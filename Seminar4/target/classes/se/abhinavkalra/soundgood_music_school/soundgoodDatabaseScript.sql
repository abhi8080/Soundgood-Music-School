--
-- PostgreSQL database dump
--

-- Dumped from database version 15.1
-- Dumped by pg_dump version 15.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: application; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.application (
    student_id integer NOT NULL,
    skill_level_id integer NOT NULL,
    email_address character varying(500),
    phone_number character varying(25),
    instrument_name character varying(500) NOT NULL
);


ALTER TABLE public.application OWNER TO postgres;

--
-- Name: contact_person; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.contact_person (
    student_id integer NOT NULL,
    name character varying(500) NOT NULL,
    phone_number character varying(25) NOT NULL
);


ALTER TABLE public.contact_person OWNER TO postgres;

--
-- Name: contact_person_student_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.contact_person ALTER COLUMN student_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.contact_person_student_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: sibling; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sibling (
    student_id integer NOT NULL,
    person_number character varying(12) NOT NULL
);


ALTER TABLE public.sibling OWNER TO postgres;

--
-- Name: student; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.student (
    student_id integer NOT NULL,
    name character varying(500) NOT NULL,
    person_number character varying(12) NOT NULL,
    phone_number character varying(25),
    address character varying(500),
    email_address character varying(500)
);


ALTER TABLE public.student OWNER TO postgres;


--
-- Name: discount; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.discount (
    discount_id integer NOT NULL,
    discount_percentage character varying(5) NOT NULL,
    student_id integer NOT NULL
);


ALTER TABLE public.discount OWNER TO postgres;

--
-- Name: discount_discount_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.discount ALTER COLUMN discount_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.discount_discount_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: instructor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.instructor (
    instructor_id integer NOT NULL,
    name character varying(500) NOT NULL,
    person_number character varying(12) NOT NULL,
    phone_number character varying(25),
    email_address character varying(500),
    age character varying(3) NOT NULL,
    address character varying(500)
);


ALTER TABLE public.instructor OWNER TO postgres;

--
-- Name: instructor_instructor_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.instructor ALTER COLUMN instructor_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.instructor_instructor_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: music_lesson; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.music_lesson (
    music_lesson_id integer NOT NULL,
    instructor_id integer NOT NULL,
    schedule_id integer NOT NULL,
    skill_level_id integer NOT NULL,
    pricing_id integer NOT NULL,
    maximum_no_of_students character varying(5),
    minimum_no_of_students character varying(5),
    genre character varying(500)
);


ALTER TABLE public.music_lesson OWNER TO postgres;

--
-- Name: schedule; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.schedule (
    schedule_id integer NOT NULL,
    "time" timestamp(6) without time zone NOT NULL,
    room character varying(20) NOT NULL
);


ALTER TABLE public.schedule OWNER TO postgres;

--
-- Name: music_lesson_music_lesson_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.music_lesson ALTER COLUMN music_lesson_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.music_lesson_music_lesson_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: pricing; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pricing (
    pricing_id integer NOT NULL,
    price character varying(10) NOT NULL,
    lesson_type character varying(20) NOT NULL,
    skill_level_id integer NOT NULL
);


ALTER TABLE public.pricing OWNER TO postgres;

--
-- Name: pricing_pricing_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.pricing ALTER COLUMN pricing_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.pricing_pricing_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: rental; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rental (
    rental_id integer NOT NULL,
    rental_start character varying(15) NOT NULL,
    rental_end character varying(15),
    student_id integer NOT NULL,
    rental_instrument_id integer NOT NULL
);


ALTER TABLE public.rental OWNER TO postgres;

--
-- Name: rental_instrument; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rental_instrument (
    rental_instrument_id integer NOT NULL,
    name character varying(500) NOT NULL,
    brand character varying(500) NOT NULL,
    price_per_month character varying(10) NOT NULL
);


ALTER TABLE public.rental_instrument OWNER TO postgres;

--
-- Name: rental_instrument_rental_instrument_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.rental_instrument ALTER COLUMN rental_instrument_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.rental_instrument_rental_instrument_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: rental_rental_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.rental ALTER COLUMN rental_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.rental_rental_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: schedule_schedule_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.schedule ALTER COLUMN schedule_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.schedule_schedule_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: skill_level; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.skill_level (
    skill_level_id integer NOT NULL,
    level character varying(12) NOT NULL
);


ALTER TABLE public.skill_level OWNER TO postgres;

--
-- Name: skill_level_skill_level_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.skill_level ALTER COLUMN skill_level_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.skill_level_skill_level_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: student_music_lesson; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.student_music_lesson (
    student_id integer NOT NULL,
    music_lesson_id integer NOT NULL
);


ALTER TABLE public.student_music_lesson OWNER TO postgres;

--
-- Name: student_student_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.student ALTER COLUMN student_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.student_student_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Data for Name: application; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.application VALUES (1, 2, 'magnis@google.edu', '056 1534 5334', 'piano');
INSERT INTO public.application VALUES (2, 3, 'per.conubia@aol.com', '0873 886 4837', 'cello');
INSERT INTO public.application VALUES (3, 1, 'eleifend.vitae@outlook.net', '0800 922 5562', 'violin');
INSERT INTO public.application VALUES (4, 1, 'ut@protonmail.ca', '(0171) 874 4231', 'bass');
INSERT INTO public.application VALUES (5, 3, 'metus@icloud.org', '0800 1111', 'viola');
INSERT INTO public.application VALUES (6, 2, 'est.ac@hotmail.couk', '056 4177 9388', 'trumpet');
INSERT INTO public.application VALUES (7, 2, 'iaculis@icloud.org', '(01533) 261462', 'trombone');
INSERT INTO public.application VALUES (8, 3, 'pellentesque@icloud.org', '(026) 6054 9343', 'guitar');
INSERT INTO public.application VALUES (9, 1, 'etiam@google.couk', '07144 515437', 'drums');
INSERT INTO public.application VALUES (10, 2, 'felis.ullamcorper@yahoo.couk', '(029) 5449 5636', 'piano');
INSERT INTO public.application VALUES (11, 1, 'congue.a.aliquet@icloud.edu', '07729 364185', 'cello');
INSERT INTO public.application VALUES (12, 2, 'ac.libero.nec@protonmail.couk', '(024) 0132 7042', 'violin');
INSERT INTO public.application VALUES (13, 3, 'nunc.quisque@icloud.net', '076 4271 5811', 'bass');
INSERT INTO public.application VALUES (14, 1, 'donec.tempus@yahoo.net', '(016977) 0351', 'viola');
INSERT INTO public.application VALUES (15, 3, 'lorem.fringilla@icloud.edu', '0845 46 43', 'trumpet');
INSERT INTO public.application VALUES (16, 3, 'risus.donec@outlook.org', '070 3527 4255', 'trombone');
INSERT INTO public.application VALUES (17, 1, 'etiam.imperdiet@aol.net', '07105 836843', 'guitar');
INSERT INTO public.application VALUES (18, 2, 'vestibulum@outlook.ca', '(016977) 0311', 'drums');
INSERT INTO public.application VALUES (19, 3, 'dictum@outlook.org', '0500 154634', 'piano');
INSERT INTO public.application VALUES (20, 1, 'enim@google.ca', '(016977) 1498', 'cello');
INSERT INTO public.application VALUES (21, 1, 'in@protonmail.couk', '(022) 4824 7587', 'violin');
INSERT INTO public.application VALUES (22, 1, 'in.mi@yahoo.org', '07624 664662', 'bass');
INSERT INTO public.application VALUES (23, 2, 'feugiat@aol.edu', '0500 257100', 'viola');
INSERT INTO public.application VALUES (24, 3, 'eros@icloud.edu', '(014616) 63387', 'trumpet');
INSERT INTO public.application VALUES (25, 2, 'erat.neque@aol.net', '(01025) 781895', 'trombone');
INSERT INTO public.application VALUES (26, 1, 'adipiscing.lacus.ut@aol.ca', '07624 050443', 'guitar');
INSERT INTO public.application VALUES (27, 2, 'nulla.eu@icloud.com', '0800 588 6296', 'drums');
INSERT INTO public.application VALUES (28, 2, 'enim.mi.tempor@aol.net', '(01444) 561785', 'piano');
INSERT INTO public.application VALUES (29, 1, 'tellus@aol.couk', '0800 1111', 'cello');
INSERT INTO public.application VALUES (30, 3, 'parturient@outlook.com', '(0113) 694 6158', 'violin');
INSERT INTO public.application VALUES (31, 2, 'ac.mi@hotmail.couk', '(01302) 443756', 'bass');
INSERT INTO public.application VALUES (32, 3, 'ut.eros@outlook.net', '0930 155 4667', 'viola');
INSERT INTO public.application VALUES (33, 2, 'nunc@icloud.org', '056 1185 8660', 'trumpet');
INSERT INTO public.application VALUES (34, 3, 'magna.nec@aol.ca', '0800 1111', 'trombone');
INSERT INTO public.application VALUES (35, 1, 'massa@google.couk', '0800 856 7410', 'guitar');
INSERT INTO public.application VALUES (36, 3, 'gravida.sit@hotmail.edu', '056 0172 4415', 'drums');
INSERT INTO public.application VALUES (37, 3, 'nunc.sed.pede@protonmail.edu', '0882 471 8373', 'piano');
INSERT INTO public.application VALUES (38, 2, 'tristique.senectus@outlook.couk', '0830 466 3461', 'cello');
INSERT INTO public.application VALUES (39, 2, 'nunc.in.at@yahoo.couk', '(021) 5570 7264', 'violin');
INSERT INTO public.application VALUES (40, 2, 'accumsan.neque@icloud.net', '(0115) 611 0176', 'bass');
INSERT INTO public.application VALUES (41, 1, 'mauris.sapien.cursus@yahoo.net', '(012612) 55426', 'viola');
INSERT INTO public.application VALUES (42, 2, 'velit.eget@icloud.ca', '07624 126805', 'trumpet');
INSERT INTO public.application VALUES (43, 1, 'ligula.consectetuer@aol.ca', '(016977) 3611', 'trombone');
INSERT INTO public.application VALUES (44, 2, 'velit@hotmail.ca', '055 5617 7337', 'guitar');
INSERT INTO public.application VALUES (45, 2, 'imperdiet.non.vestibulum@outlook.couk', '(015804) 55038', 'drums');
INSERT INTO public.application VALUES (46, 3, 'sem@icloud.com', '(017463) 58824', 'piano');
INSERT INTO public.application VALUES (47, 3, 'integer.in@google.org', '0341 142 5431', 'cello');
INSERT INTO public.application VALUES (48, 2, 'sit.amet@yahoo.edu', '055 0679 1189', 'violin');
INSERT INTO public.application VALUES (49, 2, 'mi.ac.mattis@outlook.com', '055 0487 5174', 'bass');
INSERT INTO public.application VALUES (50, 1, 'id.libero@yahoo.com', '0800 503 4125', 'viola');
INSERT INTO public.application VALUES (51, 2, 'est.ac.facilisis@google.net', '(01206) 776561', 'trumpet');
INSERT INTO public.application VALUES (52, 1, 'tempor.diam.dictum@hotmail.net', '0800 1111', 'trombone');
INSERT INTO public.application VALUES (53, 1, 'at.arcu.vestibulum@protonmail.com', '(0151) 757 1377', 'guitar');
INSERT INTO public.application VALUES (54, 2, 'felis.donec@aol.org', '07624 761219', 'drums');
INSERT INTO public.application VALUES (55, 3, 'consectetuer.ipsum@aol.com', '056 1304 4863', 'piano');
INSERT INTO public.application VALUES (56, 2, 'duis.risus@google.ca', '076 5014 5764', 'cello');
INSERT INTO public.application VALUES (57, 3, 'ligula.nullam@outlook.org', '0800 814 2789', 'violin');
INSERT INTO public.application VALUES (58, 2, 'nam.nulla@yahoo.org', '0800 410416', 'bass');
INSERT INTO public.application VALUES (59, 2, 'sodales@outlook.net', '07624 243377', 'viola');
INSERT INTO public.application VALUES (60, 1, 'vitae.mauris@aol.couk', '(0111) 657 8819', 'trumpet');
INSERT INTO public.application VALUES (61, 2, 'interdum@aol.edu', '07624 461111', 'trombone');
INSERT INTO public.application VALUES (62, 2, 'eu@hotmail.org', '(0131) 241 6315', 'guitar');
INSERT INTO public.application VALUES (63, 2, 'lorem.luctus@yahoo.org', '070 4781 4758', 'drums');
INSERT INTO public.application VALUES (64, 3, 'lacus.quisque@google.couk', '076 3215 4870', 'piano');
INSERT INTO public.application VALUES (65, 2, 'mauris.sit@protonmail.org', '(0117) 151 9258', 'cello');
INSERT INTO public.application VALUES (66, 2, 'aliquam.erat.volutpat@hotmail.org', '0845 46 44', 'violin');
INSERT INTO public.application VALUES (67, 2, 'mauris.ut@protonmail.couk', '0845 46 41', 'bass');
INSERT INTO public.application VALUES (68, 3, 'dignissim.magna@aol.net', '055 4514 0538', 'viola');
INSERT INTO public.application VALUES (69, 2, 'gravida.mauris@google.ca', '07624 638316', 'trumpet');
INSERT INTO public.application VALUES (70, 3, 'tincidunt.dui.augue@icloud.com', '0800 1111', 'trombone');
INSERT INTO public.application VALUES (71, 1, 'nec@protonmail.edu', '056 5283 2376', 'guitar');
INSERT INTO public.application VALUES (72, 3, 'ante.blandit@yahoo.net', '(022) 1688 4563', 'drums');
INSERT INTO public.application VALUES (73, 1, 'diam.nunc.ullamcorper@google.couk', '(0111) 975 5657', 'piano');
INSERT INTO public.application VALUES (74, 3, 'rutrum.non.hendrerit@outlook.edu', '(014856) 16696', 'cello');
INSERT INTO public.application VALUES (75, 2, 'ultricies.dignissim.lacus@protonmail.edu', '07178 558388', 'violin');
INSERT INTO public.application VALUES (76, 1, 'sit.amet@protonmail.edu', '(028) 1621 3602', 'bass');
INSERT INTO public.application VALUES (77, 1, 'a.enim.suspendisse@aol.edu', '(029) 7034 3032', 'viola');
INSERT INTO public.application VALUES (78, 1, 'libero@aol.com', '056 7916 5922', 'trumpet');
INSERT INTO public.application VALUES (79, 2, 'fusce.feugiat.lorem@protonmail.org', '(01444) 32522', 'trombone');
INSERT INTO public.application VALUES (80, 1, 'lorem.ipsum@protonmail.net', '(01678) 50714', 'guitar');


--
-- Data for Name: contact_person; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.contact_person OVERRIDING SYSTEM VALUE VALUES (1, 'Freya Petty', '0995 813 4777');
INSERT INTO public.contact_person OVERRIDING SYSTEM VALUE VALUES (2, 'Quamar Gray', '055 9277 1670');
INSERT INTO public.contact_person OVERRIDING SYSTEM VALUE VALUES (3, 'Carlos Kline', '0912 547 1923');
INSERT INTO public.contact_person OVERRIDING SYSTEM VALUE VALUES (4, 'Zephr Byrd', '07155 508202');
INSERT INTO public.contact_person OVERRIDING SYSTEM VALUE VALUES (5, 'Phillip Griffith', '076 6406 4161');
INSERT INTO public.contact_person OVERRIDING SYSTEM VALUE VALUES (6, 'Reagan Hays', '(0117) 415 4168');
INSERT INTO public.contact_person OVERRIDING SYSTEM VALUE VALUES (7, 'Wade Mendez', '0800 053239');
INSERT INTO public.contact_person OVERRIDING SYSTEM VALUE VALUES (8, 'Kelly Morse', '0800 1111');
INSERT INTO public.contact_person OVERRIDING SYSTEM VALUE VALUES (9, 'Hadassah Wilcox', '(016977) 6194');
INSERT INTO public.contact_person OVERRIDING SYSTEM VALUE VALUES (10, 'Conan Nielsen', '0373 236 6395');
INSERT INTO public.contact_person OVERRIDING SYSTEM VALUE VALUES (11, 'Honorato Bullock', '055 7756 7246');
INSERT INTO public.contact_person OVERRIDING SYSTEM VALUE VALUES (12, 'Karly Wong', '(029) 6570 2327');
INSERT INTO public.contact_person OVERRIDING SYSTEM VALUE VALUES (13, 'Graiden Pace', '0800 537627');
INSERT INTO public.contact_person OVERRIDING SYSTEM VALUE VALUES (14, 'Leilani Hines', '070 1366 4355');
INSERT INTO public.contact_person OVERRIDING SYSTEM VALUE VALUES (15, 'Rogan Rosa', '070 0548 5123');
INSERT INTO public.contact_person OVERRIDING SYSTEM VALUE VALUES (16, 'Tashya Bowers', '07624 551197');
INSERT INTO public.contact_person OVERRIDING SYSTEM VALUE VALUES (17, 'Ethan Solis', '(01323) 95555');
INSERT INTO public.contact_person OVERRIDING SYSTEM VALUE VALUES (18, 'Maite Munoz', '0893 238 8870');
INSERT INTO public.contact_person OVERRIDING SYSTEM VALUE VALUES (19, 'Frances Richmond', '(018388) 67202');
INSERT INTO public.contact_person OVERRIDING SYSTEM VALUE VALUES (20, 'Jonah Haney', '076 9344 2424');
INSERT INTO public.contact_person OVERRIDING SYSTEM VALUE VALUES (21, 'Paul Deleon', '0304 071 6862');
INSERT INTO public.contact_person OVERRIDING SYSTEM VALUE VALUES (22, 'Alika Myers', '(0112) 773 8659');
INSERT INTO public.contact_person OVERRIDING SYSTEM VALUE VALUES (23, 'Colt Griffin', '070 0253 3329');
INSERT INTO public.contact_person OVERRIDING SYSTEM VALUE VALUES (24, 'Piper Vance', '(0141) 136 3166');
INSERT INTO public.contact_person OVERRIDING SYSTEM VALUE VALUES (25, 'Hiram Ferguson', '07791 314238');
INSERT INTO public.contact_person OVERRIDING SYSTEM VALUE VALUES (26, 'Hilel Mcpherson', '(016977) 0268');
INSERT INTO public.contact_person OVERRIDING SYSTEM VALUE VALUES (27, 'Slade Blanchard', '(01545) 931746');
INSERT INTO public.contact_person OVERRIDING SYSTEM VALUE VALUES (28, 'Hilda Briggs', '(0112) 888 5465');
INSERT INTO public.contact_person OVERRIDING SYSTEM VALUE VALUES (29, 'Giacomo Jennings', '0800 1111');
INSERT INTO public.contact_person OVERRIDING SYSTEM VALUE VALUES (30, 'Megan Hansen', '(0131) 524 7446');
INSERT INTO public.contact_person OVERRIDING SYSTEM VALUE VALUES (31, 'Gemma Holder', '070 2354 5722');
INSERT INTO public.contact_person OVERRIDING SYSTEM VALUE VALUES (32, 'Beverly Hendricks', '(0151) 111 3218');
INSERT INTO public.contact_person OVERRIDING SYSTEM VALUE VALUES (33, 'Raven Sutton', '07624 337752');
INSERT INTO public.contact_person OVERRIDING SYSTEM VALUE VALUES (34, 'Henry Ballard', '056 6571 4257');
INSERT INTO public.contact_person OVERRIDING SYSTEM VALUE VALUES (35, 'Sydnee Robertson', '0800 1111');
INSERT INTO public.contact_person OVERRIDING SYSTEM VALUE VALUES (36, 'Blake Reid', '0845 46 45');
INSERT INTO public.contact_person OVERRIDING SYSTEM VALUE VALUES (37, 'Cameron Valentine', '07641 871181');
INSERT INTO public.contact_person OVERRIDING SYSTEM VALUE VALUES (38, 'Christian Albert', '(016418) 52308');
INSERT INTO public.contact_person OVERRIDING SYSTEM VALUE VALUES (39, 'Lana Delacruz', '0867 109 0533');
INSERT INTO public.contact_person OVERRIDING SYSTEM VALUE VALUES (40, 'Yasir Farley', '(016977) 9753');
INSERT INTO public.contact_person OVERRIDING SYSTEM VALUE VALUES (41, 'Mechelle Lowery', '0800 1111');
INSERT INTO public.contact_person OVERRIDING SYSTEM VALUE VALUES (42, 'Amela Hudson', '(0171) 635 3791');
INSERT INTO public.contact_person OVERRIDING SYSTEM VALUE VALUES (43, 'Alan Knowles', '0500 477810');
INSERT INTO public.contact_person OVERRIDING SYSTEM VALUE VALUES (44, 'Wynter Fischer', '0800 787 6847');
INSERT INTO public.contact_person OVERRIDING SYSTEM VALUE VALUES (45, 'Clinton Griffith', '056 0754 2464');
INSERT INTO public.contact_person OVERRIDING SYSTEM VALUE VALUES (46, 'Austin Mccall', '055 7431 0352');
INSERT INTO public.contact_person OVERRIDING SYSTEM VALUE VALUES (47, 'Emmanuel Bauer', '(01582) 67832');
INSERT INTO public.contact_person OVERRIDING SYSTEM VALUE VALUES (48, 'Medge Ray', '055 3935 8943');
INSERT INTO public.contact_person OVERRIDING SYSTEM VALUE VALUES (49, 'Wayne Blackwell', '0800 035802');
INSERT INTO public.contact_person OVERRIDING SYSTEM VALUE VALUES (50, 'Howard Andrews', '07046 030124');
INSERT INTO public.contact_person OVERRIDING SYSTEM VALUE VALUES (51, 'Libby Gilmore', '076 5877 0772');
INSERT INTO public.contact_person OVERRIDING SYSTEM VALUE VALUES (52, 'Craig Munoz', '07896 418474');
INSERT INTO public.contact_person OVERRIDING SYSTEM VALUE VALUES (53, 'Deanna Schmidt', '0800 461213');
INSERT INTO public.contact_person OVERRIDING SYSTEM VALUE VALUES (54, 'Jin Goodman', '(0131) 490 4968');
INSERT INTO public.contact_person OVERRIDING SYSTEM VALUE VALUES (55, 'Emmanuel Buckner', '076 4125 9644');
INSERT INTO public.contact_person OVERRIDING SYSTEM VALUE VALUES (56, 'Noel Cardenas', '070 3328 6562');
INSERT INTO public.contact_person OVERRIDING SYSTEM VALUE VALUES (57, 'Tarik Walton', '0840 217 1521');
INSERT INTO public.contact_person OVERRIDING SYSTEM VALUE VALUES (58, 'Georgia Heath', '(01120) 627928');
INSERT INTO public.contact_person OVERRIDING SYSTEM VALUE VALUES (59, 'Laura Franco', '0800 079 0366');
INSERT INTO public.contact_person OVERRIDING SYSTEM VALUE VALUES (60, 'Kuame Bright', '0500 722164');
INSERT INTO public.contact_person OVERRIDING SYSTEM VALUE VALUES (61, 'Ray Puckett', '(014762) 56827');
INSERT INTO public.contact_person OVERRIDING SYSTEM VALUE VALUES (62, 'Kim Larsen', '0845 46 42');
INSERT INTO public.contact_person OVERRIDING SYSTEM VALUE VALUES (63, 'Elton Valdez', '(016977) 5252');
INSERT INTO public.contact_person OVERRIDING SYSTEM VALUE VALUES (64, 'Melissa Daniels', '0500 380894');
INSERT INTO public.contact_person OVERRIDING SYSTEM VALUE VALUES (65, 'Travis Joyner', '(0118) 429 7840');
INSERT INTO public.contact_person OVERRIDING SYSTEM VALUE VALUES (66, 'Freya Petty', '0995 813 4777');
INSERT INTO public.contact_person OVERRIDING SYSTEM VALUE VALUES (67, 'Quamar Gray', '055 9277 1670');
INSERT INTO public.contact_person OVERRIDING SYSTEM VALUE VALUES (68, 'Carlos Kline', '0912 547 1923');
INSERT INTO public.contact_person OVERRIDING SYSTEM VALUE VALUES (69, 'Zephr Byrd', '07155 508202');
INSERT INTO public.contact_person OVERRIDING SYSTEM VALUE VALUES (70, 'Phillip Griffith', '076 6406 4161');
INSERT INTO public.contact_person OVERRIDING SYSTEM VALUE VALUES (71, 'Reagan Hays', '(0117) 415 4168');
INSERT INTO public.contact_person OVERRIDING SYSTEM VALUE VALUES (72, 'Wade Mendez', '0800 053239');
INSERT INTO public.contact_person OVERRIDING SYSTEM VALUE VALUES (73, 'Kelly Morse', '0800 1111');
INSERT INTO public.contact_person OVERRIDING SYSTEM VALUE VALUES (74, 'Hadassah Wilcox', '(016977) 6194');
INSERT INTO public.contact_person OVERRIDING SYSTEM VALUE VALUES (75, 'Conan Nielsen', '0373 236 6395');
INSERT INTO public.contact_person OVERRIDING SYSTEM VALUE VALUES (76, 'Honorato Bullock', '055 7756 7246');
INSERT INTO public.contact_person OVERRIDING SYSTEM VALUE VALUES (77, 'Karly Wong', '(029) 6570 2327');
INSERT INTO public.contact_person OVERRIDING SYSTEM VALUE VALUES (78, 'Graiden Pace', '0800 537627');
INSERT INTO public.contact_person OVERRIDING SYSTEM VALUE VALUES (79, 'Leilani Hines', '070 1366 4355');
INSERT INTO public.contact_person OVERRIDING SYSTEM VALUE VALUES (80, 'Rogan Rosa', '070 0548 5123');


--
-- Data for Name: discount; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.discount OVERRIDING SYSTEM VALUE VALUES (1, '25', 23);
INSERT INTO public.discount OVERRIDING SYSTEM VALUE VALUES (2, '25', 32);
INSERT INTO public.discount OVERRIDING SYSTEM VALUE VALUES (3, '25', 71);
INSERT INTO public.discount OVERRIDING SYSTEM VALUE VALUES (4, '25', 20);
INSERT INTO public.discount OVERRIDING SYSTEM VALUE VALUES (5, '25', 30);
INSERT INTO public.discount OVERRIDING SYSTEM VALUE VALUES (6, '25', 58);
INSERT INTO public.discount OVERRIDING SYSTEM VALUE VALUES (7, '25', 2);
INSERT INTO public.discount OVERRIDING SYSTEM VALUE VALUES (8, '25', 77);
INSERT INTO public.discount OVERRIDING SYSTEM VALUE VALUES (9, '25', 65);
INSERT INTO public.discount OVERRIDING SYSTEM VALUE VALUES (10, '25', 66);
INSERT INTO public.discount OVERRIDING SYSTEM VALUE VALUES (11, '25', 75);
INSERT INTO public.discount OVERRIDING SYSTEM VALUE VALUES (12, '25', 63);
INSERT INTO public.discount OVERRIDING SYSTEM VALUE VALUES (13, '25', 21);
INSERT INTO public.discount OVERRIDING SYSTEM VALUE VALUES (14, '25', 26);
INSERT INTO public.discount OVERRIDING SYSTEM VALUE VALUES (15, '25', 11);
INSERT INTO public.discount OVERRIDING SYSTEM VALUE VALUES (16, '25', 58);
INSERT INTO public.discount OVERRIDING SYSTEM VALUE VALUES (17, '25', 51);
INSERT INTO public.discount OVERRIDING SYSTEM VALUE VALUES (18, '25', 65);
INSERT INTO public.discount OVERRIDING SYSTEM VALUE VALUES (19, '25', 58);
INSERT INTO public.discount OVERRIDING SYSTEM VALUE VALUES (20, '25', 61);
INSERT INTO public.discount OVERRIDING SYSTEM VALUE VALUES (21, '25', 50);
INSERT INTO public.discount OVERRIDING SYSTEM VALUE VALUES (22, '25', 68);
INSERT INTO public.discount OVERRIDING SYSTEM VALUE VALUES (23, '25', 38);
INSERT INTO public.discount OVERRIDING SYSTEM VALUE VALUES (24, '25', 79);


--
-- Data for Name: instructor; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.instructor OVERRIDING SYSTEM VALUE VALUES (1, 'Nissim Kent', '2311577553', '0800 592 9058', 'velit.justo@hotmail.com', '24', 'Ap #744-1536 Quis Rd.');
INSERT INTO public.instructor OVERRIDING SYSTEM VALUE VALUES (2, 'Kameko Olsen', '1115318277', '0396 575 4831', 'dui@aol.ca', '25', 'Ap #177-2352 Felis Ave');
INSERT INTO public.instructor OVERRIDING SYSTEM VALUE VALUES (3, 'Maggie Mccormick', '1275331365', '(01867) 55650', 'vitae.velit@outlook.ca', '21', '204 Convallis, Street
');
INSERT INTO public.instructor OVERRIDING SYSTEM VALUE VALUES (4, 'Jameson Manning', '6467602785', '055 4812 4475', 'erat.in.consectetuer@aol.edu', '15', 'Ap #989-2265 Mag
na Av.');
INSERT INTO public.instructor OVERRIDING SYSTEM VALUE VALUES (5, 'Steven Rosario', '4745265293', '0906 548 5574', 'proin.non.massa@yahoo.edu', '82', 'Ap #618-1186 Lorem S
treet');
INSERT INTO public.instructor OVERRIDING SYSTEM VALUE VALUES (6, 'Rose Fisher', '3435202825', '0996 241 8854', 'luctus.felis@hotmail.com', '45', '7390 Quam Road');
INSERT INTO public.instructor OVERRIDING SYSTEM VALUE VALUES (7, 'Desiree Brewer', '9214487846', '(026) 2550 7364', 'nunc.sed@outlook.couk', '47', '279-3707 Sit Avenue');
INSERT INTO public.instructor OVERRIDING SYSTEM VALUE VALUES (8, 'Yoko Decker', '6326385882', '(01166) 258351', 'non@protonmail.net', '38', 'P.O. Box 709, 9358 Morbi St.'
);
INSERT INTO public.instructor OVERRIDING SYSTEM VALUE VALUES (9, 'Erich Velazquez', '4254376148', '056 5922 9937', 'pede.malesuada@hotmail.couk', '59', '317-9876 Habitant
 Av.');


--
-- Data for Name: music_lesson; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.music_lesson OVERRIDING SYSTEM VALUE VALUES (4, 9, 4, 2, 2, NULL, NULL, NULL);
INSERT INTO public.music_lesson OVERRIDING SYSTEM VALUE VALUES (5, 8, 5, 2, 2, NULL, NULL, NULL);
INSERT INTO public.music_lesson OVERRIDING SYSTEM VALUE VALUES (9, 5, 9, 3, 8, '10', '2', 'rock');
INSERT INTO public.music_lesson OVERRIDING SYSTEM VALUE VALUES (10, 2, 10, 3, 2, NULL, NULL, NULL);
INSERT INTO public.music_lesson OVERRIDING SYSTEM VALUE VALUES (12, 3, 12, 1, 1, NULL, NULL, NULL);
INSERT INTO public.music_lesson OVERRIDING SYSTEM VALUE VALUES (19, 3, 19, 2, 3, NULL, NULL, NULL);
INSERT INTO public.music_lesson OVERRIDING SYSTEM VALUE VALUES (24, 3, 24, 2, 3, NULL, NULL, NULL);
INSERT INTO public.music_lesson OVERRIDING SYSTEM VALUE VALUES (26, 2, 26, 1, 3, NULL, NULL, NULL);
INSERT INTO public.music_lesson OVERRIDING SYSTEM VALUE VALUES (28, 3, 28, 3, 3, NULL, NULL, NULL);
INSERT INTO public.music_lesson OVERRIDING SYSTEM VALUE VALUES (16, 2, 16, 3, 7, '10', '2', 'rock');
INSERT INTO public.music_lesson OVERRIDING SYSTEM VALUE VALUES (32, 1, 32, 3, 2, NULL, NULL, NULL);
INSERT INTO public.music_lesson OVERRIDING SYSTEM VALUE VALUES (22, 3, 22, 3, 7, '10', '2', 'rock');
INSERT INTO public.music_lesson OVERRIDING SYSTEM VALUE VALUES (43, 3, 43, 2, 3, NULL, NULL, NULL);
INSERT INTO public.music_lesson OVERRIDING SYSTEM VALUE VALUES (25, 6, 25, 3, 7, '10', '2', 'rock');
INSERT INTO public.music_lesson OVERRIDING SYSTEM VALUE VALUES (45, 9, 45, 2, 2, NULL, NULL, NULL);
INSERT INTO public.music_lesson OVERRIDING SYSTEM VALUE VALUES (29, 5, 29, 3, 7, '10', '2', 'rock');
INSERT INTO public.music_lesson OVERRIDING SYSTEM VALUE VALUES (51, 5, 51, 3, 7, '10', '2', 'rock');
INSERT INTO public.music_lesson OVERRIDING SYSTEM VALUE VALUES (55, 8, 55, 3, 7, '10', '2', 'rock');
INSERT INTO public.music_lesson OVERRIDING SYSTEM VALUE VALUES (11, 1, 11, 1, 7, '10', '2', 'metal');
INSERT INTO public.music_lesson OVERRIDING SYSTEM VALUE VALUES (34, 6, 34, 1, 9, '10', '2', 'metal');
INSERT INTO public.music_lesson OVERRIDING SYSTEM VALUE VALUES (37, 4, 37, 1, 9, '10', '2', 'metal');
INSERT INTO public.music_lesson OVERRIDING SYSTEM VALUE VALUES (38, 6, 38, 1, 9, '10', '2', 'metal');
INSERT INTO public.music_lesson OVERRIDING SYSTEM VALUE VALUES (53, 6, 53, 1, 8, '10', '2', 'metal');
INSERT INTO public.music_lesson OVERRIDING SYSTEM VALUE VALUES (1, 1, 1, 2, 8, '10', '2', 'pop');
INSERT INTO public.music_lesson OVERRIDING SYSTEM VALUE VALUES (6, 5, 6, 2, 7, '10', '2', 'pop');
INSERT INTO public.music_lesson OVERRIDING SYSTEM VALUE VALUES (13, 1, 13, 2, 8, '10', '2', 'pop');
INSERT INTO public.music_lesson OVERRIDING SYSTEM VALUE VALUES (27, 8, 27, 2, 7, '10', '2', 'pop');
INSERT INTO public.music_lesson OVERRIDING SYSTEM VALUE VALUES (30, 6, 30, 2, 7, '10', '2', 'pop');
INSERT INTO public.music_lesson OVERRIDING SYSTEM VALUE VALUES (33, 6, 33, 2, 8, '10', '2', 'pop');
INSERT INTO public.music_lesson OVERRIDING SYSTEM VALUE VALUES (8, 7, 8, 1, 2, NULL, NULL, NULL);
INSERT INTO public.music_lesson OVERRIDING SYSTEM VALUE VALUES (14, 7, 14, 1, 2, NULL, NULL, NULL);
INSERT INTO public.music_lesson OVERRIDING SYSTEM VALUE VALUES (35, 5, 35, 2, 8, '10', '2', 'pop');
INSERT INTO public.music_lesson OVERRIDING SYSTEM VALUE VALUES (42, 4, 42, 2, 9, '10', '2', 'pop');
INSERT INTO public.music_lesson OVERRIDING SYSTEM VALUE VALUES (49, 5, 49, 2, 7, '10', '2', 'pop');
INSERT INTO public.music_lesson OVERRIDING SYSTEM VALUE VALUES (2, 7, 2, 2, 8, '10', '2', 'pop');
INSERT INTO public.music_lesson OVERRIDING SYSTEM VALUE VALUES (3, 4, 3, 3, 6, '10', '2', NULL);
INSERT INTO public.music_lesson OVERRIDING SYSTEM VALUE VALUES (52, 7, 52, 2, 2, NULL, NULL, NULL);
INSERT INTO public.music_lesson OVERRIDING SYSTEM VALUE VALUES (15, 4, 15, 1, 6, '10', '2', NULL);
INSERT INTO public.music_lesson OVERRIDING SYSTEM VALUE VALUES (17, 5, 17, 2, 6, '10', '2', NULL);
INSERT INTO public.music_lesson OVERRIDING SYSTEM VALUE VALUES (18, 8, 18, 2, 5, '10', '2', NULL);
INSERT INTO public.music_lesson OVERRIDING SYSTEM VALUE VALUES (20, 5, 20, 2, 4, '10', '2', NULL);
INSERT INTO public.music_lesson OVERRIDING SYSTEM VALUE VALUES (21, 6, 21, 1, 6, '10', '2', NULL);
INSERT INTO public.music_lesson OVERRIDING SYSTEM VALUE VALUES (23, 3, 23, 2, 4, '10', '2', NULL);
INSERT INTO public.music_lesson OVERRIDING SYSTEM VALUE VALUES (36, 6, 36, 2, 4, '10', '2', NULL);
INSERT INTO public.music_lesson OVERRIDING SYSTEM VALUE VALUES (39, 4, 39, 3, 5, '10', '2', NULL);
INSERT INTO public.music_lesson OVERRIDING SYSTEM VALUE VALUES (40, 8, 40, 2, 4, '10', '2', NULL);
INSERT INTO public.music_lesson OVERRIDING SYSTEM VALUE VALUES (47, 8, 47, 3, 4, '10', '2', NULL);
INSERT INTO public.music_lesson OVERRIDING SYSTEM VALUE VALUES (50, 8, 50, 1, 4, '10', '2', NULL);
INSERT INTO public.music_lesson OVERRIDING SYSTEM VALUE VALUES (54, 6, 54, 1, 4, '10', '2', NULL);
INSERT INTO public.music_lesson OVERRIDING SYSTEM VALUE VALUES (7, 7, 7, 3, 8, '10', '2', 'rock');
INSERT INTO public.music_lesson OVERRIDING SYSTEM VALUE VALUES (46, 7, 46, 1, 8, '10', '2', 'metal');
INSERT INTO public.music_lesson OVERRIDING SYSTEM VALUE VALUES (48, 7, 48, 1, 7, '10', '2', 'metal');
INSERT INTO public.music_lesson OVERRIDING SYSTEM VALUE VALUES (31, 7, 31, 2, 8, '10', '2', 'pop');
INSERT INTO public.music_lesson OVERRIDING SYSTEM VALUE VALUES (41, 7, 41, 2, 8, '10', '2', 'pop');
INSERT INTO public.music_lesson OVERRIDING SYSTEM VALUE VALUES (44, 7, 44, 2, 8, '10', '2', 'pop');


--
-- Data for Name: pricing; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.pricing OVERRIDING SYSTEM VALUE VALUES (1, '36', 'individual', 1);
INSERT INTO public.pricing OVERRIDING SYSTEM VALUE VALUES (2, '20', 'individual', 2);
INSERT INTO public.pricing OVERRIDING SYSTEM VALUE VALUES (3, '38', 'individual', 3);
INSERT INTO public.pricing OVERRIDING SYSTEM VALUE VALUES (4, '74', 'group', 1);
INSERT INTO public.pricing OVERRIDING SYSTEM VALUE VALUES (5, '94', 'group', 2);
INSERT INTO public.pricing OVERRIDING SYSTEM VALUE VALUES (6, '98', 'group', 3);
INSERT INTO public.pricing OVERRIDING SYSTEM VALUE VALUES (7, '21', 'ensemble', 1);
INSERT INTO public.pricing OVERRIDING SYSTEM VALUE VALUES (8, '87', 'ensemble', 2);
INSERT INTO public.pricing OVERRIDING SYSTEM VALUE VALUES (9, '56', 'ensemble', 3);


--
-- Data for Name: rental; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.rental OVERRIDING SYSTEM VALUE VALUES (66, 'Mar 15, 2021', NULL, 11, 34);
INSERT INTO public.rental OVERRIDING SYSTEM VALUE VALUES (67, 'Mar 17, 2021', NULL, 15, 27);
INSERT INTO public.rental OVERRIDING SYSTEM VALUE VALUES (68, 'Apr 5, 2021', NULL, 18, 39);
INSERT INTO public.rental OVERRIDING SYSTEM VALUE VALUES (69, 'Mar 12, 2021', NULL, 22, 20);
INSERT INTO public.rental OVERRIDING SYSTEM VALUE VALUES (70, 'Mar 9, 2021', NULL, 26, 34);
INSERT INTO public.rental OVERRIDING SYSTEM VALUE VALUES (71, 'Feb 28, 2021', NULL, 29, 29);
INSERT INTO public.rental OVERRIDING SYSTEM VALUE VALUES (72, 'Feb 25, 2021', NULL, 33, 46);
INSERT INTO public.rental OVERRIDING SYSTEM VALUE VALUES (73, 'Mar 12, 2021', NULL, 36, 19);
INSERT INTO public.rental OVERRIDING SYSTEM VALUE VALUES (74, 'Mar 27, 2021', NULL, 40, 28);
INSERT INTO public.rental OVERRIDING SYSTEM VALUE VALUES (75, 'Mar 7, 2021', NULL, 44, 41);
INSERT INTO public.rental OVERRIDING SYSTEM VALUE VALUES (76, 'Mar 30, 2021', NULL, 47, 29);
INSERT INTO public.rental OVERRIDING SYSTEM VALUE VALUES (77, 'Apr 12, 2021', NULL, 51, 25);
INSERT INTO public.rental OVERRIDING SYSTEM VALUE VALUES (78, 'Feb 7, 2021', NULL, 54, 13);
INSERT INTO public.rental OVERRIDING SYSTEM VALUE VALUES (79, 'Mar 4, 2021', NULL, 58, 45);
INSERT INTO public.rental OVERRIDING SYSTEM VALUE VALUES (80, 'Mar 14, 2021', NULL, 62, 39);
INSERT INTO public.rental OVERRIDING SYSTEM VALUE VALUES (81, 'Mar 8, 2021', NULL, 65, 32);
INSERT INTO public.rental OVERRIDING SYSTEM VALUE VALUES (82, 'Feb 12, 2021', NULL, 69, 14);
INSERT INTO public.rental OVERRIDING SYSTEM VALUE VALUES (83, 'Feb 17, 2021', NULL, 72, 15);
INSERT INTO public.rental OVERRIDING SYSTEM VALUE VALUES (84, 'Mar 22, 2021', NULL, 76, 50);
INSERT INTO public.rental OVERRIDING SYSTEM VALUE VALUES (85, 'Mar 8, 2021', NULL, 80, 28);
INSERT INTO public.rental OVERRIDING SYSTEM VALUE VALUES (65, 'Mar 31, 2021', '2022-12-10', 80, 43);
INSERT INTO public.rental OVERRIDING SYSTEM VALUE VALUES (99, '2022-12-10', '2022-12-10', 79, 49);
INSERT INTO public.rental OVERRIDING SYSTEM VALUE VALUES (86, 'Mar 27, 2021', 'Jan 3, 2022', 78, 8);
INSERT INTO public.rental OVERRIDING SYSTEM VALUE VALUES (87, 'Feb 19, 2021', 'Sep 27, 2021', 77, 6);
INSERT INTO public.rental OVERRIDING SYSTEM VALUE VALUES (88, 'Feb 14, 2021', 'Dec 18, 2021', 12, 7);
INSERT INTO public.rental OVERRIDING SYSTEM VALUE VALUES (89, 'Mar 15, 2021', 'Sep 28, 2021', 45, 9);
INSERT INTO public.rental OVERRIDING SYSTEM VALUE VALUES (90, 'Mar 31, 2021', 'Dec 24, 2021', 68, 10);
INSERT INTO public.rental OVERRIDING SYSTEM VALUE VALUES (91, 'Feb 21, 2021', 'Nov 21, 2021', 10, 1);
INSERT INTO public.rental OVERRIDING SYSTEM VALUE VALUES (92, 'Apr 10, 2021', 'Sep 22, 2021', 14, 2);
INSERT INTO public.rental OVERRIDING SYSTEM VALUE VALUES (93, 'Mar 21, 2021', 'Sep 1, 2021', 15, 3);
INSERT INTO public.rental OVERRIDING SYSTEM VALUE VALUES (94, 'Apr 15, 2021', 'Sep 17, 2021', 16, 4);
INSERT INTO public.rental OVERRIDING SYSTEM VALUE VALUES (95, 'Mar 25, 2021', 'Dec 16, 2021', 17, 5);
INSERT INTO public.rental OVERRIDING SYSTEM VALUE VALUES (96, 'Apr 12, 2021', 'Oct 16, 2021', 18, 6);


--
-- Data for Name: rental_instrument; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.rental_instrument OVERRIDING SYSTEM VALUE VALUES (1, 'piano', 'Mcfadden', '66');
INSERT INTO public.rental_instrument OVERRIDING SYSTEM VALUE VALUES (2, 'cello', 'Mcpherson', '31');
INSERT INTO public.rental_instrument OVERRIDING SYSTEM VALUE VALUES (3, 'violin', 'Christian', '56');
INSERT INTO public.rental_instrument OVERRIDING SYSTEM VALUE VALUES (4, 'bass', 'Bishop', '71');
INSERT INTO public.rental_instrument OVERRIDING SYSTEM VALUE VALUES (5, 'viola', 'Skinner', '09');
INSERT INTO public.rental_instrument OVERRIDING SYSTEM VALUE VALUES (6, 'harp', 'Oneal', '61');
INSERT INTO public.rental_instrument OVERRIDING SYSTEM VALUE VALUES (7, 'trumpet', 'Emerson', '57');
INSERT INTO public.rental_instrument OVERRIDING SYSTEM VALUE VALUES (8, 'trombone', 'Harmon', '15');
INSERT INTO public.rental_instrument OVERRIDING SYSTEM VALUE VALUES (9, 'guitar', 'Sosa', '45');
INSERT INTO public.rental_instrument OVERRIDING SYSTEM VALUE VALUES (10, 'drums', 'Walter', '36');
INSERT INTO public.rental_instrument OVERRIDING SYSTEM VALUE VALUES (11, 'piano', 'Kemp', '58');
INSERT INTO public.rental_instrument OVERRIDING SYSTEM VALUE VALUES (12, 'cello', 'Mack', '16');
INSERT INTO public.rental_instrument OVERRIDING SYSTEM VALUE VALUES (13, 'violin', 'Stone', '25');
INSERT INTO public.rental_instrument OVERRIDING SYSTEM VALUE VALUES (14, 'bass', 'Gilliam', '74');
INSERT INTO public.rental_instrument OVERRIDING SYSTEM VALUE VALUES (15, 'viola', 'Bean', '33');
INSERT INTO public.rental_instrument OVERRIDING SYSTEM VALUE VALUES (16, 'harp', 'Kaufman', '98');
INSERT INTO public.rental_instrument OVERRIDING SYSTEM VALUE VALUES (17, 'trumpet', 'Barron', '16');
INSERT INTO public.rental_instrument OVERRIDING SYSTEM VALUE VALUES (18, 'trombone', 'Carey', '22');
INSERT INTO public.rental_instrument OVERRIDING SYSTEM VALUE VALUES (19, 'guitar', 'Madden', '23');
INSERT INTO public.rental_instrument OVERRIDING SYSTEM VALUE VALUES (20, 'drums', 'Tran', '44');
INSERT INTO public.rental_instrument OVERRIDING SYSTEM VALUE VALUES (21, 'piano', 'Pratt', '23');
INSERT INTO public.rental_instrument OVERRIDING SYSTEM VALUE VALUES (22, 'cello', 'Carpenter', '48');
INSERT INTO public.rental_instrument OVERRIDING SYSTEM VALUE VALUES (23, 'violin', 'Waller', '62');
INSERT INTO public.rental_instrument OVERRIDING SYSTEM VALUE VALUES (24, 'bass', 'Forbes', '25');
INSERT INTO public.rental_instrument OVERRIDING SYSTEM VALUE VALUES (25, 'viola', 'Moran', '14');
INSERT INTO public.rental_instrument OVERRIDING SYSTEM VALUE VALUES (26, 'harp', 'Benson', '84');
INSERT INTO public.rental_instrument OVERRIDING SYSTEM VALUE VALUES (27, 'trumpet', 'Powell', '85');
INSERT INTO public.rental_instrument OVERRIDING SYSTEM VALUE VALUES (28, 'trombone', 'Burns', '36');
INSERT INTO public.rental_instrument OVERRIDING SYSTEM VALUE VALUES (29, 'guitar', 'Massey', '48');
INSERT INTO public.rental_instrument OVERRIDING SYSTEM VALUE VALUES (30, 'drums', 'Wyatt', '42');
INSERT INTO public.rental_instrument OVERRIDING SYSTEM VALUE VALUES (31, 'piano', 'Mcleod', '01');
INSERT INTO public.rental_instrument OVERRIDING SYSTEM VALUE VALUES (32, 'cello', 'Hurley', '86');
INSERT INTO public.rental_instrument OVERRIDING SYSTEM VALUE VALUES (33, 'violin', 'Bridges', '33');
INSERT INTO public.rental_instrument OVERRIDING SYSTEM VALUE VALUES (34, 'bass', 'Collins', '85');
INSERT INTO public.rental_instrument OVERRIDING SYSTEM VALUE VALUES (35, 'viola', 'Walter', '88');
INSERT INTO public.rental_instrument OVERRIDING SYSTEM VALUE VALUES (36, 'harp', 'Stanton', '15');
INSERT INTO public.rental_instrument OVERRIDING SYSTEM VALUE VALUES (37, 'trumpet', 'Noble', '16');
INSERT INTO public.rental_instrument OVERRIDING SYSTEM VALUE VALUES (38, 'trombone', 'Stafford', '63');
INSERT INTO public.rental_instrument OVERRIDING SYSTEM VALUE VALUES (39, 'guitar', 'Wilkins', '95');
INSERT INTO public.rental_instrument OVERRIDING SYSTEM VALUE VALUES (40, 'drums', 'Woodard', '04');
INSERT INTO public.rental_instrument OVERRIDING SYSTEM VALUE VALUES (41, 'piano', 'Abbott', '42');
INSERT INTO public.rental_instrument OVERRIDING SYSTEM VALUE VALUES (42, 'cello', 'Weiss', '06');
INSERT INTO public.rental_instrument OVERRIDING SYSTEM VALUE VALUES (43, 'violin', 'Garrett', '39');
INSERT INTO public.rental_instrument OVERRIDING SYSTEM VALUE VALUES (44, 'bass', 'Camacho', '70');
INSERT INTO public.rental_instrument OVERRIDING SYSTEM VALUE VALUES (45, 'viola', 'Irwin', '44');
INSERT INTO public.rental_instrument OVERRIDING SYSTEM VALUE VALUES (46, 'harp', 'Hancock', '13');
INSERT INTO public.rental_instrument OVERRIDING SYSTEM VALUE VALUES (47, 'trumpet', 'Bird', '11');
INSERT INTO public.rental_instrument OVERRIDING SYSTEM VALUE VALUES (48, 'trombone', 'Clayton', '53');
INSERT INTO public.rental_instrument OVERRIDING SYSTEM VALUE VALUES (49, 'guitar', 'Hampton', '83');
INSERT INTO public.rental_instrument OVERRIDING SYSTEM VALUE VALUES (50, 'drums', 'Keller', '68');


--
-- Data for Name: schedule; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.schedule OVERRIDING SYSTEM VALUE VALUES (1, '2022-12-07 12:45:09', '476');
INSERT INTO public.schedule OVERRIDING SYSTEM VALUE VALUES (2, '2022-11-15 07:41:36', '229');
INSERT INTO public.schedule OVERRIDING SYSTEM VALUE VALUES (3, '2022-11-01 10:45:40', '647');
INSERT INTO public.schedule OVERRIDING SYSTEM VALUE VALUES (4, '2022-11-22 01:00:24', '875');
INSERT INTO public.schedule OVERRIDING SYSTEM VALUE VALUES (5, '2022-12-05 05:57:30', '533');
INSERT INTO public.schedule OVERRIDING SYSTEM VALUE VALUES (6, '2022-11-26 11:36:40', '745');
INSERT INTO public.schedule OVERRIDING SYSTEM VALUE VALUES (7, '2022-11-09 12:33:50', '635');
INSERT INTO public.schedule OVERRIDING SYSTEM VALUE VALUES (8, '2022-11-01 10:34:20', '403');
INSERT INTO public.schedule OVERRIDING SYSTEM VALUE VALUES (9, '2022-12-23 03:49:41', '507');
INSERT INTO public.schedule OVERRIDING SYSTEM VALUE VALUES (10, '2022-11-07 07:58:44', '030');
INSERT INTO public.schedule OVERRIDING SYSTEM VALUE VALUES (11, '2022-12-08 02:39:44', '804');
INSERT INTO public.schedule OVERRIDING SYSTEM VALUE VALUES (12, '2022-12-31 06:13:18', '780');
INSERT INTO public.schedule OVERRIDING SYSTEM VALUE VALUES (13, '2022-11-30 08:14:47', '135');
INSERT INTO public.schedule OVERRIDING SYSTEM VALUE VALUES (14, '2022-11-05 05:21:05', '838');
INSERT INTO public.schedule OVERRIDING SYSTEM VALUE VALUES (15, '2022-12-10 08:27:43', '069');
INSERT INTO public.schedule OVERRIDING SYSTEM VALUE VALUES (16, '2022-11-15 04:44:21', '872');
INSERT INTO public.schedule OVERRIDING SYSTEM VALUE VALUES (17, '2022-11-24 07:09:09', '170');
INSERT INTO public.schedule OVERRIDING SYSTEM VALUE VALUES (18, '2022-11-30 09:19:58', '571');
INSERT INTO public.schedule OVERRIDING SYSTEM VALUE VALUES (19, '2022-12-25 04:44:22', '588');
INSERT INTO public.schedule OVERRIDING SYSTEM VALUE VALUES (20, '2022-12-10 03:44:17', '676');
INSERT INTO public.schedule OVERRIDING SYSTEM VALUE VALUES (21, '2022-12-01 04:52:50', '231');
INSERT INTO public.schedule OVERRIDING SYSTEM VALUE VALUES (22, '2022-12-31 03:59:37', '892');
INSERT INTO public.schedule OVERRIDING SYSTEM VALUE VALUES (23, '2022-11-10 08:51:21', '572');
INSERT INTO public.schedule OVERRIDING SYSTEM VALUE VALUES (24, '2022-12-22 10:14:39', '661');
INSERT INTO public.schedule OVERRIDING SYSTEM VALUE VALUES (25, '2022-12-16 12:54:04', '353');
INSERT INTO public.schedule OVERRIDING SYSTEM VALUE VALUES (26, '2022-11-21 08:44:59', '573');
INSERT INTO public.schedule OVERRIDING SYSTEM VALUE VALUES (27, '2022-12-11 08:05:34', '595');
INSERT INTO public.schedule OVERRIDING SYSTEM VALUE VALUES (28, '2022-12-04 06:41:15', '811');
INSERT INTO public.schedule OVERRIDING SYSTEM VALUE VALUES (29, '2022-11-13 06:30:40', '821');
INSERT INTO public.schedule OVERRIDING SYSTEM VALUE VALUES (30, '2022-11-15 04:13:34', '451');
INSERT INTO public.schedule OVERRIDING SYSTEM VALUE VALUES (31, '2022-11-23 08:56:43', '387');
INSERT INTO public.schedule OVERRIDING SYSTEM VALUE VALUES (32, '2022-12-03 09:27:04', '061');
INSERT INTO public.schedule OVERRIDING SYSTEM VALUE VALUES (33, '2022-12-26 03:46:57', '145');
INSERT INTO public.schedule OVERRIDING SYSTEM VALUE VALUES (34, '2022-12-21 01:06:02', '456');
INSERT INTO public.schedule OVERRIDING SYSTEM VALUE VALUES (35, '2022-11-21 11:56:16', '516');
INSERT INTO public.schedule OVERRIDING SYSTEM VALUE VALUES (36, '2022-11-11 12:47:12', '880');
INSERT INTO public.schedule OVERRIDING SYSTEM VALUE VALUES (37, '2022-12-20 11:07:26', '014');
INSERT INTO public.schedule OVERRIDING SYSTEM VALUE VALUES (38, '2022-11-15 12:52:11', '016');
INSERT INTO public.schedule OVERRIDING SYSTEM VALUE VALUES (39, '2022-12-11 08:19:32', '129');
INSERT INTO public.schedule OVERRIDING SYSTEM VALUE VALUES (40, '2022-12-22 03:22:36', '532');
INSERT INTO public.schedule OVERRIDING SYSTEM VALUE VALUES (41, '2022-11-09 10:17:50', '317');
INSERT INTO public.schedule OVERRIDING SYSTEM VALUE VALUES (42, '2022-11-21 12:12:31', '331');
INSERT INTO public.schedule OVERRIDING SYSTEM VALUE VALUES (43, '2022-11-13 05:37:30', '962');
INSERT INTO public.schedule OVERRIDING SYSTEM VALUE VALUES (44, '2022-12-17 08:25:00', '384');
INSERT INTO public.schedule OVERRIDING SYSTEM VALUE VALUES (45, '2022-12-28 04:01:58', '667');
INSERT INTO public.schedule OVERRIDING SYSTEM VALUE VALUES (46, '2022-12-23 05:37:00', '791');
INSERT INTO public.schedule OVERRIDING SYSTEM VALUE VALUES (47, '2022-11-04 01:17:56', '624');
INSERT INTO public.schedule OVERRIDING SYSTEM VALUE VALUES (48, '2022-12-15 12:02:50', '465');
INSERT INTO public.schedule OVERRIDING SYSTEM VALUE VALUES (49, '2022-11-22 07:55:34', '291');
INSERT INTO public.schedule OVERRIDING SYSTEM VALUE VALUES (50, '2022-12-04 12:06:03', '403');
INSERT INTO public.schedule OVERRIDING SYSTEM VALUE VALUES (51, '2022-12-09 08:21:23', '865');
INSERT INTO public.schedule OVERRIDING SYSTEM VALUE VALUES (52, '2022-12-25 10:21:02', '087');
INSERT INTO public.schedule OVERRIDING SYSTEM VALUE VALUES (53, '2022-12-10 06:24:54', '844');
INSERT INTO public.schedule OVERRIDING SYSTEM VALUE VALUES (54, '2022-11-26 06:48:04', '233');
INSERT INTO public.schedule OVERRIDING SYSTEM VALUE VALUES (55, '2022-11-25 09:35:32', '112');


--
-- Data for Name: sibling; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.sibling VALUES (44, '3523154248');
INSERT INTO public.sibling VALUES (44, '7177249444');
INSERT INTO public.sibling VALUES (32, '8878687736');
INSERT INTO public.sibling VALUES (32, '0783697532');
INSERT INTO public.sibling VALUES (21, '2542234192');
INSERT INTO public.sibling VALUES (21, '4229209421');
INSERT INTO public.sibling VALUES (2, '8386756740');
INSERT INTO public.sibling VALUES (2, '6453816873');
INSERT INTO public.sibling VALUES (15, '8187989681');
INSERT INTO public.sibling VALUES (15, '6424461564');
INSERT INTO public.sibling VALUES (13, '4778945298');
INSERT INTO public.sibling VALUES (13, '0043280673');
INSERT INTO public.sibling VALUES (34, '1827422163');
INSERT INTO public.sibling VALUES (63, '1356413322');
INSERT INTO public.sibling VALUES (35, '2022184569');
INSERT INTO public.sibling VALUES (48, '0127840361');
INSERT INTO public.sibling VALUES (74, '3987736912');
INSERT INTO public.sibling VALUES (61, '5415916079');
INSERT INTO public.sibling VALUES (42, '5450672437');
INSERT INTO public.sibling VALUES (80, '1050263687');
INSERT INTO public.sibling VALUES (47, '4135211121');
INSERT INTO public.sibling VALUES (12, '7422977975');
INSERT INTO public.sibling VALUES (16, '0545297505');
INSERT INTO public.sibling VALUES (33, '5116382890');


--
-- Data for Name: skill_level; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.skill_level OVERRIDING SYSTEM VALUE VALUES (1, 'beginner');
INSERT INTO public.skill_level OVERRIDING SYSTEM VALUE VALUES (2, 'intermediate');
INSERT INTO public.skill_level OVERRIDING SYSTEM VALUE VALUES (3, 'advanced');


--
-- Data for Name: student; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (1, 'Malachi Long', '7817915388', '(0114) 116 4274', '974-330 Elit Rd.', 'molestie.sodales@google.net');
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (2, 'Madonna Montgomery', '0471178838', '0845 46 47', '395-6708 Nibh Road', 'et@icloud.com');
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (3, 'Zelda England', '9677126340', '07532 821293', '302-4259 Feugiat Av.', 'ante.nunc@protonmail.ca');
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (4, 'Ciaran Osborn', '2654928339', '(0118) 413 3418', '565-1420 Integer St.', 'id.erat.etiam@protonmail.edu');
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (5, 'Yardley Briggs', '1268476096', '(01073) 783887', 'P.O. Box 962, 5019 Nullam St.', 'eget@outlook.edu');
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (6, 'Alice Shelton', '7321224434', '0848 777 7160', '7267 Dictum Street', 'eu.odio.tristique@hotmail.couk');
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (7, 'Nasim Perkins', '1329383016', '0800 268 9445', '429-5217 Est Av.', 'at@google.couk');
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (8, 'Zephr Tran', '1081783423', '0845 46 47', '742-1714 Eget, Av.', 'eget@yahoo.net');
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (9, 'Kyra Noble', '2327872676', '(0117) 138 7677', 'P.O. Box 254, 3018 Lectus Ave', 'libero.donec@hotmail.net');
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (10, 'Carson Bird', '3691586720', '0816 468 3612', 'Ap #428-6314 Mus. Avenue', 'cursus.integer.mollis@google.com
');
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (11, 'Ira Pitts', '3434813042', '0800 667972', 'Ap #781-9837 Sem Road', 'dictum.eleifend.nunc@aol.ca');
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (12, 'Jesse Rivas', '2150661749', '0913 102 7297', 'Ap #442-6372 Integer Ave', 'urna@outlook.edu');
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (13, 'April Mays', '7391360083', '0836 265 3796', '650-6992 Eu, St.', 'phasellus.in@hotmail.ca');
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (14, 'Macey Valentine', '7841281676', '(0131) 631 6532', '243-647 Molestie St.', 'sollicitudin.orci@icloud.com')
;
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (15, 'Urielle Newman', '7847631312', '(014686) 44700', 'P.O. Box 783, 5345 Metus St.', 'arcu.eu@google.org');
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (16, 'Philip Joseph', '1563563932', '(016977) 3601', 'Ap #528-7215 Lacus. Avenue', 'quam@outlook.com');
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (17, 'Ursula Meadows', '8326617119', '(01145) 625253', '5160 Massa Road', 'mi@yahoo.net');
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (18, 'Silas Schroeder', '3468936574', '(01914) 77564', '895-4917 Nec, St.', 'aliquam@protonmail.edu');
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (19, 'Aurelia Singleton', '6888471503', '0909 112 3025', '690-6433 Lobortis Ave', 'aliquam@google.org');
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (20, 'Charles Lara', '3521416518', '0800 754 5902', '8641 Neque St.', 'metus.vivamus.euismod@protonmail.com');
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (21, 'Darryl Bradford', '8534569657', '0931 750 5167', '7367 Sociis St.', 'ultrices.a.auctor@protonmail.ca');
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (22, 'Wing Barton', '5523438737', '0313 364 7846', '214-9329 Vivamus Rd.', 'urna.suscipit@protonmail.org');
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (23, 'Kelly Wilder', '6156757686', '055 2784 6854', 'Ap #372-9724 Pede. St.', 'tellus@protonmail.com');
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (24, 'Brian Preston', '6657315417', '0975 383 7970', '963-7505 Vulputate, Rd.', 'per@protonmail.com');
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (25, 'Solomon Phelps', '7862433472', '(01745) 718645', '527-8021 Et Street', 'lobortis.quam@google.edu');
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (26, 'Zeus Houston', '1111881335', '0800 962855', 'Ap #119-3156 Quisque Avenue', 'nunc.risus@icloud.ca');
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (27, 'Michelle Hoover', '1311763541', '0500 512563', '3457 Scelerisque Street', 'luctus.ut.pellentesque@icloud.c
a');
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (28, 'Ainsley Dalton', '2726246615', '(025) 1968 8499', '2200 Sem, St.', 'vulputate.ullamcorper.magna@outlook.ed
u');
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (29, 'Lester Hendrix', '0736218464', '070 3113 5312', 'P.O. Box 944, 585 Luctus Avenue', 'nec@yahoo.org');
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (30, 'Cade Larsen', '3355386636', '0967 083 1430', 'Ap #166-8274 Lacus. Street', 'phasellus.fermentum.convallis@
google.org');
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (31, 'Noelani Valenzuela', '3503326018', '0834 148 8305', '6560 Nulla Street', 'lacinia@aol.couk');
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (32, 'Desirae Mckinney', '6546864881', '0800 700 8573', '229-2962 Lectus. Rd.', 'augue.eu@protonmail.net');
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (33, 'Travis Holder', '5132843262', '076 4533 0238', 'Ap #757-3735 Ut Avenue', 'a.scelerisque.sed@yahoo.couk');
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (34, 'Jada Sims', '4764823151', '(0181) 355 5441', '319-6204 Nibh Rd.', 'vitae.purus@yahoo.edu');
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (35, 'Fritz Castillo', '8229685447', '0500 447429', 'Ap #527-7852 Dis Avenue', 'cum.sociis@outlook.com');
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (36, 'Jasper Glover', '0384226483', '076 8137 0235', '513-5441 Elit, Rd.', 'sed.pede@hotmail.net');
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (37, 'Yasir Ochoa', '6523166243', '0500 704221', '725-6613 Dictum Ave', 'sit@icloud.couk');
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (38, 'Merritt Landry', '1460842970', '(021) 7534 7592', '529-4079 Varius Av.', 'semper.nam@protonmail.com');
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (39, 'Sharon Combs', '4074115346', '070 4115 7827', '6854 Purus, St.', 'ridiculus@google.org');
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (40, 'Hyatt Merritt', '2887166005', '0967 424 9268', '576-1546 Velit Road', 'bibendum.sed@outlook.ca');
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (41, 'Destiny Rodriguez', '7434603065', '0800 290641', 'Ap #728-5843 Eget Rd.', 'mauris@protonmail.edu');
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (42, 'MacKenzie Pace', '2595312953', '070 8938 9558', '174-4808 Mauris Av.', 'dignissim@protonmail.couk');
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (43, 'Basil Torres', '6645274972', '0845 46 42', 'Ap #585-6597 Sed, St.', 'mi.duis@outlook.edu');
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (44, 'Devin Neal', '6918576648', '(016977) 8468', 'Ap #756-8181 Neque St.', 'phasellus.dolor.elit@google.com');
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (45, 'Anastasia Wheeler', '0463651372', '056 5794 2259', '8073 Quis, St.', 'ligula.aenean@protonmail.net');
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (46, 'Reed Mason', '3336491556', '0845 46 42', 'Ap #540-3677 Varius Street', 'metus.vivamus@aol.ca');
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (47, 'Nash Witt', '3070218444', '(010246) 83541', '3107 Adipiscing St.', 'dui.cras@icloud.couk');
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (48, 'Emery Rodriquez', '5127637126', '(01832) 15355', '466-3445 Mattis St.', 'molestie.arcu@icloud.edu');
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (49, 'Jonas Mcguire', '4334457763', '0312 576 2083', 'Ap #371-5875 Ut Rd.', 'et.magna@yahoo.edu');
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (50, 'Stacey Allison', '8772238557', '07398 296037', 'Ap #194-3273 Hendrerit Ave', 'lacinia.at@hotmail.net');
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (51, 'Hoyt Hayes', '9360107710', '056 7534 2136', '331-3653 Odio. St.', 'phasellus.at@google.couk');
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (52, 'Calista Francis', '9788871685', '(028) 0426 8832', 'Ap #251-8089 Quam Road', 'quisque.ac@google.ca');
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (53, 'Violet Lee', '7355630180', '0956 888 4608', '2165 Convallis Av.', 'pharetra.nibh@icloud.org');
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (54, 'Caleb Mullins', '0163687454', '(016977) 5535', 'Ap #270-6507 Nulla Avenue', 'mauris.ut.mi@outlook.com');
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (55, 'Reed Watkins', '8527331444', '0913 566 8977', 'Ap #445-3513 Condimentum. Rd.', 'ut.tincidunt@google.couk')
;
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (56, 'Cassidy Robertson', '9627874374', '07843 734142', '522-5732 Mauris. St.', 'cursus.et@icloud.edu');
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (57, 'Nevada Carr', '5966512643', '07624 695888', 'Ap #749-2697 Orci St.', 'maecenas.iaculis.aliquet@aol.net');
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (58, 'Gil Padilla', '3835760991', '(018808) 44051', 'Ap #636-436 Odio Road', 'porta@outlook.couk');
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (59, 'Gillian Wise', '2480471452', '0800 283283', 'P.O. Box 261, 1066 Ac Av.', 'nulla@hotmail.couk');
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (60, 'Sebastian Wooten', '4180258780', '0827 111 0854', 'Ap #340-6423 Sed St.', 'laoreet@yahoo.com');
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (61, 'Quail Dyer', '8327421783', '0800 1111', '142-3729 Augue Av.', 'nec.euismod.in@google.net');
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (62, 'Neil Chandler', '4126424475', '0845 46 47', 'Ap #891-7221 Dictum. Rd.', 'ut@yahoo.couk');
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (63, 'Simone Jennings', '3678224537', '076 6861 2013', 'P.O. Box 752, 6960 Cras St.', 'netus.et@google.org');
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (64, 'Regina Garza', '5650751817', '(0111) 616 7523', '275-4601 Sed Ave', 'ipsum@protonmail.com');
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (65, 'Colin Burch', '0803261163', '055 5128 0564', 'Ap #684-4029 Luctus Rd.', 'et.ipsum.cursus@google.ca');
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (66, 'Kieran Sexton', '7474868952', '076 8551 2276', '7855 Arcu. Ave', 'lectus.rutrum.urna@outlook.org');
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (67, 'Ramona Perry', '2462328291', '0815 361 4132', '873-9828 Consequat Street', 'vel.nisl@aol.ca');
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (68, 'Ingrid Dalton', '8994050571', '070 8828 6390', 'Ap #964-6018 Nibh Rd.', 'eleifend.vitae@aol.edu');
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (69, 'Sandra Stevenson', '4041717158', '07451 357250', 'Ap #959-8777 Lacinia Rd.', 'nascetur@hotmail.com');
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (70, 'Magee Payne', '3033482763', '(016977) 1795', '865-5805 Et Av.', 'dolor.dolor.tempus@aol.org');
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (71, 'Rachel Horne', '0168928332', '0500 643389', '8450 Nullam Rd.', 'duis.a@hotmail.com');
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (72, 'Hunter Herman', '8508781877', '0845 46 45', 'Ap #469-215 Eros Rd.', 'consectetuer@hotmail.edu');
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (73, 'Yoshio Floyd', '1742683883', '(015605) 65963', 'Ap #474-1552 Aliquet Rd.', 'pellentesque.eget.dictum@iclou
d.org');
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (74, 'Diana Griffin', '8332034326', '(012441) 74424', '8928 Tortor Av.', 'ac.urna.ut@yahoo.net');
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (75, 'Price Bright', '3631778841', '0800 860 7131', '852-145 Nulla Rd.', 'volutpat.nulla@aol.edu');
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (76, 'Nora Kidd', '2777075987', '0932 332 8790', 'Ap #781-1195 Lobortis Ave', 'sodales.at.velit@hotmail.org');
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (77, 'Ivor Randall', '0864428354', '076 3427 4614', '4425 Litora St.', 'felis.eget@icloud.couk');
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (78, 'Paula Nunez', '1381790552', '(016977) 8705', 'Ap #920-6439 Ut Rd.', 'etiam.bibendum@icloud.net');
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (79, 'Berk Merrill', '1734981407', '(01468) 17233', 'Ap #119-1478 Libero Road', 'nulla.dignissim.maecenas@hotmai
l.couk');
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (80, 'Lane Farrell', '8666369147', '0800 1111', 'Ap #109-7463 Lorem Road', 'commodo.ipsum.suspendisse@outlook.ca
');


--
-- Data for Name: student_music_lesson; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.student_music_lesson VALUES (1, 1);
INSERT INTO public.student_music_lesson VALUES (2, 1);
INSERT INTO public.student_music_lesson VALUES (3, 1);
INSERT INTO public.student_music_lesson VALUES (4, 1);
INSERT INTO public.student_music_lesson VALUES (9, 1);
INSERT INTO public.student_music_lesson VALUES (10, 1);
INSERT INTO public.student_music_lesson VALUES (11, 11);
INSERT INTO public.student_music_lesson VALUES (12, 11);
INSERT INTO public.student_music_lesson VALUES (13, 11);
INSERT INTO public.student_music_lesson VALUES (14, 11);
INSERT INTO public.student_music_lesson VALUES (15, 11);
INSERT INTO public.student_music_lesson VALUES (19, 11);
INSERT INTO public.student_music_lesson VALUES (20, 11);
INSERT INTO public.student_music_lesson VALUES (21, 51);
INSERT INTO public.student_music_lesson VALUES (22, 51);
INSERT INTO public.student_music_lesson VALUES (23, 51);
INSERT INTO public.student_music_lesson VALUES (24, 51);
INSERT INTO public.student_music_lesson VALUES (25, 51);
INSERT INTO public.student_music_lesson VALUES (26, 51);
INSERT INTO public.student_music_lesson VALUES (27, 51);
INSERT INTO public.student_music_lesson VALUES (28, 51);
INSERT INTO public.student_music_lesson VALUES (29, 51);
INSERT INTO public.student_music_lesson VALUES (30, 51);
INSERT INTO public.student_music_lesson VALUES (31, 53);
INSERT INTO public.student_music_lesson VALUES (32, 53);
INSERT INTO public.student_music_lesson VALUES (33, 53);
INSERT INTO public.student_music_lesson VALUES (34, 53);
INSERT INTO public.student_music_lesson VALUES (35, 53);
INSERT INTO public.student_music_lesson VALUES (36, 53);
INSERT INTO public.student_music_lesson VALUES (37, 53);
INSERT INTO public.student_music_lesson VALUES (38, 53);
INSERT INTO public.student_music_lesson VALUES (40, 53);
INSERT INTO public.student_music_lesson VALUES (41, 27);
INSERT INTO public.student_music_lesson VALUES (42, 27);
INSERT INTO public.student_music_lesson VALUES (43, 27);
INSERT INTO public.student_music_lesson VALUES (44, 27);
INSERT INTO public.student_music_lesson VALUES (45, 27);
INSERT INTO public.student_music_lesson VALUES (46, 27);
INSERT INTO public.student_music_lesson VALUES (49, 27);
INSERT INTO public.student_music_lesson VALUES (50, 27);
INSERT INTO public.student_music_lesson VALUES (51, 48);
INSERT INTO public.student_music_lesson VALUES (52, 48);
INSERT INTO public.student_music_lesson VALUES (53, 48);
INSERT INTO public.student_music_lesson VALUES (54, 48);
INSERT INTO public.student_music_lesson VALUES (55, 48);
INSERT INTO public.student_music_lesson VALUES (56, 48);
INSERT INTO public.student_music_lesson VALUES (57, 48);
INSERT INTO public.student_music_lesson VALUES (58, 48);
INSERT INTO public.student_music_lesson VALUES (59, 48);
INSERT INTO public.student_music_lesson VALUES (60, 48);
INSERT INTO public.student_music_lesson VALUES (61, 25);
INSERT INTO public.student_music_lesson VALUES (62, 25);
INSERT INTO public.student_music_lesson VALUES (63, 25);
INSERT INTO public.student_music_lesson VALUES (64, 25);
INSERT INTO public.student_music_lesson VALUES (65, 25);
INSERT INTO public.student_music_lesson VALUES (66, 25);
INSERT INTO public.student_music_lesson VALUES (67, 25);
INSERT INTO public.student_music_lesson VALUES (69, 25);
INSERT INTO public.student_music_lesson VALUES (70, 25);
INSERT INTO public.student_music_lesson VALUES (71, 44);
INSERT INTO public.student_music_lesson VALUES (72, 44);
INSERT INTO public.student_music_lesson VALUES (73, 44);
INSERT INTO public.student_music_lesson VALUES (79, 44);
INSERT INTO public.student_music_lesson VALUES (80, 44);
INSERT INTO public.student_music_lesson VALUES (1, 37);
INSERT INTO public.student_music_lesson VALUES (2, 37);
INSERT INTO public.student_music_lesson VALUES (3, 37);
INSERT INTO public.student_music_lesson VALUES (4, 37);
INSERT INTO public.student_music_lesson VALUES (5, 37);
INSERT INTO public.student_music_lesson VALUES (6, 37);
INSERT INTO public.student_music_lesson VALUES (7, 37);
INSERT INTO public.student_music_lesson VALUES (8, 37);
INSERT INTO public.student_music_lesson VALUES (9, 37);
INSERT INTO public.student_music_lesson VALUES (10, 37);
INSERT INTO public.student_music_lesson VALUES (11, 34);
INSERT INTO public.student_music_lesson VALUES (12, 34);
INSERT INTO public.student_music_lesson VALUES (13, 34);
INSERT INTO public.student_music_lesson VALUES (19, 34);
INSERT INTO public.student_music_lesson VALUES (20, 34);
INSERT INTO public.student_music_lesson VALUES (21, 9);
INSERT INTO public.student_music_lesson VALUES (22, 9);
INSERT INTO public.student_music_lesson VALUES (23, 9);
INSERT INTO public.student_music_lesson VALUES (24, 9);
INSERT INTO public.student_music_lesson VALUES (25, 9);
INSERT INTO public.student_music_lesson VALUES (26, 9);
INSERT INTO public.student_music_lesson VALUES (28, 9);
INSERT INTO public.student_music_lesson VALUES (29, 9);
INSERT INTO public.student_music_lesson VALUES (30, 9);
INSERT INTO public.student_music_lesson VALUES (31, 46);
INSERT INTO public.student_music_lesson VALUES (32, 46);
INSERT INTO public.student_music_lesson VALUES (33, 46);
INSERT INTO public.student_music_lesson VALUES (34, 46);
INSERT INTO public.student_music_lesson VALUES (35, 46);
INSERT INTO public.student_music_lesson VALUES (36, 46);
INSERT INTO public.student_music_lesson VALUES (39, 46);
INSERT INTO public.student_music_lesson VALUES (40, 46);


--
-- Name: contact_person_student_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.contact_person_student_id_seq', 80, true);


--
-- Name: discount_discount_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.discount_discount_id_seq', 24, true);


--
-- Name: instructor_instructor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.instructor_instructor_id_seq', 9, true);


--
-- Name: music_lesson_music_lesson_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.music_lesson_music_lesson_id_seq', 55, true);


--
-- Name: pricing_pricing_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pricing_pricing_id_seq', 9, true);


--
-- Name: rental_instrument_rental_instrument_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.rental_instrument_rental_instrument_id_seq', 50, true);


--
-- Name: rental_rental_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.rental_rental_id_seq', 99, true);


--
-- Name: schedule_schedule_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.schedule_schedule_id_seq', 55, true);


--
-- Name: skill_level_skill_level_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.skill_level_skill_level_id_seq', 3, true);


--
-- Name: student_student_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.student_student_id_seq', 80, true);


--
-- Name: application application_email_address_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.application
    ADD CONSTRAINT application_email_address_key UNIQUE (email_address);


--
-- Name: instructor instructor_email_address_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instructor
    ADD CONSTRAINT instructor_email_address_key UNIQUE (email_address);


--
-- Name: instructor instructor_person_number_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instructor
    ADD CONSTRAINT instructor_person_number_key UNIQUE (person_number);


--
-- Name: instructor instructor_phone_number_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instructor
    ADD CONSTRAINT instructor_phone_number_key UNIQUE (phone_number);


--
-- Name: application pk_application; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.application
    ADD CONSTRAINT pk_application PRIMARY KEY (student_id, skill_level_id);


--
-- Name: contact_person pk_contact_person; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contact_person
    ADD CONSTRAINT pk_contact_person PRIMARY KEY (student_id);


--
-- Name: instructor pk_instructor; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instructor
    ADD CONSTRAINT pk_instructor PRIMARY KEY (instructor_id);


--
-- Name: rental_instrument pk_instrument; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rental_instrument
    ADD CONSTRAINT pk_instrument PRIMARY KEY (rental_instrument_id);


--
-- Name: music_lesson pk_music_lesson; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.music_lesson
    ADD CONSTRAINT pk_music_lesson PRIMARY KEY (music_lesson_id);


--
-- Name: pricing pk_pricing; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pricing
    ADD CONSTRAINT pk_pricing PRIMARY KEY (pricing_id);


--
-- Name: rental pk_rental; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rental
    ADD CONSTRAINT pk_rental PRIMARY KEY (rental_id);


--
-- Name: schedule pk_schedule; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.schedule
    ADD CONSTRAINT pk_schedule PRIMARY KEY (schedule_id);


--
-- Name: skill_level pk_skill_level; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.skill_level
    ADD CONSTRAINT pk_skill_level PRIMARY KEY (skill_level_id);


--
-- Name: student pk_student; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student
    ADD CONSTRAINT pk_student PRIMARY KEY (student_id);


--
-- Name: student_music_lesson pk_student_music_lesson; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student_music_lesson
    ADD CONSTRAINT pk_student_music_lesson PRIMARY KEY (student_id, music_lesson_id);


--
-- Name: sibling sibling_person_number_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sibling
    ADD CONSTRAINT sibling_person_number_key UNIQUE (person_number);


--
-- Name: sibling sibling_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sibling
    ADD CONSTRAINT sibling_pkey PRIMARY KEY (student_id, person_number);


--
-- Name: student student_person_number_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student
    ADD CONSTRAINT student_person_number_key UNIQUE (person_number);


--
-- Name: application fk_application_0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.application
    ADD CONSTRAINT fk_application_0 FOREIGN KEY (student_id) REFERENCES public.student(student_id) ON DELETE CASCADE;


--
-- Name: application fk_application_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.application
    ADD CONSTRAINT fk_application_1 FOREIGN KEY (skill_level_id) REFERENCES public.skill_level(skill_level_id) ON DELETE CASCADE;


--
-- Name: contact_person fk_contact_person_0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contact_person
    ADD CONSTRAINT fk_contact_person_0 FOREIGN KEY (student_id) REFERENCES public.student(student_id) ON DELETE CASCADE;


--
-- Name: discount fk_discount_0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.discount
    ADD CONSTRAINT fk_discount_0 FOREIGN KEY (student_id) REFERENCES public.student(student_id);


--
-- Name: music_lesson fk_music_lesson_0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.music_lesson
    ADD CONSTRAINT fk_music_lesson_0 FOREIGN KEY (instructor_id) REFERENCES public.instructor(instructor_id);


--
-- Name: music_lesson fk_music_lesson_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.music_lesson
    ADD CONSTRAINT fk_music_lesson_1 FOREIGN KEY (schedule_id) REFERENCES public.schedule(schedule_id);


--
-- Name: music_lesson fk_music_lesson_2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.music_lesson
    ADD CONSTRAINT fk_music_lesson_2 FOREIGN KEY (skill_level_id) REFERENCES public.skill_level(skill_level_id);


--
-- Name: music_lesson fk_music_lesson_3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.music_lesson
    ADD CONSTRAINT fk_music_lesson_3 FOREIGN KEY (pricing_id) REFERENCES public.pricing(pricing_id);


--
-- Name: pricing fk_pricing_0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pricing
    ADD CONSTRAINT fk_pricing_0 FOREIGN KEY (skill_level_id) REFERENCES public.skill_level(skill_level_id);


--
-- Name: rental fk_rental_0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rental
    ADD CONSTRAINT fk_rental_0 FOREIGN KEY (student_id) REFERENCES public.student(student_id);


--
-- Name: rental fk_rental_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rental
    ADD CONSTRAINT fk_rental_1 FOREIGN KEY (rental_instrument_id) REFERENCES public.rental_instrument(rental_instrument_id);


--
-- Name: sibling fk_sibling_0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sibling
    ADD CONSTRAINT fk_sibling_0 FOREIGN KEY (student_id) REFERENCES public.student(student_id);


--
-- Name: student_music_lesson fk_student_music_lesson_0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student_music_lesson
    ADD CONSTRAINT fk_student_music_lesson_0 FOREIGN KEY (student_id) REFERENCES public.student(student_id) ON DELETE CASCADE;


--
-- Name: student_music_lesson fk_student_music_lesson_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student_music_lesson
    ADD CONSTRAINT fk_student_music_lesson_1 FOREIGN KEY (music_lesson_id) REFERENCES public.music_lesson(music_lesson_id) ON DELETE CASCADE;


--
-- PostgreSQL database dump com