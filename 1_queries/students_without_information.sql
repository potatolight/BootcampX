SELECT id, name, cohort_id FROM students WHERE cohort_id = 1 ORDER BY name;
SELECT count(*) FROM students WHERE cohort_id in (1,2,3);
SELECT name, id, cohort_id FROM students WHERE email IS NULL or phone IS NULL;
SELECT name, id, email, cohort_id FROM students WHERE email NOT LIKE '%gmail.com' AND phone IS NULL;
SELECT name, id , cohort_id FROM students WHERE end_date IS NULL ORDER BY cohort_id;
SELECT name, email, phone FROM students WHERE end_date IS NOT NULL AND github IS NULL;