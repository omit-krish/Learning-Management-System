package com.lms.configuration;

import com.mchange.v2.c3p0.ComboPooledDataSource;
import org.hibernate.SessionFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.orm.hibernate5.HibernateTransactionManager;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.web.filter.HiddenHttpMethodFilter;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

import javax.sql.DataSource;
import java.beans.PropertyVetoException;
import java.util.Properties;

@EnableWebMvc
@Configuration
@ComponentScan("com")
@EnableTransactionManagement
public class DispatcherServletConfigurationInstructor {


    @Bean
    public ViewResolver viewResolver() {

        InternalResourceViewResolver viewResolver = new InternalResourceViewResolver();

        viewResolver.setPrefix("/WEB-INF/jsp/");
        viewResolver.setSuffix(".jsp");
        return viewResolver;
    }

    @Bean
    public HiddenHttpMethodFilter hiddenHttpMethodFilter() {
        return new HiddenHttpMethodFilter();
    }


    @Bean
    public LocalSessionFactoryBean sessionFactory() throws PropertyVetoException {

        LocalSessionFactoryBean localSessionFactoryBean = new LocalSessionFactoryBean();

        localSessionFactoryBean.setPackagesToScan("com.lms.Entity");
        localSessionFactoryBean.setDataSource(getDataSources());
        localSessionFactoryBean.setHibernateProperties(getHibernateProperties());

        return localSessionFactoryBean;

    }

    public DataSource getDataSources() throws PropertyVetoException {
        // it wasn't production ready
       /* DriverManagerDataSource dataSource = new DriverManagerDataSource();

        dataSource.setDriverClassName("com.mysql.cj.jdbc.Driver");

        dataSource.setUrl("jdbc:mysql://localhost:3307/2025-mysql");

        dataSource.setUsername("root");
        dataSource.setPassword("1234");*/

        //implementing connection pooling

        ComboPooledDataSource dataSource = new ComboPooledDataSource();
        dataSource.setDriverClass("com.mysql.cj.jdbc.Driver");
        dataSource.setJdbcUrl("jdbc:mysql://localhost:3307/2025-mysql");
        dataSource.setUser("root");
        dataSource.setPassword("1234");

        // C3P0 settings
        dataSource.setMinPoolSize(5);
        dataSource.setMaxPoolSize(20);
        dataSource.setAcquireIncrement(5);
        dataSource.setIdleConnectionTestPeriod(3000);
        dataSource.setMaxStatements(50);
        dataSource.setMaxIdleTime(600);


        return dataSource;
    }


    @Bean
    public Properties getHibernateProperties() {
        Properties pro = new Properties();
//        pro.put("hibernate.show_sql", "true");
//        pro.put("hibernate.format_sql", "true");
        pro.put("hibernate.dialect", "org.hibernate.dialect.MySQLDialect");
        pro.put("hibernate.hbm2ddl.auto", "update");
//         pro.put("hibernate.current_session_context_class", "org.springframework.orm.hibernate5.SpringSessionContext");

        return pro;
    }

    @Bean
    public PlatformTransactionManager transactionManager(SessionFactory sessionFactory) {
        HibernateTransactionManager transactionManager = new HibernateTransactionManager();
        // Use getObject() to retrieve the fully initialized SessionFactory
        transactionManager.setSessionFactory(sessionFactory);
        return transactionManager;
    }
}
