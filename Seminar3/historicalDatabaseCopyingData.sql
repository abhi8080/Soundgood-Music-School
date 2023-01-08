INSERT into historical.student(name)
select name from public.student;


INSERT into historical.lesson(lesson_type, price, time, room, level)
select lesson_type, price, time, room, level from (
select * from music_lesson
join schedule on music_lesson.schedule_id = schedule.schedule_id
join skill_level on music_lesson.skill_level_id = skill_level.skill_level_id
join pricing on music_lesson.pricing_id = pricing.pricing_id
) as lessons
order by music_lesson_id;


insert into historical.student_lesson
select * from public.student_music_lesson;




