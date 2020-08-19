const { Pool, Query } = require('pg');

const pool = new Pool({
  user: 'vagrant',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'
});
const cohortName = process.argv[2] ||'JUL02';
const values = [`%${cohortName}%`];
pool.query (`
SELECT cohorts.name as cohort, teachers.name AS teacher_name
FROM cohorts
JOIN students ON cohorts.id = cohort_id
JOIN assistance_requests ON students.id = student_id
JOIN teachers ON teachers.id = teacher_id 
WHERE cohorts.name LIKE $1
GROUP BY cohorts.name, teachers.name
ORDER BY teacher_name
LIMIT 10
`, values)
.then (res => {
   console.log('connected')
  res.rows.forEach(user => {
    console.log(user.cohort +': '+ user.teacher_name)
  })
}).catch(err => console.error('query error', err.stack))