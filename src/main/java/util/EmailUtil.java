package util;

import java.util.Date;
import java.util.Properties;

import javax.mail.*;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;


public class EmailUtil {
    public static boolean sendMail(String toAddress, String subject, String message) throws AddressException, MessagingException{
        //email: webfoodn8@gmail.com
        //mk: vannhucu
        //mk để gửi mail: armhbaxuukavuiag
        final String fromEmail = "webfoodn8@gmail.com";
        final String password = "armhbaxuukavuiag";

        Properties properties = new Properties();
        properties.put("mail.smtp.host", "smtp.gmail.com");//SMTP Host
        properties.put("mail.smtp.port", "587");//TLS Port
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");

        Authenticator auth = new Authenticator() {
            public PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(fromEmail, password);
            }
        };
        Session session = Session.getInstance(properties, auth);

        Message msg = new MimeMessage(session);
        msg.setFrom(new InternetAddress(fromEmail));
        InternetAddress[] toAddresses = { new InternetAddress(toAddress)};
        msg.setRecipients(Message.RecipientType.TO, toAddresses);
        msg.setSubject(subject);
        msg.setSentDate(new Date());
        msg.setText(message);

        try {
            Transport.send(msg);
        } catch (Exception e) {
            return false;
        }

        return true;
    }
}

