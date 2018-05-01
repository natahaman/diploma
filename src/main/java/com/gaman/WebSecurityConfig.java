package com.gaman;

import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

/**
 * Created by Natalka on 10.12.2017.
 */
@EnableWebSecurity
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {
    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http
            .csrf().disable()
            .authorizeRequests()
              .antMatchers("/css/**", "/js/**", "/fonts/**","/img/**")
              .permitAll()
            .and()
            .authorizeRequests()
                .antMatchers("/item/get/*")
                .permitAll()
            .and()
            .authorizeRequests().anyRequest().authenticated().and()
            .formLogin()
            .defaultSuccessUrl("/list",true)
            .loginPage("/list")
            .loginProcessingUrl("/login")
            .permitAll()
            .and()
            .logout()
            .permitAll();
    }

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.inMemoryAuthentication()
                .withUser("user").password("123").roles("USER").and()
                .withUser("user1").password("password").roles("USER");
    }
}
