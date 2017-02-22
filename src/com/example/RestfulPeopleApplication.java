package com.example;

import javax.sql.DataSource;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceBuilder;
import org.springframework.context.annotation.Bean;

@SpringBootApplication
public class RestfulPeopleApplication {

	public static void main(String[] args) {
		SpringApplication.run(RestfulPeopleApplication.class, args);
	}

	@Bean
	public DataSource dataSource() {
		return DataSourceBuilder.create().driverClassName("org.h2.Driver")
				.url("jdbc:h2:mem:;INIT=runscript from 'create.sql';DB_CLOSE_ON_EXIT=FALSE;").username("sa").password("sa").build();
	}
}
