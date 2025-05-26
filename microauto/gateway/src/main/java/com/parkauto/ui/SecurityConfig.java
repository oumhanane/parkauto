// package com.parkauto.ui;
// import org.springframework.context.annotation.Bean;
// import org.springframework.context.annotation.Configuration;
// import org.springframework.security.config.annotation.web.builders.HttpSecurity;
// import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
// import org.springframework.security.crypto.password.PasswordEncoder;
// import org.springframework.security.provisioning.InMemoryUserDetailsManager;
// import org.springframework.security.core.userdetails.User;
// import org.springframework.security.core.userdetails.UserDetails;
// import org.springframework.security.web.SecurityFilterChain;

// @Configuration
// public class SecurityConfig {

//     @Bean
//     public InMemoryUserDetailsManager userDetailsService() {
//         UserDetails user = User.builder()
//                 .username("admin")
//                 .password(passwordEncoder().encode("admin123"))
//                 .roles("USER")
//                 .build();
//         return new InMemoryUserDetailsManager(user);
//     }

//     @Bean
//     public PasswordEncoder passwordEncoder() {
//         return new BCryptPasswordEncoder();
//     }

//     @Bean
//     public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
//         http.csrf(csrf -> csrf.disable()) // Désactiver CSRF pour simplifier les tests
//             .authorizeHttpRequests(auth -> auth.anyRequest().permitAll()); // Autoriser toutes les requêtes
//         return http.build();
//     }
// }
