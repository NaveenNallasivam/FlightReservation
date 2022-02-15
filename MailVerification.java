package Main;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.math.*;
import java.util.Random;

public class MailVerification {
	public long randomNumber;
	public  long getRandomNumber() {
		 Random rand=new Random();
	      randomNumber=rand.nextInt(10000);
	      return randomNumber;
	}
	public   void sendMail(String to) {
		System.out.println("Sending mail..");
		String from = "naveennattudurai1369@gmail.com";
		 to= "naveennattudurai1369@gmail.com";
		 Properties props = System.getProperties();
		 props.put("mail.smtp.host", "smtp.gmail.com");
		 props.put("mail.smtp.auth", "true");
		 props.put("mail.smtp.port", "465");
		 props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		 props.put("mail.smtp.socketFactory.port", "465");
		 props.put("mail.smtp.socketFactory.fallback", "false");
		 
		 Session mailSession= Session.getDefaultInstance(props,null);
		 mailSession.setDebug(true);
	     //compose the message  
	      try{  
	         MimeMessage message = new MimeMessage(mailSession);  
	         message.setFrom(new InternetAddress(from));  
	         message.addRecipient(Message.RecipientType.TO,new InternetAddress(to));  
	         message.setSubject("Ping");  
	         long secretCode=getRandomNumber();
	         message.setText("Please use the number as secret code: "+secretCode);  
	         Transport transport=mailSession.getTransport("smtp");
	         transport.connect("smtp.gmail.com", "naveennattudurai1369@gmail.com","rock3google");
	         // Send message  
	         transport.sendMessage(message, message.getAllRecipients());  
	         System.out.println("message sent successfully....");  
	  
	      }catch (Exception mex) {mex.printStackTrace();}
	}
}
