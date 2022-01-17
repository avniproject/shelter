set role shelter;

--MIGRATION 1
--Update the Covid Survey subject_type type from Individual to Person


select *
from individual
where subject_type_id = (select id from subject_type where name = 'Family Member')
  and is_voided=false
  and (
            observations ->> '2c833b17-a86c-47b7-b9b5-93b4320c96a0' notnull or
            observations ->> '58965755-e577-4b51-b16d-a361885f4862' notnull or
            observations ->> '4a3705f0-87e1-4d8f-b0b5-15b4b1c4ea4d' notnull or
            observations ->> 'bdb3b553-5a6a-4a98-a07f-c3f374daf804' notnull or
            observations ->> 'e2cecf01-6249-4687-b2f9-0c5fdd75440a' notnull or
            observations ->> 'c41b0aea-7cc8-4bc2-a104-85503d41ac11' notnull or
            observations ->> '84d26153-b1db-4c2e-a4bb-5163888032ae' notnull or
            observations ->> '5b05babe-2bda-40d6-870d-648ee8617701' notnull or
            observations ->> '80dcf3f3-fd84-466a-85d1-213e8ff40e2a' notnull or
            observations ->> 'a7dd62ed-26ec-4ec5-b97c-545cdf12012d' notnull or
            observations ->> 'bea13d5a-0d3d-49ef-98ce-ac8ba6f0ca2c' notnull or
            observations ->> '1bca6ddc-ccbb-4d60-bbcd-2a53ed26ced4' notnull or
            observations ->> 'df2bfd66-083c-4933-bcaa-92a1e3b7efbf' notnull or
            observations ->> '7ed8de2e-081d-4db2-85af-11b8b0eb5b98' notnull or
            observations ->> 'e14e8221-24b6-48ff-9248-dafe2c0f1d05' notnull or
            observations ->> '67190f2f-f5b9-408a-90f0-f766e912edd9' notnull or
            observations ->> 'e617f1fe-ad9e-40e5-a277-8eecfd673941' notnull or
            observations ->> '0b2879ce-5571-45b0-9e5e-a53ab94da31d' notnull or
            observations ->> 'dd11578a-c052-49c1-af2c-24f8c93e04ac' notnull or
            observations ->> '89a5588d-ac66-49c5-89af-8727baa3e61a' notnull or
            observations ->> 'f71f6773-ff5c-4602-909b-b43de1c52a1a' notnull or
            observations ->> '4897b9a1-5c63-4980-956b-c61b62e646da' notnull or
            observations ->> '985f253f-fb73-4874-9a2c-f77f4acc2ee0' notnull or
            observations ->> 'e130331b-0570-474c-bd3e-434e78ba8bce' notnull or
            observations ->> '2a647ce4-3b08-4a06-9e49-6d9fa10b2927' notnull
    );


--MIGRATION 2 (61009)
--'Family member name' 58965755-e577-4b51-b16d-a361885f4862 to first_name
--'Gender(लिंग)' 4a3705f0-87e1-4d8f-b0b5-15b4b1c4ea4d to gender_id
--'Age' e2cecf01-6249-4687-b2f9-0c5fdd75440a to date_of_birth

    update individual
        set first_name = coalesce(observations ->> '58965755-e577-4b51-b16d-a361885f4862', ''),
            last_name = ' ',
            gender_id = (select id
                         from gender
                         where name =
                               coalesce(single_select_coded(observations ->> '4a3705f0-87e1-4d8f-b0b5-15b4b1c4ea4d'),
                                        'Other')),
            date_of_birth = (registration_date -
                             (interval '1 year' *
                              coalesce((observations ->> 'e2cecf01-6249-4687-b2f9-0c5fdd75440a')::numeric, 0)))::date,
            last_modified_date_time = current_timestamp(3) + (id / 1000) * interval '1 millisecond'
        where subject_type_id = (select id from subject_type where name = 'Family Member')
          and is_voided=false
          and (
                    observations ->> '2c833b17-a86c-47b7-b9b5-93b4320c96a0' notnull or
                    observations ->> '58965755-e577-4b51-b16d-a361885f4862' notnull or
                    observations ->> '4a3705f0-87e1-4d8f-b0b5-15b4b1c4ea4d' notnull or
                    observations ->> 'bdb3b553-5a6a-4a98-a07f-c3f374daf804' notnull or
                    observations ->> 'e2cecf01-6249-4687-b2f9-0c5fdd75440a' notnull or
                    observations ->> 'c41b0aea-7cc8-4bc2-a104-85503d41ac11' notnull or
                    observations ->> '84d26153-b1db-4c2e-a4bb-5163888032ae' notnull or
                    observations ->> '5b05babe-2bda-40d6-870d-648ee8617701' notnull or
                    observations ->> '80dcf3f3-fd84-466a-85d1-213e8ff40e2a' notnull or
                    observations ->> 'a7dd62ed-26ec-4ec5-b97c-545cdf12012d' notnull or
                    observations ->> 'bea13d5a-0d3d-49ef-98ce-ac8ba6f0ca2c' notnull or
                    observations ->> '1bca6ddc-ccbb-4d60-bbcd-2a53ed26ced4' notnull or
                    observations ->> 'df2bfd66-083c-4933-bcaa-92a1e3b7efbf' notnull or
                    observations ->> '7ed8de2e-081d-4db2-85af-11b8b0eb5b98' notnull or
                    observations ->> 'e14e8221-24b6-48ff-9248-dafe2c0f1d05' notnull or
                    observations ->> '67190f2f-f5b9-408a-90f0-f766e912edd9' notnull or
                    observations ->> 'e617f1fe-ad9e-40e5-a277-8eecfd673941' notnull or
                    observations ->> '0b2879ce-5571-45b0-9e5e-a53ab94da31d' notnull or
                    observations ->> 'dd11578a-c052-49c1-af2c-24f8c93e04ac' notnull or
                    observations ->> '89a5588d-ac66-49c5-89af-8727baa3e61a' notnull or
                    observations ->> 'f71f6773-ff5c-4602-909b-b43de1c52a1a' notnull or
                    observations ->> '4897b9a1-5c63-4980-956b-c61b62e646da' notnull or
                    observations ->> '985f253f-fb73-4874-9a2c-f77f4acc2ee0' notnull or
                    observations ->> 'e130331b-0570-474c-bd3e-434e78ba8bce' notnull or
                    observations ->> '2a647ce4-3b08-4a06-9e49-6d9fa10b2927' notnull
            );







--Create two encounters from app designer
--Covid Survey
--Social Economic Survey

--MIRGATION 3 move fields from reg to Covid Survey encounter (56669)
-- Name of the surveyor 2c833b17-a86c-47b7-b9b5-93b4320c96a0
-- Are you pregnant or lactating mother? c41b0aea-7cc8-4bc2-a104-85503d41ac11
-- Do you have any disease? 84d26153-b1db-4c2e-a4bb-5163888032ae
-- If yes for other disease, please mention here 5b05babe-2bda-40d6-870d-648ee8617701
-- Have you registered for covid vaccination? 80dcf3f3-fd84-466a-85d1-213e8ff40e2a
-- Covin Reference ID a7dd62ed-26ec-4ec5-b97c-545cdf12012d
-- Mobile number used for vaccination registration bea13d5a-0d3d-49ef-98ce-ac8ba6f0ca2c
-- Have you taken first dose? 1bca6ddc-ccbb-4d60-bbcd-2a53ed26ced4
-- Date of first dose. df2bfd66-083c-4933-bcaa-92a1e3b7efbf
-- Which of the below vaccine taken? 7ed8de2e-081d-4db2-85af-11b8b0eb5b98
-- Have you taken second dose? 2a647ce4-3b08-4a06-9e49-6d9fa10b2927
-- Second dose date. e14e8221-24b6-48ff-9248-dafe2c0f1d05
-- Have you even been infected with corona? 67190f2f-f5b9-408a-90f0-f766e912edd9
-- If corona infected, how many days it had been since infection? e617f1fe-ad9e-40e5-a277-8eecfd673941
-- Are you willing to get vaccinated? 0b2879ce-5571-45b0-9e5e-a53ab94da31d
-- If not willing to take vaccine, why? dd11578a-c052-49c1-af2c-24f8c93e04ac
-- Note 89a5588d-ac66-49c5-89af-8727baa3e61a
insert into encounter (observations, encounter_date_time, encounter_type_id, individual_id, uuid, version, audit_id,
                       organisation_id, created_by_id, last_modified_by_id, created_date_time, last_modified_date_time)
select jsonb_strip_nulls(jsonb_build_object(
        '2c833b17-a86c-47b7-b9b5-93b4320c96a0', observations ->> '2c833b17-a86c-47b7-b9b5-93b4320c96a0',
        'c41b0aea-7cc8-4bc2-a104-85503d41ac11', observations ->> 'c41b0aea-7cc8-4bc2-a104-85503d41ac11',
        '84d26153-b1db-4c2e-a4bb-5163888032ae', observations -> '84d26153-b1db-4c2e-a4bb-5163888032ae',
        '5b05babe-2bda-40d6-870d-648ee8617701', observations ->> '5b05babe-2bda-40d6-870d-648ee8617701',
        '80dcf3f3-fd84-466a-85d1-213e8ff40e2a', observations ->> '80dcf3f3-fd84-466a-85d1-213e8ff40e2a',
        'a7dd62ed-26ec-4ec5-b97c-545cdf12012d', observations ->> 'a7dd62ed-26ec-4ec5-b97c-545cdf12012d',
        'bea13d5a-0d3d-49ef-98ce-ac8ba6f0ca2c', observations -> 'bea13d5a-0d3d-49ef-98ce-ac8ba6f0ca2c',
        '1bca6ddc-ccbb-4d60-bbcd-2a53ed26ced4', observations ->> '1bca6ddc-ccbb-4d60-bbcd-2a53ed26ced4',
        'df2bfd66-083c-4933-bcaa-92a1e3b7efbf', observations ->> 'df2bfd66-083c-4933-bcaa-92a1e3b7efbf',
        '7ed8de2e-081d-4db2-85af-11b8b0eb5b98', observations ->> '7ed8de2e-081d-4db2-85af-11b8b0eb5b98',
        'e14e8221-24b6-48ff-9248-dafe2c0f1d05', observations ->> 'e14e8221-24b6-48ff-9248-dafe2c0f1d05',
        '67190f2f-f5b9-408a-90f0-f766e912edd9', observations ->> '67190f2f-f5b9-408a-90f0-f766e912edd9',
        'e617f1fe-ad9e-40e5-a277-8eecfd673941', observations ->> 'e617f1fe-ad9e-40e5-a277-8eecfd673941',
        '0b2879ce-5571-45b0-9e5e-a53ab94da31d', observations ->> '0b2879ce-5571-45b0-9e5e-a53ab94da31d',
        'dd11578a-c052-49c1-af2c-24f8c93e04ac', observations ->> 'dd11578a-c052-49c1-af2c-24f8c93e04ac',
        '89a5588d-ac66-49c5-89af-8727baa3e61a', observations ->> '89a5588d-ac66-49c5-89af-8727baa3e61a',
        '2a647ce4-3b08-4a06-9e49-6d9fa10b2927', observations ->> '2a647ce4-3b08-4a06-9e49-6d9fa10b2927'
    )),
       registration_date::timestamptz,
       (select id from encounter_type where name = 'Covid Survey'),
       id,
       uuid_generate_v4(),
       0,
       create_audit((select id from users where username = 'shubhangi@shelter')),
       (select id from organisation where name = 'Shelter'),
       (select id from users where username = 'shubhangi@shelter'),
       (select id from users where username = 'shubhangi@shelter'),
       current_timestamp(3) + (id / 1000) * interval '1 millisecond',
       current_timestamp(3) + (id / 1000) * interval '1 millisecond'

from individual
where is_voided = false
  and subject_type_id = (select id from subject_type where name = 'Family Member')
  and id not in (
    select individual.id from individual
                                  join encounter e on individual.id = e.individual_id
    where e.encounter_date_time is not null and e.encounter_type_id = (select id from encounter_type where name = 'Covid Survey'))
  and (
            observations ->> '2c833b17-a86c-47b7-b9b5-93b4320c96a0' notnull or
            observations ->> '58965755-e577-4b51-b16d-a361885f4862' notnull or
            observations ->> '4a3705f0-87e1-4d8f-b0b5-15b4b1c4ea4d' notnull or
            observations ->> 'bdb3b553-5a6a-4a98-a07f-c3f374daf804' notnull or
            observations ->> 'e2cecf01-6249-4687-b2f9-0c5fdd75440a' notnull or
            observations ->> 'c41b0aea-7cc8-4bc2-a104-85503d41ac11' notnull or
            observations ->> '84d26153-b1db-4c2e-a4bb-5163888032ae' notnull or
            observations ->> '5b05babe-2bda-40d6-870d-648ee8617701' notnull or
            observations ->> '80dcf3f3-fd84-466a-85d1-213e8ff40e2a' notnull or
            observations ->> 'a7dd62ed-26ec-4ec5-b97c-545cdf12012d' notnull or
            observations ->> 'bea13d5a-0d3d-49ef-98ce-ac8ba6f0ca2c' notnull or
            observations ->> '1bca6ddc-ccbb-4d60-bbcd-2a53ed26ced4' notnull or
            observations ->> 'df2bfd66-083c-4933-bcaa-92a1e3b7efbf' notnull or
            observations ->> '7ed8de2e-081d-4db2-85af-11b8b0eb5b98' notnull or
            observations ->> 'e14e8221-24b6-48ff-9248-dafe2c0f1d05' notnull or
            observations ->> '67190f2f-f5b9-408a-90f0-f766e912edd9' notnull or
            observations ->> 'e617f1fe-ad9e-40e5-a277-8eecfd673941' notnull or
            observations ->> '0b2879ce-5571-45b0-9e5e-a53ab94da31d' notnull or
            observations ->> 'dd11578a-c052-49c1-af2c-24f8c93e04ac' notnull or
            observations ->> '89a5588d-ac66-49c5-89af-8727baa3e61a' notnull or
            observations ->> 'f71f6773-ff5c-4602-909b-b43de1c52a1a' notnull or
            observations ->> '4897b9a1-5c63-4980-956b-c61b62e646da' notnull or
            observations ->> '985f253f-fb73-4874-9a2c-f77f4acc2ee0' notnull or
            observations ->> 'e130331b-0570-474c-bd3e-434e78ba8bce' notnull or
            observations ->> '2a647ce4-3b08-4a06-9e49-6d9fa10b2927' notnull
    );


--MIRGATION 4 move fields from reg to Social Economic Survey encounter (521)
-- Name of the surveyor 2c833b17-a86c-47b7-b9b5-93b4320c96a0
-- What is relation to head of the household? f71f6773-ff5c-4602-909b-b43de1c52a1a
-- If other relation, please specify 4897b9a1-5c63-4980-956b-c61b62e646da
-- Income-member 1 985f253f-fb73-4874-9a2c-f77f4acc2ee0
-- Comment if any ? e130331b-0570-474c-bd3e-434e78ba8bce
insert into encounter (observations, encounter_date_time, encounter_type_id, individual_id, uuid, version, audit_id,
                       organisation_id, created_by_id, last_modified_by_id, created_date_time, last_modified_date_time)
select jsonb_strip_nulls(jsonb_build_object(
        '2c833b17-a86c-47b7-b9b5-93b4320c96a0', observations ->> '2c833b17-a86c-47b7-b9b5-93b4320c96a0',
        'f71f6773-ff5c-4602-909b-b43de1c52a1a', observations ->> 'f71f6773-ff5c-4602-909b-b43de1c52a1a',
        '4897b9a1-5c63-4980-956b-c61b62e646da', observations ->> '4897b9a1-5c63-4980-956b-c61b62e646da',
        '985f253f-fb73-4874-9a2c-f77f4acc2ee0', observations ->> '985f253f-fb73-4874-9a2c-f77f4acc2ee0',
        'e130331b-0570-474c-bd3e-434e78ba8bce', observations ->> 'e130331b-0570-474c-bd3e-434e78ba8bce'
    )),
       registration_date::timestamptz,
       (select id from encounter_type where name = 'Social Economic Survey'),
       id,
       uuid_generate_v4(),
       0,
       create_audit((select id from users where username = 'shubhangi@shelter')),
       (select id from organisation where name = 'Shelter'),
       (select id from users where username = 'shubhangi@shelter'),
       (select id from users where username = 'shubhangi@shelter'),
       current_timestamp(3) + (id / 1000) * interval '1 millisecond',
       current_timestamp(3) + (id / 1000) * interval '1 millisecond'
from individual
where is_voided = false
  and subject_type_id = (select id from subject_type where name = 'Family Member')
  and jsonb_strip_nulls(jsonb_build_object(
        'f71f6773-ff5c-4602-909b-b43de1c52a1a', observations ->> 'f71f6773-ff5c-4602-909b-b43de1c52a1a',
        '4897b9a1-5c63-4980-956b-c61b62e646da', observations ->> '4897b9a1-5c63-4980-956b-c61b62e646da',
        '985f253f-fb73-4874-9a2c-f77f4acc2ee0', observations ->> '985f253f-fb73-4874-9a2c-f77f4acc2ee0',
        'e130331b-0570-474c-bd3e-434e78ba8bce', observations ->> 'e130331b-0570-474c-bd3e-434e78ba8bce'
    ))::text <> '{}'::text
  and id not in (
    select individual.id from individual
                                  join encounter e on individual.id = e.individual_id
    where e.encounter_date_time is not null and e.encounter_type_id = (select id from encounter_type where name = 'Social Economic Survey') )
  and (
            observations ->> '2c833b17-a86c-47b7-b9b5-93b4320c96a0' notnull or
            observations ->> '58965755-e577-4b51-b16d-a361885f4862' notnull or
            observations ->> '4a3705f0-87e1-4d8f-b0b5-15b4b1c4ea4d' notnull or
            observations ->> 'bdb3b553-5a6a-4a98-a07f-c3f374daf804' notnull or
            observations ->> 'e2cecf01-6249-4687-b2f9-0c5fdd75440a' notnull or
            observations ->> 'c41b0aea-7cc8-4bc2-a104-85503d41ac11' notnull or
            observations ->> '84d26153-b1db-4c2e-a4bb-5163888032ae' notnull or
            observations ->> '5b05babe-2bda-40d6-870d-648ee8617701' notnull or
            observations ->> '80dcf3f3-fd84-466a-85d1-213e8ff40e2a' notnull or
            observations ->> 'a7dd62ed-26ec-4ec5-b97c-545cdf12012d' notnull or
            observations ->> 'bea13d5a-0d3d-49ef-98ce-ac8ba6f0ca2c' notnull or
            observations ->> '1bca6ddc-ccbb-4d60-bbcd-2a53ed26ced4' notnull or
            observations ->> 'df2bfd66-083c-4933-bcaa-92a1e3b7efbf' notnull or
            observations ->> '7ed8de2e-081d-4db2-85af-11b8b0eb5b98' notnull or
            observations ->> 'e14e8221-24b6-48ff-9248-dafe2c0f1d05' notnull or
            observations ->> '67190f2f-f5b9-408a-90f0-f766e912edd9' notnull or
            observations ->> 'e617f1fe-ad9e-40e5-a277-8eecfd673941' notnull or
            observations ->> '0b2879ce-5571-45b0-9e5e-a53ab94da31d' notnull or
            observations ->> 'dd11578a-c052-49c1-af2c-24f8c93e04ac' notnull or
            observations ->> '89a5588d-ac66-49c5-89af-8727baa3e61a' notnull or
            observations ->> 'f71f6773-ff5c-4602-909b-b43de1c52a1a' notnull or
            observations ->> '4897b9a1-5c63-4980-956b-c61b62e646da' notnull or
            observations ->> '985f253f-fb73-4874-9a2c-f77f4acc2ee0' notnull or
            observations ->> 'e130331b-0570-474c-bd3e-434e78ba8bce' notnull or
            observations ->> '2a647ce4-3b08-4a06-9e49-6d9fa10b2927' notnull
    );;





--MIGRATION 5 remove all the 3 and 4 obs from registration
update individual
set observations = observations - Array [
    '2c833b17-a86c-47b7-b9b5-93b4320c96a0',
    '58965755-e577-4b51-b16d-a361885f4862',
    '4a3705f0-87e1-4d8f-b0b5-15b4b1c4ea4d',
    'bdb3b553-5a6a-4a98-a07f-c3f374daf804',
    'e2cecf01-6249-4687-b2f9-0c5fdd75440a',
    'c41b0aea-7cc8-4bc2-a104-85503d41ac11',
    '84d26153-b1db-4c2e-a4bb-5163888032ae',
    '5b05babe-2bda-40d6-870d-648ee8617701',
    '80dcf3f3-fd84-466a-85d1-213e8ff40e2a',
    'a7dd62ed-26ec-4ec5-b97c-545cdf12012d',
    'bea13d5a-0d3d-49ef-98ce-ac8ba6f0ca2c',
    '1bca6ddc-ccbb-4d60-bbcd-2a53ed26ced4',
    'df2bfd66-083c-4933-bcaa-92a1e3b7efbf',
    '7ed8de2e-081d-4db2-85af-11b8b0eb5b98',
    'e14e8221-24b6-48ff-9248-dafe2c0f1d05',
    '67190f2f-f5b9-408a-90f0-f766e912edd9',
    'e617f1fe-ad9e-40e5-a277-8eecfd673941',
    '0b2879ce-5571-45b0-9e5e-a53ab94da31d',
    'dd11578a-c052-49c1-af2c-24f8c93e04ac',
    '89a5588d-ac66-49c5-89af-8727baa3e61a',
    'f71f6773-ff5c-4602-909b-b43de1c52a1a',
    '4897b9a1-5c63-4980-956b-c61b62e646da',
    '985f253f-fb73-4874-9a2c-f77f4acc2ee0',
    'e130331b-0570-474c-bd3e-434e78ba8bce',
    '2a647ce4-3b08-4a06-9e49-6d9fa10b2927'
    ]
where subject_type_id = (select id from subject_type where name = 'Family Member')
  and is_voided =false
  and (
            observations ->> '2c833b17-a86c-47b7-b9b5-93b4320c96a0' notnull or
            observations ->> '58965755-e577-4b51-b16d-a361885f4862' notnull or
            observations ->> '4a3705f0-87e1-4d8f-b0b5-15b4b1c4ea4d' notnull or
            observations ->> 'bdb3b553-5a6a-4a98-a07f-c3f374daf804' notnull or
            observations ->> 'e2cecf01-6249-4687-b2f9-0c5fdd75440a' notnull or
            observations ->> 'c41b0aea-7cc8-4bc2-a104-85503d41ac11' notnull or
            observations ->> '84d26153-b1db-4c2e-a4bb-5163888032ae' notnull or
            observations ->> '5b05babe-2bda-40d6-870d-648ee8617701' notnull or
            observations ->> '80dcf3f3-fd84-466a-85d1-213e8ff40e2a' notnull or
            observations ->> 'a7dd62ed-26ec-4ec5-b97c-545cdf12012d' notnull or
            observations ->> 'bea13d5a-0d3d-49ef-98ce-ac8ba6f0ca2c' notnull or
            observations ->> '1bca6ddc-ccbb-4d60-bbcd-2a53ed26ced4' notnull or
            observations ->> 'df2bfd66-083c-4933-bcaa-92a1e3b7efbf' notnull or
            observations ->> '7ed8de2e-081d-4db2-85af-11b8b0eb5b98' notnull or
            observations ->> 'e14e8221-24b6-48ff-9248-dafe2c0f1d05' notnull or
            observations ->> '67190f2f-f5b9-408a-90f0-f766e912edd9' notnull or
            observations ->> 'e617f1fe-ad9e-40e5-a277-8eecfd673941' notnull or
            observations ->> '0b2879ce-5571-45b0-9e5e-a53ab94da31d' notnull or
            observations ->> 'dd11578a-c052-49c1-af2c-24f8c93e04ac' notnull or
            observations ->> '89a5588d-ac66-49c5-89af-8727baa3e61a' notnull or
            observations ->> 'f71f6773-ff5c-4602-909b-b43de1c52a1a' notnull or
            observations ->> '4897b9a1-5c63-4980-956b-c61b62e646da' notnull or
            observations ->> '985f253f-fb73-4874-9a2c-f77f4acc2ee0' notnull or
            observations ->> 'e130331b-0570-474c-bd3e-434e78ba8bce' notnull or
            observations ->> '2a647ce4-3b08-4a06-9e49-6d9fa10b2927' notnull
    );
