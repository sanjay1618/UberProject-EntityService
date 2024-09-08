package com.example.uberprojectentityservice.models;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
@Entity
public class PassengerReview extends Review{
    @Column(nullable = false)
    private Long passengerRating;

    @Column
    private String passengerReview;
}
