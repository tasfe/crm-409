package com.kaishengit.util;  
import org.springframework.mail.SimpleMailMessage;  

import org.springframework.mail.javamail.JavaMailSender;  
public class MailUtil{  
	
	public void sendMail(JavaMailSender mailsender, String mail,String site){  
		 SimpleMailMessage msg=new SimpleMailMessage();  
		 msg.setFrom("511630288@qq.com");  
		 msg.setTo(mail);  
		 msg.setSubject("有同事邀请你到Work-xp了");
		 //"http://www.baidu.com 点击注册"
		 msg.setText("有同事邀请你一起工作:" + site);  
		 mailsender.send(msg);  
		 
		 System.out.println("成功发送！");   
	}  
}  