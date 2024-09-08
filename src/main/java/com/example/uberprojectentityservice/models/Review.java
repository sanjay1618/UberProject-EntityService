package com.example.uberprojectentityservice.models;

import jakarta.persistence.*;
import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity
@Inheritance(strategy = InheritanceType.JOINED)

public class Review extends BaseModel {



    @OneToOne(cascade = {CascadeType.PERSIST, CascadeType.REMOVE}, fetch = FetchType.LAZY)
    @JoinColumn(nullable = false)
    private Booking booking;


    @Column(nullable = false)
    private String content;

    private Long rating;

}
