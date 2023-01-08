CREATE VIEW lessons_per_month_in_a_specified_year AS
SELECT (TO_CHAR(DATE(TIME), 'Month')) AS MONTH,
       COUNT(*) AS total,
       COUNT (CASE
                  WHEN maximum_no_of_students IS NULL THEN 1
                  ELSE NULL
              END) AS individual,
             COUNT (CASE
                        WHEN maximum_no_of_students IS NOT NULL
                             AND genre IS NULL THEN 1
                        ELSE NULL
                    END) AS GROUP,
                   COUNT (CASE
                              WHEN genre IS NOT NULL THEN 1
                              ELSE NULL
                          END) AS ensemble
FROM
  (SELECT *
   FROM schedule
   JOIN music_lesson ON music_lesson.schedule_id = schedule.schedule_id) AS all_scheduled_lessons
WHERE date_part('year', TIME) = '2022'
GROUP BY MONTH;






CREATE VIEW count_siblings AS
SELECT
  (SELECT Count(*)
   FROM student
   LEFT JOIN sibling ON student.student_id = sibling.student_id
   WHERE sibling.student_id IS NULL) AS "No sibling",

  (SELECT COUNT(*)
   FROM
     (SELECT name,
             COUNT(*)
      FROM
        (SELECT *
         FROM student
         JOIN sibling ON sibling.student_id = student.student_id) AS students_who_have_siblings
      GROUP BY name
      HAVING Count(*) = 1) AS students_who_have_1_sibling) AS "One sibling",

  (SELECT COUNT(*)
   FROM
     (SELECT name,
             COUNT(*)
      FROM
        (SELECT *
         FROM student
         JOIN sibling ON sibling.student_id = student.student_id) AS students_who_have_siblings
      GROUP BY name
      HAVING Count(*) = 2) AS students_who_have_2_siblings) AS "Two siblings";
      




CREATE VIEW instructors_workload AS
SELECT name,
       COUNT(instructor.instructor_id) AS number_of_lessons
FROM instructor
JOIN music_lesson ON music_lesson.instructor_id = instructor.instructor_id
JOIN schedule ON music_lesson.schedule_id = schedule.schedule_id
WHERE TO_CHAR(DATE(schedule.time), 'Month') = TO_CHAR(NOW(), 'Month')
GROUP BY name
HAVING COUNT(instructor.instructor_id) > 2
ORDER BY number_of_lessons DESC;




CREATE MATERIALIZED VIEW ensembles_next_week AS
select genre, time as weekday , CASE
	  	WHEN COUNT(*) = maximum_no_of_students::integer
			THEN 'Full booked'
	  	WHEN COUNT(*) = maximum_no_of_students::integer - 1
           THEN '1 seat left'
        WHEN COUNT(*) = maximum_no_of_students::integer - 2
           THEN '2 seats left'
        ELSE 'More than 2 seats left'
	END information from (select * from music_lesson
join student_music_lesson on student_music_lesson.music_lesson_id = music_lesson.music_lesson_id
join schedule on schedule.schedule_id = music_lesson.schedule_id
where time >= (date_trunc('week', NOW()) + INTERVAL '1 week')
AND time < (date_trunc('week', NOW()) + INTERVAL '2 week') AND genre is not null) as students_participating_in_ensembles
GROUP by genre, weekday, maximum_no_of_students
order by weekday;



















