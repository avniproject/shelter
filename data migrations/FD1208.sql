--Ticket: https://avni.freshdesk.com/a/tickets/1208

--Error is coming because earlier in Housing Survey Form "From where have you taken a loan?" was singleSelect and
--later it was made multiSelect. So when editing the older records, app is breaking and giving error
--i.isAnswerAlreadyPresent is not a function.

--This migration will convert all the singleSelect obs to multiselect.

set role shelter;
with audits as (
    update encounter set observations = observations ||
                                        json_build_object('0fc3b29e-9e97-4966-98fb-8583b4f509d7',
                                                          array [observations ->> '0fc3b29e-9e97-4966-98fb-8583b4f509d7'])::jsonb
        where encounter_type_id = (select id from encounter_type where name = 'Housing Survey Form')
            and observations -> '0fc3b29e-9e97-4966-98fb-8583b4f509d7' notnull
            and (observations ->> '0fc3b29e-9e97-4966-98fb-8583b4f509d7')::text not like '[%'
        returning audit_id
)
update audit
set last_modified_date_time = current_timestamp
where id in (select audit_id from audits)

