SELECT count(assistance_requests.*) AS total_assistances, teachers.name AS name
FROM assistance_requests
JOIN teachers ON teachers.id = teacher_id
WHERE name = 'Waylon Boehm' 
GROUP BY name;

SELECT count(assistance_requests.*) AS total_assistances, students.name AS name
FROM assistance_requests
JOIN students ON students.id = student_id
WHERE name = 'Elliot Dickinson'
GROUP BY name;


SELECT teachers.name as teacher, students.name as student, assignments.name as assignment, (completed_at-started_at) as duration
FROM assistance_requests
JOIN teachers ON teachers.id = teacher_id
JOIN students ON students.id = student_id
JOIN assignments ON assignments.id = assignment_id
ORDER BY duration;

SELECT avg(completed_at-started_at) AS average_assistance_request_duration FROM assistance_requests

SELECT cohorts.name AS name, avg(completed_at-started_at) AS average_assistance_time 
FROM assistance_requests
JOIN students ON students.id = student_id
JOIN cohorts ON cohorts.id = cohort_id
GROUP BY cohorts.name
ORDER BY average_assistance_time DESC
Limit 1

SELECT avg(started_at-created_at) AS average_wait_time  FROM assistance_requests;

SELECT cohorts.name AS cohort, sum(completed_at-started_at) AS total_duration 
FROM assistance_requests
JOIN students ON students.id = student_id
JOIN cohorts ON cohorts.id = cohort_id
GROUP BY cohorts.name
ORDER BY total_duration;

SELECT avg(total_duration) AS average_total_duration 
FROM (
  SELECT sum(completed_at-started_at) AS total_duration 
  FROM assistance_requests
  JOIN students ON students.id = student_id
  JOIN cohorts ON cohorts.id = cohort_id
  GROUP BY cohorts.name
  ORDER BY total_duration) as sub_table;

SELECT assignments.id as id, name, day, chapter, count(assistance_requests.*) AS total_requests
FROM assignments 
JOIN assistance_requests ON assignments.id = assignment_id
GROUP BY assignments.id
ORDER BY total_requests DESC;

SELECT day, count(chapter) AS number_of_assignments, sum(duration) AS duration
FROM assignments
GROUP BY day
ORDER BY day;

SELECT teachers.name AS teacher, cohorts.name AS cohort
FROM teachers
JOIN assistance_requests ON teachers.id = teacher_id
JOIN students ON students.id = student_id
JOIN cohorts ON cohorts.id = cohort_id
WHERE cohorts.name = 'JUL02'
GROUP BY teacher, cohort
ORDER BY teacher

SELECT teachers.name AS teacher, cohorts.name AS cohort, count(assistance_requests.*) AS  total_assistances 
FROM teachers
JOIN assistance_requests ON teachers.id = teacher_id
JOIN students ON students.id = student_id
JOIN cohorts ON cohorts.id = cohort_id
WHERE cohorts.name = 'JUL02'
GROUP BY teacher, cohort
ORDER BY teacher
