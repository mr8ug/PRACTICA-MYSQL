USE Practica1;

DROP TABLE IF EXISTS level_1a, geoname, locations, project, countrycodes, status, transactions, currency;

CREATE TABLE locations(
    
    location_type_code varchar(150) NOT NULL,
    location_type_name varchar(150) NOT NULL,
    PRIMARY KEY (location_type_code)
);

CREATE TABLE geoname(
    id int NOT NULL AUTO_INCREMENT,
    id_geoname INT NOT NULL,
    place_name varchar(255) NOT NULL,
    latitude DECIMAL(20,5) NOT NULL,
    longitude DECIMAL(20,5) NOT NULL,
    location_type_code varchar(255) NOT NULL,
    gazetteer_adm_code varchar(255) NOT NULL,
    gazetteer_adm_name VARCHAR(255) NOT NULL,
    location_class int NOT NULL,
    geographical_exactness int NOT NULL,
    PRIMARY KEY(id),
    CONSTRAINT geoname_location_fk FOREIGN KEY(location_type_code)
    REFERENCES locations(location_type_code)
    ON DELETE CASCADE
    ON UPDATE CASCADE 
);

CREATE TABLE status(
    id int NOT NULL AUTO_INCREMENT,
    name varchar(150) NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE countrycodes(
    id int NOT NULL AUTO_INCREMENT,
    name varchar(150) NOT NULL,
    iso2 varchar(150) NOT NULL,
    name_name varchar(150) NOT NULL,
    name_aiddata_code varchar(150) NOT NULL,
    name_aiddata_name varchar(150) NOT NULL,
    name_cow_alpha varchar(150) NOT NULL,
    name_cow_numeric varchar(150) NOT NULL ,
    name_fao_code varchar(150) NOT NULL ,
    name_fips varchar(50) NOT NULL,
    name_geonames_id varchar(150) NOT NULL,
    name_imf_code varchar(50) NOT NULL,
    name_iso2 VARCHAR(50) NOT NULL,
    name_iso3 VARCHAR(50) NOT NULL,
    name_iso_numeric VARCHAR(150) NOT NULL,
    name_oecd_code VARCHAR(150) NOT NULL,
    name_oecd_name VARCHAR(150) NOT NULL,
    name_un_code VARCHAR(150) NOT NULL,
    name_wb_code varchar(50) NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE project(
    id int NOT NULL AUTO_INCREMENT,
    id_project varchar(150) NOT NULL,
    id_geocoded int NOT NULL,
    project_title varchar(150) NOT NULL,
    start_actual_isodate varchar(150) NOT NULL,
    end_actual_isodate varchar(150),
    donors VARCHAR(150) NOT NULL,
    donors_iso3 VARCHAR(150) NOT NULL,
    recipients int NOT NULL,
    ad_sector_codes VARCHAR(150) NOT NULL,
    ad_sector_names VARCHAR(300) NOT NULL,
    status int NOT NULL,
    transactions_start_year int NOT NULL,
    transactions_end_year int NOT NULL,
    total_commitments DECIMAL(20,5),
    total_disbursements DECIMAL(20,5),
    PRIMARY KEY(id),
    CONSTRAINT project_status_fk FOREIGN KEY(status)
    REFERENCES status(id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    CONSTRAINT project_countrycodes_fk FOREIGN KEY(recipients)
    REFERENCES countrycodes(id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

CREATE TABLE currency(
    id int AUTO_INCREMENT NOT NULL,
    name_currency varchar(50) NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE transaction(
    id int NOT NULL AUTO_INCREMENT,
    id_transaction varchar(50) NOT NULL,
    id_project int NOT NULL,
    transaction_isodate DATE NOT NULL,
    transaction_year int NOT NULL,
    transaction_value_code varchar(10) NOT NULL,
    transaction_currency int NOT NULL,
    transaction_value DECIMAL(20,5) NOT NULL,
    PRIMARY KEY(id),
    CONSTRAINT transaction_project_fk FOREIGN KEY(id_project)
    REFERENCES project(id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    CONSTRAINT transaction_currency_fk FOREIGN KEY(transaction_currency)
    REFERENCES currency(id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

CREATE TABLE level_1a(
    id int NOT NULL AUTO_INCREMENT,
    id_project int NOT NULL,
    id_project_location VARCHAR(50) NOT NULL,
    id_geoname int NOT NULL,
    transaction_start_year int NOT NULL,
    transaction_end_year int NOT NULL,
    even_split_commitments DECIMAL(20,5),
    even_split_disbursements DECIMAL(20,5),
    PRIMARY KEY (id),
    CONSTRAINT level_1a_project_fk FOREIGN KEY (id_project)
    REFERENCES project(id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    CONSTRAINT level_1a_geoname_fk FOREIGN KEY(id_geoname)
    REFERENCES geoname(id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);