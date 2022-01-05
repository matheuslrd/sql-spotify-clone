DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;
USE SpotifyClone;

DROP TABLE IF EXISTS `SpotifyClone`.`plans` ;

CREATE TABLE IF NOT EXISTS `SpotifyClone`.`plans` (
    `id_plan` INT NOT NULL AUTO_INCREMENT,
    `plan_name` VARCHAR(50) NOT NULL DEFAULT 'no name',
    `price` DECIMAL(10 , 2 ) NOT NULL DEFAULT 0,
    PRIMARY KEY(`id_plan`)
)  ENGINE=INNODB;

INSERT INTO plans (plan_name, price)
VALUES
	('gratuito', 0),
	('pessoal', 6.99),
	('universitÃ¡rio', 5.99),
	('familiar', 7.99);


DROP TABLE IF EXISTS `SpotifyClone`.`users`;
CREATE TABLE IF NOT EXISTS `SpotifyClone`.`users` (
  `id_user` INT NOT NULL AUTO_INCREMENT,
  `user_name` VARCHAR(50) NOT NULL DEFAULT 'nameless',
  `user_age` DECIMAL(5) NOT NULL DEFAULT 0,
  `plan_id` INT NOT NULL DEFAULT 1,
  `date` DATE NOT NULL,
  PRIMARY KEY (`id_user`),
  CONSTRAINT `USER_PLAN_FK`
    FOREIGN KEY (`plan_id`)
    REFERENCES `SpotifyClone`.`plans` (`id_plan`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)ENGINE = InnoDB DEFAULT CHARSET=latin1;

INSERT INTO users (user_name, user_age, plan_id, `date`)
VALUES
	('Thati', 23, 1, '2019-10-20'),
	('Cintia', 35, 4, '2017-12-30'),
	('Bill', 20, 3, '2019-06-05'),
	('Roger', 45, 2, '2020-05-13'),
	('Norman', 58, 2, '2017-02-17'),
	('Patrick', 33, 4, '2017-01-06'),
	('Vivian', 26, 3, '2018-01-05'),
	('Carol', 19, 3, '2018-02-14'),
	('Angelina', 42, 4, '2018-04-29'),
	('Paul', 46, 4, '2017-01-17');


DROP TABLE IF EXISTS `SpotifyClone`.`artists` ;

CREATE TABLE IF NOT EXISTS `SpotifyClone`.`artists` (
    `id_artist` INT NOT NULL AUTO_INCREMENT,
    `artist_name` VARCHAR(50) NOT NULL DEFAULT 'nameless',
    PRIMARY KEY (`id_artist`)
)  ENGINE=INNODB;

INSERT INTO artists (artist_name)
VALUES
	('Walter Phoenix'),
  ('Peter Strong'),
  ('Lance Day'),
  ('Freedie Shannon'),
  ('Tyler Isle'),
  ('Fog');


DROP TABLE IF EXISTS `SpotifyClone`.`albums` ;

CREATE TABLE IF NOT EXISTS `SpotifyClone`.`albums` (
  `id_album` INT NOT NULL AUTO_INCREMENT,
  `album_name` VARCHAR(50) NOT NULL DEFAULT 'nameless',
  `artist_id` INT NOT NULL,
  `release_date` INT NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_album`),
  CONSTRAINT `ALBUM_ARTIST_FK`
    FOREIGN KEY (`artist_id`)
    REFERENCES `SpotifyClone`.`artists` (`id_artist`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

INSERT INTO albums (album_name, release_date, artist_id)
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




DROP TABLE IF EXISTS `SpotifyClone`.`songs` ;

CREATE TABLE IF NOT EXISTS `SpotifyClone`.`songs` (
  `id_song` INT NOT NULL AUTO_INCREMENT,
  `song_name` VARCHAR(50) NOT NULL DEFAULT 'no name',
  `time_length` INT NOT NULL DEFAULT 0,
  `album_id` INT NOT NULL,
  PRIMARY KEY (`id_song`),
  CONSTRAINT `SONGS_ALBUM_FK`
    FOREIGN KEY (`album_id`)
    REFERENCES `SpotifyClone`.`albums` (`id_album`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

INSERT INTO songs (song_name, time_length, album_id)
VALUES
  ('Soul For Us', 200, 1),
  ('Reflections Of Magic', 163, 1),
  ('Dance With Her Own', 116, 1),
  ('Troubles Of My Inner Fire', 203, 1),
  ('Time Fireworks', 152, 1),
  ('Magic Circus', 105, 2),
  ('Honey, So Do I', 207, 2),
  ('Sweetie, Lets Go Wild', 139, 2),
  ('She Knows', 244, 2),
  ('Fantasy For Me', 100, 3),
  ('Celebration Of More', 146, 3),
  ('Rock His Everything', 223, 3),
  ('Home Forever', 231, 3),
  ('Diamond Power', 241, 3),
  ("Let's Be Silly", 132, 3),
  ('Thang Of Thunder', 240, 4),
  ('Words Of Her Life', 185, 4),
  ('Without My Streets', 176, 4),
  ('Need Of The Evening', 190, 4),
  ('History Of My Roses', 222, 4),
  ('Without My Love', 111, 4),
  ('Walking And Game', 123, 4),
  ('Young And Father', 197, 4),
  ('Finding My Traditions', 179, 5),
  ('Walking And Man', 229, 5),
  ('Hard And Time', 135, 5),
  ("Honey, I'm A Lone Wolf", 150, 5),
  ("She Thinks I Won't Stay Tonight", 166, 5),
  ("He Heard You're Bad For Me", 154, 5),
  ("He Hopes We Can't Stay", 210, 5),
  ('I Know I Know', 217, 5),
  ("He's Walking Away", 159, 5),
  ("He's Trouble", 138, 5),
  ("I Heard I Want To Bo Alone", 120, 5),
  ('I Ride Alone', 151, 5),
  ('Honey', 79, 6),
  ("You Cheated On Me", 95, 6),
  ("Wouldn't It Be Nice", 213, 6),
  ("Baby", 136, 6),
  ('You Make Me Feel So..', 83, 6);

DROP TABLE IF EXISTS `SpotifyClone`.`user_following_artist` ;

CREATE TABLE IF NOT EXISTS `SpotifyClone`.`user_following_artist` (
  `user_id` INT NOT NULL,
  `artist_id` INT NOT NULL,
  PRIMARY KEY(`user_id`, `artist_id`),
  CONSTRAINT `USER_ID_FK`
    FOREIGN KEY (`user_id`)
    REFERENCES `SpotifyClone`.`users` (`id_user`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `NAME_ARTIST_FK`
    FOREIGN KEY (`artist_id`)
    REFERENCES `SpotifyClone`.`artists` (`id_artist`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

INSERT INTO user_following_artist (user_id, artist_id)
VALUES
	(1, 1),
  (1, 4),
	(1, 3),
  (2, 1),
	(2, 3),
  (3, 2),
	(3, 1),
  (4, 4),
	(5, 5),
  (5, 6),
	(6, 6),
  (6, 3),
	(6, 1),
  (7, 2),
	(7, 5),
  (8, 1),
	(8, 5),
  (9, 6),
	(9, 4),
  (9, 3),
	(10, 2),
  (10, 6);

DROP TABLE IF EXISTS `SpotifyClone`.`history` ;

CREATE TABLE IF NOT EXISTS `SpotifyClone`.`history` (
  `user_id` INT NOT NULL,
  `song_id` INT NOT NULL,
  `date` DATETIME NOT NULL,
  PRIMARY KEY(`user_id`, `song_id`),
  CONSTRAINT `USER_HISTORY_FK`
    FOREIGN KEY (`user_id`)
    REFERENCES `SpotifyClone`.`users` (`id_user`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `SONG_HISTORY_FK`
    FOREIGN KEY (`song_id`)
    REFERENCES `SpotifyClone`.`songs` (`id_song`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

INSERT INTO `history` (user_id, song_id, `date`)
VALUES
	(1, 37, '2020-02-28 10:45:55'),
  (1, 26, '2020-05-02 05:30:35'),
	(1, 23, '2020-03-06 11:22:33'),
  (1, 14, '2020-08-05 08:05:17'),
	(1, 15, '2020-09-14 16:32:22'),
  (2, 35, '2020-01-02 07:40:33'),
	(2, 25, '2020-05-16 06:16:22'),
  (2, 21, '2020-10-09 12:27:48'),
	(2, 40, '2020-09-21 13:14:46'),
  (3, 6, '2020-11-13 16:55:13'),
	(3, 3, '2020-12-05 18:38:30'),
  (3, 27, '2020-07-30 10:00:00'),
  (4, 2, '2021-08-15 17:10:10'),
	(4, 36, '2021-07-10 15:20:30'),
	(4, 28, '2021-01-09 01:44:33'),
  (5, 7, '2020-07-03 19:33:28'),
	(5, 11, '2017-02-24 21:14:22'),
  (5, 14, '2020-08-06 15:23:43'),
  (5, 1, '2020-11-10 13:52:27'),
	(6, 38, '2019-02-07 20:33:48'),
  (6, 30, '2017-01-24 00:31:17'),
  (6, 31, '2017-10-12 12:35:20'),
	(6, 22, '2018-05-29 14:56:41'),
  (7, 5, '2018-05-09 22:30:49'),
  (7, 4, '2020-07-27 12:52:58'),
	(7, 10, '2018-01-16 18:40:43'),
  (8, 39, '2018-03-21 16:56:40'),
  (8, 40, '2020-10-18 13:38:05'),
	(8, 33, '2019-05-25 08:14:03'),
  (8, 34, '2021-08-15 21:37:09'),
  (9, 16, '2021-05-24 17:23:45'),
	(9, 17, '2018-12-07 22:48:52'),
  (9, 8, '2021-03-14 06:14:26'),
	(9, 9, '2020-04-01 03:36:00'),
  (10, 20, '2017-02-06 08:21:34'),
  (10, 21, '2017-12-04 05:33:43'),
  (10, 12, '2017-07-27 05:24:49'),
  (10, 13, '2017-12-25 01:03:57');