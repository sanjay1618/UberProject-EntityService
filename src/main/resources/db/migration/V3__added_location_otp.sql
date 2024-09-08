
CREATE TABLE IF NOT EXISTS exact_location
(
    id         INT AUTO_INCREMENT NOT NULL,
    created_at datetime           NOT NULL,
    updated_at datetime           NOT NULL,
    latitude   DOUBLE             NULL,
    longitude  DOUBLE             NULL,
    CONSTRAINT pk_exact_location PRIMARY KEY (id)
);

CREATE TABLE if not exists named_location
(
    id                INT AUTO_INCREMENT NOT NULL,
    created_at        datetime           NOT NULL,
    updated_at        datetime           NOT NULL,
    exact_location_id INT                NULL,
    name              VARCHAR(255)       NULL,
    zip_code          VARCHAR(255)       NULL,
    city              VARCHAR(255)       NULL,
    country           VARCHAR(255)       NULL,
    state             VARCHAR(255)       NULL,
    CONSTRAINT pk_named_location PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS otp
(
    id               INT AUTO_INCREMENT NOT NULL,
    created_at       datetime           NOT NULL,
    updated_at       datetime           NOT NULL,
    otp              VARCHAR(255)       NULL,
    recipient_number VARCHAR(255)       NULL,
    CONSTRAINT pk_otp PRIMARY KEY (id)
);

ALTER TABLE car
    ADD CONSTRAINT uc_car_plate_number UNIQUE (plate_number);

ALTER TABLE named_location
    ADD CONSTRAINT FK_NAMED_LOCATION_ON_EXACT_LOCATION FOREIGN KEY (exact_location_id) REFERENCES exact_location (id);


ALTER TABLE car
    MODIFY plate_number VARCHAR(255) NOT NULL;