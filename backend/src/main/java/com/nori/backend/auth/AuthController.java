package com.nori.backend.auth;

import com.nori.backend.auth.dto.LoginRequest;
import com.nori.backend.user.User;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.nori.backend.auth.dto.LoginResponse;

@RestController
@RequestMapping("/api/v1/auth")
public class AuthController {

    private final AuthService authService;
    private final JwtService jwtService;

    public AuthController(
            AuthService authService,
            JwtService jwtService
    ) {
        this.authService = authService;
        this.jwtService = jwtService;
    }

    @PostMapping("/login")
    public ResponseEntity<LoginResponse> login(@RequestBody LoginRequest request) {

        User user = authService.authenticate(request);

        String accessToken = jwtService.generateAccessToken(user);

        LoginResponse response = new LoginResponse(accessToken);

        return ResponseEntity.ok(response);
    }
}