const { Pool, Query } = require('pg');

const pool = new Pool({
  user: 'vagrant',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'
});

pool.query (`
SELECT cohorts.name as cohort, teachers.name AS teacher_name
FROM cohorts
JOIN students ON cohorts.id = cohort_id
JOIN assistance_requests ON students.id = student_id
JOIN teachers ON teachers.id = teacher_id 
WHERE cohorts.name LIKE '%${process.argv[2]||'JUL02'}%'
GROUP BY cohorts.name, teachers.name
ORDER BY teacher_name
LIMIT 10
`)
.then (res => {
   console.log('connected')
  res.rows.forEach(user => {
    console.log(user.cohort +': '+ user.teacher_name)
  })
}).catch(err => console.error('query error', err.stack))