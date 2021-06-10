-- There was an initial migration done to move all values from water enrolment to an encounter.
-- This did not move values of the Photo of water meter. This script will perform this migration.

-- Source program: Water supply
-- Source concept: Photo for water meter
-- Destination encounter type: Water
-- Destination concept: Photo of water meter bill
-- ​Expected rows to be updated: 554
-- ​
-- It will ignore any rows that have already been updated (about 7 rows already have values)
-- It will not update for the following individuals. Please do this manually - 0133 (United Agency(Rajiv Gandhi Nagar)) and 0025 (Tophecha Mal (K Karvir)).

set role shelter;
-- Select concept that needs to be migrated
select *
from concept
where id = 13245
  and uuid = 'e9fc428d-3890-452b-9a97-1e5fa5fa5c6a'
  and name = 'Photo for water meter';
-- 1 row selected

-- Find out program that the program enrolment belongs to
select *
from program
where id = 59
  and name = 'Water supply'
  and uuid = '63b187f4-7b95-4674-bf7e-104bd386c43f';
-- 1 row selected

-- Count list of program encounters that have the concept value filled
select count(*)
from program_enrolment penr
where penr.observations ->> 'e9fc428d-3890-452b-9a97-1e5fa5fa5c6a' is not null;
-- 563

-- Ensure that all these program enrolments are in the same program
select count(*)
from program_enrolment penr
where penr.observations ->> 'e9fc428d-3890-452b-9a97-1e5fa5fa5c6a' is not null
  and penr.program_id = 59;
-- 563 (same as before)

-- Find out the right encounter that the observation should go to
select *
from encounter_type et
where id = 284
  and name = 'Water'
  and uuid = 'e62431ec-acf8-4ba9-9bd4-dd0dd94280e0';

-- Pick up all program encounters that map to these program enrolments in the encounter table
select count(*)
from program_enrolment penr
         inner join encounter e
                    on e.individual_id = penr.individual_id
                        and e.encounter_type_id = 284
                        and e.is_voided is false
                        and penr.is_voided is false
                        and e.cancel_date_time is null
                        and e.encounter_date_time is not null
where penr.observations ->> 'e9fc428d-3890-452b-9a97-1e5fa5fa5c6a' is not null
  and penr.program_id = 59
  and penr.id not in (75670, 81215);
-- 561 rows (we cannot fix the two items in the query. They have to be manually managed)

-- Find out destination concept
select *
from concept
where id = 13751
  and name = 'Photo of water meter bill'
  and uuid = '902e44dd-4d8a-4728-962a-28cfa4733c5b';

-- 7 rows already have values. We will not overwrite them
select count(*)
from program_enrolment penr
         inner join encounter e
                    on e.individual_id = penr.individual_id
                        and e.encounter_type_id = 284
                        and e.is_voided is false
                        and penr.is_voided is false
                        and e.cancel_date_time is null
                        and e.encounter_date_time is not null
where penr.observations ->> 'e9fc428d-3890-452b-9a97-1e5fa5fa5c6a' is not null
  and e.observations ->> '902e44dd-4d8a-4728-962a-28cfa4733c5b' is not null
  and penr.program_id = 59
  and penr.id not in (75670, 81215);


-- Select query to see if our values are being mashed perfectly. Verify a few rows to ensure things are working fine
select e.observations                          observations,
       (concat('{"902e44dd-4d8a-4728-962a-28cfa4733c5b": "',
               penr.observations ->> 'e9fc428d-3890-452b-9a97-1e5fa5fa5c6a',
               '"}'))::jsonb                   new_field,
       e.observations || (concat('{"902e44dd-4d8a-4728-962a-28cfa4733c5b": "',
                                 penr.observations ->> 'e9fc428d-3890-452b-9a97-1e5fa5fa5c6a',
                                 '"}'))::jsonb combined_observations
from program_enrolment penr
         inner join encounter e
                    on e.individual_id = penr.individual_id
                        and e.encounter_type_id = 284
                        and e.is_voided is false
                        and penr.is_voided is false
                        and e.cancel_date_time is null
                        and e.encounter_date_time is not null
where penr.observations ->> 'e9fc428d-3890-452b-9a97-1e5fa5fa5c6a' is not null
  and e.observations ->> '902e44dd-4d8a-4728-962a-28cfa4733c5b' is not null
  and penr.program_id = 59
  and penr.id not in (75670, 81215)
  and penr.id = 79152;

-- Final update query
with audit_ids as (update encounter
    set observations = encounter.observations || (concat('{"902e44dd-4d8a-4728-962a-28cfa4733c5b": "',
                                                         penr.observations ->> 'e9fc428d-3890-452b-9a97-1e5fa5fa5c6a',
                                                         '"}'))::jsonb
    from program_enrolment penr
    where encounter.individual_id = penr.individual_id
        and encounter.encounter_type_id = 284
        and encounter.is_voided is false
        and penr.is_voided is false
        and encounter.cancel_date_time is null
        and encounter.encounter_date_time is not null -- We have migrated once, so don't look for rows that are empty
        and
          penr.observations ->> 'e9fc428d-3890-452b-9a97-1e5fa5fa5c6a' is not null -- Pick only rows where there is a value
        and
          encounter.observations ->> '902e44dd-4d8a-4728-962a-28cfa4733c5b' is null -- Do not update rows that are already filled in
        and penr.program_id = 59
        and penr.id not in (75670, 81215) returning encounter.audit_id as program_encounter_audit_id)
update audit
set last_modified_date_time = current_timestamp,
    last_modified_by_id     = (select id from users where username = 'shubhangi@shelter')
where id in (select program_encounter_audit_id from audit_ids);

-- Ensure that all rows have been migrated. This should return 0 rows
select count(*)
from program_enrolment penr
         inner join encounter e
                    on e.individual_id = penr.individual_id
                        and e.encounter_type_id = 284
                        and e.is_voided is false
                        and penr.is_voided is false
                        and e.cancel_date_time is null
                        and e.encounter_date_time is not null
where penr.observations ->> 'e9fc428d-3890-452b-9a97-1e5fa5fa5c6a' is not null
  and e.observations ->> '902e44dd-4d8a-4728-962a-28cfa4733c5b' is null
  and penr.program_id = 59
  and penr.id not in (75670, 81215);

commit;
