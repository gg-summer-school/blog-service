-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jan 22, 2022 at 10:03 PM
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
('5f44841d-45ef-4e3b-afb6-bc68cd11a946', '2022-01-21 00:49:26', '2022-01-21 00:50:07', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'pic.png', 'ASSIGNMENT ON E-R MODELING.pdf', '100.00', 'Java Web', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', '4a1e4a7a-3e2c-48fc-8ab2-b1fee49ffaa3', '6943c646-144b-4b6a-893c-2050b321848e'),
('ad0f0931-36fb-4b04-a4ce-33f7546f7ba2', '2022-01-21 08:59:56', '2022-01-21 09:00:30', 'articleAbstract', 'pic.png', 'ASSIGNMENT ON E-R MODELING.pdf', '1000.00', 'title', 'table of content', '3f46bf0d-a4e6-4373-befe-af3582f9cffa', '6943c646-144b-4b6a-893c-2050b321848e'),
('08066c00-f67f-48b7-9fb2-b21117b96773', '2022-01-21 09:00:51', '2022-01-21 13:33:30', 'articleAbstract', 'bg5].jpg', 'morning minute.pdf', '1000.00', 'title', 'table of content', '3f46bf0d-a4e6-4373-befe-af3582f9cffa', '6943c646-144b-4b6a-893c-2050b321848e'),
('e7515d19-7314-489a-b789-eb6428db1a24', '2022-01-21 09:01:53', '2022-01-21 09:02:49', 'articleAbstract', 'pic.png', 'ASSIGNMENT ON E-R MODELING.pdf', '1000.00', 'title', 'table of content', '3f46bf0d-a4e6-4373-befe-af3582f9cffa', '6943c646-144b-4b6a-893c-2050b321848e'),
('7f4cf023-8523-4ee9-8335-476f0f40b583', '2022-01-21 09:04:01', '2022-01-21 09:04:40', 'articleAbstract', 'pic.png', 'ASSIGNMENT ON E-R MODELING.pdf', '1000.00', 'title', 'table of content', '3f46bf0d-a4e6-4373-befe-af3582f9cffa', '6943c646-144b-4b6a-893c-2050b321848e'),
('791478b8-004b-47a2-881b-0ac3bb0e3dd0', '2022-01-21 09:05:45', '2022-01-21 09:06:15', 'articleAbstract', 'pic.png', 'ASSIGNMENT ON E-R MODELING.pdf', '1000.00', 'title', 'table of content', '3f46bf0d-a4e6-4373-befe-af3582f9cffa', '6943c646-144b-4b6a-893c-2050b321848e'),
('201790b0-9dc3-4ea8-934b-b15d02a682b1', '2022-01-21 11:05:20', '2022-01-21 13:40:30', '<h2><strong style=\"color: rgb(230, 0, 0);\">jeading hedepofkew</strong></h2><p>erijermgkler</p><p>rgijmqgerklgmer</p>', 'choc.jpg', 'Morning scrum.pdf', '3000.00', 'image3', '<h2><strong style=\"color: rgb(230, 0, 0);\">jeading hedepofkew</strong></h2><p>erijermgkler</p><p>rgijmqgerklgmer</p>', '4a1e4a7a-3e2c-48fc-8ab2-b1fee49ffaa5', '6943c646-144b-4b6a-893c-2050b321848e'),
('9453c7ef-c210-474f-80cf-516756c83ac7', '2022-01-21 15:31:37', '2022-01-21 15:32:20', 'tabstract', 'pic.png', 'ASSIGNMENT ON E-R MODELING.pdf', '1000.00', 'PHP Dev', 'table of content', '6a1e4a7a-3e2c-48fc-8ab2-b1fee49ffaa9', 'cbaee553-0180-480a-8f41-cd684ff9b23e');

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
('5f44841d-45ef-4e3b-afb6-bc68cd11a946', '95baa80a-b9a0-4c1f-8b1b-778f029f7d18'),
('5f44841d-45ef-4e3b-afb6-bc68cd11a946', '29f4158a-13f4-4d79-923e-a141d326ff76'),
('ad0f0931-36fb-4b04-a4ce-33f7546f7ba2', 'e444d7eb-b22d-436c-8ef2-ec7768f44f68'),
('08066c00-f67f-48b7-9fb2-b21117b96773', '35142023-a5e8-4e5b-9432-50f09b507109'),
('e7515d19-7314-489a-b789-eb6428db1a24', '8c0027ef-77a0-473f-a992-692cf51f0a88'),
('7f4cf023-8523-4ee9-8335-476f0f40b583', '38c7232e-37db-4b66-936a-7c2f576ebabc'),
('791478b8-004b-47a2-881b-0ac3bb0e3dd0', 'dd73e6e3-fca1-43a4-a3a7-a3f9e29d83ee'),
('791478b8-004b-47a2-881b-0ac3bb0e3dd0', '58bf82c0-1778-4e55-86ba-3a67149b59d0'),
('201790b0-9dc3-4ea8-934b-b15d02a682b1', '03b23a0b-699e-42a3-847d-849addc30f62'),
('201790b0-9dc3-4ea8-934b-b15d02a682b1', '4ed8fd99-b77d-4c58-b6b8-903d64b0b326'),
('201790b0-9dc3-4ea8-934b-b15d02a682b1', 'edaefd1d-7d2e-48d7-b0e6-868d5e447d64'),
('9453c7ef-c210-474f-80cf-516756c83ac7', '741b2f16-90a0-4e9f-93ac-1cab6f5a5d18');

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
('3f46bf0d-a4e6-4373-befe-af3582f9cffa', 'SCIENCE'),
('4a1e4a7a-3e2c-48fc-8ab2-b1fee49ffaa5', 'TECHNOLOGY'),
('4a1e4a7a-3e2c-48fc-8ab2-b1fee49ffaa3', 'HEALTH'),
('6a1e4a7a-3e2c-48fc-8ab2-b1fee49ffaa9', 'ARTS');

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
('95baa80a-b9a0-4c1f-8b1b-778f029f7d18', 'Babi'),
('29f4158a-13f4-4d79-923e-a141d326ff76', 'Ruth'),
('e444d7eb-b22d-436c-8ef2-ec7768f44f68', 'edmond'),
('35142023-a5e8-4e5b-9432-50f09b507109', 'edmond1'),
('8c0027ef-77a0-473f-a992-692cf51f0a88', 'edmond3'),
('38c7232e-37db-4b66-936a-7c2f576ebabc', 'edmond4'),
('dd73e6e3-fca1-43a4-a3a7-a3f9e29d83ee', 'edmond5'),
('58bf82c0-1778-4e55-86ba-3a67149b59d0', 'Bob'),
('741b2f16-90a0-4e9f-93ac-1cab6f5a5d18', 'Fiona'),
('03b23a0b-699e-42a3-847d-849addc30f62', 'dklfjer'),
('4ed8fd99-b77d-4c58-b6b8-903d64b0b326', ' erufhri4'),
('edaefd1d-7d2e-48d7-b0e6-868d5e447d64', 'ioerjk');

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
(1, '2022-01-22 00:43:43', 'c6096289-bd9f-4094-bbea-67a6afcc0ba4', '6943c646-144b-4b6a-893c-2050b321848e'),
(2, '2022-01-22 00:59:43', '10c05f92-8a9b-4b9e-a6cf-f70bf9ecb143', '6943c646-144b-4b6a-893c-2050b321848e'),
(3, '2022-01-22 01:02:58', '42e08c5b-ad5d-46ea-bdc3-cac8a8f6be90', '6943c646-144b-4b6a-893c-2050b321848e'),
(4, '2022-01-22 01:10:51', 'e27e466a-bf4f-4e1b-b77b-71264cca84d6', '6943c646-144b-4b6a-893c-2050b321848e'),
(5, '2022-01-22 01:35:18', '4713e155-5ec0-40c5-a3ba-37452b4274eb', '6943c646-144b-4b6a-893c-2050b321848e'),
(6, '2022-01-22 01:56:27', '1996f609-695b-4c3f-a829-b078f3067e86', '6943c646-144b-4b6a-893c-2050b321848e'),
(7, '2022-01-22 02:23:45', '83597d16-655e-46e8-a5af-d7e10b34c145', '6943c646-144b-4b6a-893c-2050b321848e'),
(8, '2022-01-22 02:27:42', '8a63d729-204f-4f7b-bbb5-88a8d89e6077', '6943c646-144b-4b6a-893c-2050b321848e'),
(9, '2022-01-22 02:31:22', '7dae0a41-e4aa-47c8-b792-89082c198e75', '6943c646-144b-4b6a-893c-2050b321848e'),
(10, '2022-01-22 02:57:37', 'fc22ecd5-f829-4024-ac72-34392e906a6d', '6943c646-144b-4b6a-893c-2050b321848e'),
(11, '2022-01-22 08:30:24', '6543f3da-e23f-4b44-a2a5-c84f32f0b7fb', '4eff022a-d1a5-4749-b22a-e754b51423c5'),
(12, '2022-01-22 08:41:33', 'a1d7180b-9c59-42ab-9717-cacb1bddd62c', '51a3094a-41b0-418e-94ff-c5256da49a82'),
(13, '2022-01-22 08:42:28', 'f422b333-bc51-48c6-bd97-0ff94b8836be', '631ef128-1c05-49f1-a21d-d29f11dcc69a'),
(14, '2022-01-22 08:47:33', 'dfd808b3-c511-4acd-b0e5-ddf7c4bdae57', '4eff022a-d1a5-4749-b22a-e754b51423c5'),
(15, '2022-01-22 08:53:26', 'e530a577-fff7-4468-8238-6ed73d3c4dce', '4eff022a-d1a5-4749-b22a-e754b51423c5'),
(16, '2022-01-22 08:55:24', '93c35ee1-4ded-4cfd-af6f-7cb8999342c2', '4eff022a-d1a5-4749-b22a-e754b51423c5'),
(17, '2022-01-22 08:55:29', '0ed24ef8-55d4-4fe5-923f-09aaa606da7f', '6943c646-144b-4b6a-893c-2050b321848e'),
(18, '2022-01-22 08:56:13', '37bd2c0f-30ac-4cdd-ba9c-04cd58688b57', '51a3094a-41b0-418e-94ff-c5256da49a82'),
(19, '2022-01-22 08:58:27', 'b3c40968-40db-483f-923f-43fbfa75236b', '6943c646-144b-4b6a-893c-2050b321848e'),
(20, '2022-01-22 09:04:00', 'e307b4f5-33fa-4124-ab55-1d41f8edb820', '6943c646-144b-4b6a-893c-2050b321848e'),
(21, '2022-01-22 09:04:11', '0fe1403f-39a7-43c6-bcde-9582fc6e5daa', '4eff022a-d1a5-4749-b22a-e754b51423c5'),
(22, '2022-01-22 09:05:52', '2dc2fe29-75b0-4666-be36-4ac4012cadca', '6943c646-144b-4b6a-893c-2050b321848e'),
(23, '2022-01-22 09:07:32', 'edf0787b-1208-41b0-88d7-baa5acea57c2', '6943c646-144b-4b6a-893c-2050b321848e'),
(24, '2022-01-22 09:09:04', '64b88d2d-e274-4e82-a80c-b457597b03fc', '6943c646-144b-4b6a-893c-2050b321848e'),
(25, '2022-01-22 09:11:24', '9abe59cb-e98d-4864-aa49-ba0e92f4f677', '4eff022a-d1a5-4749-b22a-e754b51423c5'),
(26, '2022-01-22 09:16:27', 'bd6e7ab3-aec4-4bfd-b7e9-031f5a25fbe4', '814e9cc8-8d9b-42b2-905a-03afe25cbac6'),
(27, '2022-01-22 09:17:52', 'c754437a-31ee-46af-9b78-e2e8d4dd2317', '6943c646-144b-4b6a-893c-2050b321848e'),
(28, '2022-01-22 09:22:30', '7f8a5bbe-fcb6-4164-acbd-0a22187713be', '4eff022a-d1a5-4749-b22a-e754b51423c5'),
(29, '2022-01-22 09:23:11', 'a792e6cc-7024-4815-a5c8-86fe801a6584', '6943c646-144b-4b6a-893c-2050b321848e'),
(30, '2022-01-22 09:28:38', '58d92c4c-0a99-4f38-a5fe-080786f18def', '6943c646-144b-4b6a-893c-2050b321848e'),
(31, '2022-01-22 09:29:07', 'abb522c8-7042-48fc-8cd4-74a777f3b5bd', '4eff022a-d1a5-4749-b22a-e754b51423c5'),
(32, '2022-01-22 09:30:55', '7968e9d3-afec-4bd7-856a-2bacf52bb944', '6943c646-144b-4b6a-893c-2050b321848e'),
(33, '2022-01-22 09:33:04', 'cc928f09-3c02-4f25-8aa6-6be9a236e2aa', '6943c646-144b-4b6a-893c-2050b321848e'),
(34, '2022-01-22 09:36:20', '8196f84a-80c8-40e9-a298-2ca261f5cf2c', '4eff022a-d1a5-4749-b22a-e754b51423c5'),
(35, '2022-01-22 09:41:07', 'd7cc50af-704f-4834-8f08-249a2c35cb7a', '6943c646-144b-4b6a-893c-2050b321848e'),
(36, '2022-01-22 09:45:02', '30eb9bc7-ec11-4a39-920b-d5c823a6c6a8', '64f0ee81-ea7a-42d9-8c93-6bdf2ace2802'),
(37, '2022-01-22 09:52:38', '129e0a60-e02a-4565-83f0-a5204c347fe1', '6943c646-144b-4b6a-893c-2050b321848e'),
(38, '2022-01-22 10:03:31', '38310a2d-c74e-41e6-99c1-ef270b5e543b', '6943c646-144b-4b6a-893c-2050b321848e'),
(39, '2022-01-22 10:03:55', 'e6fbccfa-5ca5-43d3-9e65-e30d379eb8a3', '64f0ee81-ea7a-42d9-8c93-6bdf2ace2802'),
(40, '2022-01-22 10:23:04', 'af12cc8a-e327-45a0-98c1-f50d19243859', '64f0ee81-ea7a-42d9-8c93-6bdf2ace2802'),
(41, '2022-01-22 10:29:46', '99e98bae-0596-4ecc-ba57-f46d6b4ede5b', '6943c646-144b-4b6a-893c-2050b321848e'),
(42, '2022-01-22 10:30:10', '7f8482bf-3321-4117-a8e8-4917befca1fb', '64f0ee81-ea7a-42d9-8c93-6bdf2ace2802'),
(43, '2022-01-22 10:30:29', '91339169-25bd-48dd-b590-03da67be8812', '4eff022a-d1a5-4749-b22a-e754b51423c5'),
(44, '2022-01-22 10:47:03', '8680ac4f-12b8-432d-8307-f15361a8114b', '6943c646-144b-4b6a-893c-2050b321848e'),
(45, '2022-01-22 10:52:09', 'afc31634-05db-44e4-895e-a93eb4a1e5e4', '6943c646-144b-4b6a-893c-2050b321848e'),
(46, '2022-01-22 10:52:08', 'dc72a605-1014-43bd-9cd1-0c2910f2e982', '6943c646-144b-4b6a-893c-2050b321848e'),
(47, '2022-01-22 10:52:08', '651848b2-5022-456b-854d-f7ed3e06ea59', '6943c646-144b-4b6a-893c-2050b321848e'),
(48, '2022-01-22 10:52:08', 'c176d946-d203-47a9-87c4-07a0c585ac90', '6943c646-144b-4b6a-893c-2050b321848e'),
(49, '2022-01-22 10:52:08', 'eebc31a2-c359-4f29-b648-c1143ee1efcc', '6943c646-144b-4b6a-893c-2050b321848e'),
(50, '2022-01-22 10:52:08', '776ab8d5-0237-4347-9e08-d0bc4e327f81', '6943c646-144b-4b6a-893c-2050b321848e'),
(51, '2022-01-22 10:52:09', '5a501c82-39dc-473c-b537-d3f0189c3387', '6943c646-144b-4b6a-893c-2050b321848e'),
(52, '2022-01-22 10:52:12', 'b6f84950-ea38-4a3c-a953-c7a4ae045073', '6943c646-144b-4b6a-893c-2050b321848e'),
(53, '2022-01-22 10:52:12', '64a40ec1-daae-424d-843e-eb23d7db5368', '6943c646-144b-4b6a-893c-2050b321848e'),
(54, '2022-01-22 10:52:12', 'dd259b55-b252-4342-be92-045b07f6c0f7', '6943c646-144b-4b6a-893c-2050b321848e'),
(55, '2022-01-22 10:52:12', '9fbd4868-2eb6-49c0-801c-f0e13325296e', '6943c646-144b-4b6a-893c-2050b321848e'),
(56, '2022-01-22 10:52:13', '635a559b-50c0-4996-85ab-b76c93959402', '6943c646-144b-4b6a-893c-2050b321848e'),
(57, '2022-01-22 10:52:15', '9b838f7a-65e5-4a0e-a082-252f0670ed06', '6943c646-144b-4b6a-893c-2050b321848e'),
(58, '2022-01-22 11:06:22', 'd5627aef-2fe3-46d9-b4bd-7d9ff890634a', '51a3094a-41b0-418e-94ff-c5256da49a82'),
(59, '2022-01-22 12:45:33', '3c80e1ae-77ca-412a-92ae-9be852b1e9bb', '6943c646-144b-4b6a-893c-2050b321848e'),
(60, '2022-01-22 13:13:34', '49e8b1a9-2acb-4859-90ed-90e3d60231bb', '6943c646-144b-4b6a-893c-2050b321848e'),
(61, '2022-01-22 13:15:52', '3a38f90a-1cdb-4788-bb61-cb2c89448895', '4eff022a-d1a5-4749-b22a-e754b51423c5'),
(62, '2022-01-22 13:17:02', '93e73d12-0bfd-4634-97c5-68a0b280f2fe', '64f0ee81-ea7a-42d9-8c93-6bdf2ace2802'),
(63, '2022-01-22 13:42:05', '9d50ba93-291e-43d5-8447-a1bcc6ccba2a', '51a3094a-41b0-418e-94ff-c5256da49a82'),
(64, '2022-01-22 13:47:58', '105e11ec-f37d-48a9-9dd1-bac931c43263', '6943c646-144b-4b6a-893c-2050b321848e'),
(65, '2022-01-22 13:49:33', '791aa6fc-30d3-4946-9473-e43d2c3d774b', '6943c646-144b-4b6a-893c-2050b321848e'),
(66, '2022-01-22 14:19:00', 'f237c2bd-e0e7-4b0c-ad3d-cc1d625d7bfc', '53fb25a5-a3c5-4225-8406-782fc5b96ac8'),
(67, '2022-01-22 14:23:28', '51bf6ecf-aec1-4ed2-bf03-64a7a6db5ec7', '6943c646-144b-a4b6a-893c-2050b321848e'),
(68, '2022-01-22 14:25:52', 'a35ca9a3-05f8-4305-a9e6-2a0a23c3cbe2', '6943c646-144b-a4b6a-893c-2050b321848e'),
(69, '2022-01-22 14:26:00', 'ead8744b-c584-424d-bf16-fef2130ed492', '6943c646-144b-a4b6a-893c-2050b321848e'),
(70, '2022-01-22 14:30:03', 'a1e406a4-7c5b-4e85-8077-a8b74578693b', '6943c646-144b-a4b6a-893c-2050b321848e'),
(71, '2022-01-22 14:50:15', '7c50ccb4-5f26-4a63-b8f3-ae034a5b1167', '4eff022a-d1a5-4749-b22a-e754b51423c5'),
(72, '2022-01-22 14:56:53', 'a81af701-db81-4c32-950a-3a71477cd3cf', '6943c646-144b-a4b6a-893c-2050b321848e'),
(73, '2022-01-22 15:02:16', 'a0d29a76-c2d5-4baf-b1cc-c124597bd3bb', '6943c646-144b-a4b6a-893c-2050b321848e'),
(74, '2022-01-22 15:11:42', 'd9020471-0845-46ae-a7c3-dde1b5c2132b', '4eff022a-d1a5-4749-b22a-e754b51423c5'),
(75, '2022-01-22 15:13:05', '38077b35-322f-4623-98ed-0ba5a983d1b6', '6943c646-144b-a4b6a-893c-2050b321848e'),
(76, '2022-01-22 15:15:05', 'f398c155-5047-4882-be26-f2b9f0c34e30', '51a3094a-41b0-418e-94ff-c5256da49a82'),
(77, '2022-01-22 15:16:53', '771172dc-607c-48c6-8625-a0718da2123e', 'cbaee553-0180-480a-8f41-cd684ff9b23e'),
(78, '2022-01-22 15:20:54', '075ad849-07ab-4a7f-b3bb-50ba5c4f3806', '6943c646-144b-a4b6a-893c-2050b321848e'),
(79, '2022-01-22 15:31:00', '4c8d2a00-c2a5-410e-bce9-a61ecaa928d3', 'cbaee553-0180-480a-8f41-cd684ff9b23e'),
(80, '2022-01-22 15:40:40', 'ba88906e-c038-4ab1-ba27-ee4c0e0e7821', '6943c646-144b-a4b6a-893c-2050b321848e'),
(81, '2022-01-22 15:40:51', '1f447fc0-d489-4df7-871e-90366d8d3897', '6943c646-144b-a4b6a-893c-2050b321848e'),
(82, '2022-01-22 15:40:58', 'f6706013-af4a-4955-9c59-19e929683032', 'cbaee553-0180-480a-8f41-cd684ff9b23e'),
(83, '2022-01-22 15:40:59', '46b13e87-5ae5-4ce2-8c68-d06cd3734ecc', 'cbaee553-0180-480a-8f41-cd684ff9b23e'),
(84, '2022-01-22 16:29:35', 'db2dd032-0e5b-4e01-9021-5ced4fe7b9ba', '79fb96f7-e93d-4c86-a0c8-a6a0c9ad83dd'),
(85, '2022-01-22 16:29:39', '72eb7a4e-960e-4e36-b9cb-473d2d89872f', '79fb96f7-e93d-4c86-a0c8-a6a0c9ad83dd'),
(86, '2022-01-22 16:37:45', '07b476ed-928a-4083-859f-727a56c74a6c', 'cbaee553-0180-480a-8f41-cd684ff9b23e'),
(87, '2022-01-22 16:41:10', '43ea5abc-3346-43a3-8c0a-ce6f5334dce0', 'cbaee553-0180-480a-8f41-cd684ff9b23e'),
(88, '2022-01-22 16:48:48', '7effde8a-df30-401d-ac9f-08e32f5d0226', 'cbaee553-0180-480a-8f41-cd684ff9b23e');

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
('26426e7e-6be3-41c3-9855-ba06131e9958', '2022-01-21 17:04:37', '2022-01-21 17:04:37', 'Ivor Cohen', '9453c7ef-c210-474f-80cf-516756c83ac7', 'cbaee553-0180-480a-8f41-cd684ff9b23e');

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
('631ef128-1c05-49f1-a21d-d29f11dcc69a', b'1', 'johndoe@gmail.com', b'0', 'John Doe', '$2a$10$LGuJ39hkDt6IDW45SprBjeIJpNDAB/OeJ2SUatVn8EaQExML2g9a.'),
('6943c646-144b-a4b6a-893c-2050b321848e', b'1', 'marydoe@gmail.com', b'1', 'Mary Doe', '$2a$10$NmsuUmRavVKxrLh8bGZfqui.5YnU4xiv9PYk8od8j/Vj8fl3xGZVi'),
('4eff022a-d1a5-4749-b22a-e754b51423c5', b'1', 'babimorelle@sulay.com', b'0', 'BABI MORELLE', '$2a$10$SUsdQbyhhdihlM/WvL5LNeOyz6Rlq2iEsWncJrCMtjrlYCGIvJJA.'),
('51a3094a-41b0-418e-94ff-c5256da49a82', b'1', 'jones@gmail.com', b'0', 'jones', '$2a$10$ykpaOzJ1p5vuV0KHDhcjX.xIoKhCZWA1l8vQopl0177aTAOAh.UK2'),
('cbaee553-0180-480a-8f41-cd684ff9b23e', b'1', 'pauldoe@gmail.com', b'1', 'Paul Doe', '$2a$10$vqR.As/MvZeajeokSWM7YOYvDLydFbDcmhTkXmVjvF.kCjswG0OAa'),
('df3a6f56-dffa-45d5-9e0f-edb86bca0f90', b'1', 'babi@gmal.com', b'0', 'Babi', '$2a$10$AMQZ2dk7AYQ7VfiPevu3duywTVe7yLMZsTAL9n3/5DFMWeAZbeM6K'),
('814e9cc8-8d9b-42b2-905a-03afe25cbac6', b'1', 'peter@gmal.com', b'0', 'Peter', '$2a$10$rDRsPeUUhlcGthTRf2h8Q.ilZCi/uKvAQDAm54mSuPiDXPBSgxG7S'),
('64f0ee81-ea7a-42d9-8c93-6bdf2ace2802', b'1', 'user@gmail.com', b'0', 'user', '$2a$10$H8/wBjC42uaiYJYDD4jf2eyMTv5JY6cC33Z7wcwEWVHhStj.eeiYu'),
('53fb25a5-a3c5-4225-8406-782fc5b96ac8', b'1', 'eli@gmail.com', b'0', 'Chi Mah Claudette Mah', '$2a$10$wswj1PZRi.8Vq9/uHJPJau./HTAOfiLsPE6DF8hnnHXCsUxsBSht.'),
('9a572911-1b0d-4b19-aa6f-eff1ae9257f4', b'1', 'test@gmal.com', b'0', 'test', '$2a$10$IncGkRMqPPNF1QhOaiGI8OAsP7y9C40iVWBrNEaYMYJb5MILG65Uy'),
('fb53076e-4019-4805-83f2-4d0431a827c4', b'1', 'gilles@gmail.com', b'0', 'Gilles', '$2a$10$dIrPXcMUS0rUs4zANywMO.FOhprHjwMuHKzCr9cMOJkvp9KBcl4Ma'),
('e1756dbb-6ec9-49b3-b894-27d1d0d6cce7', b'1', 'gilles2020@gmail.com', b'0', 'Gilles', '$2a$10$9NNJH6xQ5c1SaI0ilJE/jenZK3QxhAXTQaAuaEUWxs5sMQb.HPEU.'),
('79fb96f7-e93d-4c86-a0c8-a6a0c9ad83dd', b'1', 'queen@gmail.com', b'0', 'queen', '$2a$10$tmYyIa8izkfzvBTQaO6cwOilMQLspa2lk6RgqdQdhi55b41B34ME6');

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
('631ef128-1c05-49f1-a21d-d29f11dcc69a', 3),
('6943c646-144b-4b6a-893c-2050b321848e', 1),
('6943c646-144b-4b6a-893c-2050b321848e', 3),
('6943c646-144b-4b6a-893c-2050b321848e', 2),
('4eff022a-d1a5-4749-b22a-e754b51423c5', 3),
('4eff022a-d1a5-4749-b22a-e754b51423c5', 2),
('51a3094a-41b0-418e-94ff-c5256da49a82', 3),
('51a3094a-41b0-418e-94ff-c5256da49a82', 2),
('cbaee553-0180-480a-8f41-cd684ff9b23e', 3),
('cbaee553-0180-480a-8f41-cd684ff9b23e', 2),
('df3a6f56-dffa-45d5-9e0f-edb86bca0f90', 3),
('df3a6f56-dffa-45d5-9e0f-edb86bca0f90', 2),
('814e9cc8-8d9b-42b2-905a-03afe25cbac6', 3),
('64f0ee81-ea7a-42d9-8c93-6bdf2ace2802', 3),
('53fb25a5-a3c5-4225-8406-782fc5b96ac8', 3),
('53fb25a5-a3c5-4225-8406-782fc5b96ac8', 2),
('9a572911-1b0d-4b19-aa6f-eff1ae9257f4', 3),
('fb53076e-4019-4805-83f2-4d0431a827c4', 3),
('e1756dbb-6ec9-49b3-b894-27d1d0d6cce7', 3),
('e1756dbb-6ec9-49b3-b894-27d1d0d6cce7', 2),
('79fb96f7-e93d-4c86-a0c8-a6a0c9ad83dd', 3);

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
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=89;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
