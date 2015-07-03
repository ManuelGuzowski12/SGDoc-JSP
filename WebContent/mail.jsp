<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="javax.mail.*" %>
    <%@ page import="javax.mail.internet.MimeMessage" %>
    <%@page import="java.util.*" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% Properties pops = new Properties();
	pops.setProperty("mail.smtp.host", "smtp.gmail.com");
	pops.setProperty("mail.smtp.starttls.enable", "true");
	pops.setProperty("mail.smtp.port", "587");
	pops.setProperty("mail.smtp.user", "mel29nielsen@gmail.com");
	pops.setProperty("mail.smtp.auth", "true");
	Session mailSession = Session.getDefaultInstance(pops);
	mailSession.setDebug(true);
	
	MimeMessage Mensaje = new MimeMessage(mailSession);
	Mensaje.setFrom(new InternetAddress("mel29nielsen@gmail.com"));
	Mensaje.setSender(new InternetAddress("mel-nielsen29@gmail.com"));
	Mensaje.setSubject("holaa");
	Mensaje.setText("akiiiiiiiiii tooooooy");
	
	Transport t = mailSession.getTransport("smtp");
	t.connect("mel29nielsen@gmail.com","47641881");
	t.sendMessage(Mensaje, Mensaje.getAllRecipients());
	t.close();
	
	
%>

</body>
</html>