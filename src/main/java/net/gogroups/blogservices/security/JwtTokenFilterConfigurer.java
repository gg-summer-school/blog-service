package net.gogroups.blogservices.security;
import org.springframework.security.config.annotation.SecurityConfigurerAdapter;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.web.DefaultSecurityFilterChain;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;

import net.gogroups.blogservices.security.jwt.AuthTokenFilter;
import net.gogroups.blogservices.security.jwt.JwtUtils;

public class JwtTokenFilterConfigurer extends SecurityConfigurerAdapter<DefaultSecurityFilterChain, HttpSecurity> {

  private JwtUtils jwtTokenProvider;

  public JwtTokenFilterConfigurer(JwtUtils jwtTokenProvider) {
    this.jwtTokenProvider = jwtTokenProvider;
  }

  @Override
  public void configure(HttpSecurity http) throws Exception {
	  AuthTokenFilter customFilter = new AuthTokenFilter();
    http.addFilterBefore(customFilter, UsernamePasswordAuthenticationFilter.class);
  }

}
