package com._thefull.dasom_web_demo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.data.jpa.repository.config.EnableJpaAuditing;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;

import java.util.Locale;

@EnableJpaAuditing
@SpringBootApplication
public class DasomWebDemoApplication {
	public static void main(String[] args) {
		SpringApplication.run(DasomWebDemoApplication.class, args);
	}


//	@Bean
//	public SessionLocaleResolver localeResolver() {
//		SessionLocaleResolver localeResolver = new SessionLocaleResolver();
//		localeResolver.setDefaultLocale(Locale.KOREA);
//		return localeResolver;
	}
