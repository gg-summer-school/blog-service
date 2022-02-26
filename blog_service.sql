-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Feb 26, 2022 at 06:27 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 7.3.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `blog_service`
--

-- --------------------------------------------------------

--
-- Table structure for table `article`
--

CREATE TABLE `article` (
  `id` varchar(50) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `article_abstract` longtext DEFAULT NULL,
  `cover_page` varchar(255) DEFAULT NULL,
  `document` varchar(255) DEFAULT NULL,
  `price` decimal(19,2) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `toc` longtext DEFAULT NULL,
  `category_id` varchar(50) DEFAULT NULL,
  `user_id` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `article`
--

INSERT INTO `article` (`id`, `created_at`, `updated_at`, `article_abstract`, `cover_page`, `document`, `price`, `title`, `toc`, `category_id`, `user_id`) VALUES
('44725fe1-2ef7-4210-aa89-b2cc0b331a36', '2022-01-28 14:58:11', '2022-02-17 12:54:49', '<p class=\"ql-align-justify\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vestibulum dictum tellus, eu venenatis nunc imperdiet ut. Maecenas orci eros, tincidunt id maximus sit amet, ultricies a erat. Cras elementum orci orci, dapibus dignissim nunc ultricies non. Praesent ac odio bibendum, sagittis ante ornare, venenatis massa. Nunc non justo eu arcu faucibus sagittis sed et libero. Suspendisse ullamcorper ligula ac lectus tempor consectetur. Aenean tincidunt, odio ut pharetra feugiat, arcu erat blandit mi, nec tincidunt leo massa a quam. Praesent gravida sapien nec pretium volutpat. Vestibulum faucibus mi vel pellentesque tristique. Nunc at tristique ligula, et mollis erat.</p><p class=\"ql-align-justify\">Curabitur eu scelerisque ligula. Phasellus est eros, aliquet vel sollicitudin nec, volutpat vel turpis. Donec blandit posuere nibh quis facilisis. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin augue quam, euismod in ornare non, pretium sed risus. Cras dapibus semper lacus semper imperdiet. Integer sed diam tempus, porta velit eu, semper ligula. Vestibulum tincidunt fermentum velit, quis euismod metus fringilla accumsan. Nunc sit amet convallis dolor. In lectus justo, elementum vel orci sit amet, auctor lobortis elit. Morbi ut tempor ante, non pulvinar mi. Fusce purus leo, viverra sit amet nulla nec, lacinia tristique sapien. Suspendisse ac elementum velit, sed rutrum ante. Mauris rutrum lectus quam, vel mollis orci tincidunt non</p><p><br></p>', 'Book Cover 06.jpg', 'ASSIGNMENT ON E-R MODELING.pdf', '20000.00', 'Java Web Development 3rd Edition', '<p class=\"ql-align-justify\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vestibulum dictum tellus, eu venenatis nunc imperdiet ut. Maecenas orci eros, tincidunt id maximus sit amet, ultricies a erat. Cras elementum orci orci, dapibus dignissim nunc ultricies non. Praesent ac odio bibendum, sagittis ante ornare, venenatis massa. Nunc non justo eu arcu faucibus sagittis sed et libero. Suspendisse ullamcorper ligula ac lectus tempor consectetur. Aenean tincidunt, odio ut pharetra feugiat, arcu erat blandit mi, nec tincidunt leo massa a quam. Praesent gravida sapien nec pretium volutpat. Vestibulum faucibus mi vel pellentesque tristique. Nunc at tristique ligula, et mollis erat.</p><p class=\"ql-align-justify\">Curabitur eu scelerisque ligula. Phasellus est eros, aliquet vel sollicitudin nec, volutpat vel turpis. Donec blandit posuere nibh quis facilisis. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin augue quam, euismod in ornare non, pretium sed risus. Cras dapibus semper lacus semper imperdiet. Integer sed diam tempus, porta velit eu, semper ligula. Vestibulum tincidunt fermentum velit, quis euismod metus fringilla accumsan. Nunc sit amet convallis dolor. In lectus justo, elementum vel orci sit amet, auctor lobortis elit. Morbi ut tempor ante, non pulvinar mi. Fusce purus leo, viverra sit amet nulla nec, lacinia tristique sapien. Suspendisse ac elementum velit, sed rutrum ante. Mauris rutrum lectus quam, vel mollis orci tincidunt non.</p><p class=\"ql-align-justify\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vestibulum dictum tellus, eu venenatis nunc imperdiet ut. Maecenas orci eros, tincidunt id maximus sit amet, ultricies a erat. Cras elementum orci orci, dapibus dignissim nunc ultricies non. Praesent ac odio bibendum, sagittis ante ornare, venenatis massa. Nunc non justo eu arcu faucibus sagittis sed et libero. Suspendisse ullamcorper ligula ac lectus tempor consectetur. Aenean tincidunt, odio ut pharetra feugiat, arcu erat blandit mi, nec tincidunt leo massa a quam. Praesent gravida sapien nec pretium volutpat. Vestibulum faucibus mi vel pellentesque tristique. Nunc at tristique ligula, et mollis erat.</p><p class=\"ql-align-justify\">Curabitur eu scelerisque ligula. Phasellus est eros, aliquet vel sollicitudin nec, volutpat vel turpis. Donec blandit posuere nibh quis facilisis. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin augue quam, euismod in ornare non, pretium sed risus. Cras dapibus semper lacus semper imperdiet. Integer sed diam tempus, porta velit eu, semper ligula. Vestibulum tincidunt fermentum velit, quis euismod metus fringilla accumsan. Nunc sit amet convallis dolor. In lectus justo, elementum vel orci sit amet, auctor lobortis elit. Morbi ut tempor ante, non pulvinar mi. Fusce purus leo, viverra sit amet nulla nec, lacinia tristique sapien. Suspendisse ac elementum velit, sed rutrum ante. Mauris rutrum lectus quam, vel mollis orci tincidunt non</p><p class=\"ql-align-justify\"><br></p>', '4a1e4a7a-3e2c-48fc-8ab2-b1fee49ffaa5', '7dfda13c-cae8-461b-95e9-72a802871f0f'),
('0348dc14-e8af-4502-8abc-753b2d8d63ce', '2022-01-28 14:59:17', '2022-01-28 14:59:41', '<p class=\"ql-align-justify\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vestibulum dictum tellus, eu venenatis nunc imperdiet ut. Maecenas orci eros, tincidunt id maximus sit amet, ultricies a erat. Cras elementum orci orci, dapibus dignissim nunc ultricies non. Praesent ac odio bibendum, sagittis ante ornare, venenatis massa. Nunc non justo eu arcu faucibus sagittis sed et libero. Suspendisse ullamcorper ligula ac lectus tempor consectetur. Aenean tincidunt, odio ut pharetra feugiat, arcu erat blandit mi, nec tincidunt leo massa a quam. Praesent gravida sapien nec pretium volutpat. Vestibulum faucibus mi vel pellentesque tristique. Nunc at tristique ligula, et mollis erat.</p><p class=\"ql-align-justify\">Curabitur eu scelerisque ligula. Phasellus est eros, aliquet vel sollicitudin nec, volutpat vel turpis. Donec blandit posuere nibh quis facilisis. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin augue quam, euismod in ornare non, pretium sed risus. Cras dapibus semper lacus semper imperdiet. Integer sed diam tempus, porta velit eu, semper ligula. Vestibulum tincidunt fermentum velit, quis euismod metus fringilla accumsan. Nunc sit amet convallis dolor. In lectus justo, elementum vel orci sit amet, auctor lobortis elit. Morbi ut tempor ante, non pulvinar mi. Fusce purus leo, viverra sit amet nulla nec, lacinia tristique sapien. Suspendisse ac elementum velit, sed rutrum ante. Mauris rutrum lectus quam, vel mollis orci tincidunt non</p><p><br></p>', '1201.jpg', 'appology.pdf', '20000.00', 'Java Web Development with Springboot 4th Edition', '<p class=\"ql-align-justify\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vestibulum dictum tellus, eu venenatis nunc imperdiet ut. Maecenas orci eros, tincidunt id maximus sit amet, ultricies a erat. Cras elementum orci orci, dapibus dignissim nunc ultricies non. Praesent ac odio bibendum, sagittis ante ornare, venenatis massa. Nunc non justo eu arcu faucibus sagittis sed et libero. Suspendisse ullamcorper ligula ac lectus tempor consectetur. Aenean tincidunt, odio ut pharetra feugiat, arcu erat blandit mi, nec tincidunt leo massa a quam. Praesent gravida sapien nec pretium volutpat. Vestibulum faucibus mi vel pellentesque tristique. Nunc at tristique ligula, et mollis erat.</p><p class=\"ql-align-justify\">Curabitur eu scelerisque ligula. Phasellus est eros, aliquet vel sollicitudin nec, volutpat vel turpis. Donec blandit posuere nibh quis facilisis. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin augue quam, euismod in ornare non, pretium sed risus. Cras dapibus semper lacus semper imperdiet. Integer sed diam tempus, porta velit eu, semper ligula. Vestibulum tincidunt fermentum velit, quis euismod metus fringilla accumsan. Nunc sit amet convallis dolor. In lectus justo, elementum vel orci sit amet, auctor lobortis elit. Morbi ut tempor ante, non pulvinar mi. Fusce purus leo, viverra sit amet nulla nec, lacinia tristique sapien. Suspendisse ac elementum velit, sed rutrum ante. Mauris rutrum lectus quam, vel mollis orci tincidunt non</p><p><br></p>', '4a1e4a7a-3e2c-48fc-8ab2-b1fee49ffaa2', '7dfda13c-cae8-461b-95e9-72a802871f0f'),
('ac861616-225e-47ec-8ed1-250f2f62729e', '2022-01-28 15:35:57', '2022-01-28 15:49:07', '<p class=\"ql-align-justify\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vestibulum dictum tellus, eu venenatis nunc imperdiet ut. Maecenas orci eros, tincidunt id maximus sit amet, ultricies a erat. Cras elementum orci orci, dapibus dignissim nunc ultricies non. Praesent ac odio bibendum, sagittis ante ornare, venenatis massa. Nunc non justo eu arcu faucibus sagittis sed et libero. Suspendisse ullamcorper ligula ac lectus tempor consectetur. Aenean tincidunt, odio ut pharetra feugiat, arcu erat blandit mi, nec tincidunt leo massa a quam. Praesent gravida sapien nec pretium volutpat. Vestibulum faucibus mi vel pellentesque tristique. Nunc at tristique ligula, et mollis erat.</p><p class=\"ql-align-justify\">Curabitur eu scelerisque ligula. Phasellus est eros, aliquet vel sollicitudin nec, volutpat vel turpis. Donec blandit posuere nibh quis facilisis. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin augue quam, euismod in ornare non, pretium sed risus. Cras dapibus semper lacus semper imperdiet. Integer sed diam tempus, porta velit eu, semper ligula. Vestibulum tincidunt fermentum velit, quis euismod metus fringilla accumsan. Nunc sit amet convallis dolor. In lectus justo, elementum vel orci sit amet, auctor lobortis elit. Morbi ut tempor ante, non pulvinar mi. Fusce purus leo, viverra sit amet nulla nec, lacinia tristique sapien. Suspendisse ac elementum velit, sed rutrum ante. Mauris rutrum lectus quam, vel mollis orci tincidunt non</p><p><br></p>', '1965061.jpg', 'Java - How to Program 10th Ed - Early Objects Version - Deitel.pdf', '10000.00', 'PHP  Web Development with Laravel Framework', '<p class=\"ql-align-justify\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vestibulum dictum tellus, eu venenatis nunc imperdiet ut. Maecenas orci eros, tincidunt id maximus sit amet, ultricies a erat. Cras elementum orci orci, dapibus dignissim nunc ultricies non. Praesent ac odio bibendum, sagittis ante ornare, venenatis massa. Nunc non justo eu arcu faucibus sagittis sed et libero. Suspendisse ullamcorper ligula ac lectus tempor consectetur. Aenean tincidunt, odio ut pharetra feugiat, arcu erat blandit mi, nec tincidunt leo massa a quam. Praesent gravida sapien nec pretium volutpat. Vestibulum faucibus mi vel pellentesque tristique. Nunc at tristique ligula, et mollis erat.</p><p class=\"ql-align-justify\">Curabitur eu scelerisque ligula. Phasellus est eros, aliquet vel sollicitudin nec, volutpat vel turpis. Donec blandit posuere nibh quis facilisis. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin augue quam, euismod in ornare non, pretium sed risus. Cras dapibus semper lacus semper imperdiet. Integer sed diam tempus, porta velit eu, semper ligula. Vestibulum tincidunt fermentum velit, quis euismod metus fringilla accumsan. Nunc sit amet convallis dolor. In lectus justo, elementum vel orci sit amet, auctor lobortis elit. Morbi ut tempor ante, non pulvinar mi. Fusce purus leo, viverra sit amet nulla nec, lacinia tristique sapien. Suspendisse ac elementum velit, sed rutrum ante. Mauris rutrum lectus quam, vel mollis orci tincidunt non</p><p><br></p>', 'la1e4a7a-3e2c-48fc-8ab2-b1fee49ffaab', '7dfda13c-cae8-461b-95e9-72a802871f0f'),
('536eb45f-52e0-4f7d-9be8-7fa7f68b848d', '2022-01-28 16:59:29', '2022-01-28 17:00:49', '<p class=\"ql-align-justify\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vestibulum dictum tellus, eu venenatis nunc imperdiet ut. Maecenas orci eros, tincidunt id maximus sit amet, ultricies a erat. Cras elementum orci orci, dapibus dignissim nunc ultricies non. Praesent ac odio bibendum, sagittis ante ornare, venenatis massa. Nunc non justo eu arcu faucibus sagittis sed et libero. Suspendisse ullamcorper ligula ac lectus tempor consectetur. Aenean tincidunt, odio ut pharetra feugiat, arcu erat blandit mi, nec tincidunt leo massa a quam. Praesent gravida sapien nec pretium volutpat. Vestibulum faucibus mi vel pellentesque tristique. Nunc at tristique ligula, et mollis erat.</p><p><span style=\"color: rgb(0, 0, 0);\">Curabitur eu scelerisque ligula. Phasellus est eros, aliquet vel sollicitudin nec, volutpat vel turpis. Donec blandit posuere nibh quis facilisis. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin augue quam, euismod in ornare non, pretium sed risus. Cras dapibus semper lacus semper imperdiet. Integer sed diam tempus, porta velit eu, semper ligula. Vestibulum tincidunt fermentum velit, quis euismod metus fringilla accumsan. Nunc sit amet convallis dolor. In lectus justo, elementum vel orci sit amet, auctor lobortis elit. Morbi ut tempor ante, non pulvinar mi. Fusce purus leo, viverra sit amet nulla nec, lacinia tristique sapien. Suspendisse ac elementum velit, sed rutrum ante. Mauris rutrum lectus quam, vel mollis orci tincidunt non</span>Omnis esse minim vol.</p>', 'Flyer 8.jpg', 'Neo4j_Graph_Algorithms_r3.pdf', '8000.00', 'Vue js Development 1st Edition', '<p class=\"ql-align-justify\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vestibulum dictum tellus, eu venenatis nunc imperdiet ut. Maecenas orci eros, tincidunt id maximus sit amet, ultricies a erat. Cras elementum orci orci, dapibus dignissim nunc ultricies non. Praesent ac odio bibendum, sagittis ante ornare, venenatis massa. Nunc non justo eu arcu faucibus sagittis sed et libero. Suspendisse ullamcorper ligula ac lectus tempor consectetur. Aenean tincidunt, odio ut pharetra feugiat, arcu erat blandit mi, nec tincidunt leo massa a quam. Praesent gravida sapien nec pretium volutpat. Vestibulum faucibus mi vel pellentesque tristique. Nunc at tristique ligula, et mollis erat.</p><p><span style=\"color: rgb(0, 0, 0);\">Curabitur eu scelerisque ligula. Phasellus est eros, aliquet vel sollicitudin nec, volutpat vel turpis. Donec blandit posuere nibh quis facilisis. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin augue quam, euismod in ornare non, pretium sed risus. Cras dapibus semper lacus semper imperdiet. Integer sed diam tempus, porta velit eu, semper ligula. Vestibulum tincidunt fermentum velit, quis euismod metus fringilla accumsan. Nunc sit amet convallis dolor. In lectus justo, elementum vel orci sit amet, auctor lobortis elit. Morbi ut tempor ante, non pulvinar mi. Fusce purus leo, viverra sit amet nulla nec, lacinia tristique sapien. Suspendisse ac elementum velit, sed rutrum ante. Mauris rutrum lectus quam, vel mollis orci tincidunt non</span>Modi culpa, obcaecat.</p>', 'da1e4a7a-3e2c-48fc-8ab2-b1fee49ffaa2', '7dfda13c-cae8-461b-95e9-72a802871f0f'),
('3e98da1c-6b1b-4b8f-bcbf-7cb6088c071c', '2022-01-29 20:41:09', '2022-01-29 21:17:57', '<p><span style=\"color: rgb(0, 0, 0);\">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</span>Modi aut non dolor e.</p>', '5171295.jpg', 'ASSIGNMENT ON E-R MODELING.pdf', '60000.00', 'Building Web Applications with Angular and SpringBoot', '<p><span style=\"color: rgb(0, 0, 0);\">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</span>Veritatis distinctio.</p>', '4a1e4a7a-3e2c-48fc-8ab2-b1fee49ffaa6', '3ec2eabf-f195-45ed-bb08-794f04b934d0'),
('3218b65c-e748-482f-ab85-a3b16346c1f7', '2022-01-30 12:50:32', '2022-01-30 12:51:24', '<p class=\"ql-align-justify\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce ullamcorper non libero ut placerat. Proin tempus ut tortor in mollis. Nulla gravida elit id augue mattis, id efficitur erat convallis. Cras diam erat, maximus vitae finibus quis, mollis a orci. Ut vel finibus dui. Aenean augue tortor, consequat at auctor sit amet, viverra quis metus. Nunc quis venenatis lacus. Sed sed quam neque. Etiam facilisis felis tellus, at ultrices justo semper vel. Mauris ut commodo neque. Phasellus sit amet tortor sollicitudin, pharetra tellus in, aliquet dolor. Morbi id velit et lacus dapibus ullamcorper. Vivamus non dui turpis. Aenean sagittis hendrerit lectus eget fermentum.</p><p><br></p>', 'Book cover 01.jpg', 'ASSIGNMENT ON E-R MODELING.pdf', '5002.00', 'JavaScript Web Development Full Courrse', '<p class=\"ql-align-justify\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce ullamcorper non libero ut placerat. Proin tempus ut tortor in mollis. Nulla gravida elit id augue mattis, id efficitur erat convallis. Cras diam erat, maximus vitae finibus quis, mollis a orci. Ut vel finibus dui. Aenean augue tortor, consequat at auctor sit amet, viverra quis metus. Nunc quis venenatis lacus. Sed sed quam neque. Etiam facilisis felis tellus, at ultrices justo semper vel. Mauris ut commodo neque. Phasellus sit amet tortor sollicitudin, pharetra tellus in, aliquet dolor. Morbi id velit et lacus dapibus ullamcorper. Vivamus non dui turpis. Aenean sagittis hendrerit lectus eget fermentum.</p><p><br></p>', '4a1e4a7a-3e2c-48fc-8ab2-b1fee49ffaa6', '7dfda13c-cae8-461b-95e9-72a802871f0f'),
('95fc37db-9c8c-4e30-bb25-8de15a9708e4', '2022-01-31 23:26:02', '2022-01-31 23:26:22', '<p><span style=\"color: rgb(0, 0, 0);\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam sollicitudin nibh justo, a interdum ex dignissim quis. Nam purus magna, ultricies vitae molestie vel, sagittis in lacus. Proin quis eros accumsan, efficitur metus sed, mollis enim. Morbi venenatis orci leo, at venenatis urna ultrices id. Phasellus ornare ut felis at sagittis. Aliquam dapibus mi eget sapien laoreet gravida. Sed iaculis hendrerit elementum. Vivamus elementum bibendum metus sit amet faucibus. Donec massa ex, sollicitudin a sapien ac, commodo lacinia nulla. Fusce nunc elit, auctor et odio sit amet, gravida tincidunt sem. Suspendisse rhoncus velit in eros gravida, vitae rutrum sem venenatis. Sed malesuada nunc a felis auctor porttitor. Nam at arcu mauris. Duis feugiat felis nec metus ultrices aliquet. Quisque venenatis, nulla sed sodales sollicitudin, lectus est finibus ligula, nec posuere nulla nisl ut libero. Integer non lectus lacus</span></p>', 'Book Cover 03.jpg', 'ASSIGNMENT ON E-R MODELING.pdf', '10000.00', 'Data Structures and Algorithms Vol 1', '<p><span style=\"color: rgb(0, 0, 0);\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam sollicitudin nibh justo, a interdum ex dignissim quis. Nam purus magna, ultricies vitae molestie vel, sagittis in lacus. Proin quis eros accumsan, efficitur metus sed, mollis enim. Morbi venenatis orci leo, at venenatis urna ultrices id. Phasellus ornare ut felis at sagittis. Aliquam dapibus mi eget sapien laoreet gravida. Sed iaculis hendrerit elementum. Vivamus elementum bibendum metus sit amet faucibus. Donec massa ex, sollicitudin a sapien ac, commodo lacinia nulla. Fusce nunc elit, auctor et odio sit amet, gravida tincidunt sem. Suspendisse rhoncus velit in eros gravida, vitae rutrum sem venenatis. Sed malesuada nunc a felis auctor porttitor. Nam at arcu mauris. Duis feugiat felis nec metus ultrices aliquet. Quisque venenatis, nulla sed sodales sollicitudin, lectus est finibus ligula, nec posuere nulla nisl ut libero. Integer non lectus lacus</span></p>', 'la1e4a7a-3e2c-48fc-8ab2-b1fee49ffaab', '7dfda13c-cae8-461b-95e9-72a802871f0f'),
('cd2369d7-bbe4-4c06-88bf-9f77d52ee81c', '2022-01-31 23:27:32', '2022-01-31 23:27:45', '<p><span style=\"color: rgb(0, 0, 0);\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam sollicitudin nibh justo, a interdum ex dignissim quis. Nam purus magna, ultricies vitae molestie vel, sagittis in lacus. Proin quis eros accumsan, efficitur metus sed, mollis enim. Morbi venenatis orci leo, at venenatis urna ultrices id. Phasellus ornare ut felis at sagittis. Aliquam dapibus mi eget sapien laoreet gravida. Sed iaculis hendrerit elementum. Vivamus elementum bibendum metus sit amet faucibus. Donec massa ex, sollicitudin a sapien ac, commodo lacinia nulla. Fusce nunc elit, auctor et odio sit amet, gravida tincidunt sem. Suspendisse rhoncus velit in eros gravida, vitae rutrum sem venenatis. Sed malesuada nunc a felis auctor porttitor. Nam at arcu mauris. Duis feugiat felis nec metus ultrices aliquet. Quisque venenatis, nulla sed sodales sollicitudin, lectus est finibus ligula, nec posuere nulla nisl ut libero. Integer non lectus lacus</span></p>', 'Flyer 8.jpg', 'ASSIGNMENT ON E-R MODELING.pdf', '34000.00', 'Database Design and Implementation', '<p><span style=\"color: rgb(0, 0, 0);\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam sollicitudin nibh justo, a interdum ex dignissim quis. Nam purus magna, ultricies vitae molestie vel, sagittis in lacus. Proin quis eros accumsan, efficitur metus sed, mollis enim. Morbi venenatis orci leo, at venenatis urna ultrices id. Phasellus ornare ut felis at sagittis. Aliquam dapibus mi eget sapien laoreet gravida. Sed iaculis hendrerit elementum. Vivamus elementum bibendum metus sit amet faucibus. Donec massa ex, sollicitudin a sapien ac, commodo lacinia nulla. Fusce nunc elit, auctor et odio sit amet, gravida tincidunt sem. Suspendisse rhoncus velit in eros gravida, vitae rutrum sem venenatis. Sed malesuada nunc a felis auctor porttitor. Nam at arcu mauris. Duis feugiat felis nec metus ultrices aliquet. Quisque venenatis, nulla sed sodales sollicitudin, lectus est finibus ligula, nec posuere nulla nisl ut libero. Integer non lectus lacus</span></p>', '6a1e4a7a-3e2c-48fc-8ab2-b1fee49ffaa8', '7dfda13c-cae8-461b-95e9-72a802871f0f'),
('b6b4a361-69b0-485c-b0ad-25d49ec002b3', '2022-01-31 23:28:48', '2022-01-31 23:29:06', '<p><span style=\"color: rgb(0, 0, 0);\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam sollicitudin nibh justo, a interdum ex dignissim quis. Nam purus magna, ultricies vitae molestie vel, sagittis in lacus. Proin quis eros accumsan, efficitur metus sed, mollis enim. Morbi venenatis orci leo, at venenatis urna ultrices id. Phasellus ornare ut felis at sagittis. Aliquam dapibus mi eget sapien laoreet gravida. Sed iaculis hendrerit elementum. Vivamus elementum bibendum metus sit amet faucibus. Donec massa ex, sollicitudin a sapien ac, commodo lacinia nulla. Fusce nunc elit, auctor et odio sit amet, gravida tincidunt sem. Suspendisse rhoncus velit in eros gravida, vitae rutrum sem venenatis. Sed malesuada nunc a felis auctor porttitor. Nam at arcu mauris. Duis feugiat felis nec metus ultrices aliquet. Quisque venenatis, nulla sed sodales sollicitudin, lectus est finibus ligula, nec posuere nulla nisl ut libero. Integer non lectus lacus</span></p>', '5171295.jpg', 'ASSIGNMENT ON E-R MODELING.pdf', '40000.00', 'Operating System Design', '<p><span style=\"color: rgb(0, 0, 0);\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam sollicitudin nibh justo, a interdum ex dignissim quis. Nam purus magna, ultricies vitae molestie vel, sagittis in lacus. Proin quis eros accumsan, efficitur metus sed, mollis enim. Morbi venenatis orci leo, at venenatis urna ultrices id. Phasellus ornare ut felis at sagittis. Aliquam dapibus mi eget sapien laoreet gravida. Sed iaculis hendrerit elementum. Vivamus elementum bibendum metus sit amet faucibus. Donec massa ex, sollicitudin a sapien ac, commodo lacinia nulla. Fusce nunc elit, auctor et odio sit amet, gravida tincidunt sem. Suspendisse rhoncus velit in eros gravida, vitae rutrum sem venenatis. Sed malesuada nunc a felis auctor porttitor. Nam at arcu mauris. Duis feugiat felis nec metus ultrices aliquet. Quisque venenatis, nulla sed sodales sollicitudin, lectus est finibus ligula, nec posuere nulla nisl ut libero. Integer non lectus lacus</span></p>', '4a1e4a7a-3e2c-48fc-8ab2-b1fee49ffaa0', '7dfda13c-cae8-461b-95e9-72a802871f0f'),
('f3b61a15-33e9-4c2a-b476-8e6ff5ad4dcd', '2022-01-31 23:32:36', '2022-01-31 23:32:50', '<p><span style=\"color: rgb(0, 0, 0);\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam sollicitudin nibh justo, a interdum ex dignissim quis. Nam purus magna, ultricies vitae molestie vel, sagittis in lacus. Proin quis eros accumsan, efficitur metus sed, mollis enim. Morbi venenatis orci leo, at venenatis urna ultrices id. Phasellus ornare ut felis at sagittis. Aliquam dapibus mi eget sapien laoreet gravida. Sed iaculis hendrerit elementum. Vivamus elementum bibendum metus sit amet faucibus. Donec massa ex, sollicitudin a sapien ac, commodo lacinia nulla. Fusce nunc elit, auctor et odio sit amet, gravida tincidunt sem. Suspendisse rhoncus velit in eros gravida, vitae rutrum sem venenatis. Sed malesuada nunc a felis auctor porttitor. Nam at arcu mauris. Duis feugiat felis nec metus ultrices aliquet. Quisque venenatis, nulla sed sodales sollicitudin, lectus est finibus ligula, nec posuere nulla nisl ut libero. Integer non lectus lacus</span></p>', 'Book Cover 03.jpg', 'ASSIGNMENT ON E-R MODELING.pdf', '7000.00', 'Designs and Teachings', '<p><span style=\"color: rgb(0, 0, 0);\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam sollicitudin nibh justo, a interdum ex dignissim quis. Nam purus magna, ultricies vitae molestie vel, sagittis in lacus. Proin quis eros accumsan, efficitur metus sed, mollis enim. Morbi venenatis orci leo, at venenatis urna ultrices id. Phasellus ornare ut felis at sagittis. Aliquam dapibus mi eget sapien laoreet gravida. Sed iaculis hendrerit elementum. Vivamus elementum bibendum metus sit amet faucibus. Donec massa ex, sollicitudin a sapien ac, commodo lacinia nulla. Fusce nunc elit, auctor et odio sit amet, gravida tincidunt sem. Suspendisse rhoncus velit in eros gravida, vitae rutrum sem venenatis. Sed malesuada nunc a felis auctor porttitor. Nam at arcu mauris. Duis feugiat felis nec metus ultrices aliquet. Quisque venenatis, nulla sed sodales sollicitudin, lectus est finibus ligula, nec posuere nulla nisl ut libero. Integer non lectus lacus</span></p>', 'ga1e4a7a-3e2c-48fc-8ab2-b1fee49ffaa5', '7dfda13c-cae8-461b-95e9-72a802871f0f'),
('fb79cff8-b1a7-4a56-8b64-8158c7e9b15b', '2022-02-22 12:31:48', '2022-02-22 12:32:40', '<p>abstract</p>', 'bg3.png', 'BIOLOGY 2.pdf', '400.00', 'Title', '<p>toc</p>', '6a1e4a7a-3e2c-48fc-8ab2-b1fee49ffaa8', '7dfda13c-cae8-461b-95e9-72a802871f0f'),
('57955a1d-b67f-4b70-94c1-f7cfb9e68950', '2022-02-22 15:32:16', '2022-02-22 15:33:21', '<p>RGGRGRGRGRGR</p>', 'nat-2.jpg', 'FINAL REPORT OF NDZO DANIEL UGHE.pdf', '123554.00', 'RERRGRGRGGGR', '<p>RGGRGRGRGRGRGR</p>', 'da1e4a7a-3e2c-48fc-8ab2-b1fee49ffaa2', 'e42094d0-441b-4c3d-b25d-bbdd26c6b2c5'),
('abcaf2b5-88b9-4e28-821d-00bf45f245ee', '2022-02-25 08:44:10', '2022-02-25 08:45:01', '<p>book abstract</p>', 'pi.jpg', 'O HumanBio2 2021.pdf', '5000.00', 'book title', '<p>book table of content</p>', '4a1e4a7a-3e2c-48fc-8ab2-b1fee49ffaa0', '7de3efe6-29e7-45ee-8e75-c85cbf8d9597'),
('a0403b1e-e0df-47a4-a5e5-ad146865bf69', '2022-02-25 08:59:25', '2022-02-25 08:59:58', '<p class=\"ql-align-justify\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. In sagittis, neque at convallis vestibulum, nisl felis faucibus enim, ut sollicitudin tellus tellus vitae elit. Quisque eget felis sit amet ex iaculis ultrices. Vestibulum vel ex cursus, egestas metus nec, gravida diam. Nulla pharetra vel velit at lacinia. Fusce turpis arcu, rutrum nec sagittis quis, faucibus eget purus. Nunc rutrum ex sollicitudin erat auctor, accumsan posuere erat molestie. Aenean consequat non risus varius rutrum. Mauris congue interdum nibh, ut auctor leo condimentum pulvinar. Ut ullamcorper nunc vel vehicula semper. In arcu dolor, volutpat et est quis, eleifend egestas justo. In hac habitasse platea dictumst.</p><p class=\"ql-align-justify\">Quisque tortor libero, cursus a risus ut, vehicula eleifend est. Quisque eu ipsum in felis ultricies semper. Aenean nibh augue, dapibus eget enim non, pulvinar hendrerit urna. Mauris neque nunc, vehicula vel urna at, auctor feugiat nunc. Proin lacus mauris, bibendum sed ornare non, fermentum ut massa. Morbi ac ex non nibh suscipit fermentum a et lorem. Donec ac ex leo. Nulla facilisi. Donec a molestie nulla. Aliquam erat volutpat. Integer porttitor aliquam nunc, ut aliquam sapien venenatis non. Integer ac sapien mauris. Quisque consequat bibendum felis nec faucibus. Vivamus egestas venenatis augue sit amet porta. Suspendisse sollicitudin ut nisl id sollicitudin.</p><p><br></p>', 'bg2.jpeg', 'AI report.pdf', '4000.00', 'title 2', '<p class=\"ql-align-justify\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. In sagittis, neque at convallis vestibulum, nisl felis faucibus enim, ut sollicitudin tellus tellus vitae elit. Quisque eget felis sit amet ex iaculis ultrices. Vestibulum vel ex cursus, egestas metus nec, gravida diam. Nulla pharetra vel velit at lacinia. Fusce turpis arcu, rutrum nec sagittis quis, faucibus eget purus. Nunc rutrum ex sollicitudin erat auctor, accumsan posuere erat molestie. Aenean consequat non risus varius rutrum. Mauris congue interdum nibh, ut auctor leo condimentum pulvinar. Ut ullamcorper nunc vel vehicula semper. In arcu dolor, volutpat et est quis, eleifend egestas justo. In hac habitasse platea dictumst.</p><p class=\"ql-align-justify\">Quisque tortor libero, cursus a risus ut, vehicula eleifend est. Quisque eu ipsum in felis ultricies semper. Aenean nibh augue, dapibus eget enim non, pulvinar hendrerit urna. Mauris neque nunc, vehicula vel urna at, auctor feugiat nunc. Proin lacus mauris, bibendum sed ornare non, fermentum ut massa. Morbi ac ex non nibh suscipit fermentum a et lorem. Donec ac ex leo. Nulla facilisi. Donec a molestie nulla. Aliquam erat volutpat. Integer porttitor aliquam nunc, ut aliquam sapien venenatis non. Integer ac sapien mauris. Quisque consequat bibendum felis nec faucibus. Vivamus egestas venenatis augue sit amet porta. Suspendisse sollicitudin ut nisl id sollicitudin.</p><p><br></p>', '4a1e4a7a-3e2c-48fc-8ab2-b1fee49ffaa0', '7de3efe6-29e7-45ee-8e75-c85cbf8d9597'),
('8ac7984d-8bfe-40b1-b2f2-62c65c16dd13', '2022-02-25 09:03:19', '2022-02-25 09:04:09', '<p><span style=\"color: rgb(0, 0, 0);\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. In sagittis, neque at convallis vestibulum, nisl felis faucibus enim, ut sollicitudin tellus tellus vitae elit. Quisque eget felis sit amet ex iaculis ultrices. Vestibulum vel ex cursus, egestas metus nec, gravida diam. Nulla pharetra vel velit at lacinia. Fusce turpis arcu, rutrum nec sagittis quis, faucibus eget purus. Nunc rutrum ex sollicitudin erat auctor, accumsan posuere erat molestie. Aenean consequat non risus varius rutrum. Mauris congue interdum nibh, ut auctor leo condimentum pulvinar. Ut ullamcorper nunc vel vehicula semper. In arcu dolor, volutpat et est quis, eleifend egestas justo. In hac habitasse platea dictumst.</span></p>', 'IMG-20220129-WA0009.jpg', 'DIP assignment.pdf', '10000.00', 'some title here', '<ol><li><span style=\"color: rgb(0, 0, 0);\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. In sagittis, neque at convallis vestibulum, nisl felis faucibus enim, </span></li><li><span style=\"color: rgb(0, 0, 0);\">ut sollicitudin tellus tellus vitae elit. Quisque eget felis sit amet ex iaculis ultrices. Vestibulum vel ex cursus, egestas metus nec, gravida diam. </span></li><li><span style=\"color: rgb(0, 0, 0);\">Nulla pharetra vel velit at lacinia. Fusce turpis arcu, rutrum nec sagittis quis, faucibus eget purus. Nunc rutrum ex sollicitudin erat auctor, </span></li><li><span style=\"color: rgb(0, 0, 0);\">accumsan posuere erat molestie. Aenean consequat non risus varius rutrum. Mauris congue interdum nibh, ut auctor leo condimentum pulvinar. Ut ullamcorper nunc vel vehicula semper. In arcu dolor, volutpat et est quis, eleifend egestas justo. In hac habitasse platea dictumst.</span></li></ol>', '4a1e4a7a-3e2c-48fc-8ab2-b1fee49ffaa0', '7de3efe6-29e7-45ee-8e75-c85cbf8d9597'),
('c62d3add-f35f-4d77-b7c0-4ef7af397fd6', '2022-02-25 09:07:40', '2022-02-25 09:08:01', '<p><span style=\"color: rgb(0, 0, 0);\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. In sagittis, neque at convallis vestibulum, nisl felis faucibus enim, ut sollicitudin tellus tellus vitae elit. Quisque eget felis sit amet ex iaculis ultrices. Vestibulum vel ex cursus, egestas metus nec, gravida diam. Nulla pharetra vel velit at lacinia. Fusce turpis arcu, rutrum nec sagittis quis, faucibus eget purus. Nunc rutrum ex sollicitudin erat auctor, accumsan posuere erat molestie. Aenean consequat non risus varius rutrum. Mauris congue interdum nibh, ut auctor leo condimentum pulvinar. Ut ullamcorper nunc vel vehicula semper. In arcu dolor, volutpat et est quis, eleifend egestas justo. In hac habitasse platea dictumst.</span></p>', 'IMG-20220129-WA0009.jpg', 'chapter5_training_your_own_classifier_using_kaglle.pdf', '10000.00', 'check this out', '<p><span style=\"color: rgb(0, 0, 0);\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. In sagittis, neque at convallis vestibulum, nisl felis faucibus enim, ut sollicitudin tellus tellus vitae elit. Quisque eget felis sit amet ex iaculis ultrices. Vestibulum vel ex cursus, egestas metus nec, gravida diam. Nulla pharetra vel velit at lacinia. Fusce turpis arcu, rutrum nec sagittis quis, faucibus eget purus. Nunc rutrum ex sollicitudin erat auctor, accumsan posuere erat molestie. Aenean consequat non risus varius rutrum. Mauris congue interdum nibh, ut auctor leo condimentum pulvinar. Ut ullamcorper nunc vel vehicula semper. In arcu dolor, volutpat et est quis, eleifend egestas justo. In hac habitasse platea dictumst.</span></p>', '6a1e4a7a-3e2c-48fc-8ab2-b1fee49ffaa8', '7de3efe6-29e7-45ee-8e75-c85cbf8d9597'),
('b2216ebf-a8fa-47ab-9991-8bc084a4223b', '2022-02-25 09:13:34', '2022-02-25 09:13:48', '<p><span style=\"color: rgb(0, 0, 0);\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. In sagittis, neque at convallis vestibulum, nisl felis faucibus enim, ut sollicitudin tellus tellus vitae elit. Quisque eget felis sit amet ex iaculis ultrices. Vestibulum vel ex cursus, egestas metus nec, gravida diam. Nulla pharetra vel velit at lacinia. Fusce turpis arcu, rutrum nec sagittis quis, faucibus eget purus. Nunc rutrum ex sollicitudin erat auctor, accumsan posuere erat molestie. Aenean consequat non risus varius rutrum. Mauris congue interdum nibh, ut auctor leo condimentum pulvinar. Ut ullamcorper nunc vel vehicula semper. In arcu dolor, volutpat et est quis, eleifend egestas justo. In hac habitasse platea dictumst.</span></p>', 'IMG-20220129-WA0009.jpg', 'minute of meeting on the 7th of November 2021.pdf', '100000.00', 'this is a test article', '<p><span style=\"color: rgb(0, 0, 0);\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. In sagittis, neque at convallis vestibulum, nisl felis faucibus enim, ut sollicitudin tellus tellus vitae elit. Quisque eget felis sit amet ex iaculis ultrices. Vestibulum vel ex cursus, egestas metus nec, gravida diam. Nulla pharetra vel velit at lacinia. Fusce turpis arcu, rutrum nec sagittis quis, faucibus eget purus. Nunc rutrum ex sollicitudin erat auctor, accumsan posuere erat molestie. Aenean consequat non risus varius rutrum. Mauris congue interdum nibh, ut auctor leo condimentum pulvinar. Ut ullamcorper nunc vel vehicula semper. In arcu dolor, volutpat et est quis, eleifend egestas justo. In hac habitasse platea dictumst.</span></p>', '4a1e4a7a-3e2c-48fc-8ab2-b1fee49ffaa0', '7de3efe6-29e7-45ee-8e75-c85cbf8d9597'),
('ff54e777-ffb9-4273-944a-fba9e5a76c3a', '2022-02-25 09:24:47', '2022-02-25 09:25:00', '<p><span style=\"color: rgb(0, 0, 0);\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. In sagittis, neque at convallis vestibulum, nisl felis faucibus enim, ut sollicitudin tellus tellus vitae elit. Quisque eget felis sit amet ex iaculis ultrices. Vestibulum vel ex cursus, egestas metus nec, gravida diam. Nulla pharetra vel velit at lacinia. Fusce turpis arcu, rutrum nec sagittis quis, faucibus eget purus. Nunc rutrum ex sollicitudin erat auctor, accumsan posuere erat molestie. Aenean consequat non risus varius rutrum. Mauris congue interdum nibh, ut auctor leo condimentum pulvinar. Ut ullamcorper nunc vel vehicula semper. In arcu dolor, volutpat et est quis, eleifend egestas justo. In hac habitasse platea dictumst.</span></p>', 'IMG-20220129-WA0014.jpg', 'chapter5_training_your_own_classifier_using_kaglle.pdf', '10000.00', 'test article A', '<p><span style=\"color: rgb(0, 0, 0);\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. In sagittis, neque at convallis vestibulum, nisl felis faucibus enim, ut sollicitudin tellus tellus vitae elit. Quisque eget felis sit amet ex iaculis ultrices. Vestibulum vel ex cursus, egestas metus nec, gravida diam. Nulla pharetra vel velit at lacinia. Fusce turpis arcu, rutrum nec sagittis quis, faucibus eget purus. Nunc rutrum ex sollicitudin erat auctor, accumsan posuere erat molestie. Aenean consequat non risus varius rutrum. Mauris congue interdum nibh, ut auctor leo condimentum pulvinar. Ut ullamcorper nunc vel vehicula semper. In arcu dolor, volutpat et est quis, eleifend egestas justo. In hac habitasse platea dictumst.</span></p>', 'la1e4a7a-3e2c-48fc-8ab2-b1fee49ffaab', '7de3efe6-29e7-45ee-8e75-c85cbf8d9597'),
('fdd40341-d6c0-4c26-9daf-c0c0d49ecd9b', '2022-02-25 09:29:01', '2022-02-25 09:29:18', '<p><span style=\"color: rgb(0, 0, 0);\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. In sagittis, neque at convallis vestibulum, nisl felis faucibus enim, ut sollicitudin tellus tellus vitae elit. Quisque eget felis sit amet ex iaculis ultrices. Vestibulum vel ex cursus, egestas metus nec, gravida diam. Nulla pharetra vel velit at lacinia. Fusce turpis arcu, rutrum nec sagittis quis, faucibus eget purus. Nunc rutrum ex sollicitudin erat auctor, accumsan posuere erat molestie. Aenean consequat non risus varius rutrum. Mauris congue interdum nibh, ut auctor leo condimentum pulvinar. Ut ullamcorper nunc vel vehicula semper. In arcu dolor, volutpat et est quis, eleifend egestas justo. In hac habitasse platea dictumst.</span></p>', 'IMG-20220129-WA0009.jpg', 'Economics 2.pdf', '20100.00', 'test art', '<p><span style=\"color: rgb(0, 0, 0);\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. In sagittis, neque at convallis vestibulum, nisl felis faucibus enim, ut sollicitudin tellus tellus vitae elit. Quisque eget felis sit amet ex iaculis ultrices. Vestibulum vel ex cursus, egestas metus nec, gravida diam. Nulla pharetra vel velit at lacinia. Fusce turpis arcu, rutrum nec sagittis quis, faucibus eget purus. Nunc rutrum ex sollicitudin erat auctor, accumsan posuere erat molestie. Aenean consequat non risus varius rutrum. Mauris congue interdum nibh, ut auctor leo condimentum pulvinar. Ut ullamcorper nunc vel vehicula semper. In arcu dolor, volutpat et est quis, eleifend egestas justo. In hac habitasse platea dictumst.</span></p>', '6a1e4a7a-3e2c-48fc-8ab2-b1fee49ffaa8', '7de3efe6-29e7-45ee-8e75-c85cbf8d9597'),
('441dc4fb-be7c-405e-b355-ec7ca3bbf8fb', '2022-02-25 09:30:52', '2022-02-25 09:31:09', '<p><span style=\"color: rgb(0, 0, 0);\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. In sagittis, neque at convallis vestibulum, nisl felis faucibus enim, ut sollicitudin tellus tellus vitae elit. Quisque eget felis sit amet ex iaculis ultrices. Vestibulum vel ex cursus, egestas metus nec, gravida diam. Nulla pharetra vel velit at lacinia. Fusce turpis arcu, rutrum nec sagittis quis, faucibus eget purus. Nunc rutrum ex sollicitudin erat auctor, accumsan posuere erat molestie. Aenean consequat non risus varius rutrum. Mauris congue interdum nibh, ut auctor leo condimentum pulvinar. Ut ullamcorper nunc vel vehicula semper. In arcu dolor, volutpat et est quis, eleifend egestas justo. In hac habitasse platea dictumst.</span></p>', 'IMG-20220129-WA0009.jpg', 'chapter5_training_your_own_classifier_using_kaglle.pdf', '12000.00', 'some test article', '<p><span style=\"color: rgb(0, 0, 0);\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. In sagittis, neque at convallis vestibulum, nisl felis faucibus enim, ut sollicitudin tellus tellus vitae elit. Quisque eget felis sit amet ex iaculis ultrices. Vestibulum vel ex cursus, egestas metus nec, gravida diam. Nulla pharetra vel velit at lacinia. Fusce turpis arcu, rutrum nec sagittis quis, faucibus eget purus. Nunc rutrum ex sollicitudin erat auctor, accumsan posuere erat molestie. Aenean consequat non risus varius rutrum. Mauris congue interdum nibh, ut auctor leo condimentum pulvinar. Ut ullamcorper nunc vel vehicula semper. In arcu dolor, volutpat et est quis, eleifend egestas justo. In hac habitasse platea dictumst.</span></p>', 'da1e4a7a-3e2c-48fc-8ab2-b1fee49ffaa2', '7de3efe6-29e7-45ee-8e75-c85cbf8d9597'),
('eeb2b6d2-2b69-42dd-9f6e-efd2d4a75569', '2022-02-25 09:38:05', '2022-02-25 09:38:16', '<p><span style=\"color: rgb(0, 0, 0);\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. In sagittis, neque at convallis vestibulum, nisl felis faucibus enim, ut sollicitudin tellus tellus vitae elit. Quisque eget felis sit amet ex iaculis ultrices. Vestibulum vel ex cursus, egestas metus nec, gravida diam. Nulla pharetra vel velit at lacinia. Fusce turpis arcu, rutrum nec sagittis quis, faucibus eget purus. Nunc rutrum ex sollicitudin erat auctor, accumsan posuere erat molestie. Aenean consequat non risus varius rutrum. Mauris congue interdum nibh, ut auctor leo condimentum pulvinar. Ut ullamcorper nunc vel vehicula semper. In arcu dolor, volutpat et est quis, eleifend egestas justo. In hac habitasse platea dictumst.</span></p>', 'IMG-20220129-WA0017.jpg', 'minute of meeting on the 7th of November 2021.pdf', '21000.00', 'some test articles here', '<p><span style=\"color: rgb(0, 0, 0);\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. In sagittis, neque at convallis vestibulum, nisl felis faucibus enim, ut sollicitudin tellus tellus vitae elit. Quisque eget felis sit amet ex iaculis ultrices. Vestibulum vel ex cursus, egestas metus nec, gravida diam. Nulla pharetra vel velit at lacinia. Fusce turpis arcu, rutrum nec sagittis quis, faucibus eget purus. Nunc rutrum ex sollicitudin erat auctor, accumsan posuere erat molestie. Aenean consequat non risus varius rutrum. Mauris congue interdum nibh, ut auctor leo condimentum pulvinar. Ut ullamcorper nunc vel vehicula semper. In arcu dolor, volutpat et est quis, eleifend egestas justo. In hac habitasse platea dictumst.</span></p>', '4a1e4a7a-3e2c-48fc-8ab2-b1fee49ffaa0', '7de3efe6-29e7-45ee-8e75-c85cbf8d9597'),
('aa2c5359-52ec-45c8-808e-31e357dcaffc', '2022-02-25 10:07:22', '2022-02-25 10:08:42', '<p class=\"ql-align-justify\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse posuere neque ut lectus vehicula, id pharetra felis fringilla. Nulla ultrices tortor at turpis imperdiet imperdiet et vel neque. Suspendisse potenti. Sed non luctus odio, sit amet aliquam nisi. Proin sit amet facilisis nisi, rutrum condimentum neque. Quisque bibendum et lorem ut lobortis. Proin bibendum, dolor sit amet tempor lacinia, mi odio pulvinar neque, quis interdum velit nisl a orci. Proin semper eros risus, sed imperdiet dui egestas at. Curabitur sagittis ut tortor ac accumsan. Nam vulputate eros risus, ultricies pretium dui euismod vitae. Nulla rhoncus sapien vel sem mollis blandit. Etiam id nisi quis odio commodo accumsan sit amet ut nisi.</p><p class=\"ql-align-justify\">Etiam semper lacinia feugiat. Fusce semper massa eu est ultricies sodales. Ut non vehicula nisl. Vivamus ut metus velit. Suspendisse condimentum mi nunc, vitae semper quam porta sit amet. Sed tincidunt, velit eget tristique dictum, massa purus ullamcorper risus, eget aliquet eros odio commodo arcu. Interdum et malesuada fames ac ante ipsum primis in faucibus. Nulla euismod dui lectus, in aliquam velit gravida at. Suspendisse potenti. Vivamus vel mauris id nunc ullamcorper efficitur in euismod risus. Quisque sit amet metus est. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Nam id consequat odio, in rutrum purus.</p><p><br></p>', 'blog.JPG', 'chapter5_training_your_own_classifier_using_kaglle.pdf', '4000.00', 'titleeeeee', '<ol><li class=\"ql-align-justify\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse posuere neque ut lectus vehicula, id pharetra felis fringilla.</li><li class=\"ql-align-justify\"> Nulla ultrices tortor at turpis imperdiet imperdiet et vel neque. Suspendisse potenti. Sed non luctus odio, sit amet aliquam nisi. Proin sit amet facilisis nisi, rutrum condimentum neque. </li><li class=\"ql-align-justify\">Quisque bibendum et lorem ut lobortis. Proin bibendum, dolor sit amet tempor lacinia, mi odio pulvinar neque, quis interdum velit nisl a orci.</li><li class=\"ql-align-justify\"> Proin semper eros risus, sed imperdiet dui egestas at. Curabitur sagittis ut tortor ac accumsan. Nam vulputate eros risus, ultricies pretium dui euismod vitae. </li><li class=\"ql-align-justify\">Nulla rhoncus sapien vel sem mollis blandit. Etiam id nisi quis odio commodo accumsan sit amet ut nisi.</li></ol><p class=\"ql-align-justify\">Etiam semper lacinia feugiat. </p><p class=\"ql-align-justify\"><br></p><p class=\"ql-align-justify\">Fusce semper massa eu est ultricies sodales. Ut non vehicula nisl.</p><p class=\"ql-align-justify\"> Vivamus ut metus velit. Suspendisse condimentum mi nunc, vitae semper quam porta sit amet. Sed tincidunt, velit eget tristique dictum, massa purus ullamcorper risus, eget aliquet eros odio commodo arcu. Interdum et malesuada fames ac ante ipsum primis in faucibus. Nulla euismod dui lectus, in aliquam velit gravida at. Suspendisse potenti. Vivamus vel mauris id nunc ullamcorper efficitur in euismod risus. Quisque sit amet metus est. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Nam id consequat odio, in rutrum purus.</p><p><br></p>', 'la1e4a7a-3e2c-48fc-8ab2-b1fee49ffaab', '7de3efe6-29e7-45ee-8e75-c85cbf8d9597');

-- --------------------------------------------------------

--
-- Table structure for table `article_contributors`
--

CREATE TABLE `article_contributors` (
  `article_id` varchar(50) NOT NULL,
  `contributor_id` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `article_contributors`
--

INSERT INTO `article_contributors` (`article_id`, `contributor_id`) VALUES
('44725fe1-2ef7-4210-aa89-b2cc0b331a36', '05db749d-0a17-4f7e-895a-a55c696934fe'),
('44725fe1-2ef7-4210-aa89-b2cc0b331a36', 'afe73533-4206-4013-ab4b-d3ddd62e51fc'),
('44725fe1-2ef7-4210-aa89-b2cc0b331a36', '5b5fb22f-85e8-4095-a010-e75a7afa3f29'),
('0348dc14-e8af-4502-8abc-753b2d8d63ce', 'c2e26cae-1431-4a6b-a38a-62f4a275d6ef'),
('0348dc14-e8af-4502-8abc-753b2d8d63ce', '5af1461e-446a-4a1a-ac07-35e7dfcd7b1a'),
('0348dc14-e8af-4502-8abc-753b2d8d63ce', '951ab7cb-29fd-4f0b-8d4a-6e1192dd16fc'),
('ac861616-225e-47ec-8ed1-250f2f62729e', 'bbe510e0-ff1d-4298-8c60-a09bd89d3a7b'),
('ac861616-225e-47ec-8ed1-250f2f62729e', 'f606a2d1-40c5-4ce5-bfd3-b90e1c33b8c3'),
('536eb45f-52e0-4f7d-9be8-7fa7f68b848d', '0f7721ff-c989-4139-83e6-617002f56e4c'),
('536eb45f-52e0-4f7d-9be8-7fa7f68b848d', 'f1ae5018-85f4-4bc1-9a9f-ea49b0358605'),
('3e98da1c-6b1b-4b8f-bcbf-7cb6088c071c', '669dce7d-3594-47b1-beba-f7e717cffd6a'),
('3e98da1c-6b1b-4b8f-bcbf-7cb6088c071c', '75a984f2-61f5-4192-ab22-08d836be7a0d'),
('3218b65c-e748-482f-ab85-a3b16346c1f7', '435eadd9-923b-4a9e-8580-2c903dc6a512'),
('3218b65c-e748-482f-ab85-a3b16346c1f7', '2834b29d-b1f8-4f56-93c8-75f6a386f143'),
('95fc37db-9c8c-4e30-bb25-8de15a9708e4', 'a0aa344f-65d2-45da-ad17-e055c2cbd087'),
('95fc37db-9c8c-4e30-bb25-8de15a9708e4', '971d27ba-4c73-45a6-8bf0-b442a50f5e55'),
('cd2369d7-bbe4-4c06-88bf-9f77d52ee81c', '0b81b0db-f00f-4179-9bdb-489091d6e821'),
('cd2369d7-bbe4-4c06-88bf-9f77d52ee81c', '7b3cb4a6-6aad-4d73-a7d0-5823fc87a645'),
('b6b4a361-69b0-485c-b0ad-25d49ec002b3', '1ba1eead-6699-45be-bd43-b5d51ed2b740'),
('b6b4a361-69b0-485c-b0ad-25d49ec002b3', 'ebcc4d1f-2aac-4602-ab9c-bd62bbe18914'),
('f3b61a15-33e9-4c2a-b476-8e6ff5ad4dcd', 'cf76652e-dfc0-4f6b-b138-6b8133c1d4eb'),
('f3b61a15-33e9-4c2a-b476-8e6ff5ad4dcd', '76769829-7db2-4849-a8b8-abc29143e049'),
('22b0988c-044b-45b8-ab12-f8982d28432b', '2cd18e6f-8a93-4782-86bb-1f4b1b0a6e31'),
('283d6dd1-2075-46ac-b378-470821b84370', 'eeec8da5-771d-428d-89c4-c970d3e17090'),
('40c78872-77cf-4914-9007-3adbd656ece2', '07d47fe1-7a2f-4af5-8ccb-fd3c03dabd54'),
('40c78872-77cf-4914-9007-3adbd656ece2', 'dff94e7d-d5a2-4fa8-b131-365e93ca5b78'),
('40c78872-77cf-4914-9007-3adbd656ece2', '31386129-40bf-4b71-b4a7-63d7ba125010'),
('a0297da7-ef7c-461c-ac76-995ecbc442fe', 'f6599009-e92b-4353-ab07-dbcc44af999f'),
('a0297da7-ef7c-461c-ac76-995ecbc442fe', '35af5ab6-de48-4583-b0d1-1c9496297588'),
('a0297da7-ef7c-461c-ac76-995ecbc442fe', 'c2c9a399-e5f1-40d4-9e08-f1419713059b'),
('a0297da7-ef7c-461c-ac76-995ecbc442fe', '7c3fe6b1-6834-4016-bc05-c87c83cd8dcd'),
('728303b5-8619-4ee6-b57f-0ba44bcac2bc', 'eb769844-6574-482f-887d-42d669d2c581'),
('728303b5-8619-4ee6-b57f-0ba44bcac2bc', '5aad7b88-365d-4a7c-b670-c1822a41953f'),
('728303b5-8619-4ee6-b57f-0ba44bcac2bc', '2d73c274-8a85-46a8-8aad-a9bf9f0fa216'),
('728303b5-8619-4ee6-b57f-0ba44bcac2bc', 'f0a4cc4e-965c-445a-b24e-aef267d84911'),
('84bb4faa-f0b2-4cf6-a666-6a1215af5589', 'ee81ca99-1199-4a7d-8b56-d2b707b68c20'),
('549431f9-3b8e-47b1-8d90-2d82a9181854', '2dfb2946-0038-49da-a88a-e89eba2c9442'),
('a11c5773-657c-4f76-8ff3-9fc573e447f4', 'aabbd954-3135-4d9f-8db7-66b9f2ad16b5'),
('a0a98162-f304-4f24-9629-3154a0936aff', 'ced444ac-ba85-4477-98ca-c4bf2239403d'),
('fb79cff8-b1a7-4a56-8b64-8158c7e9b15b', '5bb8c1b4-22fe-4293-a3e2-b0fd734d9ab0'),
('fb79cff8-b1a7-4a56-8b64-8158c7e9b15b', '12765cea-1d0e-4fc1-a58e-d611e6d41cef'),
('fb79cff8-b1a7-4a56-8b64-8158c7e9b15b', 'ab7df82f-9c1f-4719-ab99-5fe949553b0a'),
('3efa5103-68a3-4e1b-9f06-4a268d65a2b9', '87be830d-e5f3-4987-afae-0f5494c93acd'),
('3efa5103-68a3-4e1b-9f06-4a268d65a2b9', '45cc57b2-839a-4bdf-aa10-fcc8f7901d3f'),
('3efa5103-68a3-4e1b-9f06-4a268d65a2b9', '35c3139d-ffa2-47e9-9283-eac579e8aa1f'),
('3efa5103-68a3-4e1b-9f06-4a268d65a2b9', '8b6ef6f2-c8a8-4b59-a155-1b7bae851abf'),
('3a2da289-b660-4237-bfbd-d9278daceaaa', 'c1772a61-50db-4517-814f-35a03c7086d3'),
('3a2da289-b660-4237-bfbd-d9278daceaaa', '00777462-523b-494e-9f8d-d05069512843'),
('3a2da289-b660-4237-bfbd-d9278daceaaa', '24e93c3e-0d7d-455b-84ce-c8a2d8ccce83'),
('3a2da289-b660-4237-bfbd-d9278daceaaa', '820a5de1-ab47-4059-a2fd-6c3ed2d01c52'),
('da9c5f91-d53f-40b6-89d8-9cc9261667da', 'e549a3e3-9493-44cd-bade-cf345644f575'),
('da9c5f91-d53f-40b6-89d8-9cc9261667da', 'd67b9bbe-65a0-4914-8cf4-b968a1bcb780'),
('da9c5f91-d53f-40b6-89d8-9cc9261667da', 'a61ee610-6065-4224-b815-d01dc7a278e7'),
('da9c5f91-d53f-40b6-89d8-9cc9261667da', '1cfe2856-d143-4750-8eed-9440e4313a93'),
('de096c0a-dd36-4351-a379-080fa58c25c3', 'e72f0ee5-59a2-45bf-8ba8-f4794bbdf153'),
('de096c0a-dd36-4351-a379-080fa58c25c3', '18966d8b-9279-4e64-b46d-cbe3610c6a80'),
('de096c0a-dd36-4351-a379-080fa58c25c3', 'cccce891-1dea-4e4a-90cc-d8bdff5527af'),
('de096c0a-dd36-4351-a379-080fa58c25c3', '5bcd4a59-cee4-4537-b098-49550124c8e7'),
('2c062a3a-89e7-40f6-a337-d4105dc3362e', '8f5aaea6-b5a6-43d2-a935-2976c7304930'),
('2c062a3a-89e7-40f6-a337-d4105dc3362e', '9403ba33-6e64-47a1-a1c7-36866f5e77b7'),
('2c062a3a-89e7-40f6-a337-d4105dc3362e', 'b83a7299-c3ae-4cd4-85dd-8ca0e1932d71'),
('2c062a3a-89e7-40f6-a337-d4105dc3362e', '7e2d5f8f-dd88-464f-a4dc-34b04e990368'),
('57955a1d-b67f-4b70-94c1-f7cfb9e68950', '403ed7fd-4a27-46b0-8494-f8f19e1d1dd6'),
('abcaf2b5-88b9-4e28-821d-00bf45f245ee', 'cb84cefa-75c8-41d6-8a4f-23f944d21d11'),
('abcaf2b5-88b9-4e28-821d-00bf45f245ee', '577333d1-b1ca-471f-98c3-1dbc4b879203'),
('abcaf2b5-88b9-4e28-821d-00bf45f245ee', 'c78765ca-8295-402f-b47f-d2083db3d8fc'),
('a0403b1e-e0df-47a4-a5e5-ad146865bf69', 'cc82a418-62eb-42a5-8e81-14de4f2f9881'),
('a0403b1e-e0df-47a4-a5e5-ad146865bf69', '9a7f0fc9-cd17-4540-947f-ef084092e0b1'),
('a0403b1e-e0df-47a4-a5e5-ad146865bf69', '23381b67-a18f-4d39-ac4c-d69c54de8e3e'),
('8ac7984d-8bfe-40b1-b2f2-62c65c16dd13', '50dfc731-84e4-407d-b55c-97f038ac4e66'),
('8ac7984d-8bfe-40b1-b2f2-62c65c16dd13', '24e0125d-5e59-4113-8fb8-3b6741e952b2'),
('8ac7984d-8bfe-40b1-b2f2-62c65c16dd13', '2c18a4b5-2628-4e80-9e28-bb6e0d79f39e'),
('8ac7984d-8bfe-40b1-b2f2-62c65c16dd13', '7f54b16c-4fd5-48ac-8ddb-573fc0dbfdc1'),
('8ac7984d-8bfe-40b1-b2f2-62c65c16dd13', '8ebf227f-955d-486f-8035-3108292d8da6'),
('c62d3add-f35f-4d77-b7c0-4ef7af397fd6', '5d430422-42ec-4db6-b2e7-5a20c23ddb14'),
('c62d3add-f35f-4d77-b7c0-4ef7af397fd6', 'bb41b233-c704-448b-bd06-c3bdbc13041f'),
('c62d3add-f35f-4d77-b7c0-4ef7af397fd6', 'f4e22690-99bd-4c2b-ae38-e401ef5a3f75'),
('ec30b32f-6771-441d-aec8-d625bee46069', '4bd2f293-2abc-424b-99be-092eefd8c64b'),
('ec30b32f-6771-441d-aec8-d625bee46069', '93bca3da-e75f-4857-9d37-8b472836510d'),
('ec30b32f-6771-441d-aec8-d625bee46069', 'a3c975fb-ed0d-4619-b2c3-db2ba91910bb'),
('ec30b32f-6771-441d-aec8-d625bee46069', 'b8949000-e39e-4262-982d-048e4b43d58d'),
('ec30b32f-6771-441d-aec8-d625bee46069', '858dd02f-b102-4891-909d-b2e329ae45ed'),
('ec30b32f-6771-441d-aec8-d625bee46069', '04f62468-9169-4444-8bde-a6056410141a'),
('b2216ebf-a8fa-47ab-9991-8bc084a4223b', 'dcf5d581-7f16-411c-82c4-986e2082e0d4'),
('b2216ebf-a8fa-47ab-9991-8bc084a4223b', '0f8d7715-0eea-40a4-8e46-d4896d3c49eb'),
('b2216ebf-a8fa-47ab-9991-8bc084a4223b', '07b6e575-d2e9-410a-920c-2f7937e39e67'),
('f6be48b1-f4f9-48cf-a5ab-d04c736aa74c', 'bc3c83e8-0da4-4744-91a2-6b97757cf7be'),
('f6be48b1-f4f9-48cf-a5ab-d04c736aa74c', 'fd39fcb1-bc43-4f77-83f2-26ee0ae271de'),
('f6be48b1-f4f9-48cf-a5ab-d04c736aa74c', '359a75c8-ca30-4ec7-a652-95c102354d66'),
('6cc4e5bc-3843-4869-a13b-7f51654f6624', '9220f086-4ed8-45bf-b85a-d36d4fe16d90'),
('6cc4e5bc-3843-4869-a13b-7f51654f6624', '1680509a-d8af-4188-a0b0-827eb0af1837'),
('6cc4e5bc-3843-4869-a13b-7f51654f6624', 'd9b43185-c66f-4933-b0d0-f0ea43be7853'),
('ff54e777-ffb9-4273-944a-fba9e5a76c3a', 'fe64f85d-b9d8-47e6-b0d1-6c9591ad6c47'),
('ff54e777-ffb9-4273-944a-fba9e5a76c3a', 'cfc8cf45-fdbd-4188-98c4-f4248b3b2505'),
('ff54e777-ffb9-4273-944a-fba9e5a76c3a', '72a1069b-9754-4555-ab67-7b9bdc86e24b'),
('fdd40341-d6c0-4c26-9daf-c0c0d49ecd9b', '80ee7554-cfc2-4143-9f47-0c929f556e98'),
('fdd40341-d6c0-4c26-9daf-c0c0d49ecd9b', '09f6ef53-d2a3-4317-b1ef-025692fac596'),
('fdd40341-d6c0-4c26-9daf-c0c0d49ecd9b', 'f9caf034-300e-4cca-975c-abe13777362c'),
('441dc4fb-be7c-405e-b355-ec7ca3bbf8fb', '1a119e69-b338-4319-b3fb-e639d44e59f1'),
('441dc4fb-be7c-405e-b355-ec7ca3bbf8fb', 'f6351c5a-7230-4801-ae92-8ab19cdb2d11'),
('eeb2b6d2-2b69-42dd-9f6e-efd2d4a75569', 'df00a3f0-611b-41ad-a2ca-d4d54f36d667'),
('eeb2b6d2-2b69-42dd-9f6e-efd2d4a75569', '33028a2d-38f9-4ec8-8947-8540b055c91c'),
('a2b388cc-d4f6-486b-8c96-92482620c3c4', '1e533161-a6b4-4d58-b8d7-6559bf7ec7da'),
('a2b388cc-d4f6-486b-8c96-92482620c3c4', '10292099-9db0-4d2e-b233-3234614ad625'),
('a2b388cc-d4f6-486b-8c96-92482620c3c4', '98b55c23-4dc2-4a4e-89f0-c725be9d3383'),
('aa2c5359-52ec-45c8-808e-31e357dcaffc', 'dcd7bdf8-4061-4b7e-9349-176f93da7347'),
('aa2c5359-52ec-45c8-808e-31e357dcaffc', '2ef172b2-63ab-4887-a34f-89be00859257'),
('aa2c5359-52ec-45c8-808e-31e357dcaffc', '665aa414-b929-4bb1-ac57-d79f5d7ca40f');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` varchar(50) NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
('4a1e4a7a-3e2c-48fc-8ab2-b1fee49ffaa5', 'SCIENCE'),
('4a1e4a7a-3e2c-48fc-8ab2-b1fee49ffaa2', 'TECHNOLOGY'),
('da1e4a7a-3e2c-48fc-8ab2-b1fee49ffaa2', 'HEALTH'),
('ga1e4a7a-3e2c-48fc-8ab2-b1fee49ffaa5', 'ARTS'),
('la1e4a7a-3e2c-48fc-8ab2-b1fee49ffaab', 'COMPUTER SCIENCE'),
('4a1e4a7a-3e2c-48fc-8ab2-b1fee49ffaa6', 'COMPUTER ENGINEERING'),
('4a1e4a7a-3e2c-48fc-8ab2-b1fee49ffaa7', 'PUBLIC WORKS'),
('4a1e4a7a-3e2c-48fc-8ab2-b1fee49ffaa0', 'OPERATING SYSTEM'),
('6a1e4a7a-3e2c-48fc-8ab2-b1fee49ffaa8', 'SOFTWARE ENGINEERING'),
('3f46bf0d-a4e6-4373-befe-af3582f9cffa', 'LIFE');

-- --------------------------------------------------------

--
-- Table structure for table `contributor`
--

CREATE TABLE `contributor` (
  `id` varchar(50) NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `contributor`
--

INSERT INTO `contributor` (`id`, `name`) VALUES
('05db749d-0a17-4f7e-895a-a55c696934fe', 'Babi Beulah'),
('afe73533-4206-4013-ab4b-d3ddd62e51fc', ' Ruth Vifieh'),
('5b5fb22f-85e8-4095-a010-e75a7afa3f29', ' Fiona'),
('c2e26cae-1431-4a6b-a38a-62f4a275d6ef', 'Babi Beulah'),
('5af1461e-446a-4a1a-ac07-35e7dfcd7b1a', ' Ruth Vifieh'),
('951ab7cb-29fd-4f0b-8d4a-6e1192dd16fc', ' Suh Edmond'),
('bbe510e0-ff1d-4298-8c60-a09bd89d3a7b', 'Fiona Anye'),
('f606a2d1-40c5-4ce5-bfd3-b90e1c33b8c3', ' Morelle Hatou'),
('0f7721ff-c989-4139-83e6-617002f56e4c', 'Fiona Anye'),
('f1ae5018-85f4-4bc1-9a9f-ea49b0358605', ' Daniel'),
('669dce7d-3594-47b1-beba-f7e717cffd6a', 'Peter Doe'),
('75a984f2-61f5-4192-ab22-08d836be7a0d', ' James Peterson'),
('435eadd9-923b-4a9e-8580-2c903dc6a512', 'ChiMah'),
('2834b29d-b1f8-4f56-93c8-75f6a386f143', ' Deray'),
('a0aa344f-65d2-45da-ad17-e055c2cbd087', 'Thomas C'),
('971d27ba-4c73-45a6-8bf0-b442a50f5e55', ' Petterson'),
('0b81b0db-f00f-4179-9bdb-489091d6e821', 'Denis Ritche'),
('7b3cb4a6-6aad-4d73-a7d0-5823fc87a645', ' Henderson'),
('1ba1eead-6699-45be-bd43-b5d51ed2b740', 'Mary'),
('ebcc4d1f-2aac-4602-ab9c-bd62bbe18914', ' Joe'),
('cf76652e-dfc0-4f6b-b138-6b8133c1d4eb', 'Emma Johnson'),
('76769829-7db2-4849-a8b8-abc29143e049', ' Kate Doe'),
('2cd18e6f-8a93-4782-86bb-1f4b1b0a6e31', 'string'),
('eeec8da5-771d-428d-89c4-c970d3e17090', 'Banlon Koaman'),
('07d47fe1-7a2f-4af5-8ccb-fd3c03dabd54', 'Ndzo'),
('dff94e7d-d5a2-4fa8-b131-365e93ca5b78', ' Daniel'),
('31386129-40bf-4b71-b4a7-63d7ba125010', ' Ughe'),
('f6599009-e92b-4353-ab07-dbcc44af999f', 'Repudiandae laboris'),
('35af5ab6-de48-4583-b0d1-1c9496297588', ' DANIEL'),
('c2c9a399-e5f1-40d4-9e08-f1419713059b', ' NDZO'),
('7c3fe6b1-6834-4016-bc05-c87c83cd8dcd', ' ANYE'),
('eb769844-6574-482f-887d-42d669d2c581', 'Repudiandae laboris'),
('5aad7b88-365d-4a7c-b670-c1822a41953f', ' DANIEL'),
('2d73c274-8a85-46a8-8aad-a9bf9f0fa216', ' NDZO'),
('f0a4cc4e-965c-445a-b24e-aef267d84911', ' ANYE'),
('ee81ca99-1199-4a7d-8b56-d2b707b68c20', 'Sit est mollit conse'),
('2dfb2946-0038-49da-a88a-e89eba2c9442', 'Sit est mollit conse'),
('aabbd954-3135-4d9f-8db7-66b9f2ad16b5', 'Sit est mollit conse'),
('ced444ac-ba85-4477-98ca-c4bf2239403d', 'Sit est mollit conse'),
('5bb8c1b4-22fe-4293-a3e2-b0fd734d9ab0', 'a'),
('12765cea-1d0e-4fc1-a58e-d611e6d41cef', ' b'),
('ab7df82f-9c1f-4719-ab99-5fe949553b0a', ' c'),
('87be830d-e5f3-4987-afae-0f5494c93acd', 'WISEMAN'),
('45cc57b2-839a-4bdf-aa10-fcc8f7901d3f', ' DANIEL'),
('35c3139d-ffa2-47e9-9283-eac579e8aa1f', ' NDZO'),
('8b6ef6f2-c8a8-4b59-a155-1b7bae851abf', ' UGHE'),
('c1772a61-50db-4517-814f-35a03c7086d3', 'WISEMAN'),
('00777462-523b-494e-9f8d-d05069512843', ' DANIEL'),
('24e93c3e-0d7d-455b-84ce-c8a2d8ccce83', ' NDZO'),
('820a5de1-ab47-4059-a2fd-6c3ed2d01c52', ' UGHE'),
('e549a3e3-9493-44cd-bade-cf345644f575', 'WISEMAN'),
('d67b9bbe-65a0-4914-8cf4-b968a1bcb780', ' DANIEL'),
('a61ee610-6065-4224-b815-d01dc7a278e7', ' NDZO'),
('1cfe2856-d143-4750-8eed-9440e4313a93', ' UGHE'),
('e72f0ee5-59a2-45bf-8ba8-f4794bbdf153', 'WISEMAN'),
('18966d8b-9279-4e64-b46d-cbe3610c6a80', ' DANIEL'),
('cccce891-1dea-4e4a-90cc-d8bdff5527af', ' NDZO'),
('5bcd4a59-cee4-4537-b098-49550124c8e7', ' UGHE'),
('8f5aaea6-b5a6-43d2-a935-2976c7304930', 'WISEMAN'),
('9403ba33-6e64-47a1-a1c7-36866f5e77b7', ' DANIEL'),
('b83a7299-c3ae-4cd4-85dd-8ca0e1932d71', ' NDZO'),
('7e2d5f8f-dd88-464f-a4dc-34b04e990368', ' UGHE'),
('403ed7fd-4a27-46b0-8494-f8f19e1d1dd6', 'GRGRGRGRGR'),
('cb84cefa-75c8-41d6-8a4f-23f944d21d11', 'me'),
('577333d1-b1ca-471f-98c3-1dbc4b879203', ' you'),
('c78765ca-8295-402f-b47f-d2083db3d8fc', ' i'),
('cc82a418-62eb-42a5-8e81-14de4f2f9881', 'Me'),
('9a7f0fc9-cd17-4540-947f-ef084092e0b1', ' John'),
('23381b67-a18f-4d39-ac4c-d69c54de8e3e', ' Peter'),
('50dfc731-84e4-407d-b55c-97f038ac4e66', 'a'),
('24e0125d-5e59-4113-8fb8-3b6741e952b2', 'b'),
('2c18a4b5-2628-4e80-9e28-bb6e0d79f39e', 'c'),
('7f54b16c-4fd5-48ac-8ddb-573fc0dbfdc1', ''),
('8ebf227f-955d-486f-8035-3108292d8da6', 'd'),
('5d430422-42ec-4db6-b2e7-5a20c23ddb14', 'chi'),
('bb41b233-c704-448b-bd06-c3bdbc13041f', ' mah'),
('f4e22690-99bd-4c2b-ae38-e401ef5a3f75', ' chi-mah'),
('4bd2f293-2abc-424b-99be-092eefd8c64b', 'ddsda'),
('93bca3da-e75f-4857-9d37-8b472836510d', 'dadada'),
('a3c975fb-ed0d-4619-b2c3-db2ba91910bb', 'da'),
('b8949000-e39e-4262-982d-048e4b43d58d', 'da'),
('858dd02f-b102-4891-909d-b2e329ae45ed', 'dad'),
('04f62468-9169-4444-8bde-a6056410141a', 'a'),
('dcf5d581-7f16-411c-82c4-986e2082e0d4', 'dan'),
('0f8d7715-0eea-40a4-8e46-d4896d3c49eb', ' ndzo'),
('07b6e575-d2e9-410a-920c-2f7937e39e67', ' chi'),
('bc3c83e8-0da4-4744-91a2-6b97757cf7be', 'dan'),
('fd39fcb1-bc43-4f77-83f2-26ee0ae271de', 'dan'),
('359a75c8-ca30-4ec7-a652-95c102354d66', 'dan'),
('9220f086-4ed8-45bf-b85a-d36d4fe16d90', 'dan'),
('1680509a-d8af-4188-a0b0-827eb0af1837', 'dan'),
('d9b43185-c66f-4933-b0d0-f0ea43be7853', 'chi'),
('fe64f85d-b9d8-47e6-b0d1-6c9591ad6c47', 'Ndzo'),
('cfc8cf45-fdbd-4188-98c4-f4248b3b2505', ' Daniel'),
('72a1069b-9754-4555-ab67-7b9bdc86e24b', ' Ughe'),
('80ee7554-cfc2-4143-9f47-0c929f556e98', 'Babi'),
('09f6ef53-d2a3-4317-b1ef-025692fac596', ' Ndzo'),
('f9caf034-300e-4cca-975c-abe13777362c', ' Chi'),
('1a119e69-b338-4319-b3fb-e639d44e59f1', 'Ndzo Daniel'),
('f6351c5a-7230-4801-ae92-8ab19cdb2d11', ' Babi'),
('df00a3f0-611b-41ad-a2ca-d4d54f36d667', 'dan'),
('33028a2d-38f9-4ec8-8947-8540b055c91c', ' ndzo'),
('1e533161-a6b4-4d58-b8d7-6559bf7ec7da', 'dadad'),
('10292099-9db0-4d2e-b233-3234614ad625', 'dadadad'),
('98b55c23-4dc2-4a4e-89f0-c725be9d3383', 'dadada'),
('dcd7bdf8-4061-4b7e-9349-176f93da7347', 'chi'),
('2ef172b2-63ab-4887-a34f-89be00859257', ' mah'),
('665aa414-b929-4bb1-ac57-d79f5d7ca40f', ' claudette');

-- --------------------------------------------------------

--
-- Table structure for table `refresh_token`
--

CREATE TABLE `refresh_token` (
  `id` bigint(20) NOT NULL,
  `expiry_date` datetime NOT NULL,
  `token` varchar(255) NOT NULL,
  `user_id` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `refresh_token`
--

INSERT INTO `refresh_token` (`id`, `expiry_date`, `token`, `user_id`) VALUES
(1, '2022-01-29 13:58:34', '1ff7b5aa-42e3-4b29-9d8d-ad965690214c', '93444c6f-b79b-4dc7-9285-e29ff376bf7d'),
(2, '2022-01-29 14:01:12', '71d57d05-96b0-481d-88f7-c753528ca645', 'a49a4d3c-2aa4-4d5b-92a3-b01f8cf02184'),
(3, '2022-01-29 14:35:12', '9e00881f-89e4-43cd-9594-be3cc3894639', 'a49a4d3c-2aa4-4d5b-92a3-b01f8cf02184'),
(4, '2022-01-29 14:46:55', 'c5f09890-2848-434d-80bd-c53877e4dd33', 'a49a4d3c-2aa4-4d5b-92a3-b01f8cf02184'),
(5, '2022-01-29 14:48:14', 'c81ab289-a3e3-45ea-ae24-65e28a26aece', 'a49a4d3c-2aa4-4d5b-92a3-b01f8cf02184'),
(6, '2022-01-29 14:49:09', '5530715a-5a22-45d4-b0f6-5ff84b038e99', '7dfda13c-cae8-461b-95e9-72a802871f0f'),
(7, '2022-01-29 14:56:34', 'cb0c4778-36b2-4684-9109-7613aeb527de', '93444c6f-b79b-4dc7-9285-e29ff376bf7d'),
(8, '2022-01-29 15:47:52', '8470ae8b-9695-4d01-b3de-02b909801a6b', '7dfda13c-cae8-461b-95e9-72a802871f0f'),
(9, '2022-01-29 16:41:35', '9feb4cef-e438-424b-aa59-33a9da247dff', '7dfda13c-cae8-461b-95e9-72a802871f0f'),
(10, '2022-01-30 20:36:26', '6d199a61-a72f-479d-8eb0-96001b5aa1c9', '3ec2eabf-f195-45ed-bb08-794f04b934d0'),
(11, '2022-01-30 20:38:06', '358e881a-a67e-42ca-bf5b-af8ee5bb91a7', '93444c6f-b79b-4dc7-9285-e29ff376bf7d'),
(12, '2022-01-30 21:15:05', '619f51a3-256e-4cf8-a1b3-9484760408be', '93444c6f-b79b-4dc7-9285-e29ff376bf7d'),
(13, '2022-01-30 21:17:16', 'b6479f40-6100-4a9f-987e-b60a32745182', '3ec2eabf-f195-45ed-bb08-794f04b934d0'),
(14, '2022-01-31 12:48:34', '6ee0cd21-ffe3-41ea-af1c-2552aca857d5', '7dfda13c-cae8-461b-95e9-72a802871f0f'),
(15, '2022-02-01 23:23:36', '59de8bd3-be47-4af0-9f27-9c5da9a6e267', '7dfda13c-cae8-461b-95e9-72a802871f0f'),
(16, '2022-02-01 23:30:16', 'd403afae-b17d-4185-93c7-e8a69cd59aac', '7dfda13c-cae8-461b-95e9-72a802871f0f'),
(17, '2022-02-01 23:51:37', '33affe7b-aebc-452e-bf9a-10b19e81bc76', '7dfda13c-cae8-461b-95e9-72a802871f0f'),
(18, '2022-02-02 00:13:11', 'bb9bd565-c7a4-4040-91bb-a08d4010d164', '7dfda13c-cae8-461b-95e9-72a802871f0f'),
(19, '2022-02-02 08:02:08', '9f537756-1287-4e46-9d11-c878772eb15a', 'f3fb78a5-8363-4433-bf5b-0aeb392d558a'),
(20, '2022-02-02 08:08:54', 'ea8649c8-2b43-4936-ba6d-fc4833647d35', 'f3fb78a5-8363-4433-bf5b-0aeb392d558a'),
(21, '2022-02-02 09:27:46', '151d5640-b204-4864-ba89-c60eaaa8a57e', 'f3fb78a5-8363-4433-bf5b-0aeb392d558a'),
(22, '2022-02-02 10:06:33', 'bfe82585-fce8-4347-86bf-d10bb305c636', '93444c6f-b79b-4dc7-9285-e29ff376bf7d'),
(23, '2022-02-03 09:39:50', '62076bd6-8c34-41ca-afee-1a686de80273', '7dfda13c-cae8-461b-95e9-72a802871f0f'),
(24, '2022-02-03 09:52:23', 'f9e95867-3c15-41a7-8039-bff9ccb50336', 'f3fb78a5-8363-4433-bf5b-0aeb392d558a'),
(25, '2022-02-03 10:06:33', '84121493-d423-4565-bff6-54e272aad439', '93444c6f-b79b-4dc7-9285-e29ff376bf7d'),
(26, '2022-02-03 20:02:44', 'c0ba634a-326c-4e7c-9b2c-238ca65b055d', '7dfda13c-cae8-461b-95e9-72a802871f0f'),
(27, '2022-02-03 20:24:51', 'dc2016d6-ea07-4a7b-9918-6762eaa3b4f8', '7dfda13c-cae8-461b-95e9-72a802871f0f'),
(28, '2022-02-03 20:37:51', 'dfbc306f-858d-4361-8174-2806970b0eff', '7dfda13c-cae8-461b-95e9-72a802871f0f'),
(29, '2022-02-03 20:48:12', 'df8b979f-ba2c-4c12-9c10-fa1523f110c9', '7dfda13c-cae8-461b-95e9-72a802871f0f'),
(30, '2022-02-03 21:03:28', 'a2a02944-f6d5-44ec-99e6-974e5093a5a3', '7dfda13c-cae8-461b-95e9-72a802871f0f'),
(31, '2022-02-03 22:36:20', '281d1b87-f2e4-4934-8d1b-82fbf8fa2473', '7dfda13c-cae8-461b-95e9-72a802871f0f'),
(32, '2022-02-04 00:00:27', '7746b74a-5203-4cc6-98a8-82827bb18e8a', '7dfda13c-cae8-461b-95e9-72a802871f0f'),
(33, '2022-02-04 07:40:10', '1cbf2415-0efa-4016-9396-f8a1b1fe308c', '7dfda13c-cae8-461b-95e9-72a802871f0f'),
(34, '2022-02-04 07:48:21', 'abc94b72-515b-457e-b60d-7a2b6b194225', 'a49a4d3c-2aa4-4d5b-92a3-b01f8cf02184'),
(35, '2022-02-04 09:52:25', '5a7266c2-68b1-4141-b336-94d0204aa39a', '7dfda13c-cae8-461b-95e9-72a802871f0f'),
(36, '2022-02-04 09:56:26', 'f7e76357-8f3b-431d-94e2-8419d8397a59', '7dfda13c-cae8-461b-95e9-72a802871f0f'),
(37, '2022-02-04 10:06:47', '5fe71646-73d6-46f9-89cf-38fc7e65715d', '7dfda13c-cae8-461b-95e9-72a802871f0f'),
(38, '2022-02-04 10:10:43', '94fd805d-0119-4ad9-a0d6-64e20fa03b36', '7dfda13c-cae8-461b-95e9-72a802871f0f'),
(39, '2022-02-04 10:12:22', '28cebe6e-94db-410d-8585-19849fc6f526', '7dfda13c-cae8-461b-95e9-72a802871f0f'),
(40, '2022-02-04 10:22:16', '9a47de16-5c35-4384-8eb3-936ba935572c', '7dfda13c-cae8-461b-95e9-72a802871f0f'),
(41, '2022-02-04 10:24:53', '23373371-c406-49ea-aebb-dec235418fc9', '7dfda13c-cae8-461b-95e9-72a802871f0f'),
(42, '2022-02-05 13:32:35', 'a76bf2a3-70dc-4765-9fac-cba22ad59e66', '7dfda13c-cae8-461b-95e9-72a802871f0f'),
(43, '2022-02-05 13:33:34', 'f4cf85a1-b644-4d25-8552-9ae250157b19', 'e2c5b3c5-afa8-4063-adef-1e1f81a00a79'),
(44, '2022-02-05 15:36:10', 'df93e8ce-3499-4e0d-9cfe-89f8775e0c4d', 'e7f9be0b-5f18-400b-b905-9b00a4ab13b0'),
(45, '2022-02-05 16:29:17', 'b2908070-7de6-491c-828b-1cb1f6a791aa', '7dfda13c-cae8-461b-95e9-72a802871f0f'),
(46, '2022-02-05 16:47:54', '0520bdd3-96a6-4159-95df-7a1f043abb5e', '7dfda13c-cae8-461b-95e9-72a802871f0f'),
(47, '2022-02-09 00:49:55', '4e8d4bb2-8e1e-4bff-b9bb-acf290ab8d8d', '7dfda13c-cae8-461b-95e9-72a802871f0f'),
(48, '2022-02-10 14:26:32', 'f1518638-eb36-4131-9f95-192025936bd8', '53b6606f-69cd-46e0-bd8d-3cf8eccebaad'),
(49, '2022-02-15 23:58:53', 'fc961d17-eb3c-4388-ac5f-9c5c1f3010bb', '55d048bf-90b5-4bb4-b6f8-f0f1871e46d7'),
(50, '2022-02-16 00:07:29', '03514a1c-a2a3-4a84-9ec6-26cc37728f0c', '93444c6f-b79b-4dc7-9285-e29ff376bf7d'),
(51, '2022-02-16 00:10:30', '7bfa1090-f2e0-472a-b36b-19ac7e17eb88', '7dfda13c-cae8-461b-95e9-72a802871f0f'),
(52, '2022-02-16 00:16:28', 'b9aa4612-e531-422a-81f0-f2929e6593c5', '93444c6f-b79b-4dc7-9285-e29ff376bf7d'),
(53, '2022-02-16 00:29:24', '56b131ba-156c-4223-8c12-bf777efd1097', '410393ac-6f64-4df7-bd9a-8f315ec1b1aa'),
(54, '2022-02-16 23:36:57', '38e2a3ae-c379-4ec6-9e66-04f62a6e0011', '7dfda13c-cae8-461b-95e9-72a802871f0f'),
(55, '2022-02-16 23:36:57', '0b56c6ae-d01d-48d2-be45-c9fed72348eb', '7dfda13c-cae8-461b-95e9-72a802871f0f'),
(56, '2022-02-16 23:38:00', '8b996549-bfa2-4a1f-90a0-a3dd9dfe9b77', '7dfda13c-cae8-461b-95e9-72a802871f0f'),
(57, '2022-02-16 23:38:20', 'cf71b81c-b23f-4e7b-831b-7600127303e5', '7dfda13c-cae8-461b-95e9-72a802871f0f'),
(58, '2022-02-16 23:38:45', '84cb3734-2740-4271-b800-e00f2148c5a8', '7dfda13c-cae8-461b-95e9-72a802871f0f'),
(59, '2022-02-16 23:48:18', 'd992ab32-1a26-4665-9652-1ec30a63d117', '7dfda13c-cae8-461b-95e9-72a802871f0f'),
(60, '2022-02-16 23:54:46', '8d5e3529-9376-4107-8f5e-9a8ef83c20d8', '16afcae5-5c4a-4ee2-8bea-6215dfaef5f0'),
(61, '2022-02-16 23:54:47', 'b26e150d-1283-4de3-89fa-92ed8b13bfec', '93444c6f-b79b-4dc7-9285-e29ff376bf7d'),
(62, '2022-02-16 23:55:15', '8c0f72b1-9150-4264-8c1f-8bebda977189', 'a58a6308-d3c1-415b-8df2-6d350bc49ec4'),
(63, '2022-02-17 00:05:15', '4224622e-e378-4092-b745-c9f85475dcc2', '1b7b54d9-ea76-4d07-951c-0f51bd5783c6'),
(64, '2022-02-17 00:09:44', '17572db1-0b50-4946-8d58-34410ce986e3', '0f3ab68d-1f31-4457-801c-05f2d3aac7ea'),
(65, '2022-02-17 00:14:20', '23274b75-6117-41b6-860c-06d041b9efe3', 'd68c97bc-3edf-4649-97ac-354be2305a4b'),
(66, '2022-02-17 00:19:37', '45a89ac9-4c0a-4e73-83c3-bdbecf59fac5', '93444c6f-b79b-4dc7-9285-e29ff376bf7d'),
(67, '2022-02-17 00:25:05', 'e3254ee5-9c4a-4b8f-b33c-f0f619368830', '0f3ab68d-1f31-4457-801c-05f2d3aac7ea'),
(68, '2022-02-17 23:19:34', '4d5d7eeb-5126-41c2-a80b-4bade8c8af69', '93444c6f-b79b-4dc7-9285-e29ff376bf7d'),
(69, '2022-02-17 23:25:58', '27336382-a415-4427-866d-8e2489c686eb', '93444c6f-b79b-4dc7-9285-e29ff376bf7d'),
(70, '2022-02-18 03:34:26', '01d44c11-87ae-427f-8771-c3b90a1f9506', '93444c6f-b79b-4dc7-9285-e29ff376bf7d'),
(71, '2022-02-18 03:34:45', 'f183d992-45bf-4dc3-b888-46d8841c3994', '93444c6f-b79b-4dc7-9285-e29ff376bf7d'),
(72, '2022-02-18 03:38:44', '3bc51a96-ada7-4d91-8a34-c21650a8f7d7', '93444c6f-b79b-4dc7-9285-e29ff376bf7d'),
(73, '2022-02-18 03:54:22', '3897b860-42bf-433e-a588-0d1763f315ec', '7dfda13c-cae8-461b-95e9-72a802871f0f'),
(74, '2022-02-18 04:08:26', 'a60a0a02-2684-4e63-96dd-8a76ae3c3c07', '73f8406d-2ad7-4fb5-a9af-eb8685ef20b7'),
(75, '2022-02-18 04:09:57', 'ead180a3-8b43-411c-ab2a-a96c8cce4886', 'd2a3acc1-8c91-4c39-a5ea-9e9ee88cc939'),
(76, '2022-02-18 04:11:16', 'f94b467a-d59e-456d-8f22-167238a0aed0', '93444c6f-b79b-4dc7-9285-e29ff376bf7d'),
(77, '2022-02-18 04:32:35', '5bd3a948-3ec3-41b8-a08f-d5de9878f815', '93444c6f-b79b-4dc7-9285-e29ff376bf7d'),
(78, '2022-02-18 04:36:30', '14840a71-dede-4f9b-b1d1-70e3d10bed2b', '93444c6f-b79b-4dc7-9285-e29ff376bf7d'),
(79, '2022-02-18 04:42:38', 'cb42444e-b40c-4b9d-82d9-fefca313316b', '93444c6f-b79b-4dc7-9285-e29ff376bf7d'),
(80, '2022-02-18 04:58:04', '11214dd1-e551-468f-8540-da9866d39dc8', '93444c6f-b79b-4dc7-9285-e29ff376bf7d'),
(81, '2022-02-18 05:27:42', 'bccc4e8c-b294-4900-904b-9b29bad926b5', '3a134e65-46b7-4b7e-b9fe-637b4c300ef3'),
(82, '2022-02-18 05:34:09', 'ebf601ef-d62f-466b-9e07-2d679611ebd0', '6e5612f9-8320-48a1-a227-ac4bc764e161'),
(83, '2022-02-18 05:39:31', '529224d9-5f8b-4103-ada4-37dd9384b2ba', '6e5612f9-8320-48a1-a227-ac4bc764e161'),
(84, '2022-02-18 05:43:23', '43ea9d51-cdc1-494b-ba8c-6e02ca66b4e1', '93444c6f-b79b-4dc7-9285-e29ff376bf7d'),
(85, '2022-02-23 00:19:23', '70be7b57-538d-4824-ad46-5bfaf2db9116', '7dfda13c-cae8-461b-95e9-72a802871f0f'),
(86, '2022-02-23 00:20:00', '57877709-ddc1-4619-a636-9672cf269df3', '7dfda13c-cae8-461b-95e9-72a802871f0f'),
(87, '2022-02-23 00:29:19', '2566e090-fa68-4b28-a099-63b0a3f5511b', '93444c6f-b79b-4dc7-9285-e29ff376bf7d'),
(88, '2022-02-23 00:32:33', 'c5b415ac-bb06-4e8e-8af4-096ae0f58ca1', '7dfda13c-cae8-461b-95e9-72a802871f0f'),
(89, '2022-02-23 00:35:08', '19a52c40-7278-4c36-94e8-29cc20b98572', '93444c6f-b79b-4dc7-9285-e29ff376bf7d'),
(90, '2022-02-23 00:37:51', '7f7d93d4-181a-426b-8980-c25d8be86f66', '7dfda13c-cae8-461b-95e9-72a802871f0f'),
(91, '2022-02-23 00:45:49', 'e6fc479f-fa73-4b37-993c-481d13eadc2a', '93444c6f-b79b-4dc7-9285-e29ff376bf7d'),
(92, '2022-02-23 00:46:42', 'b9e86c59-b621-4115-9446-dadb14861292', '7dfda13c-cae8-461b-95e9-72a802871f0f'),
(93, '2022-02-23 00:59:02', '27bf1cc8-8b79-4f26-b659-96214db24dbc', '7dfda13c-cae8-461b-95e9-72a802871f0f'),
(94, '2022-02-23 01:03:30', '572c17f2-ca7b-4029-9611-166b92694cd5', 'f3fb78a5-8363-4433-bf5b-0aeb392d558a'),
(95, '2022-02-23 01:06:59', '79444b30-3cb3-4944-83de-7f0101430d38', '93444c6f-b79b-4dc7-9285-e29ff376bf7d'),
(96, '2022-02-23 01:34:32', 'd0b723fd-2ef3-4859-abbd-946b345b73fc', 'f3fb78a5-8363-4433-bf5b-0aeb392d558a'),
(97, '2022-02-23 01:35:55', 'f0394909-1f4a-4911-9863-eceaada6bcb1', '7dfda13c-cae8-461b-95e9-72a802871f0f'),
(98, '2022-02-23 01:36:43', '42ae4be7-0071-44bf-bb9e-7a051876b7d7', '93444c6f-b79b-4dc7-9285-e29ff376bf7d'),
(99, '2022-02-23 01:39:23', 'c3b079d6-2205-47de-a8a8-ce495db60219', 'f3fb78a5-8363-4433-bf5b-0aeb392d558a'),
(100, '2022-02-23 01:44:53', '2aaa564c-e5dc-4bdf-b9a2-5b16525f1964', '7dfda13c-cae8-461b-95e9-72a802871f0f'),
(101, '2022-02-23 02:01:08', '3234b9e3-5a73-4139-9fbf-47209c8dcf30', '6c269c89-2a53-4abb-a24a-de8043ca9055'),
(102, '2022-02-23 02:11:30', 'a6ff2aec-800c-4541-b915-eca4d04d8ad4', '7dfda13c-cae8-461b-95e9-72a802871f0f'),
(103, '2022-02-23 02:12:41', '880d28dd-3ce8-4cfa-a4c5-5c979c1e539e', '3bc693b0-bf4b-45ee-8e70-e831cfbccc6a'),
(104, '2022-02-23 03:26:16', '4c7df591-2e04-43e6-aba9-a28907126c44', '7dfda13c-cae8-461b-95e9-72a802871f0f'),
(105, '2022-02-23 03:45:31', '2bd7c600-3956-4b07-a978-386573e64a08', '0f3ab68d-1f31-4457-801c-05f2d3aac7ea'),
(106, '2022-02-23 04:10:31', '88368bc8-a837-4d92-a703-7f704a520976', '7dfda13c-cae8-461b-95e9-72a802871f0f'),
(107, '2022-02-23 05:37:39', '36f0651f-0ab6-44e7-ab40-4257ff16a2ae', '7dfda13c-cae8-461b-95e9-72a802871f0f'),
(108, '2022-02-23 05:40:28', 'db8f2b57-eab4-4e7c-ab66-b79904976e42', '0e5f7ca7-c7b4-49d9-ac7d-f59bc801e2ac'),
(109, '2022-02-23 05:41:06', '668a0a1f-f69b-4fda-9e69-90d90108dd83', 'dc4d8e2b-262e-44db-941a-ffcb8acf0c98'),
(110, '2022-02-23 05:42:16', '1e7698de-fae6-4cae-851c-99f1adc326ab', '43e68198-19cd-4a45-b943-2c4d95520aa5'),
(111, '2022-02-23 06:06:44', 'c5e78866-b26c-47fa-a1ca-d4f6746bcb65', '6c269c89-2a53-4abb-a24a-de8043ca9055'),
(112, '2022-02-23 06:19:32', 'b7f86a68-d613-4d28-8270-28efe7ade2c6', 'e42094d0-441b-4c3d-b25d-bbdd26c6b2c5'),
(113, '2022-02-23 06:20:16', '74e73f23-d67a-4817-a9a8-2c6c295acc97', '93444c6f-b79b-4dc7-9285-e29ff376bf7d'),
(114, '2022-02-23 07:42:27', '3a2efb76-14be-43f1-98af-3a51dd6269bd', '7dfda13c-cae8-461b-95e9-72a802871f0f'),
(115, '2022-02-23 23:01:00', '68e48842-178f-408b-83b6-e86ca34e347f', '7dfda13c-cae8-461b-95e9-72a802871f0f'),
(116, '2022-02-23 23:07:14', 'c586fe24-38aa-4a3f-ab5b-21c4837253df', '93444c6f-b79b-4dc7-9285-e29ff376bf7d'),
(117, '2022-02-23 23:14:42', '45bbd5b3-402d-44de-a621-5ba68a5a9fb6', '3ca80503-bb6b-4d13-a334-a1ebdf16d6f5'),
(118, '2022-02-23 23:19:08', '47bf5201-be5d-449b-9376-806928c97139', '93444c6f-b79b-4dc7-9285-e29ff376bf7d'),
(119, '2022-02-23 23:24:31', 'dcd9d757-40d0-4c73-a9d2-329cb87374e0', '93444c6f-b79b-4dc7-9285-e29ff376bf7d'),
(120, '2022-02-23 23:49:04', '0e64f86d-2037-4655-a06a-6e9981919470', '93444c6f-b79b-4dc7-9285-e29ff376bf7d'),
(121, '2022-02-24 00:29:04', '4a5cba4f-2354-4701-b487-72e8ae5a330d', '3ca80503-bb6b-4d13-a334-a1ebdf16d6f5'),
(122, '2022-02-24 00:31:09', '404e0538-e450-489f-8045-56a0346462b2', '4f10fa67-4396-497f-bb27-ef5f2d138eb0'),
(123, '2022-02-24 00:32:41', '19547ddb-dd54-4cd3-94ae-11782b9c2e13', '93444c6f-b79b-4dc7-9285-e29ff376bf7d'),
(124, '2022-02-24 00:33:52', '23ca83c6-f379-4ded-b3cc-6268c8143e04', '4f10fa67-4396-497f-bb27-ef5f2d138eb0'),
(125, '2022-02-24 00:34:18', '29968360-0f64-4ea7-b39e-132f1b40aa31', '7dfda13c-cae8-461b-95e9-72a802871f0f'),
(126, '2022-02-24 00:34:51', 'ab740acb-a2d0-4375-be3b-e52dac36088c', '7dfda13c-cae8-461b-95e9-72a802871f0f'),
(127, '2022-02-24 00:42:22', '972134f6-a0e4-40b0-ae98-3bdbd058f2ad', '7dfda13c-cae8-461b-95e9-72a802871f0f'),
(128, '2022-02-24 00:43:57', 'cd8d72aa-a377-4f28-98c0-ed716797bc48', '93444c6f-b79b-4dc7-9285-e29ff376bf7d'),
(129, '2022-02-24 00:49:18', '0553d763-4cc7-4bd6-82b1-eff5775aebeb', '7dfda13c-cae8-461b-95e9-72a802871f0f'),
(130, '2022-02-24 01:29:37', '955830e4-66b6-404c-866a-ff25f640820f', '7dfda13c-cae8-461b-95e9-72a802871f0f'),
(131, '2022-02-24 01:47:08', '078315b4-f387-4ada-81c5-e3e0c8db767a', '7dfda13c-cae8-461b-95e9-72a802871f0f'),
(132, '2022-02-24 02:56:17', '89108866-d900-4d65-965a-47c9797efc8c', '7dfda13c-cae8-461b-95e9-72a802871f0f'),
(133, '2022-02-24 02:59:52', '15a1e5be-a6ea-4169-bf2c-8e90f507ecc7', '7dfda13c-cae8-461b-95e9-72a802871f0f'),
(134, '2022-02-24 05:09:41', 'a2ed776e-c738-45dd-9262-59892cd1fe0b', '7dfda13c-cae8-461b-95e9-72a802871f0f'),
(135, '2022-02-24 05:23:59', '8804bd02-4c23-4c56-8456-2cc1fe1eefed', '7dfda13c-cae8-461b-95e9-72a802871f0f'),
(136, '2022-02-24 05:24:34', '21b92fea-fb7b-4c72-8dde-7e527eab94da', '7dfda13c-cae8-461b-95e9-72a802871f0f'),
(137, '2022-02-24 06:03:05', 'b33ac0b6-b4f5-4dbc-b9be-bec7bd168490', '7dfda13c-cae8-461b-95e9-72a802871f0f'),
(138, '2022-02-24 06:11:34', '753cf288-7e98-448b-9dd0-eb3ff18db18d', '7dfda13c-cae8-461b-95e9-72a802871f0f'),
(139, '2022-02-24 06:41:18', 'a75d4176-d43f-4904-ad00-9c8dc4ef3845', '7dfda13c-cae8-461b-95e9-72a802871f0f'),
(140, '2022-02-24 06:42:25', '1386b76e-94b2-4936-ab18-a5fcf65f5303', '7dfda13c-cae8-461b-95e9-72a802871f0f'),
(141, '2022-02-24 06:45:07', '8a33dd33-bd00-4da7-8a3a-e559aba65827', '7dfda13c-cae8-461b-95e9-72a802871f0f'),
(142, '2022-02-24 06:52:36', 'bcb919fa-afee-4670-a5e2-3669c70a8435', '7dfda13c-cae8-461b-95e9-72a802871f0f'),
(143, '2022-02-24 06:59:23', '44083f2c-4833-4581-a8c2-a9b1a235c8f1', '7dfda13c-cae8-461b-95e9-72a802871f0f'),
(144, '2022-02-24 07:15:41', '60dfb6e6-c19b-4df2-aeda-0e0386df1937', '93444c6f-b79b-4dc7-9285-e29ff376bf7d'),
(145, '2022-02-24 22:34:11', '6ec2d860-08c6-4abd-b351-a5fae9393c48', '7dfda13c-cae8-461b-95e9-72a802871f0f'),
(146, '2022-02-24 23:28:02', '8ddaaf7f-43a6-4ce1-a89d-d6cf1a03f378', '7dfda13c-cae8-461b-95e9-72a802871f0f'),
(147, '2022-02-24 23:29:11', '29b803fd-2d19-4cfa-a1df-aca1c4c6ea55', '93444c6f-b79b-4dc7-9285-e29ff376bf7d'),
(148, '2022-02-25 06:01:48', '4bbb1e74-3045-44a3-9481-11b3bff94c43', '7dfda13c-cae8-461b-95e9-72a802871f0f'),
(149, '2022-02-25 06:09:57', '163e8780-2bdc-4e92-bde8-8939547445aa', '884835f5-6ca5-406d-84bc-c67c9fb3150e'),
(150, '2022-02-25 22:55:45', 'a1f11735-c528-476f-bee5-ee1f2d857561', '6a964d44-d60a-4e4c-9cae-e0da5c5fd076'),
(151, '2022-02-25 23:08:47', '152cc35e-c8c7-42bb-bdef-3865c56007ba', 'b3deae12-7838-45ea-bacc-005544f56c9f'),
(152, '2022-02-25 23:11:06', '8c604278-d8e6-47ca-9948-46e819c0e291', '93444c6f-b79b-4dc7-9285-e29ff376bf7d'),
(153, '2022-02-25 23:39:21', '5c84ea42-27c2-4a07-a1b9-52fa327d9a33', '7de3efe6-29e7-45ee-8e75-c85cbf8d9597'),
(154, '2022-02-25 23:40:03', '96dcd679-eee1-4d45-9e50-5dbbcfb48222', '93444c6f-b79b-4dc7-9285-e29ff376bf7d'),
(155, '2022-02-25 23:42:57', '98be2acc-c83c-4620-bcbb-32ef7fe9b6d1', '7de3efe6-29e7-45ee-8e75-c85cbf8d9597'),
(156, '2022-02-26 00:51:23', '56995363-1f6c-4c9f-9edf-94bfff649d6b', '8fee9584-5ca6-43ff-92d0-522bb205a16d'),
(157, '2022-02-26 00:56:29', '3e7361a2-2c02-479e-aa0a-26368682563f', 'a3eb83c5-bcd3-4ee0-9435-7856601a59ca'),
(158, '2022-02-26 00:58:06', '3c1dfaf2-478e-48ee-9dbe-4ee32eaa34da', '7dfda13c-cae8-461b-95e9-72a802871f0f'),
(159, '2022-02-26 01:01:12', 'dea570a3-38fe-44fe-b4b7-0543c1fd22a4', '7de3efe6-29e7-45ee-8e75-c85cbf8d9597'),
(160, '2022-02-26 01:05:47', '2905769b-07bf-4e0a-88e2-9f119e41ed75', 'a3eb83c5-bcd3-4ee0-9435-7856601a59ca'),
(161, '2022-02-26 01:05:51', '395d706e-4a89-4f99-9a9e-1590ca8d9982', 'a3eb83c5-bcd3-4ee0-9435-7856601a59ca'),
(162, '2022-02-26 06:15:26', 'f773b9a0-812c-47fa-95fb-f6d979917823', '93444c6f-b79b-4dc7-9285-e29ff376bf7d'),
(163, '2022-02-26 06:28:35', '59a4a8f2-ba7c-419e-b211-99830aee427e', '93444c6f-b79b-4dc7-9285-e29ff376bf7d'),
(164, '2022-02-26 06:29:27', '2defbb1b-bca2-4f95-b931-4dddc767843a', '0f3ab68d-1f31-4457-801c-05f2d3aac7ea'),
(165, '2022-02-26 06:35:02', '1a448bd0-a498-4025-821a-6ba9b71472c2', '0f3ab68d-1f31-4457-801c-05f2d3aac7ea'),
(166, '2022-02-26 06:39:49', '5d74247e-69d2-4a09-b2ec-abb951f9115c', '7de3efe6-29e7-45ee-8e75-c85cbf8d9597'),
(167, '2022-02-26 06:55:50', '58ccae38-b03e-456f-8c51-f92715a4311c', '93444c6f-b79b-4dc7-9285-e29ff376bf7d'),
(168, '2022-02-26 07:19:05', 'bd49cb0b-bf37-4216-b580-db199ae40b0a', '7dfda13c-cae8-461b-95e9-72a802871f0f'),
(169, '2022-02-26 07:20:49', '0d927faa-409a-48f5-9748-bef94b53b9ed', '47a32ccd-21bf-4735-971f-062ac1d669ef'),
(170, '2022-02-26 07:32:35', '1b14e770-9a2b-42a9-a2b8-821fa9183d64', 'a2354b20-dbbc-4fcb-bd51-5fbc0b5a1e6f');

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `id` bigint(20) NOT NULL,
  `role` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id`, `role`) VALUES
(1, 'ROLE_ADMIN'),
(2, 'ROLE_PUBLISHER'),
(3, 'ROLE_READER');

-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--

CREATE TABLE `transaction` (
  `id` varchar(50) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `name_of_article` varchar(255) DEFAULT NULL,
  `article_id` varchar(50) DEFAULT NULL,
  `user_id` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `transaction`
--

INSERT INTO `transaction` (`id`, `created_at`, `updated_at`, `name_of_article`, `article_id`, `user_id`) VALUES
('4842c564-de40-4377-bcf1-d012d2eb9471', '2022-01-29 20:45:40', '2022-01-29 20:45:40', 'Vue js Development 1st Edition', '536eb45f-52e0-4f7d-9be8-7fa7f68b848d', '3ec2eabf-f195-45ed-bb08-794f04b934d0'),
('dc130099-52a8-45f4-90dc-0222ec1e26dd', '2022-02-01 08:25:32', '2022-02-01 08:25:32', 'Operating System Design', 'b6b4a361-69b0-485c-b0ad-25d49ec002b3', 'f3fb78a5-8363-4433-bf5b-0aeb392d558a'),
('1c2f4b2a-7bb3-4d9f-b64f-8ce3a3a367ef', '2022-02-01 08:27:28', '2022-02-01 08:27:28', 'Java Web Development 3rd Edition', '44725fe1-2ef7-4210-aa89-b2cc0b331a36', 'f3fb78a5-8363-4433-bf5b-0aeb392d558a'),
('90328e50-d306-424f-a32b-3b5e56dfb5b3', '2022-02-02 21:05:45', '2022-02-02 21:05:45', 'string', 'ac861616-225e-47ec-8ed1-250f2f62729e', '7dfda13c-cae8-461b-95e9-72a802871f0f'),
('7d16beca-3c53-48bf-be13-358ff07a46d2', '2022-02-04 15:36:19', '2022-02-04 15:36:19', 'Building Web Applications with Angular and SpringBoot', '3e98da1c-6b1b-4b8f-bcbf-7cb6088c071c', 'e7f9be0b-5f18-400b-b905-9b00a4ab13b0'),
('2740b4aa-fb59-49dc-99cf-f28394ad9257', '2022-02-15 08:59:12', '2022-02-15 08:59:12', 'Java Web Development 3rd Edition', '44725fe1-2ef7-4210-aa89-b2cc0b331a36', '55d048bf-90b5-4bb4-b6f8-f0f1871e46d7'),
('c1f92262-b144-4183-89fe-2442e73a020b', '2022-02-16 08:46:59', '2022-02-16 08:46:59', 'Clipboard 💫😅😄😂😙😂🤣😍🤧🥵🤧🤮😵', '283d6dd1-2075-46ac-b378-470821b84370', '7dfda13c-cae8-461b-95e9-72a802871f0f'),
('fdd02f6e-78d4-4656-a84b-15add8c970f1', '2022-02-16 08:54:59', '2022-02-16 08:54:59', 'Clipboard 💫😅😄😂😙😂🤣😍🤧🥵🤧🤮😵', '283d6dd1-2075-46ac-b378-470821b84370', '16afcae5-5c4a-4ee2-8bea-6215dfaef5f0'),
('f9245751-4c0d-42d2-bcf4-d0e9db69cee0', '2022-02-16 08:55:30', '2022-02-16 08:55:30', 'Java Web Development 3rd Edition', '44725fe1-2ef7-4210-aa89-b2cc0b331a36', 'a58a6308-d3c1-415b-8df2-6d350bc49ec4'),
('ebbdda1a-09ad-4bfb-b58a-374a4fb778f1', '2022-02-16 08:57:47', '2022-02-16 08:57:47', 'Designs and Teachings', 'f3b61a15-33e9-4c2a-b476-8e6ff5ad4dcd', '16afcae5-5c4a-4ee2-8bea-6215dfaef5f0'),
('4a4d9cf3-5a67-4391-92d6-8b75eebc461c', '2022-02-16 09:05:33', '2022-02-16 09:05:33', 'Java Web Development 3rd Edition', '44725fe1-2ef7-4210-aa89-b2cc0b331a36', '1b7b54d9-ea76-4d07-951c-0f51bd5783c6'),
('79c92dae-0c05-41d5-91be-7a7891c8d55c', '2022-02-16 09:12:42', '2022-02-16 09:12:42', 'JavaScript Web Development Full Courrse', '3218b65c-e748-482f-ab85-a3b16346c1f7', '0f3ab68d-1f31-4457-801c-05f2d3aac7ea'),
('8a92de4a-4956-4e08-a987-bd56b388e6a7', '2022-02-17 14:28:00', '2022-02-17 14:28:00', 'Java Web Development 3rd Edition', '44725fe1-2ef7-4210-aa89-b2cc0b331a36', '3a134e65-46b7-4b7e-b9fe-637b4c300ef3'),
('87ecbc57-e2ce-4ed8-9a09-7d7344f1c3d0', '2022-02-17 14:29:46', '2022-02-17 14:29:46', 'Data Structures and Algorithms Vol 1', '95fc37db-9c8c-4e30-bb25-8de15a9708e4', '3a134e65-46b7-4b7e-b9fe-637b4c300ef3'),
('28a4f98d-568f-4f1f-bcac-fa590aa98ed9', '2022-02-22 14:57:22', '2022-02-22 14:57:22', 'JavaScript Web Development Full Courrse', '3218b65c-e748-482f-ab85-a3b16346c1f7', '43e68198-19cd-4a45-b943-2c4d95520aa5'),
('e5fadc62-70b0-43be-a2b3-cb413e007745', '2022-02-22 15:11:20', '2022-02-22 15:11:20', 'Java Web Development 3rd Edition', '44725fe1-2ef7-4210-aa89-b2cc0b331a36', '6c269c89-2a53-4abb-a24a-de8043ca9055'),
('b0b91f06-458f-4e0b-9cac-9e5d2e674907', '2022-02-24 15:02:31', '2022-02-24 15:02:31', 'Data Structures and Algorithms Vol 1', '95fc37db-9c8c-4e30-bb25-8de15a9708e4', '7dfda13c-cae8-461b-95e9-72a802871f0f'),
('213182ea-b904-4ba8-b74c-9b23fa072ce2', '2022-02-24 15:02:31', '2022-02-24 15:02:31', 'Building Web Applications with Angular and SpringBoot', '3e98da1c-6b1b-4b8f-bcbf-7cb6088c071c', '7dfda13c-cae8-461b-95e9-72a802871f0f'),
('576137e8-234f-4109-9f1d-13da9a6153bd', '2022-02-24 15:10:57', '2022-02-24 15:10:57', 'Database Design and Implementation', 'cd2369d7-bbe4-4c06-88bf-9f77d52ee81c', '884835f5-6ca5-406d-84bc-c67c9fb3150e'),
('2e67a625-8363-4523-9987-fba3a930acda', '2022-02-25 07:58:05', '2022-02-25 07:58:05', 'Database Design and Implementation', 'cd2369d7-bbe4-4c06-88bf-9f77d52ee81c', '6a964d44-d60a-4e4c-9cae-e0da5c5fd076'),
('aaaed614-7b39-4ac9-908e-197b4b313d59', '2022-02-25 08:04:38', '2022-02-25 08:04:38', 'Operating System Design', 'b6b4a361-69b0-485c-b0ad-25d49ec002b3', '6a964d44-d60a-4e4c-9cae-e0da5c5fd076'),
('717be49f-8506-461d-a6a8-4c79ae7dc667', '2022-02-25 08:09:28', '2022-02-25 08:09:28', 'Java Web Development 3rd Edition', '44725fe1-2ef7-4210-aa89-b2cc0b331a36', 'b3deae12-7838-45ea-bacc-005544f56c9f'),
('c6582ed2-7926-4693-a7f1-df4e462a4e0d', '2022-02-25 08:28:30', '2022-02-25 08:28:30', 'Designs and Teachings', 'f3b61a15-33e9-4c2a-b476-8e6ff5ad4dcd', 'b3deae12-7838-45ea-bacc-005544f56c9f'),
('699cb841-b158-420c-8694-6b30e19fa374', '2022-02-25 08:35:52', '2022-02-25 08:35:52', 'RERRGRGRGGGR', '57955a1d-b67f-4b70-94c1-f7cfb9e68950', 'b3deae12-7838-45ea-bacc-005544f56c9f'),
('d4fd608f-7b29-4978-aee4-51499a911e65', '2022-02-25 08:57:10', '2022-02-25 08:57:10', 'book title', 'abcaf2b5-88b9-4e28-821d-00bf45f245ee', 'b3deae12-7838-45ea-bacc-005544f56c9f'),
('6481ce4a-437b-434a-8c4b-2e65c8c36007', '2022-02-25 08:57:10', '2022-02-25 08:57:10', 'JavaScript Web Development Full Courrse', '3218b65c-e748-482f-ab85-a3b16346c1f7', 'b3deae12-7838-45ea-bacc-005544f56c9f'),
('647f454b-3c36-4830-9973-5138cc926b7f', '2022-02-25 09:25:12', '2022-02-25 09:25:12', 'Building Web Applications with Angular and SpringBoot', '3e98da1c-6b1b-4b8f-bcbf-7cb6088c071c', 'b3deae12-7838-45ea-bacc-005544f56c9f'),
('4426648b-c56a-4f69-a4b1-d45b1ce9eb80', '2022-02-25 09:25:12', '2022-02-25 09:25:12', 'title 2', 'a0403b1e-e0df-47a4-a5e5-ad146865bf69', 'b3deae12-7838-45ea-bacc-005544f56c9f'),
('291cfd9e-d7a9-48a7-8a70-2d0f9f6efc5b', '2022-02-25 10:12:25', '2022-02-25 10:12:25', 'book title', 'abcaf2b5-88b9-4e28-821d-00bf45f245ee', 'a3eb83c5-bcd3-4ee0-9435-7856601a59ca'),
('ea91b25e-5fd5-458a-8958-bbd7e9f9937d', '2022-02-25 10:12:25', '2022-02-25 10:12:25', 'Building Web Applications with Angular and SpringBoot', '3e98da1c-6b1b-4b8f-bcbf-7cb6088c071c', 'a3eb83c5-bcd3-4ee0-9435-7856601a59ca'),
('9418a9be-c303-4d76-9a34-8ee3dd5497e6', '2022-02-25 10:33:49', '2022-02-25 10:33:49', 'check this out', 'c62d3add-f35f-4d77-b7c0-4ef7af397fd6', 'a3eb83c5-bcd3-4ee0-9435-7856601a59ca'),
('37542763-baa2-4eed-9745-62e65135085f', '2022-02-25 10:33:49', '2022-02-25 10:33:49', 'Database Design and Implementation', 'cd2369d7-bbe4-4c06-88bf-9f77d52ee81c', 'a3eb83c5-bcd3-4ee0-9435-7856601a59ca'),
('4474f72f-d5f1-4712-8b24-7ed8275175f6', '2022-02-25 11:00:22', '2022-02-25 11:00:22', 'Data Structures and Algorithms Vol 1', '95fc37db-9c8c-4e30-bb25-8de15a9708e4', 'a3eb83c5-bcd3-4ee0-9435-7856601a59ca'),
('f3e96938-69d9-46e5-9887-77737c4cb433', '2022-02-25 16:20:07', '2022-02-25 16:20:07', 'check this out', 'c62d3add-f35f-4d77-b7c0-4ef7af397fd6', '7dfda13c-cae8-461b-95e9-72a802871f0f'),
('ad79f09b-63b5-45b5-89db-05bc7efd6a0e', '2022-02-25 16:20:07', '2022-02-25 16:20:07', 'book title', 'abcaf2b5-88b9-4e28-821d-00bf45f245ee', '7dfda13c-cae8-461b-95e9-72a802871f0f'),
('dd7e23d0-79b2-466d-81fe-78c42d054d15', '2022-02-25 16:22:16', '2022-02-25 16:22:16', 'check this out', 'c62d3add-f35f-4d77-b7c0-4ef7af397fd6', '47a32ccd-21bf-4735-971f-062ac1d669ef'),
('73b4e882-359a-47ce-8052-49ffd6a23028', '2022-02-25 16:28:33', '2022-02-25 16:28:33', 'Java Web Development 3rd Edition', '44725fe1-2ef7-4210-aa89-b2cc0b331a36', '47a32ccd-21bf-4735-971f-062ac1d669ef'),
('00cfc5d2-5cf9-4151-80b2-64164c2f4fc1', '2022-02-25 16:28:33', '2022-02-25 16:28:33', 'book title', 'abcaf2b5-88b9-4e28-821d-00bf45f245ee', '47a32ccd-21bf-4735-971f-062ac1d669ef'),
('8f38bf1c-07b9-499a-9c60-88c73f2912c3', '2022-02-25 16:28:33', '2022-02-25 16:28:33', 'Java Web Development with Springboot 4th Edition', '0348dc14-e8af-4502-8abc-753b2d8d63ce', '47a32ccd-21bf-4735-971f-062ac1d669ef');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` varchar(50) NOT NULL,
  `active` bit(1) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `is_approved` bit(1) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `reason` longtext DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `active`, `email`, `is_approved`, `name`, `password`, `reason`) VALUES
('93444c6f-b79b-4dc7-9285-e29ff376bf7d', b'1', 'johndoe@gmail.com', b'1', 'John Doe', '$2a$10$J0hZPjnPjgdsUypYD0qcs.QkG.kBb3Tc.XGySHHE3GR974grwhFlS', NULL),
('a49a4d3c-2aa4-4d5b-92a3-b01f8cf02184', b'1', 'jonedoe@gmail.com', b'1', 'Jane Doe', '$2a$10$05LwMtRL.zxOG1CilUAxTuOfn9ttnbcUH4GdMZMhCgNamSlWrEMrm', NULL),
('7dfda13c-cae8-461b-95e9-72a802871f0f', b'1', 'pauldoe@gmail.com', b'1', 'Paul Doe', '$2a$10$Hzrag8sZ5e.FE1iYtqqIS.Hr49V9HHHXMM4IIL2tuH91COz.pr3VW', NULL),
('108d9382-3fdd-4de7-9111-12364d7f74fd', b'1', 'email@email.com', b'1', 'Enim nisi provident', '$2a$10$rXWUGIQ7xZ05lFFMW390p..8NRE6pZn7rEMDjL5bwgRHgptb.Fca2', NULL),
('3ec2eabf-f195-45ed-bb08-794f04b934d0', b'1', 'email12@email.com', b'1', 'Animi iste deserunt', '$2a$10$G8HZuyl.DRNNC.Cxrba.VuvirsAoJEhMyvpYZ07GWPQvtEWtOrZtq', NULL),
('f3fb78a5-8363-4433-bf5b-0aeb392d558a', b'1', 'reader@gmail.com', b'1', 'READER ACCOUNT', '$2a$10$Os5SGueIzBGnwc9p4AdHpeVCdSv5KDYv8tb4xfP.RQkeJ4EF79Oe2', NULL),
('e2c5b3c5-afa8-4063-adef-1e1f81a00a79', b'1', 'testuser@gmail.com', b'1', 'Pariatur Veritatis ', '$2a$10$9YRldG9GcF9WGQhfYWDo3uDth319XjWawh8JVdTEiAPeLvGbmvar2', NULL),
('707762a3-f411-4caf-b6d9-e02be5cdc648', b'1', 'edmond@gmail.com', b'1', 'Error dolorem ', '$2a$10$w2Dxa/7LgqMJsYGllGtnYOk79bPqcf0EM/8DoHbsq37xT6GOMUUBy', NULL),
('c3bab074-5e12-488a-afee-eeee9629347d', b'1', 'budiso@mailinator.com', b'0', 'Ea laboris quidem se', '$2a$10$FsYZSCrwc0QBObeBJQo/jeIaJ4CGiOH7ArKOGGOasy2RynLU.kxNq', NULL),
('8d682fd6-0b87-4263-bd0e-e81c30f13e92', b'1', 'tynowazuha@mailinator.com', b'0', 'Assumenda et magni o', '$2a$10$D0qXb6GaFcU06dwn3naMQOl8z8TRX2xIRCPm7WhQpFpX5aUXfaWo2', NULL),
('a3a8ebc8-6c6e-418e-bd5f-be477b1dfe6f', b'1', 'fojaju@mailinator.com', b'0', 'Molestiae provident', '$2a$10$9CbCsHCDVq9BX7djq59hQugrxRLaUKcIiKk/DutPl5uZwWCsyx8Aq', NULL),
('6b00ed46-cdbb-4ca1-9f67-90f6a4270623', b'1', 'miduwukej@mailinator.com', b'0', 'Error do voluptas la', '$2a$10$Cf71NMylI1be7c8mj4n6MeUnkxk.NE.mjCwLIhP/FJE8fCIQ0umx6', NULL),
('e7f9be0b-5f18-400b-b905-9b00a4ab13b0', b'1', 'xezudynad@mailinator.com', b'0', 'At quam quo atque mo', '$2a$10$fWuBSepJ9keru2ulyQTM7uU9aYoyypOCgc09e17W.lKTLUcQc.khe', NULL),
('61facbd1-ac22-4683-8c5e-6a4d7d36ba8e', b'1', 'zepixuq@mailinator.com', b'0', 'Magni cumque culpa q', '$2a$10$p8ZNqwtrPqZFuLva1RnVR.JAgngKd1zGQA7esTbjD7eA.9UCz2cLq', NULL),
('1def0ae6-6cbe-4f04-befb-360380500d92', b'1', 'qicenaq@mailinator.com', b'0', 'Deserunt et labore a', '$2a$10$yPbovXvcG3fvyCXuwAknxepOLCQBQjcJJ1KK5QLsteHBfSxgpH84i', NULL),
('53b6606f-69cd-46e0-bd8d-3cf8eccebaad', b'1', 'wary@mailinator.com', b'0', 'Ullam consequat', '$2a$10$6EJllhB.mlhqRbJxmjwZF.Pv8IqChqK6Of85.yHrBk19pMoQFCUzW', NULL),
('55d048bf-90b5-4bb4-b6f8-f0f1871e46d7', b'1', 'chi@gmail.com', b'0', 'chi mah', '$2a$10$N1mM/ofbCm1Uk4WvgBZOVes1.xg/PnOL0Ci9.qfd08NLheLUMV7nm', NULL),
('ffb655b3-35c2-462d-b804-0a8a3e8e56e1', b'1', 'jane@gmail.com', b'1', 'Jane', '$2a$10$qdVwtxvcDSBg/FzfHNBbluMAYTsoffwVXQj5j29otjZuh4WrWuEVa', NULL),
('410393ac-6f64-4df7-bd9a-8f315ec1b1aa', b'1', 'janedoe@gmail.com', b'0', 'Alice', '$2a$10$60.WvPTzE.0bhgfgohSAmunvuozMSl34qLza8gosHGrSFUULqn46q', NULL),
('16afcae5-5c4a-4ee2-8bea-6215dfaef5f0', b'1', 'ui@gmail.com', b'0', 'Hillkim', '$2a$10$VArZXdx2t275nnA508ut0On/9o3Q52hoB2O4Vj5YLBJQm894NHD4W', NULL),
('a58a6308-d3c1-415b-8df2-6d350bc49ec4', b'1', 'waziny@mailinator.com', b'0', 'Lorem amet dolor qu', '$2a$10$1oZIg85j/fizMU1mPQEfi.jCuCyIN4JNtQgSr9ZJ44qO1th6FB6ja', NULL),
('1b7b54d9-ea76-4d07-951c-0f51bd5783c6', b'1', 'morelle@gmail.com', b'0', 'Morelle', '$2a$10$kqtj3pU.R6weLhNxrGaKs.a.v/njY9.0lm099Hph4db5eMTR/zbpe', NULL),
('0f3ab68d-1f31-4457-801c-05f2d3aac7ea', b'1', 'ndzodaniel31@gmail.com', b'1', 'DANIEL UGHE', '$2a$10$iRRcOzKpbBHZNXpcAB/CFOB.T6b5fOAUTz1EW3Zu5oXvsdeODKoHK', NULL),
('d68c97bc-3edf-4649-97ac-354be2305a4b', b'1', 'johndoe1@gmail.com', b'0', 'John Doe1', '$2a$10$C7.3QpIPajPO5BYOSolKyuA/g10YwyNiwEgnR7NNfrd.4/9ocNIsG', NULL),
('73f8406d-2ad7-4fb5-a9af-eb8685ef20b7', b'1', 'peterjerry@gmail.com', b'1', 'Peter Jerry', '$2a$10$mAg5T1uma6lDhFMGfgA9EOyuA9priuxNySrlBXYPvD9UZuyPA3SY2', NULL),
('d2a3acc1-8c91-4c39-a5ea-9e9ee88cc939', b'1', 'angela@gmail.com', b'0', 'Angela Afor', '$2a$10$DC4gUbXW.0HCDKyOvKvIN.19HZWBqjIQZRX8KfGHuysHEE/57b3y.', NULL),
('3a134e65-46b7-4b7e-b9fe-637b4c300ef3', b'1', 'morellet@gmail.com', b'0', 'Morelle', '$2a$10$j9.mwJpkui6l2gTjJGS6lefeZOp0Yn2iv9eZIL3bwA4vuk/eaHhsW', NULL),
('6e5612f9-8320-48a1-a227-ac4bc764e161', b'1', 'ndzo@gmail.com', b'1', 'NDZO DANIEL', '$2a$10$0sjKSPOf4Gn2rKmK4zvTJutP6AH3S1Ime4hoHVj9Cxicu1DPEZdf2', NULL),
('6c269c89-2a53-4abb-a24a-de8043ca9055', b'1', 'ndzodaniel32@gmail.com', b'0', 'WISEMAN DANIEL', '$2a$10$4Mh/cUGuZIV63Xbl6ulLFeykvqtBKuxKr9/.4Cq4/epte/78L1cvi', NULL),
('3bc693b0-bf4b-45ee-8e70-e831cfbccc6a', b'1', 'anotheruser@gmail.com', b'1', 'anotherUser', '$2a$10$g/J8EBa94V2c7GAttdlfOOvn5kV2m2HNB/yRluT8.6AgJfMapkDam', NULL),
('0e5f7ca7-c7b4-49d9-ac7d-f59bc801e2ac', b'1', 'jofiky@mailinator.com', b'0', 'Adipisci vitae vero ', '$2a$10$XNCHypkyrlSQ1A7Gfkq6/un6qzF8Vq.UCRuD2Gw1ND7vMiUpkyfHG', NULL),
('dc4d8e2b-262e-44db-941a-ffcb8acf0c98', b'1', 'hifoz@mailinator.com', b'0', 'Aliquam doloribus do', '$2a$10$npC7rn5aiH43HlJNaM1IcOLgwy9li7uKdvcWDlvCUbCeLnSdmcVXy', NULL),
('43e68198-19cd-4a45-b943-2c4d95520aa5', b'1', 'myculacixe@mailinator.com', b'0', 'Sint ut quis quae om', '$2a$10$ZMEcVeeUe2kWlClZezFUu.jhdDnlnHUzeHlX071T8VAFF6K1DlWCC', NULL),
('e42094d0-441b-4c3d-b25d-bbdd26c6b2c5', b'1', 'suhedmond@gmail.com', b'1', 'SUH EDMOND', '$2a$10$3xytnIp41YuIHXtz1IPBqeyHwK26X9VWGrq0mF9MY2ZCelR1bHqGO', NULL),
('3ca80503-bb6b-4d13-a334-a1ebdf16d6f5', b'1', 'me@gmail.com', b'0', 'me', '$2a$10$i41tw8rHCYngiCHRoV2HQeoPZ9.6DLH33nEZg46EL1OzoNhi1.Qvi', 'To publish books\nAbout science and technology\nProvide legit info'),
('4f10fa67-4396-497f-bb27-ef5f2d138eb0', b'1', 'you@gmail.com', b'1', 'you', '$2a$10$BWX.42afGWGpyDXoJlB08O5B4MC/Qy38NG8MY2oWAZCeS1mB11YoK', 'publish article\narticles about science and technology\nprovide legit info'),
('cbfb5e3d-70f8-4496-8fc1-aa712935cb50', b'1', 'wyryqu@mailinator.com', b'0', 'Placeat cupidatat s', '$2a$10$nEsTi993pvuMvjsOC.2WzOlJ9xWlTl/U8ld9CDq3kiZaiYT3AwXXu', NULL),
('884835f5-6ca5-406d-84bc-c67c9fb3150e', b'1', 'cumar@mailinator.com', b'0', 'Labore dolor recusan', '$2a$10$Odg59F6SAGEFJt3oJCULsuZTiswnVwkx3IPJgqr2VZYv031b5rh0a', NULL),
('6a964d44-d60a-4e4c-9cae-e0da5c5fd076', b'1', 'wapuh@mailinator.com', b'0', 'Soluta eum ad velit', '$2a$10$cTvL.qdYtvja8UJhTynKx.IKFacGpx2a5nISvE16EL7IHn7M1SdpC', NULL),
('b3deae12-7838-45ea-bacc-005544f56c9f', b'1', 'gyhike@mailinator.com', b'1', 'Deserunt duis repudi', '$2a$10$DSMnfiafXvNfGBtw2omU3uKmExYwwTgpYQkTuTe5C2HHTu2/B34wK', NULL),
('7de3efe6-29e7-45ee-8e75-c85cbf8d9597', b'1', 'morellegg@gmail.com', b'1', 'morelle gg', '$2a$10$Qyx5SCV7X.WNFDKfBI3Hv.pltqLRnNB12QRrQdb7tpks72PLexdkS', 'publish legit books about health.'),
('37e830b3-8570-496e-883a-d7ae11df4738', b'1', 'gijil@mailinator.com', b'0', 'Id magna nesciunt e', '$2a$10$k0SRmE1giuY8hUqqiEZb/.vkmvEOZVLdcyr3lbeWWSTuI1HzVqxLC', NULL),
('8fee9584-5ca6-43ff-92d0-522bb205a16d', b'1', 'rejygoje@mailinator.com', b'0', 'In cupiditate conseq', '$2a$10$SxgfKUZiL3CTqREZV/mi2ePZYChKicmTsZAByWWdDPGvU6rmGB/oC', NULL),
('a3eb83c5-bcd3-4ee0-9435-7856601a59ca', b'1', 'qyhyly@mailinator.com', b'0', 'Alias facere maiores', '$2a$10$kcUlHFbBpKciGG6VMqs4weRQPYnFk3bAbZ40wvL3/lvg/hXTTGhRW', NULL),
('6cd88680-cd72-4fe9-b6ae-44a35912ddea', b'1', 'mibiqoti@mailinator.com', b'0', 'Qui nostrum eaque ex', '$2a$10$CjOQM6eIoXl74i0y.UBi8upWcnHReVnHsiThSxRWvdwhW5xKV4qYi', NULL),
('47a32ccd-21bf-4735-971f-062ac1d669ef', b'1', 'palutyf@mailinator.com', b'0', 'Voluptas excepteur p', '$2a$10$1fekRcgBRkRLZ8wzjVrpK.rN4fQsuw1Oz6bckkQ2/RN4UvB4ntsRi', NULL),
('a2354b20-dbbc-4fcb-bd51-5fbc0b5a1e6f', b'1', 'havy@mailinator.com', b'0', 'Quaerat voluptatum d', '$2a$10$2Y.ttsACl.Xtns5h70nrEuFhdkPRFLZCMGaMAmcwAzqttQ03MUDiS', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_role`
--

CREATE TABLE `user_role` (
  `user_id` varchar(50) NOT NULL,
  `role_id` bigint(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_role`
--

INSERT INTO `user_role` (`user_id`, `role_id`) VALUES
('93444c6f-b79b-4dc7-9285-e29ff376bf7d', 2),
('93444c6f-b79b-4dc7-9285-e29ff376bf7d', 3),
('a49a4d3c-2aa4-4d5b-92a3-b01f8cf02184', 3),
('93444c6f-b79b-4dc7-9285-e29ff376bf7d', 1),
('7dfda13c-cae8-461b-95e9-72a802871f0f', 3),
('3ec2eabf-f195-45ed-bb08-794f04b934d0', 3),
('3ec2eabf-f195-45ed-bb08-794f04b934d0', 2),
('e2c5b3c5-afa8-4063-adef-1e1f81a00a79', 3),
('e2c5b3c5-afa8-4063-adef-1e1f81a00a79', 2),
('707762a3-f411-4caf-b6d9-e02be5cdc648', 3),
('707762a3-f411-4caf-b6d9-e02be5cdc648', 2),
('c3bab074-5e12-488a-afee-eeee9629347d', 3),
('47a32ccd-21bf-4735-971f-062ac1d669ef', 3),
('8d682fd6-0b87-4263-bd0e-e81c30f13e92', 3),
('a3a8ebc8-6c6e-418e-bd5f-be477b1dfe6f', 3),
('6b00ed46-cdbb-4ca1-9f67-90f6a4270623', 3),
('e7f9be0b-5f18-400b-b905-9b00a4ab13b0', 3),
('61facbd1-ac22-4683-8c5e-6a4d7d36ba8e', 3),
('1def0ae6-6cbe-4f04-befb-360380500d92', 3),
('53b6606f-69cd-46e0-bd8d-3cf8eccebaad', 3),
('55d048bf-90b5-4bb4-b6f8-f0f1871e46d7', 3),
('ffb655b3-35c2-462d-b804-0a8a3e8e56e1', 3),
('ffb655b3-35c2-462d-b804-0a8a3e8e56e1', 2),
('a49a4d3c-2aa4-4d5b-92a3-b01f8cf02184', 2),
('410393ac-6f64-4df7-bd9a-8f315ec1b1aa', 3),
('16afcae5-5c4a-4ee2-8bea-6215dfaef5f0', 3),
('a58a6308-d3c1-415b-8df2-6d350bc49ec4', 3),
('1b7b54d9-ea76-4d07-951c-0f51bd5783c6', 3),
('0f3ab68d-1f31-4457-801c-05f2d3aac7ea', 3),
('0f3ab68d-1f31-4457-801c-05f2d3aac7ea', 2),
('d68c97bc-3edf-4649-97ac-354be2305a4b', 3),
('108d9382-3fdd-4de7-9111-12364d7f74fd', 2),
('73f8406d-2ad7-4fb5-a9af-eb8685ef20b7', 2),
('d2a3acc1-8c91-4c39-a5ea-9e9ee88cc939', 3),
('108d9382-3fdd-4de7-9111-12364d7f74fd', 3),
('f3fb78a5-8363-4433-bf5b-0aeb392d558a', 3),
('3a134e65-46b7-4b7e-b9fe-637b4c300ef3', 3),
('6e5612f9-8320-48a1-a227-ac4bc764e161', 3),
('6e5612f9-8320-48a1-a227-ac4bc764e161', 2),
('7dfda13c-cae8-461b-95e9-72a802871f0f', 2),
('6c269c89-2a53-4abb-a24a-de8043ca9055', 3),
('3bc693b0-bf4b-45ee-8e70-e831cfbccc6a', 3),
('3bc693b0-bf4b-45ee-8e70-e831cfbccc6a', 2),
('0e5f7ca7-c7b4-49d9-ac7d-f59bc801e2ac', 3),
('dc4d8e2b-262e-44db-941a-ffcb8acf0c98', 3),
('43e68198-19cd-4a45-b943-2c4d95520aa5', 3),
('e42094d0-441b-4c3d-b25d-bbdd26c6b2c5', 3),
('e42094d0-441b-4c3d-b25d-bbdd26c6b2c5', 2),
('4f10fa67-4396-497f-bb27-ef5f2d138eb0', 3),
('3ca80503-bb6b-4d13-a334-a1ebdf16d6f5', 3),
('4f10fa67-4396-497f-bb27-ef5f2d138eb0', 2),
('cbfb5e3d-70f8-4496-8fc1-aa712935cb50', 3),
('884835f5-6ca5-406d-84bc-c67c9fb3150e', 3),
('6a964d44-d60a-4e4c-9cae-e0da5c5fd076', 3),
('b3deae12-7838-45ea-bacc-005544f56c9f', 3),
('b3deae12-7838-45ea-bacc-005544f56c9f', 2),
('7de3efe6-29e7-45ee-8e75-c85cbf8d9597', 3),
('7de3efe6-29e7-45ee-8e75-c85cbf8d9597', 2),
('6cd88680-cd72-4fe9-b6ae-44a35912ddea', 3),
('37e830b3-8570-496e-883a-d7ae11df4738', 3),
('8fee9584-5ca6-43ff-92d0-522bb205a16d', 3),
('a3eb83c5-bcd3-4ee0-9435-7856601a59ca', 3),
('a3eb83c5-bcd3-4ee0-9435-7856601a59ca', 2),
('47a32ccd-21bf-4735-971f-062ac1d669ef', 2),
('a2354b20-dbbc-4fcb-bd51-5fbc0b5a1e6f', 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKy5kkohbk00g0w88fi05k2hcw` (`category_id`),
  ADD KEY `FKbc2qerk3l47javnl2yvn51uoi` (`user_id`);

--
-- Indexes for table `article_contributors`
--
ALTER TABLE `article_contributors`
  ADD KEY `FK3uf63qmvl4mxt6exhooumo58` (`contributor_id`),
  ADD KEY `FKh8ft18pyrun0br28te6gv13fk` (`article_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contributor`
--
ALTER TABLE `contributor`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `refresh_token`
--
ALTER TABLE `refresh_token`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_r4k4edos30bx9neoq81mdvwph` (`token`) USING HASH,
  ADD KEY `FKfgk1klcib7i15utalmcqo7krt` (`user_id`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKkd05i53a357icx0p54t4agafm` (`article_id`),
  ADD KEY `FKsg7jp0aj6qipr50856wf6vbw1` (`user_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_role`
--
ALTER TABLE `user_role`
  ADD KEY `FKa68196081fvovjhkek5m97n3y` (`role_id`),
  ADD KEY `FK859n2jvi8ivhui0rl0esws6o` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `refresh_token`
--
ALTER TABLE `refresh_token`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=171;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
