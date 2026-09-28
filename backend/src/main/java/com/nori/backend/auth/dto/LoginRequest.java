package com.nori.backend.auth.dto;

public record LoginRequest(
        String email,
        String password
) {
}