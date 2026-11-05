--1.Если почтовое отделение не принимало корреспонденцию — оставить пустое поле.--
SELECT
p.office_id,
p.city,
p.address,
p.postal_code,
p.phone,
m.tracking_number,
m.office_id AS mail_office_id,
m.acceptance_datetime,
m.declared_value,
m.total_cost,
m.is_paid,
m.dispatch_datetime
FROM Post_offices p
LEFT JOIN Mail_acceptance m ON p.office_id = m.office_id
ORDER BY p.office_id;


--2.Если корреспонденция была принята отсутствующим почтовым отделением — оставить пустое поле.--
SELECT
p.office_id,
p.city,
p.address,
p.postal_code,
p.phone,
m.tracking_number,
m.office_id AS mail_office_id,
m.acceptance_datetime,
m.declared_value,
m.total_cost,
m.is_paid,
m.dispatch_datetime
FROM Post_offices p
RIGHT JOIN Mail_acceptance m ON p.office_id = m.office_id
ORDER BY p.office_id NULLS FIRST;