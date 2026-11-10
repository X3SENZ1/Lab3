-- 1) если почтовое отделение не принимало корреспонденцию, оставить пустое поле
SELECT *
FROM Post_offices p
LEFT JOIN Mail_acceptance m ON p.office_id = m.office_id
ORDER BY p.office_id;

-- 2) если корреспонденция была принята отсутствующим почтовым отделением, оставить пустое поле
SELECT *
FROM Post_offices p
RIGHT JOIN Mail_acceptance m ON p.office_id = m.office_id
ORDER BY p.office_id NULLS FIRST;
