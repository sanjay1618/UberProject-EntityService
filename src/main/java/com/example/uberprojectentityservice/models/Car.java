package com.example.uberprojectentityservice.models;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Car extends BaseModel {
    private String model;

    private String brand;

    @ManyToOne
    private Color color;

    @Column(nullable = false, unique = true)
    private String plateNumber;

    @Enumerated(EnumType.STRING)
    private CarType carType;

    @OneToOne
    @JoinColumn(nullable = false, name = "driver_id", referencedColumnName = "id")
    private Driver driver;
}
