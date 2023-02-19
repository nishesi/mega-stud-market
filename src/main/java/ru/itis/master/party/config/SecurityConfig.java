package ru.itis.master.party.config;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

@Configuration
@ComponentScan({
        "ru.itis.master.party.security"
})
public class SecurityConfig {

}
