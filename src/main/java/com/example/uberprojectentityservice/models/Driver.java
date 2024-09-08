package com.example.uberprojectentityservice.models;

import jakarta.persistence.*;
import jakarta.validation.constraints.DecimalMax;
import jakarta.validation.constraints.DecimalMin;
import lombok.*;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

import java.util.List;

@Setter
@Getter
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Entity
public class Driver extends BaseModel {
    private String name;

    @Column(nullable = false)
    private String licenseNumber;

    @OneToOne(mappedBy = "driver", cascade = CascadeType.ALL)
    private Car car;

    @Column(nullable = false)
    @Enumerated(value = EnumType.STRING)
    private DriverApprovalStatus approvalStatus;

    private String activeCity;

    @OneToOne
    private ExactLocation lastKnownLocation;

    @DecimalMin(value = "0.0")
    @DecimalMax(value = "5.0")
    private Double rating;


    @Fetch(FetchMode.SUBSELECT)
    @OneToMany(mappedBy = "driver", fetch = FetchType.LAZY)
    private List<Booking> bookings;
}