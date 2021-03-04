--Ticket : https://avni.freshdesk.com/a/tickets/1109

set role shelter;

--"Current place of defecation" is required question for the Sanitation enrolment
--Count encounters where "Current place of defecation" is not present but it is there in the enrolment of an individual
select count(*)
from encounter enc
         join program_enrolment pe on enc.individual_id = pe.individual_id
where enc.observations -> '2dbf95e5-2eb1-4fc2-9185-7f80d603330d' isnull
  and encounter_type_id = ((select id from encounter_type where name = 'Sanitation'))
  and program_id = (select id from program where name = 'Sanitation')
  and pe.observations -> '2dbf95e5-2eb1-4fc2-9185-7f80d603330d' notnull
  and encounter_date_time notnull;

--Update such encounters
with audits as (
    update encounter enc
        set observations = enc.observations || jsonb_strip_nulls(json_build_object(
                'a5f01ad9-22bf-4c0f-a93c-87d4e3f420a8', enl.observations -> 'a5f01ad9-22bf-4c0f-a93c-87d4e3f420a8',
                'e130331b-0570-474c-bd3e-434e78ba8bce', enl.observations -> 'e130331b-0570-474c-bd3e-434e78ba8bce',
                '6516983a-39f4-4088-9cbe-0d19f94f7a0e', enl.observations -> '6516983a-39f4-4088-9cbe-0d19f94f7a0e',
                'e1bdb9ab-3005-4751-b61d-006fd82f1e21', enl.observations -> 'e1bdb9ab-3005-4751-b61d-006fd82f1e21',
                '9ad3fc36-d7f4-4643-baff-8a80ad4085db', enl.observations -> '9ad3fc36-d7f4-4643-baff-8a80ad4085db',
                '42ab25e0-b632-4eaa-b0c3-ce4c982eb6b7', enl.observations -> '42ab25e0-b632-4eaa-b0c3-ce4c982eb6b7',
                '5d0fd955-6edb-40af-800d-a097cf438764', enl.observations -> '5d0fd955-6edb-40af-800d-a097cf438764',
                '9e7f236e-8190-4052-b8f6-326ae8409bfd', enl.observations -> '9e7f236e-8190-4052-b8f6-326ae8409bfd',
                '2dbf95e5-2eb1-4fc2-9185-7f80d603330d', enl.observations -> '2dbf95e5-2eb1-4fc2-9185-7f80d603330d',
                'aec0cb21-2493-4afd-b01d-a43e6fc33aac', enl.observations -> 'aec0cb21-2493-4afd-b01d-a43e6fc33aac',
                'e0b51191-5164-4675-8905-2df02edc0497', enl.observations -> 'e0b51191-5164-4675-8905-2df02edc0497',
                '26081f29-405b-4347-8069-2c0d188a643d', enl.observations -> '26081f29-405b-4347-8069-2c0d188a643d',
                'a484fd88-1782-4454-9dc7-273ec585b729', enl.observations -> 'a484fd88-1782-4454-9dc7-273ec585b729',
                'ffaab3d3-e8ad-4ea2-8734-621e7027db51', enl.observations -> 'ffaab3d3-e8ad-4ea2-8734-621e7027db51',
                '11a06943-0bcd-426b-ad0c-a93ae7f5d6ba', enl.observations -> '11a06943-0bcd-426b-ad0c-a93ae7f5d6ba',
                'd33d5ce6-d839-4641-89f2-de5fc4fdcb41', enl.observations -> 'd33d5ce6-d839-4641-89f2-de5fc4fdcb41',
                'e130331b-0570-474c-bd3e-434e78ba8bce', enl.observations -> 'e130331b-0570-474c-bd3e-434e78ba8bce'
            )::jsonb)
        from program_enrolment enl
        where enl.program_id = (select p.id from program p where p.name = 'Sanitation')
            and enc.encounter_type_id = ((select et.id from encounter_type et where et.name = 'Sanitation'))
            and enc.encounter_date_time notnull
            and enc.individual_id = enl.individual_id
            and enl.observations -> '2dbf95e5-2eb1-4fc2-9185-7f80d603330d' notnull
            and enc.observations -> '2dbf95e5-2eb1-4fc2-9185-7f80d603330d' isnull
        returning enc.audit_id
)
update audit
set last_modified_date_time = current_timestamp
where id in (select audit_id from audits);
