package com.mirajdev.springboot.myfirstwebappusingspringboot.security;

import java.util.function.Function;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.provisioning.InMemoryUserDetailsManager;
import org.springframework.security.web.SecurityFilterChain;
import static org.springframework.security.config.Customizer.withDefaults;

@Configuration
public class SpringSecurityConfiguration {
    @Bean
    public InMemoryUserDetailsManager userDetailsService() {

        UserDetails userDetails1 = createUser("mirajhossain", "123456");
        UserDetails userDetails2 = createUser("mirajhossain1", "123456");
        return new InMemoryUserDetailsManager(userDetails1, userDetails2);
    }

    private UserDetails createUser(String userName, String password) {
        UserDetails userDetails = User.builder()
                .username(userName)
                .password(passwordEncoder().encode(password)) // Encode the password
                .roles("USER")
                .build();
        return userDetails;
    }

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
        http.authorizeHttpRequests(auth -> auth.anyRequest().authenticated());
        http.formLogin(withDefaults());
        http.csrf().disable();
        http.headers().frameOptions().disable();
        return http.build();
    }

}
