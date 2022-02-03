DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

USE SpotifyClone;

CREATE TABLE SpotifyClone.plan(
	`plan_id` INT(11) PRIMARY KEY AUTO_INCREMENT,
    `plan_type` VARCHAR(50),
    `plan_value` DECIMAL(3,2) NOT NULL DEFAULT '0'
) ENGINE=INNODB;

INSERT INTO `plan` ( plan_type, plan_value)
VALUES
("gratuito", default),
("universitário", 5.99),
("pessoal", 6.99),
("familiar", 7.99);

CREATE TABLE SpotifyClone.user(
	`user_id` INT(11) PRIMARY KEY AUTO_INCREMENT,
    `user_name` VARCHAR(50) NOT NULL,
    `age` INT(11),
    `signature_date` DATE,
	`plan_id` INT(11),
    FOREIGN KEY (`plan_id`) 
		REFERENCES `SpotifyClone`.`plan` (`plan_id`) 
        ON DELETE NO ACTION
) ENGINE=INNODB;

INSERT INTO `user` ( user_name, age, signature_date, plan_id)
VALUES 
("Thati", 23, '2019-10-20', 1),
("Cintia", 35, '2017-12-30', 4),
("Bill", 20, '2019-06-05', 2),
("Roger", 45, '2020-05-13', 3),
("Norman", 58, '2017-02-17', 3),
("Patrick", 33, '2017-01-06', 4),
("Vivian", 26, '2018-01-05', 2),
("Carol", 19, '2018-02-14', 2),
("Angelina", 42, '2018-04-29', 4),
("Paul", 46,'2017-01-17', 4);

CREATE TABLE SpotifyClone.artist(
	`artist_id` INT(11) PRIMARY KEY AUTO_INCREMENT,
    `artist_name` VARCHAR(50)
) ENGINE=INNODB;

INSERT INTO `artist` ( artist_name)
VALUES
('Walter Phoenix'),
('Peter Strong'),
('Lance Day'),
('Freedie Shannon'),
('Tyler Isle'),
('Fog');

CREATE TABLE SpotifyClone.album(
	`album_id` INT(11) PRIMARY KEY AUTO_INCREMENT,
  `album_name` VARCHAR(50) NOT NULL,
  `release_year` INT(10) NOT NULL,
  `artist_id` INT(11) NOT NULL,
  FOREIGN KEY (`artist_id`)
    REFERENCES `SpotifyClone`.`artist` (`artist_id`)
) ENGINE=INNODB;

INSERT INTO `album` ( album_name, release_year, artist_id)
VALUES
('Envious', 1990, 1),
('Exuberant', 1993, 1),
('Hallowed Steam', 1995, 2),
('Incandescent', 1998, 3),
('Temporary Culture', 2001, 4),
('Library of liberty', 2003, 4),
('Chained Down', 2007, 5),
('Cabinet of fools', 2012, 5),
('No guarantees', 2015, 5),
('Apparatus', 2015, 6);

CREATE TABLE SpotifyClone.songs(
  `song_id` INT(11) PRIMARY KEY AUTO_INCREMENT,
  `song_name` VARCHAR(50) NOT NULL,
  `duration_seconds` INT(11) NOT NULL,
  `artist_id` INT(11) NOT NULL,
  `album_id` INT(11) NOT NULL,
  FOREIGN KEY (`artist_id`)
    REFERENCES `SpotifyClone`.`artist` (`artist_id`),
  FOREIGN KEY (`album_id`)
    REFERENCES `SpotifyClone`.`album` (`album_id`)
) ENGINE=INNODB;

INSERT INTO `songs` ( song_name, duration_seconds, artist_id, album_id)
VALUES
("Soul For Us", 200, 1, 1),
("Reflections Of Magic", 163, 1, 1),
("Dance With Her Own", 116, 1, 1),
("Troubles Of My Inner Fire", 203, 1, 2),
("Time Fireworks", 152, 1, 2),
("Magic Circus", 105, 2, 3),
("Honey, So Do I", 207, 2, 3),
("Sweetie, Let's Go Wild", 139, 2, 3),
("She Knows", 244, 2, 3),
("Fantasy For Me", 100, 3, 4),
("Celebration Of More", 146, 3, 4),
("Rock His Everything", 223, 3, 4),
("Home Forever", 231, 3, 4),
("Diamond Power", 241, 3, 4),
("Let's Be Silly", 132, 3, 4),
("Thang Of Thunder", 240, 4, 5),
("Words Of Her Life", 185, 4, 5),
("Without My Streets", 176, 4, 5),
("Need Of The Evening", 190, 4, 6),
("History Of My Roses", 222, 4, 6),
("Without My Love", 111, 4, 6),
("Walking And Game", 123, 4, 6),
("Young And Father", 197, 4, 6),
("Finding My Traditions", 179, 5, 7),
("Walking And Man", 229, 5, 7),
("Hard And Time", 135, 5, 7),
("Honey, I'm A Lone Wolf", 150, 5, 7),
("She Thinks I Won't Stay Tonight", 166, 5, 8),
("He Heard You're Bad For Me", 154, 5, 8),
("He Hopes We Can't Stay", 210, 5, 8),
("I Know I Know", 117, 5, 8),
("He's Walking Away", 159, 5, 9),
("He's Trouble", 138, 5, 9),
("I Heard I Want To Bo Alone", 120, 5, 9),
("I Ride Alone", 151, 5, 9),
("Honey", 79, 6, 10),
("You Cheated On Me", 95, 6, 10),
("Wouldn't It Be Nice", 213, 6, 10),
("Baby", 136, 6, 10),
("You Make Me Feel So..", 83, 6, 10);

CREATE TABLE SpotifyClone.reproductions(
  `user_id` INT(11) NOT NULL,
  `reproduction_history` VARCHAR(50) NOT NULL,
  `reproduction_date` VARCHAR(50) NOT NULL,
  `song_id` INT(11) NOT NULL,
  PRIMARY KEY (user_id, song_id),
  FOREIGN KEY (`user_id`)
    REFERENCES `SpotifyClone`.`user` (`user_id`),
  FOREIGN KEY (`song_id`)
    REFERENCES `SpotifyClone`.`songs` (`song_id`)
) ENGINE=INNODB;

INSERT INTO `reproductions`(user_id, reproduction_history, reproduction_date, song_id)
VALUES
(1, "Honey", "2020-02-28 10:45:55", 36),
(1, "Walking And Man", "2020-05-02 05:30:35", 25),
(1, "Young And Father", "2020-03-06 11:22:33", 23),
(1, "Diamond Power", "2020-08-05 08:05:17", 14),
(1, "Let's Be Silly", "2020-09-14 16:32:22", 15),
(2, "I Heard I Want To Bo Alone", "2020-01-02 07:40:33", 34),
(2, "Finding My Traditions", "2020-05-16 06:16:22", 24),
(2, "Without My Love", "2020-10-09 12:27:48", 21),
(2, "Baby", "2020-09-21 13:14:46", 39),
(3, "Magic Circus", "2020-11-13 16:55:13", 6),
(3, "Dance With Her Own", "2020-12-05 18:38:30", 3),
(3, "Hard And Time", "2020-07-30 10:00:00", 26),
(4, "Reflections Of Magic", "2021-08-15 17:10:10", 2),
(4, "I Ride Alone", "2021-07-10 15:20:30", 35),
(4, "Honey, I'm A Lone Wolf", "2021-01-09 01:44:33", 27),
(5, "Honey, So Do I", "2020-07-03 19:33:28", 7),
(5, "Rock His Everything", "2017-02-24 21:14:22", 12),
(5, "Diamond Power", "2020-08-06 15:23:43", 14),
(5, "Soul For Us", "2020-11-10 13:52:27", 1),
(6, "Wouldn't It Be Nice", "2019-02-07 20:33:48", 38),
(6, "He Heard You're Bad For Me", "2017-01-24 00:31:17", 29),
(6, "He Hopes We Can't Stay", "2017-10-12 12:35:20", 30),
(6, "Walking And Game", "2018-05-29 14:56:41", 22),
(7, "Time Fireworks", "2018-05-09 22:30:49", 5),
(7, "Troubles Of My Inner Fire", "2020-07-27 12:52:58", 4),
(7, "Celebration Of More", "2018-01-16 18:40:43", 11),
(8, "Baby", "2018-03-21 16:56:40", 39),
(8, "You Make Me Feel So..", "2020-10-18 13:38:05", 40),
(8, "He's Walking Away", "2019-05-25 08:14:03", 32),
(8, "He's Trouble", "2021-08-15 21:37:09", 33),
(9, "Thang Of Thunder", "2021-05-24 17:23:45", 16),
(9, "Words Of Her Life", "2018-12-07 22:48:52", 17),
(9, "Sweetie, Let's Go Wild", "2021-03-14 06:14:26", 8),
(9, "She Knows", "2020-04-01 03:36:00", 9),
(10, "History Of My Roses", "2017-02-06 08:21:34", 20),
(10, "Without My Love", "2017-12-04 05:33:43", 21),
(10, "Rock His Everything", "2017-07-27 05:24:49", 12),
(10, "Home Forever", "2017-12-25 01:03:57", 13);

CREATE TABLE SpotifyClone.following_artist(
  `user_id` INT(11) NOT NULL,
  `artist_followed` VARCHAR(50),
  `artist_id` INT(11) NOT NULL,
  PRIMARY KEY (user_id, artist_id),
  FOREIGN KEY (`user_id`)
    REFERENCES `SpotifyClone`.`user` (`user_id`),
  FOREIGN KEY (`artist_id`)
    REFERENCES `SpotifyClone`.`artist` (`artist_id`) 
) ENGINE=INNODB;

INSERT INTO `following_artist`(user_id, artist_followed, artist_id)
VALUES
(1, 'Walter Phoenix', 1),
(1, 'Freedie Shannon', 4),
(1, 'Lance Day', 3),
(2, 'Walter Phoenix', 1),
(2, 'Lance Day', 3),
(3, 'Peter Strong', 2),
(3, 'Walter Phoenix', 1),
(4, 'Freedie Shannon', 4),
(5, 'Tyler Isle', 5),
(5, 'Fog', 6),
(6, 'Fog', 6),
(6, 'Lance Day', 3),
(6, 'Walter Phoenix', 1),
(7, 'Peter Strong', 2),
(7, 'Tyler Isle', 5),
(8, 'Walter Phoenix', 1),
(8, 'Tyler Isle', 5),
(9, 'Fog', 6),
(9, 'Freedie Shannon', 4),
(9, 'Lance Day', 3),
(10, 'Peter Strong', 2),
(10, 'Fog', 6);
