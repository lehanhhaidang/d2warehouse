<?php
class Chat{
	// kết nối cơ sở dữ liệu
    private $host  = 'localhost';
    private $user  = 'root';
    private $password   = "";
    private $database  = "chatapp";      
    private $chatTable = 'chat';
	private $chatUsersTable = 'chat_users';
	private $chatLoginDetailsTable = 'chat_login_details';
	private $dbConnect = false;
    public function __construct(){
        if(!$this->dbConnect){ 
            $conn = new mysqli($this->host, $this->user, $this->password, $this->database);
            if($conn->connect_error){
                die("Error failed to connect to MySQL: " . $conn->connect_error);
            }else{
                $this->dbConnect = $conn;
				mysqli_set_charset($conn, "utf8");
            }
        }
    }
	// hàm lấy dữ liệu từ cơ sở dữ liệu
	/*private function getData($sqlQuery) {
		$result = mysqli_query($this->dbConnect, $sqlQuery);
		if(!$result){
			die('Error in query: '. mysqli_error());
		}
		$data= array();
		while ($row = mysqli_fetch_array($result, MYSQL_ASSOC)) {
			$data[]=$row;            
		}
		return $data;
	}*/
	private function getData($sqlQuery) {
		$result = mysqli_query($this->dbConnect, $sqlQuery);
		if(!$result){
			die('Error in query: '. mysqli_error($this->dbConnect));
		}
		$data = array();
		while ($row = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
			$data[] = $row;
		}
		return $data;
	}
	/*private function getNumRows($sqlQuery) {
		$result = mysqli_query($this->dbConnect, $sqlQuery);
		if(!$result){
			die('Error in query: '. mysqli_error());
		}
		$numRows = mysqli_num_rows($result);
		return $numRows;
	}*/
	private function getNumRows($sqlQuery) {
		$result = mysqli_query($this->dbConnect, $sqlQuery);
		if(!$result){
			die('Error in query: '. mysqli_error($this->dbConnect));
		}
		$numRows = mysqli_num_rows($result);
		return $numRows;
	}
	// hàm kiểm tra người dùng đăng nhập
	public function loginUsers($username, $password){
		$sqlQuery = "
			SELECT userid, username
			FROM ".$this->chatUsersTable." 
			WHERE username='".$username."' AND password='".$password."'";		
        return  $this->getData($sqlQuery);
	}		
	// hàm lấy danh sách người dùng
	public function chatUsers($userid){
		$sqlQuery = "
			SELECT * FROM ".$this->chatUsersTable." 
			WHERE userid != '$userid'";
		return  $this->getData($sqlQuery);
	}
	// hàm lấy thông tin người dùng
	public function getUserDetails($userid){
		$sqlQuery = "
			SELECT * FROM ".$this->chatUsersTable." 
			WHERE userid = '$userid'";
		return  $this->getData($sqlQuery);
	}
	// hàm lấy ảnh đại diện người dùng
	public function getUserAvatar($userid){
		$sqlQuery = "
			SELECT avatar 
			FROM ".$this->chatUsersTable." 
			WHERE userid = '$userid'";
		$userResult = $this->getData($sqlQuery);
		$userAvatar = '';
		foreach ($userResult as $user) {
			$userAvatar = $user['avatar'];
		}	
		return $userAvatar;
	}	
	// hàm cập nhật trạng thái online
	public function updateUserOnline($userid, $online) {		
		$sqlUserUpdate = "
			UPDATE ".$this->chatUsersTable." 
			SET online = '".$online."' 
			WHERE userid = '".$userid."'";			
		mysqli_query($this->dbConnect, $sqlUserUpdate);		
	}
	// hàm nhập trò chuyện
	/*public function insertChat($reciever_userid, $sender_userid,  $chat_message) {		
		$sqlInsert = "
			INSERT INTO ".$this->chatTable." 
			(reciever_userid, sender_userid, message, status) 
			VALUES ('".$reciever_userid."','".$sender_userid."', '".$chat_message."', '1')";
		$result = mysqli_query($this->dbConnect, $sqlInsert);
		if(!$result){
			return ('Error in query: '. mysqli_error());
		} else {
			$conversation = $this->getUserChat($sender_userid, $reciever_userid);
			$data = array(
				"conversation" => $conversation			
			);
			echo json_encode($data);	
		}
	}*/
	public function insertChat($reciever_userid, $sender_userid, $chat_message) {
		$sqlInsert = "
			INSERT INTO ".$this->chatTable." 
			(reciever_userid, sender_userid, message, status) 
			VALUES ('".$reciever_userid."', '".$sender_userid."', '".$chat_message."', '1')";
		
		if (!mysqli_query($this->dbConnect, $sqlInsert)) {
			die('Error in query: '. mysqli_error($this->dbConnect));
		} else {
			$conversation = $this->getUserChat($sender_userid, $reciever_userid);
			$data = array(
				"conversation" => $conversation
			);
			echo json_encode($data);
		}
	}
	

	public function getUseridByMail($mail)
	{
		$sqlQuery = "
			SELECT userid FROM ".$this->chatUsersTable." 
			WHERE email = '$mail'";
		return  $this->getData($sqlQuery);
	}
	
	
	// hàm gửi dữ liệu hội thoại người dùng
	public function getUserChat($from_user_id, $to_user_id) {
		$fromUserAvatar = $this->getUserAvatar($from_user_id);	
		$toUserAvatar = $this->getUserAvatar($to_user_id);			
		$sqlQuery = "
			SELECT * FROM ".$this->chatTable." 
			WHERE (sender_userid = '".$from_user_id."' 
			AND reciever_userid = '".$to_user_id."') 
			OR (sender_userid = '".$to_user_id."' 
			AND reciever_userid = '".$from_user_id."') 
			ORDER BY timestamp ASC";
		$userChat = $this->getData($sqlQuery);	
		$conversation = '<ul>';
		foreach($userChat as $chat){
			$user_name = '';
			if($chat["sender_userid"] == $to_user_id) {
				$conversation .= '<li class="chat-bubble sent">';
				$conversation .= '<img width="22px" height="22px" src="assets/images/userpics/'.$toUserAvatar.'" alt="" />';
			} else {
				$conversation .= '<li class="chat-bubble replies">';
				$conversation .= '<img width="22px" height="22px" src="assets/images/userpics/'.$fromUserAvatar.'" alt="" />';
			}			
			$conversation .= '<p>'.$chat["message"].'</p>';			
			$conversation .= '</li>';
		}		
		$conversation .= '</ul>';
		return $conversation;
	}
	// hàm hiển thị trò chuyện
	public function showUserChat($from_user_id, $to_user_id) {		
		$userDetails = $this->getUserDetails($to_user_id);
		$toUserAvatar = '';
		foreach ($userDetails as $user) {
			$toUserAvatar = $user['avatar'];
			$userSection = '<img src="userpics/'.$user['avatar'].'" alt="" />
				<p>'.$hoten['hoten'].'</p>
				<div class="social-media">
					<i class="fa fa-facebook" aria-hidden="true"></i>
					<i class="fa fa-twitter" aria-hidden="true"></i>
					 <i class="fa fa-instagram" aria-hidden="true"></i>
				</div>';
		}		
		// nhận trò chuyện
		$conversation = $this->getUserChat($from_user_id, $to_user_id);	
		// cập nhật trạng thái tin nhắn	
		$sqlUpdate = "
			UPDATE ".$this->chatTable." 
			SET status = '0' 
			WHERE sender_userid = '".$to_user_id."' AND reciever_userid = '".$from_user_id."' AND status = '1'";
		mysqli_query($this->dbConnect, $sqlUpdate);		
		// cập nhật trjang thái hiện tại của người dùng
		$sqlUserUpdate = "
			UPDATE ".$this->chatUsersTable." 
			SET current_session = '".$to_user_id."' 
			WHERE userid = '".$from_user_id."'";
		mysqli_query($this->dbConnect, $sqlUserUpdate);		
		$data = array(
			"userSection" => $userSection,
			"conversation" => $conversation			
		 );
		 echo json_encode($data);		
	}	
	// hàm cập nhật trạng thái tin nhắn chưa đọc
	public function getUnreadMessageCount($senderUserid, $recieverUserid) {
		$sqlQuery = "
			SELECT * FROM ".$this->chatTable."  
			WHERE sender_userid = '$senderUserid' AND reciever_userid = '$recieverUserid' AND status = '1'";
		$numRows = $this->getNumRows($sqlQuery);
		$output = '';
		if($numRows > 0){
			$output = $numRows;
		}
		return $output;
	}	
	/*hàm cập nhật trạng thái gõ
	public function updateTypingStatus($is_type, $loginDetailsId) {		
		$sqlUpdate = "
			UPDATE ".$this->chatLoginDetailsTable." 
			SET is_typing = '".$is_type."' 
			WHERE id = '".$loginDetailsId."'";
		mysqli_query($this->dbConnect, $sqlUpdate);
	}	hàm hiển thị trạng thái gõ	
	public function fetchIsTypeStatus($userId){
		$sqlQuery = "
		SELECT is_typing FROM ".$this->chatLoginDetailsTable." 
		WHERE userid = '".$userId."' ORDER BY last_activity DESC LIMIT 1"; 
		$result =  $this->getData($sqlQuery);
		$output = '';
		foreach($result as $row) {
			if($row["is_typing"] == 'yes'){
				$output = ' - <small><em>Typing...</em></small>';
			}
		}
		return $output;
	}*/
	// hàm chèn chi tiết đăng nhập người dùng	
	public function insertUserLoginDetails($userid) {		
		$sqlInsert = "
			INSERT INTO ".$this->chatLoginDetailsTable."(userid) 
			VALUES ('".$userid."')";
		mysqli_query($this->dbConnect, $sqlInsert);
		$lastInsertId = mysqli_insert_id($this->dbConnect);
        return $lastInsertId;		
	}	
	// hàm cập nhật hoạt động cuối cùng
	public function updateLastActivity($loginDetailsId) {		
		$sqlUpdate = "
			UPDATE ".$this->chatLoginDetailsTable." 
			SET last_activity = now() 
			WHERE id = '".$loginDetailsId."'";
		mysqli_query($this->dbConnect, $sqlUpdate);
	}	
	// hàm lấy hoạt động cuối cùng của người dùng
	public function getUserLastActivity($userId) {
		$sqlQuery = "
			SELECT last_activity FROM ".$this->chatLoginDetailsTable." 
			WHERE userid = '$userId' ORDER BY last_activity DESC LIMIT 1";
		$result =  $this->getData($sqlQuery);
		foreach($result as $row) {
			return $row['last_activity'];
		}
	}	
}
?>