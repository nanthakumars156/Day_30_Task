CREATE TABLE `studentinfo` (
  `student_id` integer PRIMARY KEY,
  `student_name` varchar(255),
  `mobile_number` integer,
  `email` varchar(255),
  `mentor_id` varchar(255),
  `batch_id` integer,
  `batch_name` varchar(255)
);

CREATE TABLE `mentorinfo` (
  `mentor_id` integer PRIMARY KEY,
  `mentor_name` varchar(255),
  `email` varchar(255),
  `mobile_number` integer,
  `batch_id` integer
);

CREATE TABLE `taskinfo` (
  `task_id` integer PRIMARY KEY,
  `student_id` integer,
  `submited_at` timestamp
);

CREATE TABLE `batchinfo` (
  `batch_id` integer PRIMARY KEY,
  `batch_name` varchar(255),
  `student_id` integer,
  `mentor_id` integer
);

CREATE TABLE `mockinterviewinfo` (
  `mockinterview_id` integer PRIMARY KEY,
  `mockinterview_name` varchar(255),
  `student_id` integer
);

CREATE TABLE `dashboardinfo` (
  `dashboard_id` integer PRIMARY KEY,
  `student_id` integer,
  `mentor_id` integer
);

CREATE TABLE `sessioninfo` (
  `session_id` integer PRIMARY KEY,
  `session_name` varchar(255),
  `title_id` integer
);

CREATE TABLE `leaveinfo` (
  `leave_id` integer PRIMARY KEY,
  `reason` text,
  `student_id` integer,
  `mentor_id` integer,
  `batch_id` integer
);

CREATE TABLE `queryinfo` (
  `query_id` integer PRIMARY KEY,
  `query_details` text,
  `student_id` integer,
  `mentor_id` integer,
  `batch_id` integer
);

CREATE TABLE `syllabus` (
  `title_id` integer PRIMARY KEY,
  `title_name` varchar(255),
  `task_name` varchar(255),
  `task_id` integer
);

ALTER TABLE `studentinfo` ADD FOREIGN KEY (`student_id`) REFERENCES `batchinfo` (`student_id`);

ALTER TABLE `studentinfo` ADD FOREIGN KEY (`student_id`) REFERENCES `taskinfo` (`student_id`);

ALTER TABLE `studentinfo` ADD FOREIGN KEY (`student_id`) REFERENCES `dashboardinfo` (`student_id`);

ALTER TABLE `studentinfo` ADD FOREIGN KEY (`student_id`) REFERENCES `queryinfo` (`student_id`);

ALTER TABLE `studentinfo` ADD FOREIGN KEY (`student_id`) REFERENCES `mockinterviewinfo` (`student_id`);

ALTER TABLE `studentinfo` ADD FOREIGN KEY (`student_id`) REFERENCES `leaveinfo` (`student_id`);

ALTER TABLE `mentorinfo` ADD FOREIGN KEY (`mentor_id`) REFERENCES `batchinfo` (`mentor_id`);

ALTER TABLE `mentorinfo` ADD FOREIGN KEY (`mentor_id`) REFERENCES `studentinfo` (`mentor_id`);

ALTER TABLE `mentorinfo` ADD FOREIGN KEY (`mentor_id`) REFERENCES `dashboardinfo` (`mentor_id`);

ALTER TABLE `mentorinfo` ADD FOREIGN KEY (`mentor_id`) REFERENCES `queryinfo` (`mentor_id`);

ALTER TABLE `mentorinfo` ADD FOREIGN KEY (`mentor_id`) REFERENCES `leaveinfo` (`mentor_id`);

ALTER TABLE `batchinfo` ADD FOREIGN KEY (`batch_id`) REFERENCES `studentinfo` (`batch_id`);

ALTER TABLE `batchinfo` ADD FOREIGN KEY (`batch_id`) REFERENCES `mentorinfo` (`batch_id`);

ALTER TABLE `batchinfo` ADD FOREIGN KEY (`batch_id`) REFERENCES `queryinfo` (`batch_id`);

ALTER TABLE `batchinfo` ADD FOREIGN KEY (`batch_id`) REFERENCES `leaveinfo` (`batch_id`);

ALTER TABLE `syllabus` ADD FOREIGN KEY (`title_id`) REFERENCES `sessioninfo` (`title_id`);

ALTER TABLE `syllabus` ADD FOREIGN KEY (`task_id`) REFERENCES `taskinfo` (`task_id`);
