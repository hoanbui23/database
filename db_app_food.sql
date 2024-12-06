/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

CREATE TABLE `food` (
  `food_id` int NOT NULL AUTO_INCREMENT,
  `food_name` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `price` int DEFAULT NULL,
  `descs` varchar(255) DEFAULT NULL,
  `type_id` int DEFAULT NULL,
  PRIMARY KEY (`food_id`),
  KEY `type_id` (`type_id`),
  CONSTRAINT `food_ibfk_5` FOREIGN KEY (`type_id`) REFERENCES `food_type` (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `food_type` (
  `type_id` int NOT NULL AUTO_INCREMENT,
  `type_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `like_res` (
  `user_id` int DEFAULT NULL,
  `res_id` int DEFAULT NULL,
  `date_like` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  KEY `user_id` (`user_id`),
  KEY `res_id` (`res_id`),
  CONSTRAINT `like_res_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `like_res_ibfk_2` FOREIGN KEY (`res_id`) REFERENCES `restaurants` (`res_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `orders` (
  `user_id` int DEFAULT NULL,
  `food_id` int DEFAULT NULL,
  `amount` int DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  KEY `user_id` (`user_id`),
  KEY `food_id` (`food_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`food_id`) REFERENCES `food` (`food_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `rate_res` (
  `user_id` int DEFAULT NULL,
  `res_id` int DEFAULT NULL,
  `amount` int DEFAULT NULL,
  `date_rate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  KEY `user_id` (`user_id`),
  KEY `res_id` (`res_id`),
  CONSTRAINT `rate_res_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `rate_res_ibfk_2` FOREIGN KEY (`res_id`) REFERENCES `restaurants` (`res_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `restaurants` (
  `res_id` int NOT NULL AUTO_INCREMENT,
  `res_name` varchar(255) DEFAULT NULL,
  `imgae` varchar(255) DEFAULT NULL,
  `decs` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`res_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `sub_food` (
  `sub_id` int NOT NULL AUTO_INCREMENT,
  `sub_name` varchar(255) DEFAULT NULL,
  `sub_price` float DEFAULT NULL,
  `food_id` int DEFAULT NULL,
  PRIMARY KEY (`sub_id`),
  KEY `food_id` (`food_id`),
  CONSTRAINT `sub_food_ibfk_1` FOREIGN KEY (`food_id`) REFERENCES `food` (`food_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `full_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `pass_word` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `food` (`food_id`, `food_name`, `image`, `price`, `descs`, `type_id`) VALUES
(1, 'Cơm Gà', NULL, 15000, 'Cơm Ga Xối mỡ', 1);
INSERT INTO `food` (`food_id`, `food_name`, `image`, `price`, `descs`, `type_id`) VALUES
(2, 'Cơm Chiên DƯơng châu', NULL, 15000, 'Cơm ', 1);


INSERT INTO `food_type` (`type_id`, `type_name`) VALUES
(1, 'Tráng Miệng');
INSERT INTO `food_type` (`type_id`, `type_name`) VALUES
(2, 'Món Chính');
INSERT INTO `food_type` (`type_id`, `type_name`) VALUES
(3, 'Món Phụ');

INSERT INTO `like_res` (`user_id`, `res_id`, `date_like`) VALUES
(1, 1, '2024-12-01 09:09:23');
INSERT INTO `like_res` (`user_id`, `res_id`, `date_like`) VALUES
(2, 2, '2024-12-01 09:09:33');
INSERT INTO `like_res` (`user_id`, `res_id`, `date_like`) VALUES
(2, 2, '2024-12-01 09:09:43');
INSERT INTO `like_res` (`user_id`, `res_id`, `date_like`) VALUES
(3, 3, '2024-12-01 09:11:22'),
(1, 4, '2024-12-01 09:11:29'),
(4, 2, '2024-12-01 09:11:39');

INSERT INTO `orders` (`user_id`, `food_id`, `amount`, `code`) VALUES
(1, 1, NULL, '');
INSERT INTO `orders` (`user_id`, `food_id`, `amount`, `code`) VALUES
(1, 2, NULL, NULL);
INSERT INTO `orders` (`user_id`, `food_id`, `amount`, `code`) VALUES
(2, 2, NULL, NULL);
INSERT INTO `orders` (`user_id`, `food_id`, `amount`, `code`) VALUES
(3, 1, NULL, NULL);

INSERT INTO `rate_res` (`user_id`, `res_id`, `amount`, `date_rate`) VALUES
(1, 1, NULL, '2024-12-01 09:03:39');
INSERT INTO `rate_res` (`user_id`, `res_id`, `amount`, `date_rate`) VALUES
(1, 2, NULL, '2024-12-01 09:03:50');
INSERT INTO `rate_res` (`user_id`, `res_id`, `amount`, `date_rate`) VALUES
(2, 1, NULL, '2024-12-01 09:03:58');
INSERT INTO `rate_res` (`user_id`, `res_id`, `amount`, `date_rate`) VALUES
(3, 2, NULL, '2024-12-01 09:04:23');

INSERT INTO `restaurants` (`res_id`, `res_name`, `imgae`, `decs`) VALUES
(1, '4psPizza', NULL, 'Pizza rất ngon');
INSERT INTO `restaurants` (`res_id`, `res_name`, `imgae`, `decs`) VALUES
(2, 'Trà sữa Koi', NULL, 'Trà sữa trấn trâu hoàng kim');
INSERT INTO `restaurants` (`res_id`, `res_name`, `imgae`, `decs`) VALUES
(3, 'Cờm sườn Sà Bì Chưởng', NULL, 'Tấm sà bì chưởng của độ MIXI');
INSERT INTO `restaurants` (`res_id`, `res_name`, `imgae`, `decs`) VALUES
(4, 'Sanfulou', NULL, 'Dimsum ngon nhất'),
(5, 'Ơ Bistro Restaurants', NULL, '');



INSERT INTO `users` (`user_id`, `full_name`, `email`, `create_at`, `pass_word`) VALUES
(1, 'Bùi Hoan ', 'hoanbui247@gmail.com', '2024-11-27 02:31:55', '123456');
INSERT INTO `users` (`user_id`, `full_name`, `email`, `create_at`, `pass_word`) VALUES
(2, 'Bui HIen', 'hienbui@gmail.com', '2024-11-27 02:32:14', '22334455');
INSERT INTO `users` (`user_id`, `full_name`, `email`, `create_at`, `pass_word`) VALUES
(3, 'Bao bao', 'baobao@gmail.com', '2024-11-27 02:32:36', '11223344');
INSERT INTO `users` (`user_id`, `full_name`, `email`, `create_at`, `pass_word`) VALUES
(4, 'Linh Nhi', 'linhnhi@gmail.com', '2024-12-01 03:08:11', '23061998'),
(5, 'My Dung', 'dunglt@gmail.com', '2024-12-06 14:19:03', '1234567'),
(6, 'Hai Ha', 'haiha@gm,ail.com', '2024-12-06 14:19:22', '22334455');


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;