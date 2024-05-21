package com.green.provider;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;

import jakarta.mail.Multipart;
import jakarta.mail.internet.MimeMessage;
import lombok.RequiredArgsConstructor;

@Component
@RequiredArgsConstructor
public class EmailProvider {

	private final JavaMailSender javaMailSender;
	private final String SUBJECT = "[Jic Job 공고서비스] 인증메일입니다";
	public boolean sendCerticicationMail(String mail) {
		
		try {
			MimeMessage message = javaMailSender.createMimeMessage();
			MimeMessageHelper maasageHelper = new MimeMessageHelper(message, multipart:true);
			
			String htmlContent = htmlContent
			
		} catch (Exception exception) {
			
			exception.printStackTrace();
			return false;
			
		}
			return true;

	}

	
}
