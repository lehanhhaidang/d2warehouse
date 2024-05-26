<?php

if(isset($_SESSION['user_mail'])) {
    $mail = $_SESSION['user_mail'];
    include('Chat.php');
    $chat = new Chat();
    $id = $chat->getUseridByMail($mail);
    $userid = $id[0]['userid'];
    $_SESSION['userid'] = $userid; // Lưu userid vào session để sử dụng sau này
}


?>

<div class="container_app">			
	<br>		
		<div class="chatapp">	
			<div id="frame_app">		
				<div id="sidepanel_app">
					<div id="profile_app">
					<?php
					$loggedUser = $chat->getUserDetails($_SESSION['userid']);
					echo '<div class="wrap">';
					$currentSession = '';
					foreach ($loggedUser as $user) {
						$currentSession = $user['current_session'];
						echo '<img id="profile_app-img" src="assets/images/userpics/'.$user['avatar'].'" class="online" alt="" />';
						echo  '<p>'.$user['username'].'</p>';
							echo '<i class="fa fa-chevron-down expand-button" aria-hidden="true"></i>';
							echo '<div id="status-options">';
							echo '<ul>';
								echo '<li id="status-online" class="active"><span class="status-circle"></span> <p>Online</p></li>';
								echo '<li id="status-away"><span class="status-circle"></span> <p>Away</p></li>';
								echo '<li id="status-busy"><span class="status-circle"></span> <p>Busy</p></li>';
								echo '<li id="status-offline"><span class="status-circle"></span> <p>Offline</p></li>';
							echo '</ul>';
							echo '</div>';
							echo '<div id="expanded">';			
							echo '<a href="logout.php">Logout</a>';
							echo '</div>';
					}
					echo '</div>';
					?>
					</div>
					<div id="search">
						<label for=""><i class="fa fa-search" aria-hidden="true"></i></label>
						<input type="text" placeholder="Search contacts..." />					
					</div>
					<div id="contacts">	
					<?php
					echo '<ul>';
					$chatUsers = $chat->chatUsers($_SESSION['userid']);
					foreach ($chatUsers as $user) {
						$status = 'offline';						
						if($user['online']) {
							$status = 'online';
						}
						$activeUser = '';
						if($user['userid'] == $currentSession) {
							$activeUser = "active";
						}
						echo '<li id="'.$user['userid'].'" class="contact '.$activeUser.'" data-touserid="'.$user['userid'].'" data-tousername="'.$user['username'].'">';
						echo '<div class="wrap">';
						echo '<span id="status_'.$user['userid'].'" class="contact-status '.$status.'"></span>';
						echo '<img src="assets/images/userpics/'.$user['avatar'].'" alt="" />';
						echo '<div class="meta">';
						echo '<p class="name">'.$user['username'].'<span id="unread_'.$user['userid'].'" class="unread">'.$chat->getUnreadMessageCount($user['userid'], $_SESSION['userid']).'</span></p>';
						echo '<p class="preview"><span id="isTyping_'.$user['userid'].'" class="isTyping"></span></p>';
						echo '</div>';
						echo '</div>';
						echo '</li>'; 
					}
					echo '</ul>';
					?>
					</div>
				</div>			
				<div class="content" id="content"> 
					<div class="contact-profile_app" id="userSection">	
						<?php
            
						$userDetails = $chat->getUserDetails($currentSession);
						foreach ($userDetails as $user) {										
							echo '<img src="../assets/images/userpics/'.$user['avatar'].'" alt="" style="width:50px; height:50px;" />';
								echo '<p>'.$user['username'].'</p>';
								echo '<div class="social-media">';
									echo '<i class="fa fa-facebook" aria-hidden="true"></i>';
									echo '<i class="fa fa-twitter" aria-hidden="true"></i>';
									echo '<i class="fa fa-instagram" aria-hidden="true"></i>';
								echo '</div>';
						}	
						?>						
					</div>
					<div class="messages" id="conversation">		
						<?php
              $id = $chat->getUserDetails($mail);
              $userid = $id[0]['userid'];
							echo $chat->getUserChat($userid, $currentSession);	
              			
						?>
					</div>
					<div class="message-input" id="replySection">				
						<div class="message-input" id="replyContainer">
							<div class="wrap">
								<input type="text" class="chatMessage" id="chatMessage<?php echo $currentSession; ?>" placeholder="Hãy nhập tin nhắn..." />
								<button class="submit chatButton" id="chatButton<?php echo $currentSession; ?>"><i class="fa fa-paper-plane" aria-hidden="true"></i></button>	
							</div>
						</div>					
					</div>

				</div>
			</div>
		</div>
</div>	

<style>
*{
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}
.container_app{
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    background-color: #f1f1f1;
}
.chatapp {
  display: flex;
  align-items: center;
  justify-content: center;
  min-height: 100vh;
  font-family: "proxima-nova", "Source Sans Pro", sans-serif;
  /*font-size: 1em;*/
  letter-spacing: 0.1px;
  color: #32465a;
  text-rendering: optimizeLegibility;
  text-shadow: 1px 1px 1px rgba(0, 0, 0, 0.004);
  -webkit-font-smoothing: antialiased;
}
#frame_app {
  width: 95%;
  min-width: 360px;
  max-width: 1000px;
  height: 92vh;
  min-height: 300px;
  max-height: 720px;
  background: #E6EAEA;
}
@media screen and (max-width: 360px) {
  #frame_app {
    width: 100%;
    height: 100vh;
  }
}
#frame_app #sidepanel_app {
  float: left;
  min-width: 280px;
  max-width: 340px;
  width: 40%;
  height: 100%;
  background: #2c3e50;
  color: #f5f5f5;
  overflow: hidden;
  position: relative;
}
@media screen and (max-width: 735px) {
  #frame_app #sidepanel_app {
    width: 58px;
    min-width: 58px;
  }
}
#frame_app #sidepanel_app #profile_app {
  width: 80%;
  margin: 25px auto;
}
@media screen and (max-width: 735px) {
  #frame_app #sidepanel_app #profile_app {
    width: 100%;
    margin: 0 auto;
    padding: 5px 0 0 0;
    background: #32465a;
  }
}
#frame_app #sidepanel_app #profile_app.expanded .wrap {
  height: 210px;
  line-height: initial;
}
#frame_app #sidepanel_app #profile_app.expanded .wrap p {
  margin-top: 20px;
}
#frame_app #sidepanel_app #profile_app.expanded .wrap i.expand-button {
  -moz-transform: scaleY(-1);
  -o-transform: scaleY(-1);
  -webkit-transform: scaleY(-1);
  transform: scaleY(-1);
  filter: FlipH;
  -ms-filter: "FlipH";
}
#frame_app #sidepanel_app #profile_app .wrap {
  height: 60px;
  line-height: 60px;
  overflow: hidden;
  -moz-transition: 0.3s height ease;
  -o-transition: 0.3s height ease;
  -webkit-transition: 0.3s height ease;
  transition: 0.3s height ease;
}
@media screen and (max-width: 100px) {
  #frame_app #sidepanel_app #profile_app .wrap {
    height: 55px;
  }
}
#frame_app #sidepanel_app #profile_app .wrap img {
  width: 50px;
  border-radius: 50%;
  padding: 3px;
  border: 2px solid #e74c3c;
  height: auto;
  float: left;
  cursor: pointer;
  -moz-transition: 0.3s border ease;
  -o-transition: 0.3s border ease;
  -webkit-transition: 0.3s border ease;
  transition: 0.3s border ease;
}
@media screen and (max-width: 735px) {
  #frame_app #sidepanel_app #profile_app .wrap img {
    width: 40px;
    margin-left: 4px;
  }
}
#frame_app #sidepanel_app #profile_app .wrap img.online {
  border: 2px solid #2ecc71;
}
#frame_app #sidepanel_app #profile_app .wrap img.away {
  border: 2px solid #f1c40f;
}
#frame_app #sidepanel_app #profile_app .wrap img.busy {
  border: 2px solid #e74c3c;
}
#frame_app #sidepanel_app #profile_app .wrap img.offline {
  border: 2px solid #95a5a6;
}
#frame_app #sidepanel_app #profile_app .wrap p {
  float: left;
  margin-left: 15px;
}
@media screen and (max-width: 735px) {
  #frame_app #sidepanel_app #profile_app .wrap p {
    display: none;
  }
}
#frame_app #sidepanel_app #profile_app .wrap i.expand-button {
  float: right;
  margin-top: 23px;
  font-size: 0.8em;
  cursor: pointer;
  color: #435f7a;
}
@media screen and (max-width: 735px) {
  #frame_app #sidepanel_app #profile_app .wrap i.expand-button {
    display: none;
  }
}
#frame_app #sidepanel_app #profile_app .wrap #status-options {
  position: absolute;
  opacity: 0;
  visibility: hidden;
  width: 150px;
  margin: 70px 0 0 0;
  border-radius: 6px;
  z-index: 99;
  line-height: initial;
  background: #435f7a;
  -moz-transition: 0.3s all ease;
  -o-transition: 0.3s all ease;
  -webkit-transition: 0.3s all ease;
  transition: 0.3s all ease;
}
@media screen and (max-width: 735px) {
  #frame_app #sidepanel_app #profile_app .wrap #status-options {
    width: 58px;
    margin-top: 57px;
  }
}
#frame_app #sidepanel_app #profile_app .wrap #status-options.active {
  opacity: 1;
  visibility: visible;
  margin: 75px 0 0 0;
}
@media screen and (max-width: 735px) {
  #frame_app #sidepanel_app #profile_app .wrap #status-options.active {
    margin-top: 62px;
  }
}
#frame_app #sidepanel_app #profile_app .wrap #status-options:before {
  content: '';
  position: absolute;
  width: 0;
  height: 0;
  border-left: 6px solid transparent;
  border-right: 6px solid transparent;
  border-bottom: 8px solid #435f7a;
  margin: -8px 0 0 24px;
}
@media screen and (max-width: 735px) {
  #frame_app #sidepanel_app #profile_app .wrap #status-options:before {
    margin-left: 23px;
  }
}
#frame_app #sidepanel_app #profile_app .wrap #status-options ul {
  overflow: hidden;
  border-radius: 6px;
}
#frame_app #sidepanel_app #profile_app .wrap #status-options ul li {
  padding: 15px 0 30px 18px;
  display: block;
  cursor: pointer;
}
@media screen and (max-width: 735px) {
  #frame_app #sidepanel_app #profile_app .wrap #status-options ul li {
    padding: 15px 0 35px 22px;
  }
}
#frame_app #sidepanel_app #profile_app .wrap #status-options ul li:hover {
  background: #496886;
}
#frame_app #sidepanel_app #profile_app .wrap #status-options ul li span.status-circle {
  position: absolute;
  width: 10px;
  height: 10px;
  border-radius: 50%;
  margin: 5px 0 0 0;
}
@media screen and (max-width: 735px) {
  #frame_app #sidepanel_app #profile_app .wrap #status-options ul li span.status-circle {
    width: 14px;
    height: 14px;
  }
}
#frame_app #sidepanel_app #profile_app .wrap #status-options ul li span.status-circle:before {
  content: '';
  position: absolute;
  width: 14px;
  height: 14px;
  margin: -3px 0 0 -3px;
  background: transparent;
  border-radius: 50%;
  z-index: 0;
}
@media screen and (max-width: 735px) {
  #frame_app #sidepanel_app #profile_app .wrap #status-options ul li span.status-circle:before {
    height: 18px;
    width: 18px;
  }
}
#frame_app #sidepanel_app #profile_app .wrap #status-options ul li p {
  padding-left: 12px;
}
@media screen and (max-width: 735px) {
  #frame_app #sidepanel_app #profile_app .wrap #status-options ul li p {
    display: none;
  }
}
#frame_app #sidepanel_app #profile_app .wrap #status-options ul li#status-online span.status-circle {
  background: #2ecc71;
}
#frame_app #sidepanel_app #profile_app .wrap #status-options ul li#status-online.active span.status-circle:before {
  border: 1px solid #2ecc71;
}
#frame_app #sidepanel_app #profile_app .wrap #status-options ul li#status-away span.status-circle {
  background: #f1c40f;
}
#frame_app #sidepanel_app #profile_app .wrap #status-options ul li#status-away.active span.status-circle:before {
  border: 1px solid #f1c40f;
}
#frame_app #sidepanel_app #profile_app .wrap #status-options ul li#status-busy span.status-circle {
  background: #e74c3c;
}
#frame_app #sidepanel_app #profile_app .wrap #status-options ul li#status-busy.active span.status-circle:before {
  border: 1px solid #e74c3c;
}
#frame_app #sidepanel_app #profile_app .wrap #status-options ul li#status-offline span.status-circle {
  background: #95a5a6;
}
#frame_app #sidepanel_app #profile_app .wrap #status-options ul li#status-offline.active span.status-circle:before {
  border: 1px solid #95a5a6;
}
#frame_app #sidepanel_app #profile_app .wrap #expanded {
  padding: 100px 0 0 0;
  display: block;
  line-height: initial !important;
}
#frame_app #sidepanel_app #profile_app .wrap #expanded label {
  float: left;
  clear: both;
  margin: 0 8px 5px 0;
  padding: 5px 0;
}
#frame_app #sidepanel_app #profile_app .wrap #expanded input {
  border: none;
  margin-bottom: 6px;
  background: #32465a;
  border-radius: 3px;
  color: #f5f5f5;
  padding: 7px;
  width: calc(100% - 43px);
}
#frame_app #sidepanel_app #profile_app .wrap #expanded input:focus {
  outline: none;
  background: #435f7a;
}
#frame_app #sidepanel_app #search {
  border-top: 1px solid #32465a;
  border-bottom: 1px solid #32465a;
  font-weight: 300;
}
@media screen and (max-width: 735px) {
  #frame_app #sidepanel_app #search {
    display: none;
  }
}
#frame_app #sidepanel_app #search label {
  position: absolute;
  margin: 10px 0 0 20px;
}
#frame_app #sidepanel_app #search input {
  font-family: "proxima-nova",  "Source Sans Pro", sans-serif;
  padding: 10px 0 10px 46px;
  width: calc(100% - 25px);
  border: none;
  background: #32465a;
  color: #f5f5f5;
}
#frame_app #sidepanel_app #search input:focus {
  outline: none;
  background: #435f7a;
}
#frame_app #sidepanel_app #search input::-webkit-input-placeholder {
  color: #f5f5f5;
}
#frame_app #sidepanel_app #search input::-moz-placeholder {
  color: #f5f5f5;
}
#frame_app #sidepanel_app #search input:-ms-input-placeholder {
  color: #f5f5f5;
}
#frame_app #sidepanel_app #search input:-moz-placeholder {
  color: #f5f5f5;
}
#frame_app #sidepanel_app #contacts {
  height: calc(100% - 177px);
  overflow-y: scroll;
  overflow-x: hidden;
}
@media screen and (max-width: 735px) {
  #frame_app #sidepanel_app #contacts {
    height: calc(100% - 149px);
    overflow-y: scroll;
    overflow-x: hidden;
  }
  #frame_app #sidepanel_app #contacts::-webkit-scrollbar {
    display: none;
  }
}
#frame_app #sidepanel_app #contacts.expanded {
  height: calc(100% - 334px);
}
#frame_app #sidepanel_app #contacts::-webkit-scrollbar {
  width: 8px;
  background: #2c3e50;
}
#frame_app #sidepanel_app #contacts::-webkit-scrollbar-thumb {
  background-color: #243140;
}
#frame_app #sidepanel_app #contacts ul li.contact {
  position: relative;
  padding: 10px 0 15px 0;
  font-size: 0.9em;
  cursor: pointer;
}
@media screen and (max-width: 735px) {
  #frame_app #sidepanel_app #contacts ul li.contact {
    padding: 6px 0 46px 8px;
  }
}
#frame_app #sidepanel_app #contacts ul li.contact:hover {
  background: #32465a;
}
#frame_app #sidepanel_app #contacts ul li.contact.active {
  background: #32465a;
  border-right: 5px solid #435f7a;
}
#frame_app #sidepanel_app #contacts ul li.contact.active span.contact-status {
  border: 2px solid #32465a !important;
}
#frame_app #sidepanel_app #contacts ul li.contact .wrap {
  width: 88%;
  margin: 0 auto;
  position: relative;
}
@media screen and (max-width: 735px) {
  #frame_app #sidepanel_app #contacts ul li.contact .wrap {
    width: 100%;
  }
}
#frame_app #sidepanel_app #contacts ul li.contact .wrap span {
  position: absolute;
  left: 0;
  margin: -2px 0 0 -2px;
  width: 10px;
  height: 10px;
  border-radius: 50%;
  border: 2px solid #2c3e50;
  background: #95a5a6;
}
#frame_app #sidepanel_app #contacts ul li.contact .wrap span.online {
  background: #2ecc71;
}
#frame_app #sidepanel_app #contacts ul li.contact .wrap span.away {
  background: #f1c40f;
}
#frame_app #sidepanel_app #contacts ul li.contact .wrap span.busy {
  background: #e74c3c;
}
#frame_app #sidepanel_app #contacts ul li.contact .wrap span.unread {
   background:red;  
   position: relative;
   left: 5px;
}
#frame_app #sidepanel_app #contacts ul li.contact .wrap img {
  width: 40px;
  border-radius: 50%;
  float: left;
  margin-right: 10px;
}
@media screen and (max-width: 735px) {
  #frame_app #sidepanel_app #contacts ul li.contact .wrap img {
    margin-right: 0px;
  }
}
#frame_app #sidepanel_app #contacts ul li.contact .wrap .meta {
  padding: 5px 0 0 0;
}
@media screen and (max-width: 735px) {
  #frame_app #sidepanel_app #contacts ul li.contact .wrap .meta {
    display: none;
  }
}
#frame_app #sidepanel_app #contacts ul li.contact .wrap .meta .name {
  font-weight: 600;
}
#frame_app #sidepanel_app #contacts ul li.contact .wrap .meta .preview {
  margin: 5px 0 0 0;
  padding: 0 0 1px;
  font-weight: 400;
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
  -moz-transition: 1s all ease;
  -o-transition: 1s all ease;
  -webkit-transition: 1s all ease;
  transition: 1s all ease;
}
#frame_app #sidepanel_app #contacts ul li.contact .wrap .meta .preview span {
  position: initial;
  border-radius: initial;
  background: none;
  border: none;
  padding: 0 2px 0 0;
  margin: 0 0 0 1px;
  opacity: .5;
}
#frame_app #sidepanel_app #bottom-bar {
  position: absolute;
  width: 100%;
  bottom: 0;
}
#frame_app #sidepanel_app #bottom-bar button {
  float: left;
  border: none;
  width: 50%;
  padding: 10px 0;
  background: #32465a;
  color: #f5f5f5;
  cursor: pointer;
  font-size: 0.85em;
  font-family: "proxima-nova",  "Source Sans Pro", sans-serif;
}
@media screen and (max-width: 735px) {
  #frame_app #sidepanel_app #bottom-bar button {
    float: none;
    width: 100%;
    padding: 15px 0;
  }
}
#frame_app #sidepanel_app #bottom-bar button:focus {
  outline: none;
}
#frame_app #sidepanel_app #bottom-bar button:nth-child(1) {
  border-right: 1px solid #2c3e50;
}
@media screen and (max-width: 735px) {
  #frame_app #sidepanel_app #bottom-bar button:nth-child(1) {
    border-right: none;
    border-bottom: 1px solid #2c3e50;
  }
}
#frame_app #sidepanel_app #bottom-bar button:hover {
  background: #435f7a;
}
#frame_app #sidepanel_app #bottom-bar button i {
  margin-right: 3px;
  font-size: 1em;
}
@media screen and (max-width: 735px) {
  #frame_app #sidepanel_app #bottom-bar button i {
    font-size: 1.3em;
  }
}
@media screen and (max-width: 735px) {
  #frame_app #sidepanel_app #bottom-bar button span {
    display: none;
  }
}
#frame_app .content {
  float: right;
  width: 100vh;
  height: 100%;
  overflow: hidden;
  position: relative;
}
@media screen and (max-width: 735px) {
  #frame_app .content {
    width: calc(100% - 58px);
    min-width: 300px !important;
  }
}
@media screen and (min-width: 900px) {
  #frame_app .content {
    width: calc(100% - 340px);
  }
}
#frame_app .content .contact-profile_app {
  width: 100%;
  height: 60px;
  line-height: 60px;
  background: #f5f5f5;
}
#frame_app .content .contact-profile_app img {
  width: 40px;
  border-radius: 50%;
  float: left;
  margin: 9px 12px 0 9px;
}
#frame_app .content .contact-profile_app p {
  float: left;
}
#frame_app .content .contact-profile_app .social-media {
  float: right;
}
#frame_app .content .contact-profile_app .social-media i {
  margin-left: 14px;
  cursor: pointer;
}
#frame_app .content .contact-profile_app .social-media i:nth-last-child(1) {
  margin-right: 20px;
}
#frame_app .content .contact-profile_app .social-media i:hover {
  color: #435f7a;
}
#frame_app .content .messages {
  height: auto;
  min-height: calc(100% - 93px);
  max-height: calc(100% - 93px);
  overflow-y: scroll;
  overflow-x: hidden;
  width:100vh;
}
@media screen and (max-width: 735px) {
  #frame_app .content .messages {
    max-height: calc(100% - 105px);
  }
}
#frame_app .content .messages::-webkit-scrollbar {
  width: 8px;
  background: transparent;
}
#frame_app .content .messages::-webkit-scrollbar-thumb {
  background-color: rgba(0, 0, 0, 0.3);
}
#frame_app .content .messages ul li {
  display: inline-block;
  clear: both;
  margin: 15px 15px 5px 15px;
  width: calc(100% - 25px);
  font-size: 0.9em;

}
#frame_app .content .messages ul li:nth-last-child(1) {
  margin-bottom: 20px;
}
#frame_app .content .messages ul li.sent img {
  margin: 6px 8px 0 0;
}
#frame_app .content .messages ul li.sent p {
  background: #435f7a;
  color: #f5f5f5;

}
#frame_app .content .messages ul li.replies img {
  margin: 6px 0 0 8px;
  float: right;
  margin-right: 120px;
}
#frame_app .content .messages ul li.replies p {
  background: #f5f5f5;
  float: right;
 
}
#frame_app .content .messages ul li img {
  width: 40px;
  height: 40px;
  border-radius: 50%;
  float: left;
}
#frame_app .content .messages ul li p {
  display: inline-block;
  padding: 10px 15px;
  border-radius: 20px;
  max-width: 205px;
  line-height: 130%;
}
@media screen and (min-width: 735px) {
  #frame_app .content .messages ul li p {
    max-width: 300px;
  }
}
#frame_app .content .message-input {
  position: absolute;
  bottom: 0;
  width: 100%;
  z-index: 99;
}
#frame_app .content .message-input .wrap {
  position: relative;
}
#frame_app .content .message-input .wrap input {
  font-family: "proxima-nova",  "Source Sans Pro", sans-serif;
  float: left;
  border: none;
  width: calc(100% - 90px);
  padding: 11px 32px 10px 8px;
  font-size: 0.8em;
  color: #32465a;
}
@media screen and (max-width: 735px) {
  #frame_app .content .message-input .wrap input {
    padding: 15px 32px 16px 8px;
  }
}
#frame_app .content .message-input .wrap input:focus {
  outline: none;
}
#frame_app .content .message-input .wrap .attachment {
  position: absolute;
  right: 60px;
  z-index: 4;
  margin-top: 10px;
  font-size: 1.1em;
  color: #435f7a;
  opacity: .5;
  cursor: pointer;
}
@media screen and (max-width: 735px) {
  #frame_app .content .message-input .wrap .attachment {
    margin-top: 17px;
    right: 65px;
  }
}
#frame_app .content .message-input .wrap .attachment:hover {
  opacity: 1;
}
#frame_app .content .message-input .wrap button {
  float: right;
  border: none;
  width: 50px;
  padding: 12px 0;
  cursor: pointer;
  background: #32465a;
  color: #f5f5f5;
}
@media screen and (max-width: 735px) {
  #frame_app .content .message-input .wrap button {
    padding: 16px 0;
  }
}
#frame_app .content .message-input .wrap button:hover {
  background: #435f7a;
}
#frame_app .content .message-input .wrap button:focus {
  outline: none;
}
ol, ul {
    list-style: none;
}
.fa {
    display: inline-block;
    text-rendering: auto;
    -webkit-font-smoothing: antialiased;
    font: normal normal normal normal normal normal normal 1 FontAwesome;
}
#frame_app .content .message-input .wrap .attachment {
    position: absolute;
    right: 60px;
    z-index: 4;
    margin-top: 10px;
    font-size: 1.1em;
    color: #435f7a;
    opacity: .5;
    cursor: pointer;
}
#frame_app .content .message-input .wrap button {
    float: right;
    border: none;
    width: 50px;
    padding: 12px 0;
    cursor: pointer;
    background: #32465a;
    color: #f5f5f5;
}
.isTyping {
	font-size:12px;	
}
.badge-notify {
    background: red;
    position: relative;
    top: -20px;
    left: -35px;
}
.badge {
    display: inline-block;
    min-width: 10px;
    padding: 3px 7px;
    font-size: 12px;
    font-weight: 700;
    color: #fff;
    line-height: 1;
    vertical-align: baseline;
    white-space: nowrap;
    text-align: center;
    border-radius: 10px;
}
</style>