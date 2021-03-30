--Ticket : https://avni.freshdesk.com/a/tickets/1173

set role shelter;

insert into encounter(observations, encounter_date_time, encounter_type_id, individual_id, uuid, version,
                      organisation_id, audit_id, cancel_observations)
select jsonb_strip_nulls(json_build_object(
        '7fba7f93-b69b-4213-bedb-a0da9fc6ff91', i.observations -> '7fba7f93-b69b-4213-bedb-a0da9fc6ff91',
        '10dff1a6-b9a0-40f3-a2ae-e30b15c4763c', i.observations -> '10dff1a6-b9a0-40f3-a2ae-e30b15c4763c',
        '9ed61367-3bb1-4b2b-8d53-b96d4386d88c', i.observations -> '9ed61367-3bb1-4b2b-8d53-b96d4386d88c',
        '332bf2bb-424f-4be1-ab56-ee7732def001', i.observations -> '332bf2bb-424f-4be1-ab56-ee7732def001',
        '48cc2430-6bd5-493b-9fdd-eccf584e3f2e', i.observations -> '48cc2430-6bd5-493b-9fdd-eccf584e3f2e',
        '4b2e59d2-02be-4467-9d54-425679c17c8a', i.observations -> '4b2e59d2-02be-4467-9d54-425679c17c8a',
        'bedd0845-8eda-4955-b6da-436704e639bb', i.observations -> 'bedd0845-8eda-4955-b6da-436704e639bb',
        'ec6449fa-df43-46c8-8508-7dbe1545df14', i.observations -> 'ec6449fa-df43-46c8-8508-7dbe1545df14',
        'ba9767b4-c95e-4426-96cd-1287bf6f313a', i.observations -> 'ba9767b4-c95e-4426-96cd-1287bf6f313a',
        'be980299-9dde-452e-8226-0dbafa9c504f', i.observations -> 'be980299-9dde-452e-8226-0dbafa9c504f',
        '66fd3ba6-d38b-4448-b5d5-535d5bd12d3f', i.observations -> '66fd3ba6-d38b-4448-b5d5-535d5bd12d3f',
        '16188801-c97c-44bd-8ee3-743263584e11', i.observations -> '16188801-c97c-44bd-8ee3-743263584e11',
        '558657ec-5542-48a5-ab97-41c4f6a8845c', i.observations -> '558657ec-5542-48a5-ab97-41c4f6a8845c',
        '81f5cac5-33e0-46ad-b2ff-4e2f7a6e8850', i.observations -> '81f5cac5-33e0-46ad-b2ff-4e2f7a6e8850',
        '603a0744-d30b-4197-acba-882fd531021a', i.observations -> '603a0744-d30b-4197-acba-882fd531021a',
        'bd7fb3f3-fdbd-489c-8c89-581c72042975', i.observations -> 'bd7fb3f3-fdbd-489c-8c89-581c72042975',
        '6dcdd591-0335-48b2-aef9-e24ee712425c', i.observations -> '6dcdd591-0335-48b2-aef9-e24ee712425c',
        '975c75b7-cc14-4432-bdce-b33f5f816d41', i.observations -> '975c75b7-cc14-4432-bdce-b33f5f816d41',
        'cae7b5f5-4fef-4dc6-a2ef-2b6f19e7f96f', i.observations -> 'cae7b5f5-4fef-4dc6-a2ef-2b6f19e7f96f',
        'baebd1c2-1b08-4ac7-9859-99a332e1fd4e', i.observations -> 'baebd1c2-1b08-4ac7-9859-99a332e1fd4e',
        '724f3ae4-62c8-4975-8ea8-d01338b27d29', i.observations -> '724f3ae4-62c8-4975-8ea8-d01338b27d29',
        'f3db9ff8-fabe-4e49-8f58-d0e6ee6b073c', i.observations -> 'f3db9ff8-fabe-4e49-8f58-d0e6ee6b073c',
        '38fa346f-b213-4686-9410-c79c5a1a22d0', i.observations -> '38fa346f-b213-4686-9410-c79c5a1a22d0',
        'eb605d55-cae9-4c3f-b88f-4c9710f98f51', i.observations -> 'eb605d55-cae9-4c3f-b88f-4c9710f98f51',
        'd20f14d2-6b2f-43c3-b030-bbaccff0ea1e', i.observations -> 'd20f14d2-6b2f-43c3-b030-bbaccff0ea1e',
        '30a82a03-9030-4d0f-8cf1-8ff95cedfa89', i.observations -> '30a82a03-9030-4d0f-8cf1-8ff95cedfa89',
        '0d323c53-5913-4bfa-b509-a8d676ea4ebb', i.observations -> '0d323c53-5913-4bfa-b509-a8d676ea4ebb',
        '0fc3b29e-9e97-4966-98fb-8583b4f509d7', i.observations -> '0fc3b29e-9e97-4966-98fb-8583b4f509d7',
        '877c1266-a426-4d43-a4bc-35c4c62c591b', i.observations -> '877c1266-a426-4d43-a4bc-35c4c62c591b',
        '3456c339-6dd0-4fb8-a14a-cf177797e51c', i.observations -> '3456c339-6dd0-4fb8-a14a-cf177797e51c',
        'c78d09ff-75ce-422c-bff4-05d96439b584', i.observations -> 'c78d09ff-75ce-422c-bff4-05d96439b584',
        '06115034-79a4-4c43-9314-81185f8b09f2', i.observations -> '06115034-79a4-4c43-9314-81185f8b09f2',
        '3e4f91dd-0d56-45a2-a8ef-5dbb4fe8137f', i.observations -> '3e4f91dd-0d56-45a2-a8ef-5dbb4fe8137f',
        'f2c5aeeb-f2ac-4590-9b5b-17d0b76f560f', i.observations -> 'f2c5aeeb-f2ac-4590-9b5b-17d0b76f560f',
        'e2e74b61-cab4-43d0-bb01-a3a96f6036cb', i.observations -> 'e2e74b61-cab4-43d0-bb01-a3a96f6036cb'
    )::jsonb),
       registration_date::timestamptz,
       (select id from encounter_type where name = 'Housing Survey Form'),
       i.id,
       uuid_generate_v4(),
       0,
       (select id from organisation where name = 'Shelter'),
       create_audit((select id from users where username = 'shubhangi@shelter')),
       '{}'::jsonb
from individual i
         left join encounter e on i.id = e.individual_id and e.encounter_type_id =
                                                             (select id from encounter_type where name = 'Housing Survey Form')
where e.id isnull
  and subject_type_id = (select id from subject_type where name = 'Household')
  and (i.observations -> '7fba7f93-b69b-4213-bedb-a0da9fc6ff91' notnull
    or i.observations -> '10dff1a6-b9a0-40f3-a2ae-e30b15c4763c' notnull
    or i.observations -> '9ed61367-3bb1-4b2b-8d53-b96d4386d88c' notnull
    or i.observations -> '332bf2bb-424f-4be1-ab56-ee7732def001' notnull
    or i.observations -> '48cc2430-6bd5-493b-9fdd-eccf584e3f2e' notnull
    or i.observations -> '4b2e59d2-02be-4467-9d54-425679c17c8a' notnull
    or i.observations -> 'bedd0845-8eda-4955-b6da-436704e639bb' notnull
    or i.observations -> 'ec6449fa-df43-46c8-8508-7dbe1545df14' notnull
    or i.observations -> 'ba9767b4-c95e-4426-96cd-1287bf6f313a' notnull
    or i.observations -> 'be980299-9dde-452e-8226-0dbafa9c504f' notnull
    or i.observations -> '66fd3ba6-d38b-4448-b5d5-535d5bd12d3f' notnull
    or i.observations -> '16188801-c97c-44bd-8ee3-743263584e11' notnull
    or i.observations -> '558657ec-5542-48a5-ab97-41c4f6a8845c' notnull
    or i.observations -> '81f5cac5-33e0-46ad-b2ff-4e2f7a6e8850' notnull
    or i.observations -> '603a0744-d30b-4197-acba-882fd531021a' notnull
    or i.observations -> 'bd7fb3f3-fdbd-489c-8c89-581c72042975' notnull
    or i.observations -> '6dcdd591-0335-48b2-aef9-e24ee712425c' notnull
    or i.observations -> '975c75b7-cc14-4432-bdce-b33f5f816d41' notnull
    or i.observations -> 'cae7b5f5-4fef-4dc6-a2ef-2b6f19e7f96f' notnull
    or i.observations -> 'baebd1c2-1b08-4ac7-9859-99a332e1fd4e' notnull
    or i.observations -> '724f3ae4-62c8-4975-8ea8-d01338b27d29' notnull
    or i.observations -> 'f3db9ff8-fabe-4e49-8f58-d0e6ee6b073c' notnull
    or i.observations -> '38fa346f-b213-4686-9410-c79c5a1a22d0' notnull
    or i.observations -> 'eb605d55-cae9-4c3f-b88f-4c9710f98f51' notnull
    or i.observations -> 'd20f14d2-6b2f-43c3-b030-bbaccff0ea1e' notnull
    or i.observations -> '30a82a03-9030-4d0f-8cf1-8ff95cedfa89' notnull
    or i.observations -> '0d323c53-5913-4bfa-b509-a8d676ea4ebb' notnull
    or i.observations -> '0fc3b29e-9e97-4966-98fb-8583b4f509d7' notnull
    or i.observations -> '877c1266-a426-4d43-a4bc-35c4c62c591b' notnull
    or i.observations -> '3456c339-6dd0-4fb8-a14a-cf177797e51c' notnull
    or i.observations -> 'c78d09ff-75ce-422c-bff4-05d96439b584' notnull
    or i.observations -> '06115034-79a4-4c43-9314-81185f8b09f2' notnull
    or i.observations -> '3e4f91dd-0d56-45a2-a8ef-5dbb4fe8137f' notnull
    or i.observations -> 'f2c5aeeb-f2ac-4590-9b5b-17d0b76f560f' notnull
    or i.observations -> 'e2e74b61-cab4-43d0-bb01-a3a96f6036cb' notnull)
