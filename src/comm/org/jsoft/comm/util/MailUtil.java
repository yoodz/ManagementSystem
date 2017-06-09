package org.jsoft.comm.util;


import javax.mail.Address;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Date;
import java.util.Properties;
import java.util.StringTokenizer;

/**
 * Created by Reuben.Zheng on 2017/3/20.
 */
public class MailUtil {
    public static String myEmailAccount = "13589136362@163.com";
    public static String myEmailPassword = "520myn";
    public static String myEmailSMTPHost = "smtp.163.com";

    //String addrs like "904201050@qq.com; 1124558571@qq.com"
    public static boolean sendEmail (String addrs, String title, String content)   {
        boolean falg =false;
        Address [] addrsArray = parseAddress(addrs);
        Properties props = new Properties();
        props.setProperty("mail.transport.protocol", "smtp");
        props.setProperty("mail.smtp.host", myEmailSMTPHost);
        props.setProperty("mail.smtp.auth", "true");
        Session session = Session.getDefaultInstance(props);
        session.setDebug(true);
        try {
            MimeMessage message = createMimeMessage(session, myEmailAccount, addrsArray, title, content);
            Transport transport = session.getTransport();
            transport.connect(myEmailAccount, myEmailPassword);
            transport.sendMessage(message, message.getAllRecipients());
            transport.close();
            falg = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return falg;
    }

    public static MimeMessage createMimeMessage(Session session, String sendMail, Address[] receiveMail, String title, String content) throws Exception {
        MimeMessage message = new MimeMessage(session);
        message.setFrom(new InternetAddress(sendMail, title, "UTF-8"));
        message.setRecipients(MimeMessage.RecipientType.TO, receiveMail);
        message.setSubject(title, "UTF-8");
        message.setContent(content, "text/html;charset=UTF-8");
        message.setSentDate(new Date());
        message.saveChanges();
        return message;
    }

    public static InternetAddress[] parseAddress(String addr) {
        StringTokenizer token = new StringTokenizer(addr, ";");
        InternetAddress[] addrArr = new InternetAddress[token.countTokens()];
        int i = 0;
        while (token.hasMoreTokens()) {
            try {
                addrArr[i] = new InternetAddress(token.nextToken().toString());
            } catch (AddressException e1) {
                return null;
            }
            i++;
        }
        return addrArr;
    }
}