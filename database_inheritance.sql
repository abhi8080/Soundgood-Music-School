CREATE TABLE "instructor" (
 "instructor_id" INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 "name" VARCHAR(500) NOT NULL,
 "person_number" VARCHAR(12) UNIQUE NOT NULL,
 "phone_number" VARCHAR(25) UNIQUE,
 "email_address" VARCHAR(500) UNIQUE,
 "age" VARCHAR(3) NOT NULL,
 "address" VARCHAR(500)
);

ALTER TABLE "instructor" ADD CONSTRAINT PK_instructor PRIMARY KEY ("instructor_id");


CREATE TABLE "music_school" (
 "music_school_id" INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 "address" VARCHAR(500) NOT NULL,
 "name" VARCHAR(500) NOT NULL
);

ALTER TABLE "music_school" ADD CONSTRAINT PK_music_school PRIMARY KEY ("music_school_id");


CREATE TABLE "schedule" (
 "schedule_id" INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 "time" TIMESTAMP(10) NOT NULL,
 "room" VARCHAR(20) NOT NULL
);

ALTER TABLE "schedule" ADD CONSTRAINT PK_schedule PRIMARY KEY ("schedule_id");


CREATE TABLE "skill_level" (
 "skill_level_id" INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 "level" VARCHAR(12) NOT NULL
);

ALTER TABLE "skill_level" ADD CONSTRAINT PK_skill_level PRIMARY KEY ("skill_level_id");


CREATE TABLE "student" (
 "student_id" INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 "name" VARCHAR(500) NOT NULL,
 "person_number" VARCHAR(12) UNIQUE NOT NULL,
 "phone_number" VARCHAR(25) UNIQUE,
 "address" VARCHAR(500),
 "sibling_person_number" VARCHAR(12) UNIQUE,
 "email_address" VARCHAR(500) UNIQUE
);

ALTER TABLE "student" ADD CONSTRAINT PK_student PRIMARY KEY ("student_id");


CREATE TABLE "application" (
 "student_id" INT GENERATED ALWAYS AS IDENTITY NOT NULL ON DELETE CASCADE,
 "music_school_id" INT GENERATED ALWAYS AS IDENTITY NOT NULL ON DELETE CASCADE,
 "skill_level_id" INT GENERATED ALWAYS AS IDENTITY NOT NULL ON DELETE CASCADE,
 "email_address" VARCHAR(500) UNIQUE,
 "phone_number" VARCHAR(25) UNIQUE,
 "instrument" VARCHAR(500) NOT NULL
);

ALTER TABLE "application" ADD CONSTRAINT PK_application PRIMARY KEY ("student_id","music_school_id","skill_level_id");


CREATE TABLE "contact_person" (
 "student_id" INT GENERATED ALWAYS AS IDENTITY NOT NULL ON DELETE CASCADE,
 "name" VARCHAR(500) NOT NULL,
 "phone_number" VARCHAR(25) UNIQUE NOT NULL 
);

ALTER TABLE "contact_person" ADD CONSTRAINT PK_contact_person PRIMARY KEY ("student_id");


CREATE TABLE "discount" (
 "discount_id" INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 "discount_percentage" VARCHAR(5) NOT NULL,
 "student_id" INT NOT NULL
);

ALTER TABLE "discount" ADD CONSTRAINT PK_discount PRIMARY KEY ("discount_id");


CREATE TABLE "pricing" (
 "pricing_id" INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 "price" VARCHAR(10) NOT NULL,
 "lesson_type" VARCHAR(20) NOT NULL,
 "skill_level_id" INT NOT NULL
);

ALTER TABLE "pricing" ADD CONSTRAINT PK_pricing PRIMARY KEY ("pricing_id");


CREATE TABLE "rental" (
 "rental_id" INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 "rental_start" VARCHAR(15) NOT NULL,
  "rental_end" VARCHAR(15),
 "student_id" INT NOT NULL
);

ALTER TABLE "rental" ADD CONSTRAINT PK_rental PRIMARY KEY ("rental_id");


CREATE TABLE "instrument" (
 "instrument_id" INT GENERATED ALWAYS AS IDENTITY NOT NULL,
  "name" VARCHAR(500) NOT NULL,
 "brand" VARCHAR(500) NOT NULL,
 "price" VARCHAR(10) NOT NULL,
 "rental_id" INT NOT NULL
);

ALTER TABLE "instrument" ADD CONSTRAINT PK_instrument PRIMARY KEY ("instrument_id");


CREATE TABLE "music_lesson" (
 "music_lesson_id" INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 "instrument" VARCHAR(50),
 "maximum_no_of_students" VARCHAR(5),
 "minimum_no_of_students" VARCHAR(5),
 "genre" VARCHAR(500),
 "instructor_id" INT NOT NULL,
 "student_id" INT NOT NULL,
 "schedule_id" INT NOT NULL,
 "skill_level_id" INT NOT NULL,
 "pricing_id" INT NOT NULL
);

ALTER TABLE "music_lesson" ADD CONSTRAINT PK_music_lesson PRIMARY KEY ("music_lesson_id");


ALTER TABLE "application" ADD CONSTRAINT FK_application_0 FOREIGN KEY ("student_id") REFERENCES "student" ("student_id");
ALTER TABLE "application" ADD CONSTRAINT FK_application_1 FOREIGN KEY ("music_school_id") REFERENCES "music_school" ("music_school_id");
ALTER TABLE "application" ADD CONSTRAINT FK_application_2 FOREIGN KEY ("skill_level_id") REFERENCES "skill_level" ("skill_level_id");


ALTER TABLE "contact_person" ADD CONSTRAINT FK_contact_person_0 FOREIGN KEY ("student_id") REFERENCES "student" ("student_id");


ALTER TABLE "discount" ADD CONSTRAINT FK_discount_0 FOREIGN KEY ("student_id") REFERENCES "student" ("student_id");


ALTER TABLE "pricing" ADD CONSTRAINT FK_pricing_0 FOREIGN KEY ("skill_level_id") REFERENCES "skill_level" ("skill_level_id");


ALTER TABLE "rental" ADD CONSTRAINT FK_rental_0 FOREIGN KEY ("student_id") REFERENCES "student" ("student_id");


ALTER TABLE "instrument" ADD CONSTRAINT FK_instrument_0 FOREIGN KEY ("rental_id") REFERENCES "rental" ("rental_id");


ALTER TABLE "music_lesson" ADD CONSTRAINT FK_music_lesson_0 FOREIGN KEY ("instructor_id") REFERENCES "instructor" ("instructor_id");
ALTER TABLE "music_lesson" ADD CONSTRAINT FK_music_lesson_1 FOREIGN KEY ("student_id") REFERENCES "student" ("student_id");
ALTER TABLE "music_lesson" ADD CONSTRAINT FK_music_lesson_2 FOREIGN KEY ("schedule_id") REFERENCES "schedule" ("schedule_id");
ALTER TABLE "music_lesson" ADD CONSTRAINT FK_music_lesson_3 FOREIGN KEY ("skill_level_id") REFERENCES "skill_level" ("skill_level_id");
ALTER TABLE "music_lesson" ADD CONSTRAINT FK_music_lesson_4 FOREIGN KEY ("pricing_id") REFERENCES "pricing" ("pricing_id");


