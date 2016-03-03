package com.mifatest.executers;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class SendMailTLS {

	public static void sendMail(String an, int userId) {

		final String username = "ba.dresden.mifa@gmail.com";
		final String password = "badresden1234";

		Properties props = new Properties();
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", "587");

		Session session = Session.getInstance(props,
		  new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username, password);
			}
		  });

		try {

			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress("ba.dresden.mifa@gmail.com"));
			message.setRecipients(Message.RecipientType.TO,
				InternetAddress.parse(an));
			message.setSubject("Deine Accountaktivierung bei mifa.de");
			message.setText("Um deinen Account zu aktivieren, klicke bitte auf folgenden Link: " + 
			
					
					"213.187.73.194/mifa/m_activate.jsp?userid=" + userId);

			Transport.send(message);

			System.out.println("Done");

		} catch (MessagingException e) {
			throw new RuntimeException(e);
		}
	}
}