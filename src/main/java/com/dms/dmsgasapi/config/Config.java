package com.dms.dmsgasapi.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

import com.dms.event.listener.ResourceCreatedListener;
import com.dms.exception.handler.ResourcesExceptionHandler;

/**
 * Configurar as classes de outro projeto
 * 
 * @author Diorgenes Morais
 *
 */
@Configuration
@ComponentScan(basePackageClasses = { ResourcesExceptionHandler.class })
public class Config {

	@Bean
	public ResourceCreatedListener resourceCreatedListener() {
		return new ResourceCreatedListener();
	}

}
