--Use below report to get the entity and concept list for which migration is required.
--https://reporting.avniproject.org/question/1581?organisation_name=Shelter
-- concept_uuid,entity_name,entity_type_id,organisation_name
-- 16188801-c97c-44bd-8ee3-743263584e11,Encounter,662,Shelter
-- 724f3ae4-62c8-4975-8ea8-d01338b27d29,Encounter,662,Shelter
-- 975c75b7-cc14-4432-bdce-b33f5f816d41,Encounter,662,Shelter
-- bedd0845-8eda-4955-b6da-436704e639bb,Encounter,662,Shelter
-- ec6449fa-df43-46c8-8508-7dbe1545df14,Encounter,662,Shelter
-- e2db3e0d-02b4-4107-92fd-50cc250478de,Encounter,205,Shelter
-- 0ac65b0a-a003-4865-ab44-8197c61bb05f,Program Encounter,659,Shelter
-- 27905a75-64c0-4561-a892-df0c0a301eab,Program Encounter,659,Shelter
-- 8fec4f5d-d8d2-49a8-ae7e-0272b529f3c7,Program Encounter,659,Shelter
-- 9b866b15-d0d7-4bb2-8a53-d6838d742825,Program Encounter,659,Shelter
-- b04e6038-11f8-4df9-9a7f-908993a7e299,Program Encounter,659,Shelter
-- cc42a1b6-955f-4018-a9b2-ad4bcfa971c1,Program Encounter,659,Shelter
-- d9fe1ad5-9feb-4e90-b92f-6a471037abb7,Program Encounter,659,Shelter
-- f762f273-4650-413e-bc24-1dba6bf596cf,Program Encounter,659,Shelter

set role shelter;

with audits as (
    update encounter set observations = observations ||
                                        jsonb_strip_nulls(json_build_object(
                                                '16188801-c97c-44bd-8ee3-743263584e11', case
                                                                                            when (observations -> '16188801-c97c-44bd-8ee3-743263584e11') =
                                                                                                 '[
                                                                                                   null
                                                                                                 ]'::jsonb
                                                                                                then NULL
                                                                                            else (observations -> '16188801-c97c-44bd-8ee3-743263584e11') end,
                                                '724f3ae4-62c8-4975-8ea8-d01338b27d29', case
                                                                                            when (observations -> '724f3ae4-62c8-4975-8ea8-d01338b27d29') =
                                                                                                 '[
                                                                                                   null
                                                                                                 ]'::jsonb
                                                                                                then NULL
                                                                                            else (observations -> '724f3ae4-62c8-4975-8ea8-d01338b27d29') end,
                                                '975c75b7-cc14-4432-bdce-b33f5f816d41', case
                                                                                            when (observations -> '975c75b7-cc14-4432-bdce-b33f5f816d41') =
                                                                                                 '[
                                                                                                   null
                                                                                                 ]'::jsonb
                                                                                                then NULL
                                                                                            else (observations -> '975c75b7-cc14-4432-bdce-b33f5f816d41') end,
                                                'bedd0845-8eda-4955-b6da-436704e639bb', case
                                                                                            when (observations -> 'bedd0845-8eda-4955-b6da-436704e639bb') =
                                                                                                 '[
                                                                                                   null
                                                                                                 ]'::jsonb
                                                                                                then NULL
                                                                                            else (observations -> 'bedd0845-8eda-4955-b6da-436704e639bb') end,
                                                'ec6449fa-df43-46c8-8508-7dbe1545df14', case
                                                                                            when (observations -> 'ec6449fa-df43-46c8-8508-7dbe1545df14') =
                                                                                                 '[
                                                                                                   null
                                                                                                 ]'::jsonb
                                                                                                then NULL
                                                                                            else (observations -> 'ec6449fa-df43-46c8-8508-7dbe1545df14') end
                                            )::jsonb)::jsonb
        where encounter_type_id = 662
            and (
                          jsonb_typeof(observations -> '16188801-c97c-44bd-8ee3-743263584e11') = 'string' OR
                          jsonb_typeof(observations -> '724f3ae4-62c8-4975-8ea8-d01338b27d29') = 'string' OR
                          jsonb_typeof(observations -> '975c75b7-cc14-4432-bdce-b33f5f816d41') = 'string' OR
                          jsonb_typeof(observations -> 'bedd0845-8eda-4955-b6da-436704e639bb') = 'string' OR
                          jsonb_typeof(observations -> 'ec6449fa-df43-46c8-8508-7dbe1545df14') = 'string'
                  )
        returning audit_id
)
update audit
set last_modified_date_time = current_timestamp
where id in (select audit_id from audits);

-- e2db3e0d-02b4-4107-92fd-50cc250478de,Encounter,205,Shelter
with audits as (
    update encounter set observations = observations ||
                                        json_build_object(
                                                'e2db3e0d-02b4-4107-92fd-50cc250478de',
                                                array [observations ->> 'e2db3e0d-02b4-4107-92fd-50cc250478de']
                                            )::jsonb
        where encounter_type_id = 205
            and jsonb_typeof(observations -> 'e2db3e0d-02b4-4107-92fd-50cc250478de') = 'string'
        returning audit_id
)
update audit
set last_modified_date_time = current_timestamp
where id in (select audit_id from audits);


-- 0ac65b0a-a003-4865-ab44-8197c61bb05f,Program Encounter,659,Shelter
-- 27905a75-64c0-4561-a892-df0c0a301eab,Program Encounter,659,Shelter
-- 8fec4f5d-d8d2-49a8-ae7e-0272b529f3c7,Program Encounter,659,Shelter
-- 9b866b15-d0d7-4bb2-8a53-d6838d742825,Program Encounter,659,Shelter
-- b04e6038-11f8-4df9-9a7f-908993a7e299,Program Encounter,659,Shelter
-- cc42a1b6-955f-4018-a9b2-ad4bcfa971c1,Program Encounter,659,Shelter
-- d9fe1ad5-9feb-4e90-b92f-6a471037abb7,Program Encounter,659,Shelter
-- f762f273-4650-413e-bc24-1dba6bf596cf,Program Encounter,659,Shelter
with audits as (
    update program_encounter set observations = jsonb_strip_nulls(observations ||
                                                                  jsonb_build_object(
                                                                          '0ac65b0a-a003-4865-ab44-8197c61bb05f', case
                                                                                                                      when (observations -> '0ac65b0a-a003-4865-ab44-8197c61bb05f') =
                                                                                                                           '[
                                                                                                                             null
                                                                                                                           ]'::jsonb
                                                                                                                          then NULL
                                                                                                                      else (observations -> '0ac65b0a-a003-4865-ab44-8197c61bb05f') end,
                                                                          '27905a75-64c0-4561-a892-df0c0a301eab', case
                                                                                                                      when (observations -> '27905a75-64c0-4561-a892-df0c0a301eab') =
                                                                                                                           '[
                                                                                                                             null
                                                                                                                           ]'::jsonb
                                                                                                                          then NULL
                                                                                                                      else (observations -> '27905a75-64c0-4561-a892-df0c0a301eab') end,
                                                                          '8fec4f5d-d8d2-49a8-ae7e-0272b529f3c7', case
                                                                                                                      when (observations -> '8fec4f5d-d8d2-49a8-ae7e-0272b529f3c7') =
                                                                                                                           '[
                                                                                                                             null
                                                                                                                           ]'::jsonb
                                                                                                                          then NULL
                                                                                                                      else (observations -> '8fec4f5d-d8d2-49a8-ae7e-0272b529f3c7') end,
                                                                          '9b866b15-d0d7-4bb2-8a53-d6838d742825', case
                                                                                                                      when (observations -> '9b866b15-d0d7-4bb2-8a53-d6838d742825') =
                                                                                                                           '[
                                                                                                                             null
                                                                                                                           ]'::jsonb
                                                                                                                          then NULL
                                                                                                                      else (observations -> '9b866b15-d0d7-4bb2-8a53-d6838d742825') end,
                                                                          'b04e6038-11f8-4df9-9a7f-908993a7e299', case
                                                                                                                      when (observations -> 'b04e6038-11f8-4df9-9a7f-908993a7e299') =
                                                                                                                           '[
                                                                                                                             null
                                                                                                                           ]'::jsonb
                                                                                                                          then NULL
                                                                                                                      else (observations -> 'b04e6038-11f8-4df9-9a7f-908993a7e299') end,
                                                                          'cc42a1b6-955f-4018-a9b2-ad4bcfa971c1', case
                                                                                                                      when (observations -> 'cc42a1b6-955f-4018-a9b2-ad4bcfa971c1') =
                                                                                                                           '[
                                                                                                                             null
                                                                                                                           ]'::jsonb
                                                                                                                          then NULL
                                                                                                                      else (observations -> 'cc42a1b6-955f-4018-a9b2-ad4bcfa971c1') end,
                                                                          'd9fe1ad5-9feb-4e90-b92f-6a471037abb7', case
                                                                                                                      when (observations -> 'd9fe1ad5-9feb-4e90-b92f-6a471037abb7') =
                                                                                                                           '[
                                                                                                                             null
                                                                                                                           ]'::jsonb
                                                                                                                          then NULL
                                                                                                                      else (observations -> 'd9fe1ad5-9feb-4e90-b92f-6a471037abb7') end,
                                                                          'f762f273-4650-413e-bc24-1dba6bf596cf', case
                                                                                                                      when (observations -> 'f762f273-4650-413e-bc24-1dba6bf596cf') =
                                                                                                                           '[
                                                                                                                             null
                                                                                                                           ]'::jsonb
                                                                                                                          then NULL
                                                                                                                      else (observations -> 'f762f273-4650-413e-bc24-1dba6bf596cf') end
                                                                      ))
        where encounter_type_id = 659
            and (
                          (observations -> '0ac65b0a-a003-4865-ab44-8197c61bb05f')::text ilike '%null%' OR
                          (observations -> '27905a75-64c0-4561-a892-df0c0a301eab')::text ilike '%null%' OR
                          (observations -> '8fec4f5d-d8d2-49a8-ae7e-0272b529f3c7')::text ilike '%null%' OR
                          (observations -> '9b866b15-d0d7-4bb2-8a53-d6838d742825')::text ilike '%null%' OR
                          (observations -> 'b04e6038-11f8-4df9-9a7f-908993a7e299')::text ilike '%null%' OR
                          (observations -> 'cc42a1b6-955f-4018-a9b2-ad4bcfa971c1')::text ilike '%null%' OR
                          (observations -> 'd9fe1ad5-9feb-4e90-b92f-6a471037abb7')::text ilike '%null%' OR
                          (observations -> 'f762f273-4650-413e-bc24-1dba6bf596cf')::text ilike '%null%'
                  )
        returning audit_id
)
update audit
set last_modified_date_time = current_timestamp
where id in (select audit_id from audits);
