set -e
CLASSPATH=mods/accessors-smart-1.1.jar:mods/spring-aop-4.3.6.RELEASE.jar:mods/android-json-0.0.20131108.vaadin1.jar:mods/spring-aspects-4.3.6.RELEASE.jar:mods/antlr-2.7.7.jar:mods/spring-beans-4.3.6.RELEASE.jar:mods/asm-5.0.3.jar:mods/spring-boot-1.5.1.RELEASE.jar:mods/aspectjweaver-1.8.9.jar:mods/spring-boot-autoconfigure-1.5.1.RELEASE.jar:mods/assertj-core-2.6.0.jar:mods/spring-boot-starter-1.5.1.RELEASE.jar:mods/classmate-1.3.3.jar:mods/spring-boot-starter-aop-1.5.1.RELEASE.jar:mods/dom4j-1.6.1.jar:mods/spring-boot-starter-data-jpa-1.5.1.RELEASE.jar:mods/evo-inflector-1.2.1.jar:mods/spring-boot-starter-data-rest-1.5.1.RELEASE.jar:mods/h2-1.4.193.jar:mods/spring-boot-starter-jdbc-1.5.1.RELEASE.jar:mods/hamcrest-core-1.3.jar:mods/spring-boot-starter-logging-1.5.1.RELEASE.jar:mods/hamcrest-modsrary-1.3.jar:mods/spring-boot-starter-test-1.5.1.RELEASE.jar:mods/hibernate-commons-annotations-5.0.1.Final.jar:mods/spring-boot-starter-tomcat-1.5.1.RELEASE.jar:mods/hibernate-core-5.2.8.Final.jar:mods/spring-boot-starter-web-1.5.1.RELEASE.jar:mods/hibernate-entitymanager-5.0.11.Final.jar:mods/hibernate-jpa-2.1-api-1.0.0.Final.jar:mods/hibernate-validator-5.3.4.Final.jar:mods/spring-context-4.3.6.RELEASE.jar:mods/jackson-annotations-2.8.0.jar:mods/spring-core-4.3.6.RELEASE.jar:mods/jackson-core-2.8.6.jar:mods/spring-data-commons-1.13.0.RELEASE.jar:mods/jackson-databind-2.8.6.jar:mods/spring-data-jpa-1.11.0.RELEASE.jar:mods/jandex-2.0.0.Final.jar:mods/spring-data-rest-core-2.6.0.RELEASE.jar:mods/javassist-3.22.0-CR1.jar:mods/spring-data-rest-webmvc-2.6.0.RELEASE.jar:mods/javax.transaction-api-1.2.jar:mods/spring-expression-4.3.6.RELEASE.jar:mods/jboss-logging-3.3.0.Final.jar:mods/spring-hateoas-0.23.0.RELEASE.jar:mods/jcl-over-slf4j-1.7.22.jar:mods/spring-jdbc-4.3.6.RELEASE.jar:mods/json-path-2.2.0.jar:mods/spring-orm-4.3.6.RELEASE.jar:mods/json-smart-2.2.1.jar:mods/spring-plugin-core-1.2.0.RELEASE.jar:mods/jsonassert-1.4.0.jar:mods/jul-to-slf4j-1.7.22.jar:mods/spring-tx-4.3.6.RELEASE.jar:mods/spring-web-4.3.6.RELEASE.jar:mods/log4j-over-slf4j-1.7.22.jar:mods/spring-webmvc-4.3.6.RELEASE.jar:mods/logback-classic-1.1.9.jar:mods/tomcat-embed-core-8.5.11.jar:mods/logback-core-1.1.9.jar:mods/tomcat-embed-el-8.5.11.jar:mods/tomcat-embed-websocket-8.5.11.jar:mods/tomcat-jdbc-8.5.11.jar:mods/objenesis-2.1.jar:mods/tomcat-juli-8.5.11.jar:mods/slf4j-api-1.7.22.jar:mods/validation-api-1.1.0.Final.jar:mods/snakeyaml-1.17.jar:mods/spring-boot-test-1.5.1.RELEASE.jar:mods/spring-boot-test-autoconfigure-1.5.1.RELEASE.jar:mods/spring-test-4.3.6.RELEASE.jar:mods/junit-4.12.jar:mods/mockito-core-1.10.19.jar

javac -cp $CLASSPATH \
      --module-path mods \
      -d out         \
      --module-source-path src $(find src -name '*.java')

jar --create --file mods/restfulpeople-1.0.jar --module-version=1.0 -C out/restfulpeople .

java -cp $CLASSPATH \
     --module-path mods       \
     --add-modules java.xml.bind,java.sql,javassist,spring.core,spring.beans,java.instrument,spring.boot.autoconfigure \
     --add-opens java.base/java.lang=javassist \
     --add-opens java.base/java.lang=spring.core \
     --add-opens java.base/java.lang=spring.beans \
     --add-opens java.base/java.lang=spring.boot.autoconfigure \
     -m restfulpeople/com.khs.restful.people.RestfulPeopleApplication --debug