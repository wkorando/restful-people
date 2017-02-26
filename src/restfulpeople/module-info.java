module restfulpeople {
	requires spring.boot;
	requires spring.boot.autoconfigure;
	requires spring.context; 
	requires hibernate.jpa;
	requires spring.data.commons;
	requires spring.data.rest.core;
	requires java.sql;
	
	opens com.khs.restful.people.model;
	opens com.khs.restful.people;
}