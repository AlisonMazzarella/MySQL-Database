-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema university
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `university` ;

-- -----------------------------------------------------
-- Schema university
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `university` DEFAULT CHARACTER SET utf8 ;
USE `university` ;

-- -----------------------------------------------------
-- Table `university`.`student`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `university`.`student` ;

CREATE TABLE IF NOT EXISTS `university`.`student` (
  `student_id` INT NOT NULL,
  `lname` VARCHAR(25) NOT NULL,
  `fname` VARCHAR(25) NOT NULL,
  `gender` CHAR(1) NULL,
  `city` VARCHAR(25) NOT NULL,
  `state` CHAR(2) NOT NULL,
  `dob` DATE NULL,
  PRIMARY KEY (`student_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `university`.`college`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `university`.`college` ;

CREATE TABLE IF NOT EXISTS `university`.`college` (
  `college_id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`college_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `university`.`department`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `university`.`department` ;

CREATE TABLE IF NOT EXISTS `university`.`department` (
  `department_code` VARCHAR(5) NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `college_id` INT NOT NULL,
  PRIMARY KEY (`department_code`),
  INDEX `fk_department_college1_idx` (`college_id` ASC) VISIBLE,
  CONSTRAINT `fk_department_college1`
    FOREIGN KEY (`college_id`)
    REFERENCES `university`.`college` (`college_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `university`.`course`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `university`.`course` ;

CREATE TABLE IF NOT EXISTS `university`.`course` (
  `course_id` INT NOT NULL,
  `course_num` INT NOT NULL,
  `name` VARCHAR(30) NOT NULL,
  `credit` INT NOT NULL,
  `department_code` VARCHAR(5) NOT NULL,
  PRIMARY KEY (`course_id`),
  INDEX `fk_course_department1_idx` (`department_code` ASC) VISIBLE,
  CONSTRAINT `fk_course_department1`
    FOREIGN KEY (`department_code`)
    REFERENCES `university`.`department` (`department_code`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `university`.`section`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `university`.`section` ;

CREATE TABLE IF NOT EXISTS `university`.`section` (
  `section_id` INT NOT NULL,
  `section_num` INT NOT NULL,
  `capacity` INT NOT NULL,
  `course_id` INT NOT NULL,
  PRIMARY KEY (`section_id`),
  INDEX `fk_section_course1_idx` (`course_id` ASC) VISIBLE,
  CONSTRAINT `fk_section_course1`
    FOREIGN KEY (`course_id`)
    REFERENCES `university`.`course` (`course_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `university`.`enrollment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `university`.`enrollment` ;

CREATE TABLE IF NOT EXISTS `university`.`enrollment` (
  `student_id` INT NOT NULL,
  `section_id` INT NOT NULL,
  PRIMARY KEY (`student_id`, `section_id`),
  INDEX `fk_enrollment_section1_idx` (`section_id` ASC) VISIBLE,
  CONSTRAINT `fk_enrollment_student`
    FOREIGN KEY (`student_id`)
    REFERENCES `university`.`student` (`student_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_enrollment_section1`
    FOREIGN KEY (`section_id`)
    REFERENCES `university`.`section` (`section_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `university`.`term`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `university`.`term` ;

CREATE TABLE IF NOT EXISTS `university`.`term` (
  `term_id` INT NOT NULL,
  `term` VARCHAR(15) NOT NULL,
  `year` YEAR(4) NOT NULL,
  `section_id` INT NOT NULL,
  PRIMARY KEY (`term_id`),
  INDEX `fk_term_section1_idx` (`section_id` ASC) VISIBLE,
  CONSTRAINT `fk_term_section1`
    FOREIGN KEY (`section_id`)
    REFERENCES `university`.`section` (`section_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `university`.`faculty`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `university`.`faculty` ;

CREATE TABLE IF NOT EXISTS `university`.`faculty` (
  `faculty_id` INT NOT NULL,
  `lname` VARCHAR(25) NOT NULL,
  `fname` VARCHAR(25) NOT NULL,
  `section_id` INT NOT NULL,
  PRIMARY KEY (`faculty_id`),
  INDEX `fk_faculty_section1_idx` (`section_id` ASC) VISIBLE,
  CONSTRAINT `fk_faculty_section1`
    FOREIGN KEY (`section_id`)
    REFERENCES `university`.`section` (`section_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

INSERT INTO college (college_id, name) VALUES (1, 'College of Physical Science and Engineering'), (2, 'College of Business and Communication'), (3, 'College of Language and Letters');
INSERT INTO department (department_code, name, college_id) VALUES ('CIT', 'Computer Information Technology', 1), ('ECON', 'Economics', 2), ('HUM', 'Humanities and Philosophy', 3);
INSERT INTO course (course_id, course_num, name, credit, department_code) VALUES (4, 111, 'Intro to Databases', 3, 'CIT'), (5, 388, 'Econometrics', 4, 'ECON'), (6, 150, 'Micro Economics', 3, 'ECON'), (7, 376, 'Classical Heritage', 2, 'HUM');
INSERT INTO section (section_id, section_num, capacity, course_id) VALUES (18, 1, 30, 4), (19, 1, 50, 6), (20, 2, 50, 6), (21, 1, 35, 5), (22, 1, 30, 7), (23, 2, 30, 4), (24, 3, 35, 4), (25, 1, 50, 6), (26, 2, 50, 6), (27, 1, 30, 7);
INSERT INTO faculty (faculty_id, lname, fname, section_id) VALUES (8, 'Morring', 'Marty', 18), (9, 'Norris', 'Nate', 19), (10, 'Norris', 'Nate', 20), (11, 'Barrus', 'Ben', 21), (12, 'Jensen', 'John', 22), (13, 'Morring', 'Marty', 23), (14, 'Barney', 'Bill', 24), (15, 'Nathan', 'Nate', 25), (16, 'Nathan', 'Nate', 26), (17, 'Jensen', 'John', 27);
INSERT INTO term (term_id, term, year, section_id) VALUES (28, 'Fall', 2019, 18), (29, 'Fall', 2019, 19), (30, 'Fall', 2019, 20), (31, 'Fall', 2019, 21), (32, 'Fall', 2019, 22), (33, 'Fall', 2019, 23), (34, 'Fall', 2019, 24), (35, 'Fall', 2019, 25), (36, 'Fall', 2019, 26), (37, 'Fall', 2019, 27);
INSERT INTO student (student_id, lname, fname, gender, city, state, dob) VALUES (38, 'Miller', 'Paul', 'M', 'Dallas', 'TX', '1996-02-22'), (39, 'Smith', 'Katie', 'F', 'Provo', 'UT', '1995-07-22'), (40, 'Jones', 'Kelly', 'F', 'Provo', 'UT', '1998-06-22'), (41, 'Merrill', 'Devon', 'M', 'Mesa', 'AZ', '2000-07-22'), (42, 'Murdock', 'Mandy', 'F', 'Topeka', 'KS', '1996-11-22'), (43, 'Adams', 'Alece', 'F', 'Rigby', 'ID', '1997-05-22'), (44, 'Carlson', 'Bryce', 'M', 'Bozeman', 'MT', '1997-11-22'), (45, 'Larsen', 'Preston', 'M', 'Decatur', 'TN', '1996-09-22'), (46, 'Madsen', 'Julia', 'F', 'Rexburg', 'ID', '1998-09-22'), (47, 'Sorensen', 'Susan', 'F', 'Mesa', 'AZ', '1998-08-09');
INSERT INTO enrollment (student_id, section_id) VALUES (38, 18), (38, 20), (39, 22), (40, 22), (41, 23), (42, 22), (42, 23), (43, 25), (44, 24), (44, 25), (44, 27), (45, 26), (46, 26), (47, 24);

/* 1. SELECT fname, lname, DATE_FORMAT(dob, "%M %e, %Y") AS "Sept Birthdays" 
FROM student
WHERE MONTH(dob) = 09 
ORDER BY lname DESC;
*/

/* 2. SELECT lname, fname, FLOOR(DATEDIFF("2017-01-05", dob)/365) AS Years,DATEDIFF("2017-01-05", dob)%365 AS Days,CONCAT(FLOOR(DATEDIFF("2017-01-05", dob)/365)," - Yrs, ",DATEDIFF("2017-01-05", dob)%365," - Days") AS "Years and Days"
FROM student 
ORDER BY dob;
*/

/* 3. SELECT student.fname, student.lname
FROM student
	JOIN enrollment
		ON student.student_id = enrollment.student_id
	JOIN section
		ON enrollment.section_id = section.section_id
	JOIN faculty
		ON section.faculty_id = faculty.faculty_id
WHERE faculty.fname = 'John' AND faculty.lname = 'Jensen'
ORDER BY student.lname;
*/

/* 4. SELECT faculty.fname, faculty.lname
FROM student
	JOIN enrollment
		ON student.student_id = enrollment.student_id
	JOIN section
		ON enrollment.section_id = section.section_id
	JOIN faculty
		ON section.faculty_id = faculty.faculty_id
WHERE student.fname = 'Bryce' AND student.lname = 'Carlson'
ORDER BY faculty.lname;
*/

/* 5. SELECT fname, lname
FROM student
	JOIN enrollment
		ON student.student_id = enrollment.student_id
	JOIN section
		ON enrollment.section_id = section.section_id
	JOIN course
		ON section.course_id = course.course_id
WHERE section.course_id = 2 AND section.term_id = 2
ORDER BY student.lname;
*/

/* 6. SELECT department_code, course_num, course.name
FROM student
	JOIN enrollment
		ON student.student_id = enrollment.student_id
	JOIN section
		ON enrollment.section_id = section.section_id
	JOIN course
		ON section.course_id = course.course_id
WHERE student.fname = ‘Bryce’ AND student.lname = 'Carlson' AND term = 'Winter' AND year = 2018 
ORDER BY course_name;
*/

/* 7. SELECT term, term.year, COUNT(student.student_id) AS 'Enrollment'
FROM student
	JOIN enrollment
		ON student.student_id = enrollment.student_id
	JOIN section
		ON enrollment.section_id = section.section_id
	JOIN term
		ON section.term_id = term.term_id
WHERE term = 'Fall' AND term.year = 2019;
*/

/* 8. SELECT college.name AS 'Colleges', COUNT(course_id) AS 'Courses'
FROM college
	JOIN department
		ON college.college_id = department.college_id
	JOIN course
		ON department.department_code = course.department_code
GROUP BY college.name
ORDER BY college.name;
*/

/* 9. SELECT faculty.fname, faculty.lname, SUM(capacity) AS 'TeachingCapacity'
FROM faculty
	JOIN section
		ON faculty.faculty_id = section.faculty_id
WHERE term_id = 1
GROUP BY faculty.fname
ORDER by 'TeachingCapacity';
*/

/* 10. SELECT student.lname, student.fname, SUM(course.credit) AS 'Credits'
FROM student
	JOIN enrollment
		ON student.student_id = enrollment.student_id
	JOIN section
		ON enrollment.section_id = section.section_id
	JOIN course
		ON course.course_id = section.course_id
	JOIN term
		ON term.term_id = section.term_id
WHERE term = 'Fall'
GROUP BY student.student_id
Having SUM(course.credit) > 3
ORDER by ‘Credits’ DESC;
*/
