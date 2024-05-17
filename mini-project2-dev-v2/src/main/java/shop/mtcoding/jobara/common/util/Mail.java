package shop.mtcoding.jobara.common.util;

import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;
import shop.mtcoding.jobara.apply.dto.ApplyResp.MailDto;

@Service
@RequiredArgsConstructor
public class Mail {
    private final JavaMailSender javaMailSender;
    private String fromAddress = "kimalss22@gmail.com";

    public void sendMail(MailDto mailDto, String email) {
        String subject = "지원하신 공고가 " + getStateToString(mailDto.getState()) + " 처리되었습니다.";
        String content = "지원하신 공고 " + mailDto.getBoardTitle() + "이 " + getStateToString(mailDto.getState())
                + "처리 되었습니다.";
        SimpleMailMessage message = new SimpleMailMessage();
        message.setFrom(fromAddress);
        message.setTo(email);
        message.setSubject(subject);
        message.setText(content);
        javaMailSender.send(message);
    }

    public String getStateToString(Integer state) {
        switch (state) {
            case 1:
                return "합격";
            case -1:
                return "불합격";
            default:
                return "검토중";
        }
    }
}
