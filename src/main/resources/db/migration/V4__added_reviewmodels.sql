ALTER TABLE driver
    ADD active_city VARCHAR(255) NULL;

ALTER TABLE driver
    ADD approval_status ENUM('APPROVED', 'PENDING', 'REJECTED') NULL;

ALTER TABLE driver
    ADD last_known_location_id INT NULL;

ALTER TABLE driver
    ADD rating DOUBLE NULL;

ALTER TABLE driver
    MODIFY approval_status VARCHAR(255) NOT NULL;

ALTER TABLE driver
    MODIFY rating DOUBLE NOT NULL;

ALTER TABLE car
    ADD CONSTRAINT uc_car_driver UNIQUE (driver_id);

ALTER TABLE driver
    ADD CONSTRAINT FK_DRIVER_ON_LASTKNOWNLOCATION FOREIGN KEY (last_known_location_id) REFERENCES exact_location (id);

ALTER TABLE driver
    ADD CONSTRAINT check_driver_rating CHECK ( driver.rating >= 0.0 AND driver.rating <=5.0 )