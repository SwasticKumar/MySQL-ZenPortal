CREATE TABLE `Students` (
  `student_id` int PRIMARY KEY,
  `first_name` varchar(50),
  `last_name` varchar(50),
  `email` varchar(100),
  `phone_number` varchar(15),
  `date_of_birth` date,
  `address` varchar(255),
  `guardian_name` varchar(100),
  `guardian_contact` varchar(15)
);

CREATE TABLE `Instructors` (
  `instructor_id` int PRIMARY KEY,
  `first_name` varchar(50),
  `last_name` varchar(50),
  `email` varchar(100),
  `phone_number` varchar(15)
);

CREATE TABLE `Courses` (
  `course_id` int PRIMARY KEY,
  `course_name` varchar(100),
  `description` text,
  `start_date` date,
  `end_date` date,
  `instructor_id` int
);

CREATE TABLE `Enrollments` (
  `enrollment_id` int PRIMARY KEY,
  `student_id` int,
  `course_id` int,
  `enrollment_date` date
);

CREATE TABLE `ClassSchedule` (
  `schedule_id` int PRIMARY KEY,
  `course_id` int,
  `day_of_week` varchar(15),
  `start_time` time,
  `end_time` time,
  `room_location` varchar(100)
);

CREATE TABLE `Payments` (
  `payment_id` int PRIMARY KEY,
  `student_id` int,
  `course_id` int,
  `payment_date` date,
  `amount` decimal(10, 2),
  `payment_method` varchar(50)
);

ALTER TABLE `Courses` ADD FOREIGN KEY (`instructor_id`) REFERENCES `Instructors` (`instructor_id`);

ALTER TABLE `Enrollments` ADD FOREIGN KEY (`student_id`) REFERENCES `Students` (`student_id`);

ALTER TABLE `Enrollments` ADD FOREIGN KEY (`course_id`) REFERENCES `Courses` (`course_id`);

ALTER TABLE `ClassSchedule` ADD FOREIGN KEY (`course_id`) REFERENCES `Courses` (`course_id`);

ALTER TABLE `Payments` ADD FOREIGN KEY (`student_id`) REFERENCES `Students` (`student_id`);

ALTER TABLE `Payments` ADD FOREIGN KEY (`course_id`) REFERENCES `Courses` (`course_id`);


