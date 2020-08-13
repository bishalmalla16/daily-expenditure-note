package com.nitv.shiro;

import org.apache.shiro.authc.credential.DefaultPasswordService;
import org.apache.shiro.authc.credential.PasswordMatcher;
import org.apache.shiro.authc.credential.Sha256CredentialsMatcher;
import org.apache.shiro.cache.CacheManager;
import org.apache.shiro.cache.MemoryConstrainedCacheManager;
import org.apache.shiro.realm.Realm;
import org.apache.shiro.realm.jdbc.JdbcRealm;
import org.apache.shiro.spring.web.config.DefaultShiroFilterChainDefinition;
import org.apache.shiro.spring.web.config.ShiroFilterChainDefinition;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import javax.sql.DataSource;

@Configuration
public class SecurityBeanConfig {
    @Bean
    public Realm jdbcRealm(DataSource dataSource){
        JdbcRealm jdbcRealm = new JdbcRealm();
        jdbcRealm.setAuthenticationQuery("select password from user where username=?");
        jdbcRealm.setUserRolesQuery("select role_name from role where id IN (select roles_id from user_roles where users_id = (select id from user where username = ?))");
        jdbcRealm.setPermissionsQuery("select permissions from role_permissions where role_id = (select id from role where role_name = ?)");
        jdbcRealm.setDataSource(dataSource);
        DefaultPasswordService passwordService = new DefaultPasswordService();
        PasswordMatcher passwordMatcher = new PasswordMatcher();
        passwordMatcher.setPasswordService(passwordService);

        Sha256CredentialsMatcher credentialsMatcher = new Sha256CredentialsMatcher();
        jdbcRealm.setCredentialsMatcher(credentialsMatcher);

        return jdbcRealm;
    }

    @Bean
    public CacheManager cacheManager(){
        return new MemoryConstrainedCacheManager();
    }

    @Bean
    public ShiroFilterChainDefinition shiroFilterChainDefinition(){
        DefaultShiroFilterChainDefinition chainDefinition = new DefaultShiroFilterChainDefinition();
        chainDefinition.addPathDefinition("/login", "authc");
        chainDefinition.addPathDefinition("/logout", "logout");
        chainDefinition.addPathDefinition("/expenditures", "authc, roles[user]");
        
        return chainDefinition;
    }
}
