package mybeans;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class SendEmail 
{
	private String message;
	private String subject;
	private String to;
	private String from;
	private String status;
	
	public SendEmail()
	{
		message="";
		subject="";
		to="";
		from="";
		status="";
	}

	
	public String getStatus() {
		return status;
	}


	public void setMessage(String message) {
		this.message = message;
		semding();
	}

	public void setSubject(String subject) {
		this.subject = subject;
		semding();
	}

	public void setTo(String to) {
		this.to = to;
		semding();
	}

	public void setFrom(String from) {
		this.from = from;
		semding();
	}
	
	
	private void semding()
	{
		System.out.println(from);
		System.out.println(to);
		System.out.println(subject);
		System.out.println(message);

		
		
		String host="smtp.gmail.com";
		
		Properties properties = System.getProperties();
		
		properties.put("mail.smtp.host", host);
		
		properties.put("mail.smtp.port", "465");
		
		properties.put("mail.smtp.ssl.enable", "true");
		
		properties.put("mail.smtp.auth", "true");
		
		
			Session session = Session.getInstance(properties, new Authenticator() {

				@Override
				protected PasswordAuthentication getPasswordAuthentication() {
					// TODO Auto-generated method stub
					return new PasswordAuthentication("myonlinewallet01@gmail.com" ,"anirudh@123");
				}
				
				
			});
			
			
			session.setDebug(true);
			
			 MimeMessage m = new MimeMessage(session);
		
			 try
			 {				 
				 m.setFrom(from);	
				 
				 m.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
				 
				 m.setSubject(subject);
				 
				 m.setText(message);
				 
				 Transport.send(m);  
				 
				System.out.println(from);
				System.out.println(to);
				System.out.println(subject);
				System.out.println(message);
				 
				 
				 status="sucess";
				 
				 
			 }
			 catch (MessagingException mex) {
		         mex.printStackTrace();
		      }
	
	
		
	}
}
