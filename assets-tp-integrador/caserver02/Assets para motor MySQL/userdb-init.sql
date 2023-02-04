CREATE DATABASE IF NOT EXISTS `userdb`;
USE `userdb`;

CREATE TABLE IF NOT EXISTS `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `firstname` varchar(45) DEFAULT NULL,
  `lastname` varchar(45) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;

DELETE FROM `users`;
INSERT INTO `users` (`id`, `firstname`, `lastname`, `dob`, `email`) VALUES
	(1, 'Maria', 'Fernandez', '1988-07-07', 'maria@fernandez.com');