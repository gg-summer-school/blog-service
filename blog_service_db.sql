-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jan 29, 2022 at 06:09 PM
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
('44725fe1-2ef7-4210-aa89-b2cc0b331a36', '2022-01-28 14:58:11', '2022-01-28 17:10:05', '<p class=\"ql-align-justify\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vestibulum dictum tellus, eu venenatis nunc imperdiet ut. Maecenas orci eros, tincidunt id maximus sit amet, ultricies a erat. Cras elementum orci orci, dapibus dignissim nunc ultricies non. Praesent ac odio bibendum, sagittis ante ornare, venenatis massa. Nunc non justo eu arcu faucibus sagittis sed et libero. Suspendisse ullamcorper ligula ac lectus tempor consectetur. Aenean tincidunt, odio ut pharetra feugiat, arcu erat blandit mi, nec tincidunt leo massa a quam. Praesent gravida sapien nec pretium volutpat. Vestibulum faucibus mi vel pellentesque tristique. Nunc at tristique ligula, et mollis erat.</p><p class=\"ql-align-justify\">Curabitur eu scelerisque ligula. Phasellus est eros, aliquet vel sollicitudin nec, volutpat vel turpis. Donec blandit posuere nibh quis facilisis. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin augue quam, euismod in ornare non, pretium sed risus. Cras dapibus semper lacus semper imperdiet. Integer sed diam tempus, porta velit eu, semper ligula. Vestibulum tincidunt fermentum velit, quis euismod metus fringilla accumsan. Nunc sit amet convallis dolor. In lectus justo, elementum vel orci sit amet, auctor lobortis elit. Morbi ut tempor ante, non pulvinar mi. Fusce purus leo, viverra sit amet nulla nec, lacinia tristique sapien. Suspendisse ac elementum velit, sed rutrum ante. Mauris rutrum lectus quam, vel mollis orci tincidunt non</p><p><br></p>', 'Book Cover 06.jpg', 'ASSIGNMENT ON E-R MODELING.pdf', '2000.00', 'Java Web Development 3rd Edition', '<p class=\"ql-align-justify\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vestibulum dictum tellus, eu venenatis nunc imperdiet ut. Maecenas orci eros, tincidunt id maximus sit amet, ultricies a erat. Cras elementum orci orci, dapibus dignissim nunc ultricies non. Praesent ac odio bibendum, sagittis ante ornare, venenatis massa. Nunc non justo eu arcu faucibus sagittis sed et libero. Suspendisse ullamcorper ligula ac lectus tempor consectetur. Aenean tincidunt, odio ut pharetra feugiat, arcu erat blandit mi, nec tincidunt leo massa a quam. Praesent gravida sapien nec pretium volutpat. Vestibulum faucibus mi vel pellentesque tristique. Nunc at tristique ligula, et mollis erat.</p><p class=\"ql-align-justify\">Curabitur eu scelerisque ligula. Phasellus est eros, aliquet vel sollicitudin nec, volutpat vel turpis. Donec blandit posuere nibh quis facilisis. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin augue quam, euismod in ornare non, pretium sed risus. Cras dapibus semper lacus semper imperdiet. Integer sed diam tempus, porta velit eu, semper ligula. Vestibulum tincidunt fermentum velit, quis euismod metus fringilla accumsan. Nunc sit amet convallis dolor. In lectus justo, elementum vel orci sit amet, auctor lobortis elit. Morbi ut tempor ante, non pulvinar mi. Fusce purus leo, viverra sit amet nulla nec, lacinia tristique sapien. Suspendisse ac elementum velit, sed rutrum ante. Mauris rutrum lectus quam, vel mollis orci tincidunt non</p><p><br></p>', '4a1e4a7a-3e2c-48fc-8ab2-b1fee49ffaa5', '7dfda13c-cae8-461b-95e9-72a802871f0f'),
('0348dc14-e8af-4502-8abc-753b2d8d63ce', '2022-01-28 14:59:17', '2022-01-28 14:59:41', '<p class=\"ql-align-justify\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vestibulum dictum tellus, eu venenatis nunc imperdiet ut. Maecenas orci eros, tincidunt id maximus sit amet, ultricies a erat. Cras elementum orci orci, dapibus dignissim nunc ultricies non. Praesent ac odio bibendum, sagittis ante ornare, venenatis massa. Nunc non justo eu arcu faucibus sagittis sed et libero. Suspendisse ullamcorper ligula ac lectus tempor consectetur. Aenean tincidunt, odio ut pharetra feugiat, arcu erat blandit mi, nec tincidunt leo massa a quam. Praesent gravida sapien nec pretium volutpat. Vestibulum faucibus mi vel pellentesque tristique. Nunc at tristique ligula, et mollis erat.</p><p class=\"ql-align-justify\">Curabitur eu scelerisque ligula. Phasellus est eros, aliquet vel sollicitudin nec, volutpat vel turpis. Donec blandit posuere nibh quis facilisis. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin augue quam, euismod in ornare non, pretium sed risus. Cras dapibus semper lacus semper imperdiet. Integer sed diam tempus, porta velit eu, semper ligula. Vestibulum tincidunt fermentum velit, quis euismod metus fringilla accumsan. Nunc sit amet convallis dolor. In lectus justo, elementum vel orci sit amet, auctor lobortis elit. Morbi ut tempor ante, non pulvinar mi. Fusce purus leo, viverra sit amet nulla nec, lacinia tristique sapien. Suspendisse ac elementum velit, sed rutrum ante. Mauris rutrum lectus quam, vel mollis orci tincidunt non</p><p><br></p>', '1201.jpg', 'appology.pdf', '20000.00', 'Java Web Development with Springboot 4th Edition', '<p class=\"ql-align-justify\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vestibulum dictum tellus, eu venenatis nunc imperdiet ut. Maecenas orci eros, tincidunt id maximus sit amet, ultricies a erat. Cras elementum orci orci, dapibus dignissim nunc ultricies non. Praesent ac odio bibendum, sagittis ante ornare, venenatis massa. Nunc non justo eu arcu faucibus sagittis sed et libero. Suspendisse ullamcorper ligula ac lectus tempor consectetur. Aenean tincidunt, odio ut pharetra feugiat, arcu erat blandit mi, nec tincidunt leo massa a quam. Praesent gravida sapien nec pretium volutpat. Vestibulum faucibus mi vel pellentesque tristique. Nunc at tristique ligula, et mollis erat.</p><p class=\"ql-align-justify\">Curabitur eu scelerisque ligula. Phasellus est eros, aliquet vel sollicitudin nec, volutpat vel turpis. Donec blandit posuere nibh quis facilisis. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin augue quam, euismod in ornare non, pretium sed risus. Cras dapibus semper lacus semper imperdiet. Integer sed diam tempus, porta velit eu, semper ligula. Vestibulum tincidunt fermentum velit, quis euismod metus fringilla accumsan. Nunc sit amet convallis dolor. In lectus justo, elementum vel orci sit amet, auctor lobortis elit. Morbi ut tempor ante, non pulvinar mi. Fusce purus leo, viverra sit amet nulla nec, lacinia tristique sapien. Suspendisse ac elementum velit, sed rutrum ante. Mauris rutrum lectus quam, vel mollis orci tincidunt non</p><p><br></p>', '4a1e4a7a-3e2c-48fc-8ab2-b1fee49ffaa2', '7dfda13c-cae8-461b-95e9-72a802871f0f'),
('ac861616-225e-47ec-8ed1-250f2f62729e', '2022-01-28 15:35:57', '2022-01-28 15:49:07', '<p class=\"ql-align-justify\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vestibulum dictum tellus, eu venenatis nunc imperdiet ut. Maecenas orci eros, tincidunt id maximus sit amet, ultricies a erat. Cras elementum orci orci, dapibus dignissim nunc ultricies non. Praesent ac odio bibendum, sagittis ante ornare, venenatis massa. Nunc non justo eu arcu faucibus sagittis sed et libero. Suspendisse ullamcorper ligula ac lectus tempor consectetur. Aenean tincidunt, odio ut pharetra feugiat, arcu erat blandit mi, nec tincidunt leo massa a quam. Praesent gravida sapien nec pretium volutpat. Vestibulum faucibus mi vel pellentesque tristique. Nunc at tristique ligula, et mollis erat.</p><p class=\"ql-align-justify\">Curabitur eu scelerisque ligula. Phasellus est eros, aliquet vel sollicitudin nec, volutpat vel turpis. Donec blandit posuere nibh quis facilisis. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin augue quam, euismod in ornare non, pretium sed risus. Cras dapibus semper lacus semper imperdiet. Integer sed diam tempus, porta velit eu, semper ligula. Vestibulum tincidunt fermentum velit, quis euismod metus fringilla accumsan. Nunc sit amet convallis dolor. In lectus justo, elementum vel orci sit amet, auctor lobortis elit. Morbi ut tempor ante, non pulvinar mi. Fusce purus leo, viverra sit amet nulla nec, lacinia tristique sapien. Suspendisse ac elementum velit, sed rutrum ante. Mauris rutrum lectus quam, vel mollis orci tincidunt non</p><p><br></p>', '1965061.jpg', 'Java - How to Program 10th Ed - Early Objects Version - Deitel.pdf', '10000.00', 'PHP  Web Development with Laravel Framework', '<p class=\"ql-align-justify\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vestibulum dictum tellus, eu venenatis nunc imperdiet ut. Maecenas orci eros, tincidunt id maximus sit amet, ultricies a erat. Cras elementum orci orci, dapibus dignissim nunc ultricies non. Praesent ac odio bibendum, sagittis ante ornare, venenatis massa. Nunc non justo eu arcu faucibus sagittis sed et libero. Suspendisse ullamcorper ligula ac lectus tempor consectetur. Aenean tincidunt, odio ut pharetra feugiat, arcu erat blandit mi, nec tincidunt leo massa a quam. Praesent gravida sapien nec pretium volutpat. Vestibulum faucibus mi vel pellentesque tristique. Nunc at tristique ligula, et mollis erat.</p><p class=\"ql-align-justify\">Curabitur eu scelerisque ligula. Phasellus est eros, aliquet vel sollicitudin nec, volutpat vel turpis. Donec blandit posuere nibh quis facilisis. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin augue quam, euismod in ornare non, pretium sed risus. Cras dapibus semper lacus semper imperdiet. Integer sed diam tempus, porta velit eu, semper ligula. Vestibulum tincidunt fermentum velit, quis euismod metus fringilla accumsan. Nunc sit amet convallis dolor. In lectus justo, elementum vel orci sit amet, auctor lobortis elit. Morbi ut tempor ante, non pulvinar mi. Fusce purus leo, viverra sit amet nulla nec, lacinia tristique sapien. Suspendisse ac elementum velit, sed rutrum ante. Mauris rutrum lectus quam, vel mollis orci tincidunt non</p><p><br></p>', 'la1e4a7a-3e2c-48fc-8ab2-b1fee49ffaab', '7dfda13c-cae8-461b-95e9-72a802871f0f'),
('536eb45f-52e0-4f7d-9be8-7fa7f68b848d', '2022-01-28 16:59:29', '2022-01-28 17:00:49', '<p class=\"ql-align-justify\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vestibulum dictum tellus, eu venenatis nunc imperdiet ut. Maecenas orci eros, tincidunt id maximus sit amet, ultricies a erat. Cras elementum orci orci, dapibus dignissim nunc ultricies non. Praesent ac odio bibendum, sagittis ante ornare, venenatis massa. Nunc non justo eu arcu faucibus sagittis sed et libero. Suspendisse ullamcorper ligula ac lectus tempor consectetur. Aenean tincidunt, odio ut pharetra feugiat, arcu erat blandit mi, nec tincidunt leo massa a quam. Praesent gravida sapien nec pretium volutpat. Vestibulum faucibus mi vel pellentesque tristique. Nunc at tristique ligula, et mollis erat.</p><p><span style=\"color: rgb(0, 0, 0);\">Curabitur eu scelerisque ligula. Phasellus est eros, aliquet vel sollicitudin nec, volutpat vel turpis. Donec blandit posuere nibh quis facilisis. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin augue quam, euismod in ornare non, pretium sed risus. Cras dapibus semper lacus semper imperdiet. Integer sed diam tempus, porta velit eu, semper ligula. Vestibulum tincidunt fermentum velit, quis euismod metus fringilla accumsan. Nunc sit amet convallis dolor. In lectus justo, elementum vel orci sit amet, auctor lobortis elit. Morbi ut tempor ante, non pulvinar mi. Fusce purus leo, viverra sit amet nulla nec, lacinia tristique sapien. Suspendisse ac elementum velit, sed rutrum ante. Mauris rutrum lectus quam, vel mollis orci tincidunt non</span>Omnis esse minim vol.</p>', 'Flyer 8.jpg', 'Neo4j_Graph_Algorithms_r3.pdf', '8000.00', 'Vue js Development 1st Edition', '<p class=\"ql-align-justify\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vestibulum dictum tellus, eu venenatis nunc imperdiet ut. Maecenas orci eros, tincidunt id maximus sit amet, ultricies a erat. Cras elementum orci orci, dapibus dignissim nunc ultricies non. Praesent ac odio bibendum, sagittis ante ornare, venenatis massa. Nunc non justo eu arcu faucibus sagittis sed et libero. Suspendisse ullamcorper ligula ac lectus tempor consectetur. Aenean tincidunt, odio ut pharetra feugiat, arcu erat blandit mi, nec tincidunt leo massa a quam. Praesent gravida sapien nec pretium volutpat. Vestibulum faucibus mi vel pellentesque tristique. Nunc at tristique ligula, et mollis erat.</p><p><span style=\"color: rgb(0, 0, 0);\">Curabitur eu scelerisque ligula. Phasellus est eros, aliquet vel sollicitudin nec, volutpat vel turpis. Donec blandit posuere nibh quis facilisis. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin augue quam, euismod in ornare non, pretium sed risus. Cras dapibus semper lacus semper imperdiet. Integer sed diam tempus, porta velit eu, semper ligula. Vestibulum tincidunt fermentum velit, quis euismod metus fringilla accumsan. Nunc sit amet convallis dolor. In lectus justo, elementum vel orci sit amet, auctor lobortis elit. Morbi ut tempor ante, non pulvinar mi. Fusce purus leo, viverra sit amet nulla nec, lacinia tristique sapien. Suspendisse ac elementum velit, sed rutrum ante. Mauris rutrum lectus quam, vel mollis orci tincidunt non</span>Modi culpa, obcaecat.</p>', 'da1e4a7a-3e2c-48fc-8ab2-b1fee49ffaa2', '7dfda13c-cae8-461b-95e9-72a802871f0f');

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
('536eb45f-52e0-4f7d-9be8-7fa7f68b848d', 'f1ae5018-85f4-4bc1-9a9f-ea49b0358605');

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
('6a1e4a7a-3e2c-48fc-8ab2-b1fee49ffaa8', 'SOFTWARE ENGINEERING');

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
('f1ae5018-85f4-4bc1-9a9f-ea49b0358605', ' Daniel');

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
(9, '2022-01-29 16:41:35', '9feb4cef-e438-424b-aa59-33a9da247dff', '7dfda13c-cae8-461b-95e9-72a802871f0f');

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
  `password` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `active`, `email`, `is_approved`, `name`, `password`) VALUES
('93444c6f-b79b-4dc7-9285-e29ff376bf7d', b'1', 'johndoe@gmail.com', b'0', 'John Doe', '$2a$10$J0hZPjnPjgdsUypYD0qcs.QkG.kBb3Tc.XGySHHE3GR974grwhFlS'),
('a49a4d3c-2aa4-4d5b-92a3-b01f8cf02184', b'1', 'jonedoe@gmail.com', b'1', 'Jane Doe', '$2a$10$05LwMtRL.zxOG1CilUAxTuOfn9ttnbcUH4GdMZMhCgNamSlWrEMrm'),
('7dfda13c-cae8-461b-95e9-72a802871f0f', b'1', 'pauldoe@gmail.com', b'1', 'Paul Doe', '$2a$10$Hzrag8sZ5e.FE1iYtqqIS.Hr49V9HHHXMM4IIL2tuH91COz.pr3VW'),
('108d9382-3fdd-4de7-9111-12364d7f74fd', b'1', 'email@email.com', b'0', 'Enim nisi provident', '$2a$10$rXWUGIQ7xZ05lFFMW390p..8NRE6pZn7rEMDjL5bwgRHgptb.Fca2');

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
('7dfda13c-cae8-461b-95e9-72a802871f0f', 2),
('108d9382-3fdd-4de7-9111-12364d7f74fd', 3),
('108d9382-3fdd-4de7-9111-12364d7f74fd', 2);

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
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
