--TABLA TEMPORAL COUNTRY CODES
CREATE TABLE country_codes_temp(
    name VARCHAR(255),
    iso2 VARCHAR(255),
    name_name VARCHAR(255),
    name_aiddata_code VARCHAR(255),
    name_aiddata_name VARCHAR(255),
    name_cow_alpha VARCHAR(255),
    name_cow_numeric VARCHAR(255),
    name_fao_code VARCHAR(255),
    name_fips VARCHAR(255),
    name_geonames_id VARCHAR(255),
    name_imf_code VARCHAR(255),
    name_iso2 VARCHAR(255),
    name_iso3 VARCHAR(255),
    name_iso_numeric VARCHAR(255),
    name_oecd_code VARCHAR(255),
    name_oecd_name VARCHAR(255),
    name_un_code VARCHAR(255),
    name_wb_code VARCHAR(255)
);

--TABLA TEMPORAL GEONAMES
CREATE TABLE geonames_temp(
    geoname_id VARCHAR(255),
    place_name VARCHAR(255),
    latitude VARCHAR(255),
    longitude VARCHAR(255),
    location_type_code VARCHAR(255),
    location_type_name VARCHAR(255),
    gazetteer_adm_code VARCHAR(255),
    gazetteer_adm_name VARCHAR(255),
    location_class VARCHAR(255),
    geographic_exactness VARCHAR(255)
);

--TABLA TEMPORAL LEVEL_1A
CREATE TABLE level_1a_temp(
    project_id VARCHAR(255),
    project_location_id VARCHAR(255),
    geoname_id VARCHAR(255),
    transactions_start_year VARCHAR(255),
    transactions_end_year VARCHAR(255),
    even_split_commitments VARCHAR(255),
    even_split_disbursements VARCHAR(255)
);

--TABLA TEMPORAL LOCATIONS
CREATE TABLE locations_temp(
    location_type_code VARCHAR(255),
    location_type_name VARCHAR(255)
);

--TABLA TEMPORAL PROJECTS
CREATE TABLE projects_temp(
    project_id VARCHAR(255),
    is_geocoded VARCHAR(255),
    project_title VARCHAR(255),
    start_actual_isodate VARCHAR(255),
    end_actual_isodate VARCHAR(255),
    donors VARCHAR(255),
    donors_iso3 VARCHAR(255),
    recipients VARCHAR(255),
    recipients_iso3 VARCHAR(255),
    ad_sector_codes VARCHAR(255),
    ad_sector_names VARCHAR(255),
    status VARCHAR(255),
    transactions_start_year VARCHAR(255),
    transactions_end_year VARCHAR(255),
    total_commitments VARCHAR(255),
    total_disbursements VARCHAR(255)
);

--TABLA TEMPORAL TRANSACTIONS
CREATE TABLE transactions_temp(
    transaction_id VARCHAR(255),
    project_id VARCHAR(255),
    transaction_isodate VARCHAR(255),
    transaction_year VARCHAR(255),
    transaction_value_code VARCHAR(255),
    transaction_currency VARCHAR(255),
    transaction_value VARCHAR(255)
);