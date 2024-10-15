package spring.conf;

import javax.sql.DataSource;

import org.apache.commons.dbcp2.BasicDataSource;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.io.ClassPathResource;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@Configuration
@EnableTransactionManagement
@PropertySource("classpath:spring/db.properties")
@MapperScan("user.dao")
public class SpringConfiguration {
	private @Value("${jdbc.driver}") String driver;
	private @Value("${jdbc.url}") String url;
	private @Value("${jdbc.username}") String username;
	private @Value("${jdbc.password}")  String password;
	
	//@Autowired
	//private ApplicationContext context; (spring)
	
	@Bean
    public DataSource dataSource() {
        BasicDataSource basicdataSource = new BasicDataSource();
        basicdataSource.setDriverClassName(driver);
        basicdataSource.setUrl(url);
        basicdataSource.setUsername(username);
        basicdataSource.setPassword(password);
        return basicdataSource;
    }
	
	@Bean
	public SqlSessionFactory sqlSessionFactory() throws Exception {
        SqlSessionFactoryBean sqlSessionFactoryBean = new SqlSessionFactoryBean();
        sqlSessionFactoryBean.setDataSource(dataSource());
        sqlSessionFactoryBean.setConfigLocation(new ClassPathResource("spring/mybatis-config.xml"));
        sqlSessionFactoryBean.setMapperLocations(new ClassPathResource("mapper/userMapper.xml"));
        
        //sqlSessionFactoryBean.setMapperLocations(context.getResources("classpath:mapper/*Mapper.xml")); 여러개의 mapper 사용

        return sqlSessionFactoryBean.getObject(); //sqlSessionFactory 변환 
    }
	
	@Bean
	public SqlSessionTemplate sqlSession() throws Exception {
		SqlSessionTemplate sqlSessionTemplate = new SqlSessionTemplate(sqlSessionFactory());
		return sqlSessionTemplate;
	}
	
	@Bean
	public DataSourceTransactionManager transactionManager() {
		DataSourceTransactionManager dataSourceTransactionManager = 
				new DataSourceTransactionManager(dataSource());
		return dataSourceTransactionManager;
		
	}
}