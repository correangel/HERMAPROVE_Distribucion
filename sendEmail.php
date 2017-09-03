<?php
require 'PHPMailerAutoload.php';

function sendingEmailTest($data){
	$mail = new PHPMailer;

	//$mail->SMTPDebug = 3;

	$mail->isSMTP();
	$mail->Host = 'smtp.zoho.com';
	$mail->SMTPAuth = true;
	$mail->Username = 'fmora@passeapp.com';
	$mail->Password = 'fausto123';
	$mail->SMTPSecure = 'ssl';
	$mail->Port = 465;

	$mail->setFrom('fmora@passeapp.com',$data["sender"]);
	$mail->addAddress($data["to"]);
	$mail->addCustomHeader('X-Priority','Medium');
	$mail->addCustomHeader('User-Agent','Zoho Mail');
	$mail->addCustomHeader('X-Mailer','Zoho Mail');
	$mail->isHTML(true);

	$mail->Subject = $data["subject"];
	if(array_key_exists('text', $data)){
		$mail->Body = $data["body"] ."<br>". $data["text"];
		$mail->AltBody = $data["body"] ."<br>". $data["text"];
	}else{
		$mail->Body = $data["body"];
		$mail->AltBody = $data["body"];
	}

	if(!$mail->send()) {
	    return 'Mailer Error: ' . $mail->ErrorInfo;
	} else {
	    return $mail;
	}
}
