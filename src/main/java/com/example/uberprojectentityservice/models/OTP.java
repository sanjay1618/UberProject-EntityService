package com.example.uberprojectentityservice.models;

import jakarta.persistence.Entity;
import lombok.*;

import java.util.Random;

@Entity
@Setter
@Getter
@Builder
@NoArgsConstructor
@AllArgsConstructor

public class OTP extends BaseModel{
    private String otp;

    private String recipientNumber;

    public static OTP generateOTP(String recipientNumber) {
        Random random = new Random();
        Integer code = random.nextInt(9000) + 1000;
        return OTP.builder().otp(code.toString()).build();
    }


    
}
