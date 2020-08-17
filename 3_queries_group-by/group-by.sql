SELECT day, count(day) as total_assignments
FROM assignments
GROUP BY day
ORDER BY day;

SELECT day, count(*) as total_assignments
FROM assignments
GROUP BY day
HAVING count(*) >= 10
ORDER BY day;

SELECT cohorts.name AS cohort_name, count(students.id) AS student_count 
FROM cohorts
JOIN students ON cohorts.id = cohort_id
GROUP BY cohorts.name
HAVING count(students.id) >= 18
ORDER BY count(students.id)

SELECT cohorts.name AS cohort, count(assignment_submissions.id) AS total_submissions
FROM cohorts
JOIN students ON cohorts.id = cohort_id
JOIN assignment_submissions ON students.id = student_id
GROUP BY cohorts.name
ORDER BY total_submissions DESC;

SELECT students.name AS student , avg(assignment_submissions.duration) AS average_assignment_duration
FROM students
JOIN assignment_submissions ON students.id = student_id
WHERE end_date IS NULL
GROUP BY students.name
ORDER BY average_assignment_duration DESC;

SELECT students.name AS student, avg(assignment_submissions.duration) AS average_assignment_duration, avg(assignments.duration) AS average_estimated_duration
FROM students
JOIN assignment_submissions ON students.id = student_id
JOIN assignments ON assignments.id = assignment_id
WHERE end_date IS NULL
GROUP BY student
HAVING avg(assignment_submissions.duration) < avg(assignments.duration)
ORDER BY average_assignment_duration;

