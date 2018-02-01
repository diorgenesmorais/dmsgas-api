package com.dms.dmsgasapi.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.dms.event.listener.ResourceCreatedListener;

@Configuration
public class Config {

	@Bean
	public ResourceCreatedListener resourceCreatedListener() {
		return new ResourceCreatedListener();
	}
}
