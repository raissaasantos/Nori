package com.nori.backend.config;

import org.junit.jupiter.api.Test;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

import static org.junit.jupiter.api.Assertions.*;

class PasswordEncoderTest {

    private final PasswordEncoder passwordEncoder =
            new BCryptPasswordEncoder();

    @Test
    void shouldEncodeAndMatchPassword() {
        String rawPassword = "testPassword123";
        String passwordHash = passwordEncoder.encode(rawPassword);

        assertNotEquals(rawPassword, passwordHash);
        assertTrue(passwordEncoder.matches(rawPassword, passwordHash));
        assertFalse(passwordEncoder.matches("wrongPassword", passwordHash));
    }
}