package grv.cell.servlets;

import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.*;

public class SendExternalEmail {
    private String link="";

	public SendExternalEmail() {
	}

	//private String sender_email = "ebanking500@gmail.com";
	//private String sender_password = "ebankingproject";
	private String sender_email = "grievanceresolution15@gmail.com";
	private String sender_password = "grievance15";
	private String host_name = "smtp.gmail.com";
	private String port_port = "465";	
 	private String mail_to = "";
	private String mail_subject = "";
	private String mail_text = "";
	
	
	
	private String receiver;
	private String subject;
	private String message;
	
	private String sender;
	private String password;
	
	private String status="fail";

	public String sendEmail()
	{
		Properties props = new Properties();
		props.put("mail.smtp.user", sender_email);
		props.put("mail.smtp.host", host_name);
		props.put("mail.smtp.port", port_port);
		props.put("mail.smtp.starttls.enable","true");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.socketFactory.port", port_port);
		props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		props.put("mail.smtp.socketFactory.fallback", "false");
		
		SecurityManager security = System.getSecurityManager();
		
		try
		{
			/*
			if(sender!=null && !"".equals(sender.trim()))
				sender_email=sender;
			if(password!=null && !"".equals(password.trim()))
				sender_password=password;
			*/
			
			mail_to=receiver;
			mail_subject=subject;
			
			mail_text+="Hello "+receiver;
                        mail_text+="<br/><br/>"+link;
			mail_text+="<br/>"+message;			
			mail_text+="<br/> Your problem will be solved very soon.";			
			mail_text+="<br/><br/>This a auto-genered message from Grievance Resolution Services";
			
			mail_text+="<br/> ";
			mail_text+="<br/><br/>Regards,";
			mail_text+="<br/><br/> Grievance Resolution! Mail Service";
			
			Authenticator auth = new SMTPAuthenticator();
			Session mailSession = Session.getDefaultInstance(props, auth);
	      
			MimeMessage msg = new MimeMessage(mailSession);
			msg.setSubject(mail_subject);
			msg.setFrom(new InternetAddress(sender_email));
			msg.addRecipient(javax.mail.Message.RecipientType.TO, new InternetAddress(mail_to));
			
                        msg.setContent(mail_text, "text/html");
			Transport.send(msg);
			
			status="success";
		}
		catch (Exception mex)
		{
			mex.printStackTrace();
			status="fail";
		}
		
		return status;
	}

	

	public String getReceiver() {
		return receiver;
	}

	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getSender() {
		return sender;
	}

	public void setSender(String sender) {
		this.sender = sender;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
    }


	
	private class SMTPAuthenticator extends javax.mail.Authenticator
	{
		public PasswordAuthentication getPasswordAuthentication()
		{
			return new PasswordAuthentication(sender_email, sender_password);
		}
	}
	
}
