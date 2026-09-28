package com.nori.backend.auth;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import com.auth0.jwt.JWT;
import com.auth0.jwt.algorithms.Algorithm;
import com.nori.backend.user.User;
import java.time.Instant;
import java.time.temporal.ChronoUnit;
import com.auth0.jwt.interfaces.DecodedJWT;
import com.auth0.jwt.exceptions.JWTVerificationException;

@Service
public class JwtService {

    private final String secret;

    public JwtService(@Value("${jwt.secret}") String secret) {
        this.secret = secret;
    }

    public String generateAccessToken(User user) {

        Algorithm algorithm = Algorithm.HMAC256(secret);

        Instant expiresAt = Instant.now()
                .plus(15, ChronoUnit.MINUTES);

        return JWT.create()
                .withSubject(user.getId().toString())
                .withIssuedAt(Instant.now())
                .withExpiresAt(expiresAt)
                .sign(algorithm);
    }

    public String validateAccessToken(String token) {

        try {
            Algorithm algorithm = Algorithm.HMAC256(secret);

            DecodedJWT decodedJWT = JWT.require(algorithm)
                    .build()
                    .verify(token);

            return decodedJWT.getSubject();

        } catch (JWTVerificationException exception) {
            throw new InvalidTokenException();
        }
    }
}