
CREATE TABLE IF NOT EXISTS car
(
    id           INT AUTO_INCREMENT NOT NULL,
    created_at   datetime           NOT NULL,
    updated_at   datetime           NOT NULL,
    model        VARCHAR(255)       NULL,
    brand       VARCHAR(255)       NULL,
    color_id    INT NULL,
    plate_number VARCHAR(255)       NULL,
    car_type     enum('SEDAN', 'SUV', 'HATCHBACK', 'COMPACT_SUV') NULL,
    driver_id    INT                NULL,
    CONSTRAINT pk_car PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS color
(
    id         INT AUTO_INCREMENT NOT NULL,
    created_at datetime           NOT NULL,
    updated_at datetime           NOT NULL,
    color      VARCHAR(255)       NOT NULL,
    CONSTRAINT pk_color PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS driver
(
    id             INT AUTO_INCREMENT NOT NULL,
    created_at     datetime           NOT NULL,
    updated_at     datetime           NOT NULL,
    name           VARCHAR(255)       NULL,
    license_number VARCHAR(255)       NOT NULL,
    CONSTRAINT pk_driver PRIMARY KEY (id)
);


ALTER TABLE color
    ADD CONSTRAINT uc_color_color UNIQUE (color);

ALTER TABLE car
    ADD CONSTRAINT FK_CAR_ON_COLOR FOREIGN KEY (color_id) REFERENCES color (id);

ALTER TABLE car
    ADD CONSTRAINT FK_CAR_ON_DRIVER FOREIGN KEY (driver_id) REFERENCES driver (id);