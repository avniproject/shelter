--https://avni.freshdesk.com/a/tickets/1483

set role shelter;
with subject_ids_to_void(ind_id) as (select id
                                     from individual
                                     where uuid in (
                                                    'bc531872-c538-431f-b675-1a35a290aca4',
                                                    '3f8bc545-e4f6-4fce-877d-bad73f98cd37',
                                                    '54211e9d-8d7e-44a2-b1fb-0d6feaab9e98',
                                                    'abf0d774-a1e5-4818-8308-35a3b2641ae7',
                                                    'df9716e6-98ee-45f8-b77f-877b74392996',
                                                    '0c735561-2828-401e-8a08-21a8a7368e91',
                                                    '1bf8cd71-9345-427b-888d-a7af0a809e79',
                                                    '67c59e63-2299-4e21-9fe2-59a6a029b15f',
                                                    '9645112e-a0ef-4407-8d2c-f39a8b8fa68f',
                                                    '4a60ef05-488e-40e3-8b10-53d27b1cdcfa',
                                                    '3ee2975e-7258-412f-9985-86ccc8f8d05a',
                                                    '291635b9-d974-4b68-9986-7fa3884c8a3b',
                                                    'c9d272a8-4989-4c29-be74-5aca41e18373',
                                                    '19a4caa4-9659-4bf3-a26d-f9f4f7ea18ba',
                                                    '4e0cd95e-8ff3-4d74-83ed-a34e37eaae2f',
                                                    '0b301fba-cc0c-4ae0-987c-6f14327bed1f',
                                                    '46b9f7d4-b78d-4300-ba52-0b794daf2b59',
                                                    '2d8af525-9440-4907-8db4-516ebf28dc09',
                                                    'b9a2f0ef-b7b9-4431-a78d-84dc0c8853b0',
                                                    'd9f17d7c-44e7-4816-8088-68a787e1aa20',
                                                    'aa5e0e0e-d6b0-4694-92a0-6eac10a4a5b5',
                                                    '997ddf00-c5f0-4527-8d5a-2d1332d520eb',
                                                    '273cbada-df60-4b9a-8652-db3413e9279a',
                                                    '82b13666-5be9-4190-995a-bbf23302c551',
                                                    '9ca487b9-2134-4617-b7cc-f1f1f8cb7ff8',
                                                    'c6f2ec78-94c4-490e-a65a-e073b7cdd1dc',
                                                    '34f579d5-4d61-4b61-9a93-ae29c7f0fcaf',
                                                    'c71869f8-1fdf-47ed-a713-aae77defcfed',
                                                    '5c19c88e-1364-4e25-83d8-38950bd689c9',
                                                    'a16e5651-ed9f-4522-b9b8-4ecc19569d0a',
                                                    '715ee47c-136c-46cf-bebd-a7d058885cdc',
                                                    '32709768-9e5f-4755-ae95-6d230156d587',
                                                    '039673de-d3b1-4c35-ac23-4c6d3669d544',
                                                    '1e80be5b-6a12-48f0-aaa7-e3c629e34623',
                                                    '9ecfae34-37b7-4573-85f2-4938fae0cac6',
                                                    'a56ad011-419b-4640-b92b-fca285993106',
                                                    '37afe57a-28c7-43c5-b734-0aaa3bd4eb6d',
                                                    '0d01aa46-b4a1-452c-822c-644f4e793e2b',
                                                    '8687079e-e6fc-48a4-96a9-601296df658e',
                                                    'fc6e475b-cb49-4e90-8ee8-7ba50373e9d3',
                                                    '913e9815-1a01-4976-9015-103f40cc1686',
                                                    '4dd96e18-0f3a-4dad-93db-ab6477cecdc7',
                                                    '989762ce-9d34-4022-b6bb-b88dca997146',
                                                    '88949b69-30cc-48e2-9184-56b4674ab4f6',
                                                    'afdad245-286c-42bb-86cf-a1b975cb7685',
                                                    'e2267cc7-bd87-452b-8791-3d5e96240d7b',
                                                    'bcb4a737-6f21-4fb2-b5ef-90dd7e58ba3a',
                                                    'b507875a-2e7f-411b-b380-7c8253f41735',
                                                    '476bd24a-8c48-48be-89d6-73ee491784ae',
                                                    '321f48d0-3c43-4bb2-9950-1a7b6b4c131b',
                                                    '49dfb6b1-3a82-44e1-afed-5159a98f0b1c',
                                                    'eb927bc8-89b9-47b5-9548-aa2a3ca6c6eb',
                                                    '26610b0c-80e8-47ca-a8b8-c69ecd6a57bf',
                                                    '644dafc6-c22b-4a39-97ee-31f14ee9a970',
                                                    'ebb4b32e-d916-49c4-8d23-bda995565989',
                                                    '3d44e4e5-0e41-4b7a-b4c2-6ada407085ad',
                                                    'ad2fbaed-758b-4fe2-8e0d-eed9deaa6b04',
                                                    '8a1c51df-96cc-4a6d-8ba1-451746f28deb',
                                                    'de2d08a4-103e-4ebc-94d9-f73d96779b37',
                                                    '9b763ec8-5228-485c-92c0-ac154a5b78b3',
                                                    '695e82f0-74ba-4da7-a1c8-49fba24708d1',
                                                    '482d64f3-70ca-4cc0-8628-88dc487ece92',
                                                    '86aa042e-ca49-43f0-a299-a327ed0096c5',
                                                    'fdcedfaa-63e2-4d28-8ea2-309573292f90',
                                                    'b9c97d4e-6f42-47bc-b293-d33626256bde',
                                                    'c4144bb2-59b8-465f-a6e4-11aa8a6b9203',
                                                    'fb1d3b86-9d7e-4023-b400-925886a19698',
                                                    '500a2838-17e5-4bdd-9a83-ae026fb568ae',
                                                    '43c88b4c-f336-42e3-9725-2c0861c88568',
                                                    '2846f1d5-4841-442b-a82a-dc006151d91d',
                                                    '1767b9ca-d0f3-4ea8-8038-758840d1fd2f',
                                                    'd89c364b-7e86-4324-b6ac-32595e397e7c',
                                                    'a20934a0-c63b-4dc2-b1eb-b86ae24cedf1',
                                                    '73548436-b22b-4c2e-a60f-a87f10fe4e96',
                                                    'eeb56c16-3477-48e4-a404-8f45d7d80246',
                                                    '3e912d0b-5fd0-4306-bc22-6cf2019a4dd7',
                                                    '4667c0a9-35fb-49b9-9cbe-fc42e5ed31de',
                                                    'a99e4ae2-2405-4002-bc0a-1a51f6a7806b',
                                                    'cddf1af3-add9-480e-96a7-092658f3396a',
                                                    'b5297db4-6432-4cd1-95a4-32809db32497',
                                                    '1f4ca0a5-a656-41ac-bfe5-c5a9a636c567',
                                                    '59a97abc-1cd9-4688-b23a-6547912a78f4',
                                                    'a6aa8309-0fb1-4632-b79e-4f97c5673a5f',
                                                    '3f34430a-41ad-457a-94c2-92f01b800bc5',
                                                    '3ec38907-e229-46a7-82ca-e71f4094dafc',
                                                    'e16fd6ae-2cc2-47c8-acf6-45f182580900',
                                                    '53dcc6b6-1e0a-421a-9e73-a1e3b23820b2',
                                                    '84b276f3-9668-41f5-bbd3-737df59ccea0',
                                                    'c5e092ad-9aef-4190-9a9b-fc9080735f86',
                                                    '874a84cd-128a-4110-948c-ddbbbc336d2b',
                                                    '391f2268-df38-4a1b-a90a-e2db10d18d56',
                                                    '9ed9bc06-ce2a-4980-a737-44ed4b8d1bf8',
                                                    '9cdd636b-1e1e-4646-8fcf-42fef172d070',
                                                    '4e7051b9-74b0-4284-88da-5ca0b55ec762',
                                                    '1bc4a495-35fe-442c-b3a9-30ab21fecf18',
                                                    'fcd8b752-f0ad-4d48-a998-7b8834e38665',
                                                    'cb708f37-0011-4609-8f37-8e3c772b59e6',
                                                    '8cdfaa94-18b1-478b-b4f0-ffb2b7e5e345',
                                                    '9f548d2d-d9bb-411e-9a78-e58c716e7516',
                                                    'ee1ed937-e067-475b-99f0-accb0e049889',
                                                    '7b998ed1-72b9-45d7-962d-908b9117329a',
                                                    '4d356ec4-771d-4ded-b080-7e10862a3bcd',
                                                    'a74cca1f-302e-43d5-b690-4af352af79bb',
                                                    'f4c4a70a-eab6-481a-91c5-15826dc59145',
                                                    '8c197abc-d12d-49e1-b3af-437fbbcda8b5',
                                                    'f9f19e1a-d8b1-4eda-ba1d-2aaf98d09ebe',
                                                    'ca02717e-9b44-42e8-93da-07e436598141',
                                                    '30bbb0ef-ed39-4115-a0e4-939e6c690b9d',
                                                    '1203c9d5-148f-4881-b41b-44a64dbfe8c8',
                                                    '16a738ce-ac29-4ec5-a0f1-5f81de3fadc7',
                                                    'fb95bb8e-0dc6-4fef-8c09-aabb4e046a7f',
                                                    '53b1f7ba-b993-4e63-b332-f1fa01c0ef90',
                                                    '4377797a-ecf5-41ba-9606-15bc9957b4cb',
                                                    '2335fe86-67c6-44ed-8ec3-8d13435b879f',
                                                    'fcaa7706-87e3-4e9e-8cba-e6a4c9083c85',
                                                    '0b1472da-08d4-4890-a2ed-65c2bfc3c9f8',
                                                    'faff1fe8-5173-430b-8889-3171326afd18',
                                                    '47fe336a-1d74-4d80-bc66-8533dddb7982'
                                         )
),
     ind_auits as (
         update individual set is_voided = true where id in (
             select ind_id
             from subject_ids_to_void
         )
             returning audit_id
     ),
     enl_audits as (
         update program_enrolment set is_voided = true where individual_id in (select ind_id from subject_ids_to_void)
             returning audit_id
     ),
     enc_audits as (
         update program_encounter set is_voided = true where program_enrolment_id in (select id
                                                                                      from program_enrolment
                                                                                      where individual_id in (select ind_id from subject_ids_to_void)
         )
             returning audit_id
     )
update audit
set last_modified_date_time = current_timestamp(3) + (id / 1000) * interval '1 millisecond'
where id in (
    select audit_id
    from ind_auits
    union all
    select audit_id
    from enl_audits
    union all
    select audit_id
    from enc_audits
);
