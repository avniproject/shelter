--Ticket: https://avni.freshdesk.com/a/tickets/1405
--Context: File which was uploaded had incorrect date format for the registration date which resulted in this.

set role shelter;

--45788
select count(*)
from individual
where registration_date::text ilike '00%';

--check the correct date vs wrong date
select ('20' || extract(day from registration_date) || '-' || extract(month from registration_date) || '-' ||
        extract(year from registration_date))::date,
       registration_date
from individual
where registration_date::text ilike '00%';

--update the date
with audits as (
    update individual set registration_date =
            ('20' || extract(day from registration_date) || '-' || extract(month from registration_date) || '-' ||
             extract(year from registration_date))::date
        where registration_date::text ilike '00%'
        returning audit_id
)
update audit
set last_modified_date_time = current_timestamp + ((id/1000) * interval '1 millisecond')
where id in (select audit_id from audits);
