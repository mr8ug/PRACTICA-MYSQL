USE Practica1;

INSERT INTO locations
SELECT DISTINCT location_type_code, location_type_name
FROM locations_temp;

INSERT INTO currency (name_currency)
SELECT DISTINCT transaction_currency
FROM transactions_temp;

INSERT INTO status (name)
SELECT DISTINCT status
FROM projects_temp;

INSERT INTO countrycodes(name, iso2, name_name, name_aiddata_code, name_aiddata_name, name_cow_alpha, name_cow_numeric, name_fao_code, name_fips, name_geonames_id, name_imf_code, name_iso2, name_iso3, name_iso_numeric, name_oecd_code, name_oecd_name, name_un_code, name_wb_code)
SELECT DISTINCT name, iso2, name_name, name_aiddata_code, name_aiddata_name, name_cow_alpha, name_cow_numeric, name_fao_code, name_fips, name_geonames_id, name_imf_code, name_iso2, name_iso3, name_iso_numeric, name_oecd_code, name_oecd_name, name_un_code, name_wb_code
FROM country_codes_temp;

INSERT INTO geoname(id_geoname, place_name, latitude, longitude,location_type_code,gazetteer_adm_code, gazetteer_adm_name,location_class,geographical_exactness)
SELECT geoname_id, place_name, latitude, longitude, location_type_code,gazetteer_adm_code, gazetteer_adm_name,location_class,geographical_exactness
FROM geonames_temp;

INSERT IGNORE INTO project(id_project,id_geocoded,project_title, start_actual_isodate, end_actual_isodate, donors, donors_iso3,recipients,ad_sector_codes, ad_sector_names,status,transactions_start_year, transactions_end_year,total_commitments,total_disbursements)
SELECT DISTINCT pt.project_id, pt.is_geocoded, pt.project_title, pt.start_actual_isodate, pt.end_actual_isodate,pt.donors, pt.donors_iso3,(SELECT DISTINCT id from countrycodes as cc1, projects_temp as pt1 where cc1.name = pt1.recipients LIMIT 1),pt.ad_sector_codes,pt.ad_sector_names,(SELECT DISTINCT id from status as s1, projects_temp as pt2 where s1.name = pt2.status LIMIT 1),pt.transactions_start_year,pt.transactions_end_year,IF(pt.total_commitments='',NULL, CAST(pt.total_commitments AS DECIMAL(19,5))),IF(pt.total_disbursements='',NULL,CAST(pt.total_disbursements AS DECIMAL(19,5)))
FROM projects_temp as pt, status as s, countrycodes as cc;


INSERT INTO transaction(id_transaction,id_project,transaction_isodate,transaction_year,transaction_value_code, transaction_currency,transaction_value)
SELECT tt.transaction_id, p.id,  STR_TO_DATE(tt.transaction_isodate,"%d/%m/%Y"), tt.transaction_year, tt.transaction_value_code, c.id, tt.transaction_value
FROM transactions_temp as tt, project as p, currency as c
WHERE tt.project_id = p.id_project AND tt.transaction_currency = c.name_currency;

INSERT IGNORE INTO level_1a(id_project,id_project_location,id_geoname, transaction_start_year, transaction_end_year, even_split_commitments, even_split_disbursements)
SELECT DISTINCT p.id, l.project_location_id, g.id, l.transactions_start_year, l.transactions_end_year, CAST(l.even_split_commitments AS DECIMAL(19,5)),  CAST(l.even_split_disbursements AS DECIMAL(19,5))
FROM level_1a_temp as l, project as p, geoname as g
WHERE l.project_id = p.id_project AND l.geoname_id = g.id_geoname;