-- phpMyAdmin SQL Dump
-- version 5.x
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 02, 2025 at 20:43
-- Server version: 11.4.7-MariaDB
-- PHP Version: 8.3.19

SET SQL_MODE = 'NO_AUTO_VALUE_ON_ZERO';
START TRANSACTION;
SET time_zone = '+00:00';

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

SET FOREIGN_KEY_CHECKS=0;

-- --------------------------------------------------------

-- Estructura de tabla para la tabla `authorized_persons`

DROP TABLE IF EXISTS `authorized_persons`;
CREATE TABLE `authorized_persons` (
  `auth_id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `relationship` varchar(50) NOT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`auth_id`),
  KEY `student_id` (`student_id`),
  CONSTRAINT `authorized_persons_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcado de datos para la tabla `authorized_persons`

LOCK TABLES `authorized_persons` WRITE;
/*!40000 ALTER TABLE `authorized_persons` DISABLE KEYS */;
INSERT INTO `authorized_persons` VALUES ('2', '216', 'Magliano Mariana', 'Madrastra', '', '2025-11-02 21:17:56');
INSERT INTO `authorized_persons` VALUES ('3', '218', 'Marini Maria', 'Abuela', '', '2025-11-02 21:20:53');
INSERT INTO `authorized_persons` VALUES ('4', '222', 'Calvo Angel', 'Padrastro', '', '2025-11-02 21:45:29');
INSERT INTO `authorized_persons` VALUES ('5', '229', 'Zelmer Julio', '', '', '2025-11-02 21:51:41');
INSERT INTO `authorized_persons` VALUES ('6', '231', 'Mariñanco Marta', '', '', '2025-11-02 21:56:27');
INSERT INTO `authorized_persons` VALUES ('7', '237', 'Paez Jose Luis', 'Abuelo', '', '2025-11-02 22:02:54');
INSERT INTO `authorized_persons` VALUES ('8', '240', 'Nain Karen', '', '', '2025-11-02 22:06:39');
INSERT INTO `authorized_persons` VALUES ('9', '240', 'Rola Horacio', '', '', '2025-11-02 22:06:44');
INSERT INTO `authorized_persons` VALUES ('10', '205', 'COLLOMILLA Jorge', 'Abuelo', '', '2025-11-02 22:13:40');
INSERT INTO `authorized_persons` VALUES ('11', '265', 'Cayumil Isabel', 'Tia', '', '2025-11-02 22:27:03');
INSERT INTO `authorized_persons` VALUES ('12', '270', 'Caramilla Delia', 'Abuela', '15609209', '2025-11-02 22:28:36');
INSERT INTO `authorized_persons` VALUES ('13', '268', 'Von Holtun Griselda', 'Abuela', '', '2025-11-02 22:30:27');
INSERT INTO `authorized_persons` VALUES ('14', '272', 'Muller Leticia', 'Tía', '', '2025-11-02 22:33:03');
INSERT INTO `authorized_persons` VALUES ('15', '273', 'Winter Monica', 'Madrastra', '', '2025-11-02 22:34:19');
INSERT INTO `authorized_persons` VALUES ('16', '274', 'Etchetto Fernando', 'Hermano', '15345347', '2025-11-02 22:35:49');
INSERT INTO `authorized_persons` VALUES ('17', '275', 'Ruiz Evangelina', 'Tía', '', '2025-11-02 22:36:59');
INSERT INTO `authorized_persons` VALUES ('18', '311', 'Cornejo Vanes', 'Tía', '', '2025-11-02 22:40:03');
INSERT INTO `authorized_persons` VALUES ('19', '306', 'Pinilla Zulema', 'Ab', '', '2025-11-02 22:41:18');
INSERT INTO `authorized_persons` VALUES ('20', '306', 'Ferreira Marcos', 'P', '', '2025-11-02 22:41:23');
INSERT INTO `authorized_persons` VALUES ('21', '308', 'Cabrera Agustina', 'Tia', '15300430', '2025-11-02 22:45:47');
INSERT INTO `authorized_persons` VALUES ('22', '309', 'Gudiño Maria', 'Abuela', '', '2025-11-02 22:46:54');
INSERT INTO `authorized_persons` VALUES ('23', '310', 'Cataldo Araceli', 'Niñera', '', '2025-11-02 22:50:08');
/*!40000 ALTER TABLE `authorized_persons` ENABLE KEYS */;
UNLOCK TABLES;

-- --------------------------------------------------------

-- Estructura de tabla para la tabla `classrooms`

DROP TABLE IF EXISTS `classrooms`;
CREATE TABLE `classrooms` (
  `classroom_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`classroom_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcado de datos para la tabla `classrooms`

LOCK TABLES `classrooms` WRITE;
/*!40000 ALTER TABLE `classrooms` DISABLE KEYS */;
INSERT INTO `classrooms` VALUES ('1', 'Taller 1', '');
INSERT INTO `classrooms` VALUES ('2', 'Taller 2', '');
INSERT INTO `classrooms` VALUES ('3', 'Taller 3', '');
INSERT INTO `classrooms` VALUES ('4', 'Taller 4', '');
INSERT INTO `classrooms` VALUES ('5', 'Taller 5', '');
INSERT INTO `classrooms` VALUES ('6', 'Taller 6', '');
INSERT INTO `classrooms` VALUES ('7', 'Laboratorio 1', '');
INSERT INTO `classrooms` VALUES ('8', 'Laboratorio 2', '');
INSERT INTO `classrooms` VALUES ('9', 'Laboratorio 3', '');
INSERT INTO `classrooms` VALUES ('10', 'Laboratorio 4', '');
INSERT INTO `classrooms` VALUES ('11', 'Aula 1', '');
INSERT INTO `classrooms` VALUES ('12', 'Aula 2', '');
INSERT INTO `classrooms` VALUES ('13', 'Aula 3', '');
INSERT INTO `classrooms` VALUES ('14', 'Aula 4', '');
/*!40000 ALTER TABLE `classrooms` ENABLE KEYS */;
UNLOCK TABLES;

-- --------------------------------------------------------

-- Estructura de tabla para la tabla `courses`

DROP TABLE IF EXISTS `courses`;
CREATE TABLE `courses` (
  `course_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `technical_degree` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`course_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcado de datos para la tabla `courses`

LOCK TABLES `courses` WRITE;
/*!40000 ALTER TABLE `courses` DISABLE KEYS */;
INSERT INTO `courses` VALUES ('1', '1Ro Primera', '', 'Ciclo Basica');
INSERT INTO `courses` VALUES ('2', '1Ro Segunda', '', 'Ciclo Basica');
INSERT INTO `courses` VALUES ('3', '1Ro Tercera', '', 'Ciclo Basica');
INSERT INTO `courses` VALUES ('4', '2Do Primera', '', 'Ciclo Basica');
INSERT INTO `courses` VALUES ('5', '2Do Segunda', '', 'Ciclo Basica');
INSERT INTO `courses` VALUES ('6', '3Ro Primera', '', 'Ciclo Basica');
INSERT INTO `courses` VALUES ('7', '3Ro Segunda', '', 'Ciclo Basica');
INSERT INTO `courses` VALUES ('8', '3Ro Tercera', '', 'Ciclo Basica');
INSERT INTO `courses` VALUES ('9', '4To TP', '', 'Tecnico En Programacion');
INSERT INTO `courses` VALUES ('10', '4To MMO', '', 'Maestro Mayor de Obra');
INSERT INTO `courses` VALUES ('11', '5To TP', '', 'Tecnico En Programacion');
INSERT INTO `courses` VALUES ('12', '5To MMO', '', 'Maestro Mayor de Obra');
INSERT INTO `courses` VALUES ('13', '6To TP', '', 'Tecnico En Programacion');
INSERT INTO `courses` VALUES ('14', '6To MMO', '', 'Maestro Mayor de Obra');
INSERT INTO `courses` VALUES ('15', '7Mo TP', '', 'Tecnico En Programacion');
INSERT INTO `courses` VALUES ('16', '7Mo MMO', '', 'Maestro Mayor de Obra');
/*!40000 ALTER TABLE `courses` ENABLE KEYS */;
UNLOCK TABLES;

-- --------------------------------------------------------

-- Estructura de tabla para la tabla `groups`

DROP TABLE IF EXISTS `groups`;
CREATE TABLE `groups` (
  `group_id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` text DEFAULT NULL,
  PRIMARY KEY (`group_id`),
  KEY `course_id` (`course_id`),
  CONSTRAINT `groups_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcado de datos para la tabla `groups`

LOCK TABLES `groups` WRITE;
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;
INSERT INTO `groups` VALUES ('1', '1', 'Grupo 1', '');
INSERT INTO `groups` VALUES ('2', '1', 'Grupo 2', '');
INSERT INTO `groups` VALUES ('3', '2', 'Grupo 1', '');
INSERT INTO `groups` VALUES ('4', '2', 'Grupo 2', '');
INSERT INTO `groups` VALUES ('5', '3', 'Grupo 1', '');
INSERT INTO `groups` VALUES ('6', '3', 'Grupo 2', '');
INSERT INTO `groups` VALUES ('7', '4', 'Grupo 1', '');
INSERT INTO `groups` VALUES ('8', '4', 'Grupo 2', '');
INSERT INTO `groups` VALUES ('9', '5', 'Grupo 1', '');
INSERT INTO `groups` VALUES ('10', '5', 'Grupo 2', '');
INSERT INTO `groups` VALUES ('11', '6', 'Grupo 1', '');
INSERT INTO `groups` VALUES ('12', '6', 'Grupo 2', '');
INSERT INTO `groups` VALUES ('13', '7', 'Grupo 1', '');
INSERT INTO `groups` VALUES ('14', '7', 'Grupo 2', '');
INSERT INTO `groups` VALUES ('15', '8', 'Grupo 1', '');
INSERT INTO `groups` VALUES ('16', '8', 'Grupo 2', '');
INSERT INTO `groups` VALUES ('17', '9', 'Grupo 1', '');
INSERT INTO `groups` VALUES ('18', '9', 'Grupo 2', '');
INSERT INTO `groups` VALUES ('19', '10', 'Grupo 1', '');
INSERT INTO `groups` VALUES ('20', '10', 'Grupo 2', '');
INSERT INTO `groups` VALUES ('21', '11', 'Grupo 1', '');
INSERT INTO `groups` VALUES ('22', '11', 'Grupo 2', '');
INSERT INTO `groups` VALUES ('23', '12', 'Grupo 1', '');
INSERT INTO `groups` VALUES ('24', '12', 'Grupo 2', '');
INSERT INTO `groups` VALUES ('25', '14', 'Grupo 1', '');
INSERT INTO `groups` VALUES ('26', '14', 'Grupo 2', '');
INSERT INTO `groups` VALUES ('27', '13', 'Grupo 1', '');
INSERT INTO `groups` VALUES ('28', '13', 'Grupo 2', '');
INSERT INTO `groups` VALUES ('30', '16', 'Grupo 1', '');
INSERT INTO `groups` VALUES ('31', '16', 'Grupo 2', '');
INSERT INTO `groups` VALUES ('34', '15', 'Grupo Unico', '');
/*!40000 ALTER TABLE `groups` ENABLE KEYS */;
UNLOCK TABLES;

-- --------------------------------------------------------

-- Estructura de tabla para la tabla `parents`

DROP TABLE IF EXISTS `parents`;
CREATE TABLE `parents` (
  `parent_id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NOT NULL,
  `relationship` enum('madre','padre','tutor') NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `occupation` varchar(100) DEFAULT NULL,
  `DNI` int(150) DEFAULT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`parent_id`),
  KEY `student_id` (`student_id`),
  CONSTRAINT `parents_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcado de datos para la tabla `parents`

LOCK TABLES `parents` WRITE;
/*!40000 ALTER TABLE `parents` DISABLE KEYS */;
INSERT INTO `parents` VALUES ('5', '214', 'madre', 'SILVEIRA Karina', 'Doc', '24650501', '15636543', '2025-11-02 21:13:13');
INSERT INTO `parents` VALUES ('6', '214', 'padre', 'AMBROSIONI Jose', 'Doc', '20997006', '15631362', '2025-11-02 21:13:35');
INSERT INTO `parents` VALUES ('7', '213', 'madre', 'CALVO Maia', 'Aux Doc', '31771799', '15635127', '2025-11-02 21:14:27');
INSERT INTO `parents` VALUES ('8', '213', 'padre', 'ALVAREZ Jose', 'Prefectura', '29826581', '15635127', '2025-11-02 21:14:48');
INSERT INTO `parents` VALUES ('9', '216', 'madre', 'ALVAREZ Andrea', 'A. de Casa', '39743848', '', '2025-11-02 21:15:50');
INSERT INTO `parents` VALUES ('10', '216', 'padre', 'GUGENHEIN, Nestor', 'Mecánico', '35246884', '15275597', '2025-11-02 21:16:44');
INSERT INTO `parents` VALUES ('11', '215', 'madre', 'GAUNA Natalia', 'D Grafico', '31869945', '15645159', '2025-11-02 21:17:17');
INSERT INTO `parents` VALUES ('12', '215', 'padre', 'BIAGETTI Mario', 'Emp', '29898103', '15645153', '2025-11-02 21:17:38');
INSERT INTO `parents` VALUES ('13', '223', 'madre', 'ALEMAN Gabriela', 'Empleada', '29034120', '15252073', '2025-11-02 21:19:02');
INSERT INTO `parents` VALUES ('14', '223', 'padre', 'ROLLA Horacio', '', '26645680', '15554716', '2025-11-02 21:19:20');
INSERT INTO `parents` VALUES ('15', '218', 'madre', 'PARDAL Maria Fernanda', 'Cont Publica', '25545767', '15613958', '2025-11-02 21:20:21');
INSERT INTO `parents` VALUES ('16', '218', 'padre', 'MARTINEZ Ignacio', 'Anal de Sist', '22053611', '15362956', '2025-11-02 21:20:42');
INSERT INTO `parents` VALUES ('17', '219', 'madre', 'PAZOS Valeria', 'Mar Publica', '24134628', '15524840', '2025-11-02 21:21:41');
INSERT INTO `parents` VALUES ('18', '219', 'padre', 'MENDEZ Alejandro', 'Com', '21390053', '15602654', '2025-11-02 21:21:59');
INSERT INTO `parents` VALUES ('19', '336', 'madre', 'ROSELLO Silvana G', 'Adm', '29898466', '15603101', '2025-11-02 21:24:14');
INSERT INTO `parents` VALUES ('20', '221', 'madre', 'GOMEZ Denise', 'Docente', '32557638', '15574516', '2025-11-02 21:43:31');
INSERT INTO `parents` VALUES ('21', '222', 'madre', 'MELI Ivana', 'Empl dom', '34580312', '668025', '2025-11-02 21:45:16');
INSERT INTO `parents` VALUES ('22', '224', 'madre', 'SILVA Jorgelina', 'A de casa', '27113136', '15543736', '2025-11-02 21:46:25');
INSERT INTO `parents` VALUES ('23', '224', 'padre', 'RUPPEL Fabian', 'Indep', '24134501', '15607318', '2025-11-02 21:46:46');
INSERT INTO `parents` VALUES ('24', '225', 'madre', 'REIMER Carolina', 'Docente', '27332162', '15250485', '2025-11-02 21:47:35');
INSERT INTO `parents` VALUES ('25', '225', 'padre', 'SANCHEZ Javier', 'Empl', '27606177', '15267542', '2025-11-02 21:47:54');
INSERT INTO `parents` VALUES ('26', '229', 'madre', 'ZELMER Luciana', 'Docente', '27090242', '15607375', '2025-11-02 21:49:45');
INSERT INTO `parents` VALUES ('27', '229', 'padre', 'AZAROFF Jose', 'Periodista', '29504937', '15404519', '2025-11-02 21:50:04');
INSERT INTO `parents` VALUES ('28', '230', 'madre', 'GUENOFIL Adriana', 'Empl Dom', '26546315', '15565398', '2025-11-02 21:53:35');
INSERT INTO `parents` VALUES ('29', '230', 'padre', 'BEJARANO Sergio', 'Taxista', '24656572', '15276963', '2025-11-02 21:53:56');
INSERT INTO `parents` VALUES ('30', '232', 'madre', 'Romero Valeria', 'Psc Social', '26567977', '15613378', '2025-11-02 21:54:59');
INSERT INTO `parents` VALUES ('31', '232', 'padre', 'DENEZIO Sergio', 'Comerciante', '27843504', '15257859', '2025-11-02 21:55:21');
INSERT INTO `parents` VALUES ('32', '231', 'madre', 'AROCENA Antonia', 'Empl Dom', '36302549', '15346702', '2025-11-02 21:56:04');
INSERT INTO `parents` VALUES ('33', '231', 'padre', 'DIAZ Mauricio', 'Empl Com', '31455039', '15301556', '2025-11-02 21:56:21');
INSERT INTO `parents` VALUES ('34', '233', 'madre', 'CABRAL Veronica', 'A de casa', '31648040', '011-33692189', '2025-11-02 21:57:39');
INSERT INTO `parents` VALUES ('35', '233', 'padre', 'LUNA Nelson', 'O.Prefec', '28442522', '', '2025-11-02 21:57:58');
INSERT INTO `parents` VALUES ('36', '234', 'madre', 'FRAIRE Marcela', 'Prof', '26416892', '15495716', '2025-11-02 21:58:42');
INSERT INTO `parents` VALUES ('37', '234', 'padre', 'MAYER Alejandro', 'Chofer', '28823114', '15502182', '2025-11-02 21:59:03');
INSERT INTO `parents` VALUES ('38', '235', 'madre', 'MELILLAN Micaela', 'A de casa', '31192314', '15349083', '2025-11-02 22:00:17');
INSERT INTO `parents` VALUES ('39', '236', 'madre', 'HARO Veronica', 'Com', '32709791', '15623441', '2025-11-02 22:00:56');
INSERT INTO `parents` VALUES ('40', '236', 'padre', 'NICONIELLO Cristian', 'Comerciante', '94951894', '15411344', '2025-11-02 22:01:14');
INSERT INTO `parents` VALUES ('41', '237', 'madre', 'PAEZ Nair', 'Op Megattel', '35654965', '291 5711775', '2025-11-02 22:02:19');
INSERT INTO `parents` VALUES ('42', '237', 'tutor', 'COLICHEO Facundo', 'Guardavidas', '0', '291 4298358', '2025-11-02 22:02:36');
INSERT INTO `parents` VALUES ('43', '244', 'padre', 'PALMA Alexis', '', '34666216', '15616285', '2025-11-02 22:03:40');
INSERT INTO `parents` VALUES ('44', '239', 'padre', 'REY Fabian', 'Emp', '18340154', '15614089', '2025-11-02 22:05:16');
INSERT INTO `parents` VALUES ('45', '240', 'madre', 'MIÑO Celeste', 'Niñera/ Est', '37056185', '15350429', '2025-11-02 22:06:14');
INSERT INTO `parents` VALUES ('46', '240', 'padre', 'SOSA Fabio', 'Mant Hospital', '36302594', '15349213', '2025-11-02 22:06:32');
INSERT INTO `parents` VALUES ('47', '241', 'madre', 'IBAÑEZ Mirna', 'A de Casa', '32362199', '15300800', '2025-11-02 22:07:52');
INSERT INTO `parents` VALUES ('48', '241', 'padre', 'TOLABA Ramon', 'Elec automot', '23365129', '15211237', '2025-11-02 22:08:10');
INSERT INTO `parents` VALUES ('49', '242', 'madre', 'FERNANADEZ Veronica', 'Emp', '36311487', '15363871', '2025-11-02 22:09:09');
INSERT INTO `parents` VALUES ('50', '242', 'padre', 'WEINZETEL Julio', 'Policia', '32539084', '15567286', '2025-11-02 22:09:27');
INSERT INTO `parents` VALUES ('51', '204', 'madre', 'COLLOMILLA Eliana', 'Emp Muni', '34051308', '', '2025-11-02 22:12:13');
INSERT INTO `parents` VALUES ('52', '204', 'padre', 'BUENOPIL Dario', 'Emp Muni', '34051224', '', '2025-11-02 22:12:25');
INSERT INTO `parents` VALUES ('53', '205', 'madre', 'Millahual Jesica', 'Doc', '33368899', '15282788', '2025-11-02 22:13:14');
INSERT INTO `parents` VALUES ('54', '205', 'padre', 'Cabeza Facundo', 'Emp', '34051220', '15706271', '2025-11-02 22:13:30');
INSERT INTO `parents` VALUES ('55', '206', 'madre', 'GUEVARA Romina', 'Docenete', '34730442', '11- 30419045', '2025-11-02 22:14:49');
INSERT INTO `parents` VALUES ('56', '206', 'padre', 'GONGORA Carlos', 'Elect', '28128523', '15544580', '2025-11-02 22:15:11');
INSERT INTO `parents` VALUES ('57', '209', 'madre', 'SANCHES Ana M', 'Est', '20237909', '', '2025-11-02 22:16:05');
INSERT INTO `parents` VALUES ('58', '210', 'madre', 'PAINITRU Liliana', 'Serv Penit', '30698271', '15251952', '2025-11-02 22:17:03');
INSERT INTO `parents` VALUES ('59', '210', 'padre', 'PERALTA Daniel', 'Trab Indep', '32263633', '15540151', '2025-11-02 22:17:20');
INSERT INTO `parents` VALUES ('60', '265', 'madre', 'CAYUMIL Janet', 'Guard mat', '36302552', '15554053', '2025-11-02 22:26:56');
INSERT INTO `parents` VALUES ('61', '270', 'madre', 'GARIGLIO Mayra', 'Comerc', '33532153', '15521716', '2025-11-02 22:27:56');
INSERT INTO `parents` VALUES ('62', '270', 'padre', 'GAVLOVSKY Jorge', '', '0', '15637985', '2025-11-02 22:28:23');
INSERT INTO `parents` VALUES ('63', '268', 'madre', 'URRETA M. Laura', 'A de casa', '31561880', '15616618', '2025-11-02 22:29:46');
INSERT INTO `parents` VALUES ('64', '268', 'padre', 'ALBANESE Entique C.', 'Radiólogo', '26704840', '15626112', '2025-11-02 22:30:11');
INSERT INTO `parents` VALUES ('65', '269', 'madre', 'YUNES M. Laura', 'Docente', '28521056', '', '2025-11-02 22:31:17');
INSERT INTO `parents` VALUES ('66', '269', 'padre', 'BARRERA Alfredo', 'Médico', '23634636', '622399', '2025-11-02 22:31:29');
INSERT INTO `parents` VALUES ('67', '272', 'madre', 'MULLER Carla', 'Docente', '27829993', '15446138', '2025-11-02 22:32:38');
INSERT INTO `parents` VALUES ('68', '272', 'padre', 'PEÑA Pablo', '', '24712570', '15446138', '2025-11-02 22:32:54');
INSERT INTO `parents` VALUES ('69', '273', 'madre', 'BELMAR Mirta', '', '17858152', '', '2025-11-02 22:33:52');
INSERT INTO `parents` VALUES ('70', '273', 'padre', 'PINO Angel', 'Comerc', '92796504', '15364692', '2025-11-02 22:34:09');
INSERT INTO `parents` VALUES ('71', '274', 'madre', 'ROTUNDO Cecilia', 'Abogada', '18777759', '15605477', '2025-11-02 22:35:17');
INSERT INTO `parents` VALUES ('72', '274', 'padre', 'RODRIGUEZ Gustavo', 'Arquitecto', '21877049', '15601569', '2025-11-02 22:35:33');
INSERT INTO `parents` VALUES ('73', '275', 'madre', 'RUIZ Julieta', 'A de casa', '32663188', '15555359', '2025-11-02 22:36:37');
INSERT INTO `parents` VALUES ('74', '275', 'padre', 'ROLLA Jorge', 'Comerc', '33245122', '', '2025-11-02 22:36:49');
INSERT INTO `parents` VALUES ('75', '311', 'madre', 'CORNEJO Mercedes', 'Empleado', '34580498', '15414980', '2025-11-02 22:39:38');
INSERT INTO `parents` VALUES ('76', '311', 'padre', 'ALVAREZ Jorge', 'Empleado', '34876213', '15244563', '2025-11-02 22:39:55');
INSERT INTO `parents` VALUES ('77', '306', 'madre', 'VERNACURE Gisela', 'Policía', '32717553', '15487999', '2025-11-02 22:40:46');
INSERT INTO `parents` VALUES ('78', '306', 'padre', 'CUELLO Marcos', 'Policía', '26698985', '15487999', '2025-11-02 22:41:02');
INSERT INTO `parents` VALUES ('79', '307', 'madre', 'JUSTINIANO Mariana', 'A de casa', '29169156', '15685472', '2025-11-02 22:44:04');
INSERT INTO `parents` VALUES ('80', '307', 'padre', 'DINAMARCA Oscar', 'Jubilado', '10438017', '15508483', '2025-11-02 22:44:23');
INSERT INTO `parents` VALUES ('81', '308', 'madre', 'CABRERA Carla', 'Docente', '25424773', '15602742', '2025-11-02 22:45:15');
INSERT INTO `parents` VALUES ('82', '308', 'padre', 'FRANCOLINO Roberto', 'Empl munic', '25485007', '15477888', '2025-11-02 22:45:34');
INSERT INTO `parents` VALUES ('83', '309', 'madre', 'GUDIÑO Sonia', 'Empl dom', '26702932', '15289045', '2025-11-02 22:46:33');
INSERT INTO `parents` VALUES ('84', '309', 'padre', 'LOPEZ Mario', 'Taxista', '24134647', '15250094', '2025-11-02 22:46:47');
INSERT INTO `parents` VALUES ('85', '337', 'madre', 'DIAZ Carolina', 'Docente', '28930765', '1136323181', '2025-11-02 22:48:45');
INSERT INTO `parents` VALUES ('86', '337', 'padre', 'PACHECO Norberto', 'Docente', '27274424', '1167247022', '2025-11-02 22:49:00');
INSERT INTO `parents` VALUES ('87', '310', 'madre', 'CABRERA Maia', 'Policía', '18862869', '15498953', '2025-11-02 22:49:43');
INSERT INTO `parents` VALUES ('88', '310', 'padre', 'PEREZ Claudio', '', '0', '', '2025-11-02 22:49:54');
/*!40000 ALTER TABLE `parents` ENABLE KEYS */;
UNLOCK TABLES;

-- --------------------------------------------------------

-- Estructura de tabla para la tabla `role_permissions`

DROP TABLE IF EXISTS `role_permissions`;
CREATE TABLE `role_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `page` varchar(100) NOT NULL,
  `action` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `role_permissions_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=574 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcado de datos para la tabla `role_permissions`

LOCK TABLES `role_permissions` WRITE;
/*!40000 ALTER TABLE `role_permissions` DISABLE KEYS */;
INSERT INTO `role_permissions` VALUES ('539', '3', 'index.php', 'view', '2025-11-14 18:24:42');
INSERT INTO `role_permissions` VALUES ('540', '3', 'attendance.php', 'view', '2025-11-14 18:24:42');
INSERT INTO `role_permissions` VALUES ('541', '3', 'course_attendance.php', 'view', '2025-11-14 18:24:42');
INSERT INTO `role_permissions` VALUES ('542', '3', 'attendance_reports_list.php', 'view', '2025-11-14 18:24:42');
INSERT INTO `role_permissions` VALUES ('543', '3', 'attendance_report.php', 'view', '2025-11-14 18:24:42');
INSERT INTO `role_permissions` VALUES ('544', '3', 'student_attendance.php', 'view', '2025-11-14 18:24:42');
INSERT INTO `role_permissions` VALUES ('545', '3', 'teachers_attendance.php', 'view', '2025-11-14 18:24:42');
INSERT INTO `role_permissions` VALUES ('546', '7', 'index.php', 'view', '2025-11-14 18:25:14');
INSERT INTO `role_permissions` VALUES ('547', '7', 'attendance_teacher.php', 'view', '2025-11-14 18:25:14');
INSERT INTO `role_permissions` VALUES ('548', '7', 'teacher_courses.php', 'view', '2025-11-14 18:25:14');
INSERT INTO `role_permissions` VALUES ('549', '7', 'teacher_reports.php', 'view', '2025-11-14 18:25:14');
INSERT INTO `role_permissions` VALUES ('550', '7', 'attendance_reports_list_teacher.php', 'view', '2025-11-14 18:25:14');
INSERT INTO `role_permissions` VALUES ('551', '2', 'index.php', 'view', '2025-11-17 07:59:49');
INSERT INTO `role_permissions` VALUES ('552', '2', 'attendance_teacher.php', 'view', '2025-11-17 07:59:49');
INSERT INTO `role_permissions` VALUES ('553', '2', 'attendance_reports_list_teacher.php', 'view', '2025-11-17 07:59:49');
INSERT INTO `role_permissions` VALUES ('554', '2', 'teacher_reports.php', 'view', '2025-11-17 07:59:49');
INSERT INTO `role_permissions` VALUES ('555', '2', 'teacher_courses.php', 'view', '2025-11-17 07:59:49');
INSERT INTO `role_permissions` VALUES ('556', '2', 'attendance.php', 'view', '2025-11-17 07:59:49');
INSERT INTO `role_permissions` VALUES ('557', '2', 'course_attendance.php', 'view', '2025-11-17 07:59:49');
INSERT INTO `role_permissions` VALUES ('558', '2', 'attendance_reports_list.php', 'view', '2025-11-17 07:59:49');
INSERT INTO `role_permissions` VALUES ('559', '2', 'attendance_report.php', 'view', '2025-11-17 07:59:49');
INSERT INTO `role_permissions` VALUES ('560', '2', 'student_attendance.php', 'view', '2025-11-17 07:59:49');
INSERT INTO `role_permissions` VALUES ('561', '2', 'teachers_attendance.php', 'view', '2025-11-17 07:59:49');
INSERT INTO `role_permissions` VALUES ('562', '2', 'teachers.php', 'view', '2025-11-17 07:59:49');
INSERT INTO `role_permissions` VALUES ('563', '2', 'students.php', 'view', '2025-11-17 07:59:49');
INSERT INTO `role_permissions` VALUES ('564', '2', 'courses.php', 'view', '2025-11-17 07:59:49');
INSERT INTO `role_permissions` VALUES ('565', '2', 'positions.php', 'view', '2025-11-17 07:59:49');
INSERT INTO `role_permissions` VALUES ('566', '2', 'subjects.php', 'view', '2025-11-17 07:59:49');
INSERT INTO `role_permissions` VALUES ('567', '2', 'classrooms.php', 'view', '2025-11-17 07:59:49');
INSERT INTO `role_permissions` VALUES ('568', '2', 'schedules.php', 'view', '2025-11-17 07:59:49');
INSERT INTO `role_permissions` VALUES ('569', '2', 'roles.php', 'view', '2025-11-17 07:59:49');
INSERT INTO `role_permissions` VALUES ('570', '2', 'users.php', 'view', '2025-11-17 07:59:49');
INSERT INTO `role_permissions` VALUES ('571', '2', 'attendance_report_admin.php', 'view', '2025-11-17 07:59:49');
INSERT INTO `role_permissions` VALUES ('572', '2', 'attendance_reports_admin_teachers.php', 'view', '2025-11-17 07:59:49');
INSERT INTO `role_permissions` VALUES ('573', '2', 'backup.php', 'view', '2025-11-17 07:59:49');
/*!40000 ALTER TABLE `role_permissions` ENABLE KEYS */;
UNLOCK TABLES;

-- --------------------------------------------------------

-- Estructura de tabla para la tabla `roles`

DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcado de datos para la tabla `roles`

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES ('2', 'Administrador', 'Perfil Por Defecto Para Administradores', '2025-10-10 18:52:33');
INSERT INTO `roles` VALUES ('3', 'Preceptor', 'Perfil Por Defecto Para Preceptores', '2025-10-10 18:57:17');
INSERT INTO `roles` VALUES ('7', 'Profesor', 'Perfil Por Defecto Para Profesores', '2025-11-14 18:24:58');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

-- --------------------------------------------------------

-- Estructura de tabla para la tabla `schedules`

DROP TABLE IF EXISTS `schedules`;
CREATE TABLE `schedules` (
  `schedule_id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  `substitute_teacher_id` int(11) DEFAULT NULL,
  `active_teacher_id` int(11) DEFAULT NULL,
  `weekday` enum('monday','tuesday','wednesday','thursday','friday','saturday') NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `group_id` int(11) DEFAULT NULL,
  `classroom_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`schedule_id`),
  KEY `course_id` (`course_id`),
  KEY `subject_id` (`subject_id`),
  KEY `teacher_id` (`teacher_id`),
  KEY `fk_schedules_groups` (`group_id`),
  KEY `classroom_id` (`classroom_id`),
  KEY `fk_substitute_teacher` (`substitute_teacher_id`),
  CONSTRAINT `fk_schedules_groups` FOREIGN KEY (`group_id`) REFERENCES `groups` (`group_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_substitute_teacher` FOREIGN KEY (`substitute_teacher_id`) REFERENCES `teachers` (`teacher_id`),
  CONSTRAINT `schedules_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`) ON DELETE CASCADE,
  CONSTRAINT `schedules_ibfk_2` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`subject_id`) ON DELETE CASCADE,
  CONSTRAINT `schedules_ibfk_3` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`teacher_id`) ON DELETE CASCADE,
  CONSTRAINT `schedules_ibfk_4` FOREIGN KEY (`classroom_id`) REFERENCES `classrooms` (`classroom_id`)
) ENGINE=InnoDB AUTO_INCREMENT=453 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcado de datos para la tabla `schedules`

LOCK TABLES `schedules` WRITE;
/*!40000 ALTER TABLE `schedules` DISABLE KEYS */;
INSERT INTO `schedules` VALUES ('1', '1', '331', '133', NULL, '133', 'monday', '07:30:00', '09:30:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('2', '1', '4', '43', NULL, '43', 'monday', '09:40:00', '11:40:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('3', '1', '6', '36', NULL, '36', 'tuesday', '07:30:00', '09:30:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('4', '1', '4', '43', NULL, '43', 'tuesday', '09:40:00', '11:40:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('5', '1', '7', '92', NULL, '92', 'wednesday', '07:30:00', '09:30:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('6', '1', '3', '134', NULL, '134', 'wednesday', '09:40:00', '11:40:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('7', '1', '7', '92', '78', '92', 'thursday', '07:30:00', '09:30:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('8', '1', '3', '134', NULL, '134', 'thursday', '09:40:00', '11:40:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('9', '1', '6', '36', NULL, '36', 'friday', '07:30:00', '09:30:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('10', '1', '5', '135', NULL, '135', 'friday', '09:40:00', '11:40:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('11', '2', '49', '43', NULL, '43', 'monday', '07:30:00', '09:30:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('12', '2', '52', '13', NULL, '13', 'monday', '09:40:00', '11:40:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('13', '2', '49', '43', NULL, '43', 'tuesday', '07:30:00', '09:30:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('14', '2', '50', '135', NULL, '135', 'tuesday', '09:40:00', '11:40:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('15', '2', '51', '36', NULL, '36', 'wednesday', '07:30:00', '09:30:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('16', '2', '48', '118', NULL, '118', 'wednesday', '09:40:00', '11:40:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('17', '2', '51', '36', NULL, '36', 'thursday', '07:30:00', '09:30:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('18', '2', '332', '5', NULL, '5', 'thursday', '09:40:00', '11:40:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('19', '2', '52', '13', NULL, '13', 'friday', '07:30:00', '09:30:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('20', '2', '48', '118', NULL, '118', 'friday', '09:40:00', '11:40:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('21', '3', '59', '98', NULL, '98', 'monday', '07:30:00', '09:30:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('22', '3', '60', '137', NULL, '137', 'monday', '09:40:00', '11:40:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('23', '3', '58', '28', NULL, '28', 'tuesday', '07:30:00', '09:30:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('24', '3', '60', '137', NULL, '137', 'tuesday', '09:40:00', '11:40:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('25', '3', '57', '22', NULL, '22', 'wednesday', '07:30:00', '09:30:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('26', '3', '61', '27', NULL, '27', 'wednesday', '09:40:00', '11:40:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('27', '3', '57', '22', NULL, '22', 'thursday', '07:30:00', '09:30:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('28', '3', '58', '28', NULL, '28', 'thursday', '09:40:00', '11:40:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('29', '3', '333', '35', NULL, '35', 'friday', '07:30:00', '09:30:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('30', '3', '61', '27', NULL, '27', 'friday', '09:40:00', '11:40:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('51', '4', '71', '138', NULL, '138', 'monday', '07:30:00', '09:30:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('52', '4', '72', '27', NULL, '27', 'monday', '09:40:00', '11:40:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('53', '4', '67', '94', NULL, '94', 'tuesday', '07:30:00', '09:30:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('54', '4', '70', '98', NULL, '98', 'tuesday', '09:40:00', '11:40:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('55', '4', '69', '104', NULL, '104', 'wednesday', '07:30:00', '09:30:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('56', '4', '71', '138', NULL, '138', 'wednesday', '09:40:00', '11:40:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('57', '4', '68', '140', NULL, '140', 'thursday', '07:30:00', '09:30:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('58', '4', '72', '27', NULL, '27', 'thursday', '09:40:00', '11:40:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('59', '4', '331', '141', NULL, '141', 'friday', '07:30:00', '09:30:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('60', '4', '66', '28', NULL, '28', 'friday', '09:40:00', '11:40:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('61', '5', '83', '97', NULL, '97', 'monday', '07:30:00', '09:30:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('62', '5', '82', '53', NULL, '53', 'monday', '09:40:00', '11:40:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('63', '5', '83', '97', NULL, '97', 'tuesday', '07:30:00', '09:30:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('64', '5', '78', '94', NULL, '94', 'tuesday', '09:40:00', '11:40:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('65', '5', '77', '26', NULL, '26', 'wednesday', '07:30:00', '09:30:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('66', '5', '80', '95', NULL, '95', 'wednesday', '09:40:00', '11:40:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('67', '5', '79', '21', NULL, '21', 'thursday', '07:30:00', '09:30:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('68', '5', '333', '35', NULL, '35', 'thursday', '09:40:00', '11:40:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('69', '5', '82', '53', NULL, '53', 'friday', '07:30:00', '09:30:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('70', '5', '81', '143', NULL, '143', 'friday', '09:40:00', '11:40:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('71', '6', '92', '1', NULL, '1', 'monday', '07:30:00', '09:30:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('72', '6', '91', '86', NULL, '86', 'monday', '09:40:00', '11:40:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('73', '6', '292', '147', NULL, '147', 'tuesday', '07:30:00', '09:30:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('74', '6', '89', '54', NULL, '54', 'tuesday', '09:40:00', '11:40:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('75', '6', '94', '120', NULL, '120', 'wednesday', '07:30:00', '09:30:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('76', '6', '88', '26', NULL, '26', 'wednesday', '09:40:00', '11:40:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('77', '6', '94', '120', NULL, '120', 'thursday', '07:30:00', '09:30:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('78', '6', '93', '31', NULL, '31', 'thursday', '09:40:00', '11:40:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('79', '6', '90', '21', NULL, '21', 'friday', '07:30:00', '09:30:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('80', '6', '93', '31', NULL, '31', 'friday', '09:40:00', '11:40:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('81', '7', '105', '27', NULL, '27', 'monday', '07:30:00', '09:30:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('82', '7', '104', '31', NULL, '31', 'monday', '09:40:00', '11:40:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('83', '7', '100', '54', NULL, '54', 'tuesday', '07:30:00', '09:30:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('84', '7', '99', '149', NULL, '149', 'tuesday', '09:40:00', '11:40:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('85', '7', '105', '27', NULL, '27', 'wednesday', '07:30:00', '09:30:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('86', '7', '104', '31', NULL, '31', 'wednesday', '09:40:00', '11:40:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('87', '7', '102', '148', NULL, '148', 'thursday', '07:30:00', '09:30:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('88', '7', '101', '140', NULL, '140', 'thursday', '09:40:00', '11:40:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('89', '7', '292', '150', NULL, '150', 'friday', '07:30:00', '09:30:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('90', '7', '103', '98', NULL, '98', 'friday', '09:40:00', '11:40:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('91', '9', '132', '151', NULL, '151', 'monday', '07:30:00', '09:30:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('92', '9', '126', '51', NULL, '51', 'monday', '09:40:00', '11:40:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('93', '9', '124', '124', NULL, '124', 'tuesday', '07:30:00', '09:30:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('94', '9', '126', '51', NULL, '51', 'tuesday', '09:40:00', '11:40:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('95', '9', '122', '152', NULL, '152', 'wednesday', '07:30:00', '09:30:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('96', '9', '123', '125', NULL, '125', 'wednesday', '09:40:00', '11:40:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('97', '9', '134', '78', NULL, '78', 'thursday', '07:30:00', '09:30:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('98', '9', '127', '92', NULL, '92', 'thursday', '09:40:00', '11:40:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('99', '9', '125', '98', NULL, '98', 'friday', '07:30:00', '09:30:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('100', '9', '133', '76', NULL, '76', 'friday', '09:40:00', '11:40:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('101', '10', '170', '92', NULL, '92', 'monday', '07:30:00', '09:30:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('102', '10', '167', '124', NULL, '124', 'monday', '09:40:00', '11:40:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('103', '10', '169', '66', NULL, '66', 'tuesday', '07:30:00', '09:30:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('104', '10', '171', '28', NULL, '28', 'tuesday', '09:40:00', '11:40:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('105', '10', '168', '6', NULL, '6', 'wednesday', '07:30:00', '09:30:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('106', '10', '166', '140', NULL, '140', 'wednesday', '09:40:00', '11:40:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('107', '10', '172', '153', NULL, '153', 'thursday', '07:30:00', '09:30:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('108', '10', '165', '152', NULL, '152', 'thursday', '09:40:00', '11:40:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('109', '10', '169', '31', NULL, '31', 'friday', '07:30:00', '09:30:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('110', '10', '178', '70', NULL, '70', 'friday', '09:40:00', '11:40:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('111', '11', '245', '124', NULL, '124', 'monday', '07:30:00', '09:30:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('112', '11', '243', '155', NULL, '155', 'monday', '09:40:00', '11:40:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('113', '11', '243', '155', NULL, '155', 'tuesday', '07:30:00', '09:30:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('114', '11', '240', '21', NULL, '21', 'tuesday', '09:40:00', '11:40:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('115', '11', '253', '31', NULL, '31', 'wednesday', '07:30:00', '09:30:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('116', '11', '241', '86', NULL, '86', 'wednesday', '09:40:00', '11:40:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('117', '11', '246', '90', NULL, '90', 'thursday', '07:30:00', '09:30:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('118', '11', '244', '96', NULL, '96', 'thursday', '09:40:00', '11:40:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('119', '11', '252', '156', NULL, '156', 'friday', '07:30:00', '09:30:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('120', '11', '242', '1', NULL, '1', 'friday', '09:40:00', '11:40:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('121', '12', '256', '140', NULL, '140', 'monday', '07:30:00', '09:30:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('122', '12', '271', '78', NULL, '78', 'monday', '09:40:00', '11:40:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('123', '12', '261', '157', NULL, '157', 'tuesday', '07:30:00', '09:30:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('124', '12', '270', '87', NULL, '87', 'tuesday', '09:40:00', '11:40:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('125', '12', '260', '34', NULL, '34', 'wednesday', '07:30:00', '09:30:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('126', '12', '258', '6', NULL, '6', 'wednesday', '09:40:00', '11:40:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('127', '12', '270', '87', NULL, '87', 'thursday', '07:30:00', '09:30:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('128', '12', '259', '137', NULL, '137', 'thursday', '09:40:00', '11:40:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('129', '12', '259', '137', NULL, '137', 'friday', '07:30:00', '09:30:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('130', '12', '257', '130', NULL, '130', 'friday', '10:40:00', '11:40:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('131', '13', '294', '159', NULL, '159', 'monday', '07:30:00', '09:30:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('132', '13', '296', '161', NULL, '161', 'monday', '09:40:00', '11:40:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('133', '13', '293', '74', NULL, '74', 'tuesday', '07:30:00', '09:30:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('134', '13', '294', '159', NULL, '159', 'tuesday', '10:40:00', '11:40:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('135', '13', '293', '74', NULL, '74', 'tuesday', '09:40:00', '10:40:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('136', '13', '290', '108', NULL, '108', 'wednesday', '07:30:00', '09:30:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('137', '13', '281', '92', NULL, '92', 'wednesday', '09:40:00', '11:40:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('138', '13', '292', '23', NULL, '23', 'thursday', '07:30:00', '09:30:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('139', '13', '295', '74', NULL, '74', 'thursday', '09:40:00', '11:40:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('140', '13', '291', '160', NULL, '160', 'friday', '07:30:00', '09:30:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('141', '13', '279', '6', NULL, '6', 'friday', '09:40:00', '11:40:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('142', '14', '311', '111', NULL, '111', 'monday', '07:30:00', '09:30:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('143', '14', '298', '92', NULL, '92', 'monday', '09:40:00', '11:40:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('144', '14', '304', '160', NULL, '160', 'tuesday', '07:30:00', '09:30:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('145', '14', '306', '88', NULL, '88', 'tuesday', '09:40:00', '11:40:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('146', '14', '309', '161', NULL, '161', 'wednesday', '07:30:00', '09:30:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('147', '14', '310', '111', NULL, '111', 'wednesday', '09:40:00', '11:40:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('148', '14', '305', '147', NULL, '147', 'thursday', '07:30:00', '09:30:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('149', '14', '310', '111', NULL, '111', 'thursday', '09:40:00', '11:40:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('150', '14', '297', '6', NULL, '6', 'friday', '07:30:00', '09:30:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('151', '14', '310', '111', NULL, '111', 'friday', '09:40:00', '11:40:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('209', '1', '11', '88', NULL, '88', 'monday', '13:20:00', '15:20:00', '1', NULL);
INSERT INTO `schedules` VALUES ('210', '1', '334', '69', NULL, '69', 'tuesday', '13:00:00', '14:00:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('211', '1', '8', '20', NULL, '20', 'tuesday', '15:30:00', '17:30:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('212', '1', '334', '69', NULL, '69', 'thursday', '13:00:00', '14:00:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('213', '1', '9', '87', NULL, '87', 'wednesday', '13:20:00', '15:20:00', '1', NULL);
INSERT INTO `schedules` VALUES ('214', '1', '10', '62', NULL, '62', 'friday', '13:20:00', '15:20:00', '1', NULL);
INSERT INTO `schedules` VALUES ('215', '1', '10', '62', NULL, '62', 'monday', '15:30:00', '17:30:00', '2', NULL);
INSERT INTO `schedules` VALUES ('216', '1', '11', '113', NULL, '113', 'wednesday', '15:30:00', '17:30:00', '2', NULL);
INSERT INTO `schedules` VALUES ('217', '1', '9', '71', NULL, '71', 'friday', '15:30:00', '17:30:00', '2', NULL);
INSERT INTO `schedules` VALUES ('218', '2', '55', '75', NULL, '75', 'monday', '15:30:00', '17:30:00', '3', NULL);
INSERT INTO `schedules` VALUES ('219', '2', '56', '114', NULL, '114', 'tuesday', '13:20:00', '15:20:00', '3', NULL);
INSERT INTO `schedules` VALUES ('220', '2', '335', '136', NULL, '136', 'monday', '11:40:00', '12:40:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('221', '2', '335', '136', NULL, '136', 'wednesday', '11:40:00', '12:40:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('222', '2', '53', '169', NULL, '169', 'wednesday', '15:30:00', '17:30:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('224', '2', '56', '88', NULL, '88', 'monday', '15:30:00', '17:30:00', '4', NULL);
INSERT INTO `schedules` VALUES ('225', '2', '54', '83', NULL, '83', 'tuesday', '15:30:00', '17:30:00', '4', NULL);
INSERT INTO `schedules` VALUES ('226', '2', '55', '75', NULL, '75', 'thursday', '13:20:00', '15:20:00', '4', NULL);
INSERT INTO `schedules` VALUES ('227', '3', '336', '14', NULL, '14', 'monday', '16:00:00', '17:00:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('228', '3', '336', '14', NULL, '14', 'wednesday', '16:00:00', '17:00:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('229', '3', '65', '75', NULL, '75', 'monday', '13:20:00', '15:20:00', '6', NULL);
INSERT INTO `schedules` VALUES ('230', '3', '64', '62', NULL, '62', 'monday', '13:20:00', '15:20:00', '5', NULL);
INSERT INTO `schedules` VALUES ('231', '3', '62', '134', NULL, '134', 'tuesday', '13:20:00', '15:20:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('232', '3', '64', '62', NULL, '62', 'thursday', '13:20:00', '15:20:00', '6', NULL);
INSERT INTO `schedules` VALUES ('233', '2', '54', '87', NULL, '87', 'thursday', '13:20:00', '15:20:00', '3', NULL);
INSERT INTO `schedules` VALUES ('234', '3', '63', '170', NULL, '170', 'friday', '13:20:00', '15:20:00', '6', NULL);
INSERT INTO `schedules` VALUES ('235', '3', '65', '114', NULL, '114', 'friday', '13:20:00', '15:20:00', '5', NULL);
INSERT INTO `schedules` VALUES ('236', '3', '63', '83', NULL, '83', 'thursday', '13:20:00', '15:30:00', '5', NULL);
INSERT INTO `schedules` VALUES ('237', '4', '73', '171', NULL, '171', 'monday', '13:20:00', '15:20:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('238', '4', '337', '172', NULL, '172', 'monday', '12:00:00', '13:00:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('239', '4', '337', '172', NULL, '172', 'wednesday', '12:00:00', '13:00:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('240', '4', '76', '75', NULL, '75', 'tuesday', '13:20:00', '15:20:00', '7', NULL);
INSERT INTO `schedules` VALUES ('241', '4', '74', '87', NULL, '87', 'wednesday', '15:30:00', '17:30:00', '7', NULL);
INSERT INTO `schedules` VALUES ('243', '4', '76', '75', NULL, '75', 'friday', '15:30:00', '17:30:00', '7', NULL);
INSERT INTO `schedules` VALUES ('244', '4', '76', '71', NULL, '71', 'tuesday', '13:20:00', '15:20:00', '8', NULL);
INSERT INTO `schedules` VALUES ('245', '4', '75', '62', NULL, '62', 'wednesday', '13:20:00', '15:20:00', '8', NULL);
INSERT INTO `schedules` VALUES ('246', '4', '76', '71', NULL, '71', 'thursday', '15:30:00', '17:30:00', '8', NULL);
INSERT INTO `schedules` VALUES ('247', '4', '75', '114', NULL, '114', 'thursday', '15:30:00', '17:30:00', '7', NULL);
INSERT INTO `schedules` VALUES ('248', '4', '74', '62', NULL, '62', 'friday', '15:30:00', '17:30:00', '8', NULL);
INSERT INTO `schedules` VALUES ('249', '5', '84', '169', NULL, '169', 'monday', '15:30:00', '17:30:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('250', '5', '338', '14', NULL, '14', 'monday', '13:00:00', '14:00:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('251', '5', '338', '14', NULL, '14', 'wednesday', '12:00:00', '13:00:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('252', '5', '85', '62', NULL, '62', 'tuesday', '15:30:00', '17:30:00', '9', NULL);
INSERT INTO `schedules` VALUES ('253', '5', '87', '58', NULL, '58', 'wednesday', '13:20:00', '15:20:00', '9', NULL);
INSERT INTO `schedules` VALUES ('254', '5', '86', '62', NULL, '62', 'thursday', '15:30:00', '17:30:00', '9', NULL);
INSERT INTO `schedules` VALUES ('255', '5', '87', '58', NULL, '58', 'friday', '15:30:00', '17:30:00', '9', NULL);
INSERT INTO `schedules` VALUES ('256', '5', '87', '165', NULL, '165', 'tuesday', '13:20:00', '15:20:00', '10', NULL);
INSERT INTO `schedules` VALUES ('257', '5', '86', '62', NULL, '62', 'wednesday', '15:30:00', '17:30:00', '10', NULL);
INSERT INTO `schedules` VALUES ('258', '5', '87', '165', NULL, '165', 'thursday', '15:30:00', '17:30:00', '10', NULL);
INSERT INTO `schedules` VALUES ('259', '5', '85', '170', NULL, '170', 'friday', '15:30:00', '17:30:00', '10', NULL);
INSERT INTO `schedules` VALUES ('260', '6', '95', '35', NULL, '35', 'wednesday', '15:30:00', '17:30:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('261', '6', '339', '14', NULL, '14', 'wednesday', '13:00:00', '14:00:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('262', '6', '339', '14', NULL, '14', 'friday', '14:20:00', '15:20:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('263', '6', '96', '6', NULL, '6', 'monday', '13:20:00', '15:20:00', '11', NULL);
INSERT INTO `schedules` VALUES ('264', '6', '97', '71', NULL, '71', 'monday', '15:30:00', '17:30:00', '11', NULL);
INSERT INTO `schedules` VALUES ('265', '6', '98', '174', NULL, '174', 'tuesday', '15:30:00', '17:30:00', '11', NULL);
INSERT INTO `schedules` VALUES ('266', '6', '97', '71', NULL, '71', 'thursday', '13:20:00', '15:20:00', '11', NULL);
INSERT INTO `schedules` VALUES ('267', '6', '98', '153', NULL, '153', 'monday', '13:20:00', '15:20:00', '12', NULL);
INSERT INTO `schedules` VALUES ('268', '6', '97', '153', NULL, '153', 'tuesday', '13:20:00', '15:20:00', '12', NULL);
INSERT INTO `schedules` VALUES ('269', '6', '96', '87', NULL, '87', 'tuesday', '15:30:00', '17:30:00', '12', NULL);
INSERT INTO `schedules` VALUES ('270', '6', '97', '153', NULL, '153', 'thursday', '13:20:00', '15:20:00', '12', NULL);
INSERT INTO `schedules` VALUES ('271', '7', '106', '175', NULL, '175', 'monday', '15:30:00', '17:30:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('272', '7', '340', '11', NULL, '11', 'monday', '12:00:00', '13:00:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('273', '7', '107', '83', NULL, '83', 'tuesday', '13:20:00', '15:20:00', '13', NULL);
INSERT INTO `schedules` VALUES ('274', '7', '109', '75', NULL, '75', 'wednesday', '13:20:00', '15:20:00', '13', NULL);
INSERT INTO `schedules` VALUES ('275', '7', '108', '75', NULL, '75', 'thursday', '15:30:00', '17:30:00', '13', NULL);
INSERT INTO `schedules` VALUES ('276', '7', '108', '75', NULL, '75', 'friday', '13:20:00', '15:20:00', '13', NULL);
INSERT INTO `schedules` VALUES ('277', '7', '107', '62', NULL, '62', 'tuesday', '13:20:00', '15:20:00', '14', NULL);
INSERT INTO `schedules` VALUES ('278', '7', '108', '88', NULL, '88', 'wednesday', '13:20:00', '15:20:00', '14', NULL);
INSERT INTO `schedules` VALUES ('279', '7', '109', '78', NULL, '78', 'wednesday', '15:30:00', '17:30:00', '14', NULL);
INSERT INTO `schedules` VALUES ('280', '7', '108', '88', NULL, '88', 'friday', '15:30:00', '17:30:00', '14', NULL);
INSERT INTO `schedules` VALUES ('281', '10', '342', '176', NULL, '176', 'tuesday', '13:00:00', '14:00:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('282', '10', '342', '176', NULL, '176', 'thursday', '13:00:00', '14:00:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('283', '10', '179', '71', NULL, '71', 'monday', '13:20:00', '15:20:00', '20', NULL);
INSERT INTO `schedules` VALUES ('284', '10', '180', '167', NULL, '167', 'wednesday', '13:20:00', '14:20:00', '20', NULL);
INSERT INTO `schedules` VALUES ('285', '10', '179', '71', NULL, '71', 'wednesday', '14:20:00', '15:20:00', '20', NULL);
INSERT INTO `schedules` VALUES ('286', '10', '181', '49', NULL, '49', 'friday', '13:20:00', '15:20:00', '20', NULL);
INSERT INTO `schedules` VALUES ('287', '10', '181', '49', NULL, '49', 'monday', '15:30:00', '17:30:00', '20', NULL);
INSERT INTO `schedules` VALUES ('288', '10', '180', '167', NULL, '167', 'tuesday', '15:30:00', '17:30:00', '20', NULL);
INSERT INTO `schedules` VALUES ('289', '10', '182', '70', NULL, '70', 'wednesday', '15:30:00', '17:30:00', '20', NULL);
INSERT INTO `schedules` VALUES ('290', '10', '183', '177', NULL, '177', 'friday', '15:30:00', '17:30:00', '20', NULL);
INSERT INTO `schedules` VALUES ('291', '10', '179', '87', NULL, '87', 'monday', '13:20:00', '15:20:00', '19', NULL);
INSERT INTO `schedules` VALUES ('294', '10', '180', '53', NULL, '53', 'monday', '15:30:00', '17:30:00', '19', NULL);
INSERT INTO `schedules` VALUES ('295', '10', '181', '71', NULL, '71', 'tuesday', '15:30:00', '17:30:00', '19', NULL);
INSERT INTO `schedules` VALUES ('296', '10', '182', '70', NULL, '70', 'wednesday', '13:20:00', '15:20:00', '19', NULL);
INSERT INTO `schedules` VALUES ('297', '10', '181', '71', NULL, '71', 'wednesday', '15:30:00', '17:30:00', '19', NULL);
INSERT INTO `schedules` VALUES ('298', '10', '183', '107', NULL, '107', 'friday', '13:20:00', '15:20:00', '19', NULL);
INSERT INTO `schedules` VALUES ('299', '10', '180', '53', NULL, '53', 'friday', '15:30:00', '16:30:00', '19', NULL);
INSERT INTO `schedules` VALUES ('300', '10', '179', '87', NULL, '87', 'friday', '16:30:00', '17:30:00', '19', NULL);
INSERT INTO `schedules` VALUES ('301', '10', '165', '152', NULL, '152', 'thursday', '11:40:00', '12:40:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('302', '9', '122', '152', NULL, '152', 'tuesday', '11:40:00', '12:40:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('303', '9', '343', '7', NULL, '7', 'wednesday', '15:30:00', '16:30:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('304', '9', '343', '7', NULL, '7', 'friday', '13:00:00', '14:00:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('305', '9', '137', '55', NULL, '55', 'monday', '13:20:00', '15:20:00', '17', NULL);
INSERT INTO `schedules` VALUES ('306', '9', '136', '108', NULL, '108', 'tuesday', '13:20:00', '15:20:00', '17', NULL);
INSERT INTO `schedules` VALUES ('307', '9', '137', '55', NULL, '55', 'tuesday', '15:30:00', '17:30:00', '17', NULL);
INSERT INTO `schedules` VALUES ('308', '9', '135', '31', NULL, '31', 'wednesday', '13:20:00', '15:20:00', '17', NULL);
INSERT INTO `schedules` VALUES ('309', '9', '136', '108', NULL, '108', 'thursday', '13:20:00', '15:20:00', '17', NULL);
INSERT INTO `schedules` VALUES ('310', '9', '138', '109', NULL, '109', 'thursday', '15:30:00', '17:30:00', '17', NULL);
INSERT INTO `schedules` VALUES ('311', '9', '138', '109', NULL, '109', 'monday', '13:20:00', '15:20:00', '18', NULL);
INSERT INTO `schedules` VALUES ('312', '9', '136', '109', NULL, '109', 'monday', '15:30:00', '17:30:00', '18', NULL);
INSERT INTO `schedules` VALUES ('313', '9', '137', '122', NULL, '122', 'tuesday', '13:20:00', '15:20:00', '18', NULL);
INSERT INTO `schedules` VALUES ('314', '9', '136', '109', NULL, '109', 'tuesday', '15:30:00', '17:30:00', '18', NULL);
INSERT INTO `schedules` VALUES ('315', '9', '135', '48', NULL, '48', 'thursday', '13:20:00', '15:20:00', '18', NULL);
INSERT INTO `schedules` VALUES ('316', '11', '345', '178', NULL, '178', 'tuesday', '14:20:00', '15:20:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('317', '11', '345', '178', NULL, '178', 'thursday', '13:20:00', '14:20:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('318', '11', '246', '90', NULL, '90', 'monday', '14:20:00', '15:20:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('319', '11', '251', '110', NULL, '110', 'monday', '15:30:00', '17:30:00', '21', NULL);
INSERT INTO `schedules` VALUES ('320', '11', '248', '48', NULL, '48', 'wednesday', '13:20:00', '15:20:00', '21', NULL);
INSERT INTO `schedules` VALUES ('321', '11', '249', '110', NULL, '110', 'wednesday', '15:30:00', '17:30:00', '21', NULL);
INSERT INTO `schedules` VALUES ('322', '11', '251', '110', NULL, '110', 'thursday', '15:30:00', '17:30:00', '21', NULL);
INSERT INTO `schedules` VALUES ('323', '11', '248', '48', NULL, '48', 'friday', '13:20:00', '15:20:00', '21', NULL);
INSERT INTO `schedules` VALUES ('324', '11', '247', '156', NULL, '156', 'friday', '15:30:00', '17:30:00', '21', NULL);
INSERT INTO `schedules` VALUES ('325', '11', '248', '108', NULL, '108', 'monday', '15:30:00', '17:30:00', '22', NULL);
INSERT INTO `schedules` VALUES ('326', '11', '247', '110', NULL, '110', 'tuesday', '15:30:00', '17:30:00', '22', NULL);
INSERT INTO `schedules` VALUES ('327', '11', '249', '45', NULL, '45', 'wednesday', '13:20:00', '15:20:00', '22', NULL);
INSERT INTO `schedules` VALUES ('328', '11', '251', '108', NULL, '108', 'wednesday', '15:30:00', '17:30:00', '22', NULL);
INSERT INTO `schedules` VALUES ('329', '11', '248', '108', NULL, '108', 'thursday', '15:30:00', '17:30:00', '22', NULL);
INSERT INTO `schedules` VALUES ('330', '11', '251', '108', NULL, '108', 'friday', '15:30:00', '17:30:00', '22', NULL);
INSERT INTO `schedules` VALUES ('331', '12', '273', '111', NULL, '111', 'monday', '13:20:00', '16:30:00', '23', NULL);
INSERT INTO `schedules` VALUES ('332', '12', '271', '78', NULL, '78', 'wednesday', '11:40:00', '12:40:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('333', '12', '257', '130', NULL, '130', 'friday', '11:40:00', '12:40:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('334', '12', '274', '70', NULL, '70', 'tuesday', '13:20:00', '15:20:00', '23', NULL);
INSERT INTO `schedules` VALUES ('335', '12', '275', '70', NULL, '70', 'tuesday', '15:30:00', '17:30:00', '23', NULL);
INSERT INTO `schedules` VALUES ('336', '12', '275', '70', NULL, '70', 'thursday', '13:20:00', '15:20:00', '23', NULL);
INSERT INTO `schedules` VALUES ('337', '12', '272', '113', NULL, '113', 'thursday', '15:30:00', '17:30:00', '23', NULL);
INSERT INTO `schedules` VALUES ('338', '12', '272', '113', NULL, '113', 'friday', '15:30:00', '17:30:00', '23', NULL);
INSERT INTO `schedules` VALUES ('339', '12', '275', '70', NULL, '70', 'monday', '13:20:00', '15:20:00', '24', NULL);
INSERT INTO `schedules` VALUES ('340', '12', '272', '58', NULL, '58', 'monday', '15:30:00', '17:30:00', '24', NULL);
INSERT INTO `schedules` VALUES ('341', '12', '273', '68', NULL, '68', 'tuesday', '13:20:00', '16:30:00', '24', NULL);
INSERT INTO `schedules` VALUES ('342', '12', '274', '113', NULL, '113', 'thursday', '13:20:00', '15:20:00', '24', NULL);
INSERT INTO `schedules` VALUES ('343', '12', '272', '58', NULL, '58', 'thursday', '15:30:00', '17:30:00', '24', NULL);
INSERT INTO `schedules` VALUES ('344', '12', '275', '70', NULL, '70', 'friday', '15:30:00', '17:30:00', '24', NULL);
INSERT INTO `schedules` VALUES ('345', '13', '295', '74', NULL, '74', 'monday', '11:40:00', '12:40:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('346', '13', '285', '48', NULL, '48', 'monday', '13:20:00', '15:20:00', '27', NULL);
INSERT INTO `schedules` VALUES ('347', '13', '283', '66', '74', '74', 'tuesday', '15:30:00', '17:30:00', '27', NULL);
INSERT INTO `schedules` VALUES ('348', '13', '285', '48', NULL, '48', 'wednesday', '15:30:00', '17:30:00', '27', NULL);
INSERT INTO `schedules` VALUES ('349', '13', '286', '45', NULL, '45', 'thursday', '13:20:00', '15:20:00', '27', NULL);
INSERT INTO `schedules` VALUES ('350', '13', '288', '108', NULL, '108', 'friday', '13:20:00', '15:20:00', '27', NULL);
INSERT INTO `schedules` VALUES ('351', '13', '286', '45', NULL, '45', 'friday', '15:30:00', '17:30:00', '27', NULL);
INSERT INTO `schedules` VALUES ('352', '13', '285', '108', NULL, '108', 'monday', '13:20:00', '15:20:00', '28', NULL);
INSERT INTO `schedules` VALUES ('353', '13', '288', '108', NULL, '108', 'tuesday', '15:30:00', '17:30:00', '28', NULL);
INSERT INTO `schedules` VALUES ('354', '13', '285', '108', NULL, '108', 'wednesday', '13:20:00', '15:20:00', '28', NULL);
INSERT INTO `schedules` VALUES ('355', '13', '286', '74', NULL, '74', 'thursday', '13:20:00', '15:20:00', '28', NULL);
INSERT INTO `schedules` VALUES ('356', '13', '283', '74', NULL, '74', 'friday', '13:20:00', '15:20:00', '28', NULL);
INSERT INTO `schedules` VALUES ('357', '13', '286', '74', NULL, '74', 'friday', '15:30:00', '17:30:00', '28', NULL);
INSERT INTO `schedules` VALUES ('358', '14', '311', '111', NULL, '111', 'friday', '11:40:00', '12:40:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('359', '14', '314', '70', '107', '70', 'monday', '15:30:00', '17:30:00', '25', NULL);
INSERT INTO `schedules` VALUES ('360', '14', '315', '6', NULL, '6', 'tuesday', '13:20:00', '15:20:00', '25', NULL);
INSERT INTO `schedules` VALUES ('361', '14', '313', '6', NULL, '6', 'wednesday', '13:20:00', '15:20:00', '25', NULL);
INSERT INTO `schedules` VALUES ('362', '14', '312', '58', NULL, '58', 'wednesday', '15:30:00', '17:30:00', '25', NULL);
INSERT INTO `schedules` VALUES ('363', '14', '312', '58', NULL, '58', 'thursday', '13:20:00', '15:20:00', '25', NULL);
INSERT INTO `schedules` VALUES ('364', '14', '315', '6', NULL, '6', 'thursday', '15:30:00', '17:30:00', '25', NULL);
INSERT INTO `schedules` VALUES ('365', '14', '312', '58', NULL, '58', 'friday', '13:20:00', '15:20:00', '25', NULL);
INSERT INTO `schedules` VALUES ('366', '14', '313', '111', NULL, '111', 'tuesday', '13:20:00', '15:20:00', '26', NULL);
INSERT INTO `schedules` VALUES ('367', '14', '312', '111', NULL, '111', 'tuesday', '15:30:00', '17:30:00', '26', NULL);
INSERT INTO `schedules` VALUES ('368', '14', '312', '111', NULL, '111', 'wednesday', '13:20:00', '15:20:00', '26', NULL);
INSERT INTO `schedules` VALUES ('369', '14', '314', '107', NULL, '107', 'wednesday', '15:30:00', '17:30:00', '26', NULL);
INSERT INTO `schedules` VALUES ('370', '14', '312', '111', NULL, '111', 'thursday', '13:20:00', '15:20:00', '26', NULL);
INSERT INTO `schedules` VALUES ('371', '14', '315', '107', NULL, '107', 'thursday', '15:30:00', '17:30:00', '26', NULL);
INSERT INTO `schedules` VALUES ('372', '14', '315', '107', NULL, '107', 'friday', '15:30:00', '17:30:00', '26', NULL);
INSERT INTO `schedules` VALUES ('392', '15', '316', '163', NULL, '163', 'monday', '07:30:00', '09:30:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('393', '15', '318', '165', NULL, '165', 'monday', '09:40:00', '11:40:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('394', '15', '323', '108', NULL, '108', 'tuesday', '07:30:00', '09:30:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('395', '15', '321', '78', NULL, '78', 'wednesday', '09:40:00', '11:40:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('396', '15', '322', '55', NULL, '55', 'thursday', '07:30:00', '10:40:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('397', '15', '323', '108', NULL, '108', 'friday', '07:30:00', '09:30:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('398', '15', '320', '48', NULL, '48', 'monday', '15:30:00', '17:30:00', '34', NULL);
INSERT INTO `schedules` VALUES ('399', '15', '319', '48', NULL, '48', 'tuesday', '15:30:00', '17:30:00', '34', NULL);
INSERT INTO `schedules` VALUES ('400', '15', '317', '90', NULL, '90', 'wednesday', '13:20:00', '15:20:00', '34', NULL);
INSERT INTO `schedules` VALUES ('401', '15', '319', '48', NULL, '48', 'thursday', '15:30:00', '17:30:00', '34', NULL);
INSERT INTO `schedules` VALUES ('402', '15', '320', '48', NULL, '48', 'friday', '15:30:00', '17:30:00', '34', NULL);
INSERT INTO `schedules` VALUES ('404', '16', '327', '53', NULL, '53', 'monday', '13:20:00', '15:20:00', '30', NULL);
INSERT INTO `schedules` VALUES ('405', '16', '329', '168', NULL, '168', 'monday', '15:30:00', '17:30:00', '30', NULL);
INSERT INTO `schedules` VALUES ('406', '16', '327', '53', NULL, '53', 'tuesday', '13:20:00', '14:20:00', '30', NULL);
INSERT INTO `schedules` VALUES ('407', '16', '328', '179', NULL, '179', 'tuesday', '14:20:00', '17:30:00', '30', NULL);
INSERT INTO `schedules` VALUES ('408', '16', '327', '53', NULL, '53', 'wednesday', '13:20:00', '15:20:00', '30', NULL);
INSERT INTO `schedules` VALUES ('409', '16', '328', '168', NULL, '168', 'wednesday', '15:30:00', '17:30:00', '30', NULL);
INSERT INTO `schedules` VALUES ('410', '16', '329', '168', NULL, '168', 'thursday', '13:20:00', '15:20:00', '30', NULL);
INSERT INTO `schedules` VALUES ('411', '16', '328', '179', NULL, '179', 'thursday', '15:30:00', '17:30:00', '30', NULL);
INSERT INTO `schedules` VALUES ('412', '16', '327', '179', NULL, '179', 'friday', '13:20:00', '15:20:00', '30', NULL);
INSERT INTO `schedules` VALUES ('413', '16', '325', '179', NULL, '179', 'friday', '15:30:00', '17:30:00', '30', NULL);
INSERT INTO `schedules` VALUES ('414', '16', '329', '168', NULL, '168', 'monday', '13:20:00', '15:20:00', '31', NULL);
INSERT INTO `schedules` VALUES ('415', '16', '328', '177', NULL, '177', 'monday', '15:30:00', '17:30:00', '31', NULL);
INSERT INTO `schedules` VALUES ('416', '16', '328', '177', NULL, '177', 'tuesday', '13:20:00', '14:20:00', '31', NULL);
INSERT INTO `schedules` VALUES ('417', '16', '327', '177', NULL, '177', 'tuesday', '14:20:00', '17:30:00', '31', NULL);
INSERT INTO `schedules` VALUES ('418', '16', '329', '168', NULL, '168', 'wednesday', '13:20:00', '15:20:00', '31', NULL);
INSERT INTO `schedules` VALUES ('419', '16', '327', '177', NULL, '177', 'wednesday', '15:30:00', '17:30:00', '31', NULL);
INSERT INTO `schedules` VALUES ('420', '16', '328', '177', NULL, '177', 'thursday', '13:20:00', '15:20:00', '31', NULL);
INSERT INTO `schedules` VALUES ('421', '16', '329', '168', NULL, '168', 'thursday', '15:30:00', '17:30:00', '31', NULL);
INSERT INTO `schedules` VALUES ('422', '16', '327', '177', NULL, '177', 'friday', '13:20:00', '15:20:00', '31', NULL);
INSERT INTO `schedules` VALUES ('423', '16', '325', '179', NULL, '179', 'friday', '15:30:00', '17:30:00', '31', NULL);
INSERT INTO `schedules` VALUES ('424', '16', '330', '168', NULL, '168', 'monday', '09:40:00', '11:40:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('425', '16', '324', '107', NULL, '107', 'tuesday', '07:30:00', '09:30:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('426', '16', '330', '168', NULL, '168', 'wednesday', '09:40:00', '11:40:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('427', '16', '326', '167', NULL, '167', 'tuesday', '09:40:00', '11:40:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('428', '16', '324', '107', NULL, '107', 'thursday', '07:30:00', '09:30:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('429', '16', '326', '167', NULL, '167', 'thursday', '09:40:00', '11:40:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('430', '16', '330', '168', NULL, '168', 'friday', '09:40:00', '11:40:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('431', '8', '113', '142', NULL, '142', 'monday', '13:20:00', '15:20:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('432', '8', '116', '127', NULL, '127', 'monday', '15:30:00', '17:30:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('433', '8', '114', '129', NULL, '129', 'tuesday', '13:20:00', '15:20:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('434', '8', '341', '16', NULL, '16', 'tuesday', '15:30:00', '17:30:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('435', '8', '112', '81', NULL, '81', 'wednesday', '13:20:00', '15:20:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('436', '8', '115', '94', NULL, '94', 'wednesday', '15:30:00', '17:30:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('437', '8', '110', '180', NULL, '180', 'thursday', '13:20:00', '15:20:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('438', '8', '111', '94', NULL, '94', 'thursday', '15:30:00', '17:30:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('439', '8', '116', '127', NULL, '127', 'friday', '13:20:00', '15:20:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('440', '8', '115', '137', NULL, '137', 'friday', '15:30:00', '17:30:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('441', '8', '117', '23', NULL, '23', 'monday', '07:30:00', '09:30:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('442', '8', '118', '87', NULL, '87', 'monday', '09:40:00', '11:40:00', '16', NULL);
INSERT INTO `schedules` VALUES ('443', '8', '341', '181', NULL, '181', 'tuesday', '12:10:00', '13:10:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('444', '8', '119', '122', NULL, '122', 'wednesday', '07:30:00', '09:30:00', '15', NULL);
INSERT INTO `schedules` VALUES ('445', '8', '120', '75', NULL, '75', 'wednesday', '09:40:00', '11:40:00', '16', NULL);
INSERT INTO `schedules` VALUES ('446', '8', '118', '83', NULL, '83', 'wednesday', '09:40:00', '11:40:00', '15', NULL);
INSERT INTO `schedules` VALUES ('447', '8', '119', '73', NULL, '73', 'wednesday', '09:40:00', '11:40:00', '16', NULL);
INSERT INTO `schedules` VALUES ('448', '8', '119', '122', NULL, '122', 'friday', '07:30:00', '09:30:00', '15', NULL);
INSERT INTO `schedules` VALUES ('449', '8', '120', '75', NULL, '75', 'friday', '09:40:00', '11:40:00', '15', NULL);
INSERT INTO `schedules` VALUES ('450', '8', '119', '73', NULL, '73', 'friday', '09:40:00', '11:40:00', '16', NULL);
INSERT INTO `schedules` VALUES ('451', '15', '321', '78', NULL, '78', 'tuesday', '09:40:00', '11:40:00', NULL, NULL);
INSERT INTO `schedules` VALUES ('452', '15', '321', '78', NULL, '78', 'friday', '09:40:00', '11:40:00', NULL, NULL);
/*!40000 ALTER TABLE `schedules` ENABLE KEYS */;
UNLOCK TABLES;

-- --------------------------------------------------------

-- Estructura de tabla para la tabla `student_attendance`

DROP TABLE IF EXISTS `student_attendance`;
CREATE TABLE `student_attendance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NOT NULL,
  `schedule_id` int(11) NOT NULL,
  `attendance_date` datetime NOT NULL,
  `status` enum('present','absent') NOT NULL,
  `justification` tinyint(1) DEFAULT 0,
  `justification_file` varchar(255) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `student_id` (`student_id`),
  KEY `schedule_id` (`schedule_id`),
  CONSTRAINT `student_attendance_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`),
  CONSTRAINT `student_attendance_ibfk_2` FOREIGN KEY (`schedule_id`) REFERENCES `schedules` (`schedule_id`)
) ENGINE=InnoDB AUTO_INCREMENT=494 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcado de datos para la tabla `student_attendance`

LOCK TABLES `student_attendance` WRITE;
/*!40000 ALTER TABLE `student_attendance` DISABLE KEYS */;
INSERT INTO `student_attendance` VALUES ('1', '37', '225', '2025-11-18 00:00:00', 'absent', '0', NULL, '2025-11-18 10:53:07');
INSERT INTO `student_attendance` VALUES ('2', '38', '225', '2025-11-18 00:00:00', 'absent', '0', NULL, '2025-11-18 10:53:07');
INSERT INTO `student_attendance` VALUES ('3', '39', '225', '2025-11-18 00:00:00', 'absent', '0', NULL, '2025-11-18 10:53:07');
INSERT INTO `student_attendance` VALUES ('4', '40', '225', '2025-11-18 00:00:00', 'absent', '0', NULL, '2025-11-18 10:53:07');
INSERT INTO `student_attendance` VALUES ('5', '41', '225', '2025-11-18 00:00:00', 'absent', '0', NULL, '2025-11-18 10:53:07');
INSERT INTO `student_attendance` VALUES ('6', '42', '225', '2025-11-18 00:00:00', 'absent', '0', NULL, '2025-11-18 10:53:07');
INSERT INTO `student_attendance` VALUES ('7', '43', '225', '2025-11-18 00:00:00', 'absent', '0', NULL, '2025-11-18 10:53:07');
INSERT INTO `student_attendance` VALUES ('8', '44', '225', '2025-11-18 00:00:00', 'absent', '0', NULL, '2025-11-18 10:53:07');
INSERT INTO `student_attendance` VALUES ('9', '45', '225', '2025-11-18 00:00:00', 'absent', '0', NULL, '2025-11-18 10:53:07');
INSERT INTO `student_attendance` VALUES ('10', '46', '225', '2025-11-18 00:00:00', 'absent', '0', NULL, '2025-11-18 10:53:07');
INSERT INTO `student_attendance` VALUES ('11', '47', '225', '2025-11-18 00:00:00', 'absent', '0', NULL, '2025-11-18 10:53:07');
INSERT INTO `student_attendance` VALUES ('12', '48', '225', '2025-11-18 00:00:00', 'absent', '0', NULL, '2025-11-18 10:53:07');
INSERT INTO `student_attendance` VALUES ('13', '49', '225', '2025-11-18 00:00:00', 'absent', '0', NULL, '2025-11-18 10:53:07');
INSERT INTO `student_attendance` VALUES ('14', '26', '219', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:43:58');
INSERT INTO `student_attendance` VALUES ('15', '27', '219', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:43:58');
INSERT INTO `student_attendance` VALUES ('16', '28', '219', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:43:58');
INSERT INTO `student_attendance` VALUES ('17', '29', '219', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:43:58');
INSERT INTO `student_attendance` VALUES ('18', '30', '219', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:43:58');
INSERT INTO `student_attendance` VALUES ('19', '31', '219', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:43:58');
INSERT INTO `student_attendance` VALUES ('20', '32', '219', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:43:58');
INSERT INTO `student_attendance` VALUES ('21', '33', '219', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:43:58');
INSERT INTO `student_attendance` VALUES ('22', '34', '219', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:43:58');
INSERT INTO `student_attendance` VALUES ('23', '35', '219', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:43:58');
INSERT INTO `student_attendance` VALUES ('24', '36', '219', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:43:58');
INSERT INTO `student_attendance` VALUES ('25', '70', '240', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:44:39');
INSERT INTO `student_attendance` VALUES ('26', '71', '240', '2025-11-18 00:00:00', 'absent', '0', NULL, '2025-11-18 11:44:39');
INSERT INTO `student_attendance` VALUES ('27', '72', '240', '2025-11-18 00:00:00', 'absent', '0', NULL, '2025-11-18 11:44:39');
INSERT INTO `student_attendance` VALUES ('28', '73', '240', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:44:39');
INSERT INTO `student_attendance` VALUES ('29', '74', '240', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:44:39');
INSERT INTO `student_attendance` VALUES ('30', '75', '240', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:44:39');
INSERT INTO `student_attendance` VALUES ('31', '76', '240', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:44:39');
INSERT INTO `student_attendance` VALUES ('32', '77', '240', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:44:39');
INSERT INTO `student_attendance` VALUES ('33', '78', '240', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:44:39');
INSERT INTO `student_attendance` VALUES ('34', '79', '240', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:44:39');
INSERT INTO `student_attendance` VALUES ('35', '80', '240', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:44:39');
INSERT INTO `student_attendance` VALUES ('36', '81', '240', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:44:39');
INSERT INTO `student_attendance` VALUES ('37', '82', '240', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:44:39');
INSERT INTO `student_attendance` VALUES ('38', '83', '240', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:44:39');
INSERT INTO `student_attendance` VALUES ('39', '99', '252', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:45:16');
INSERT INTO `student_attendance` VALUES ('40', '100', '252', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:45:16');
INSERT INTO `student_attendance` VALUES ('41', '101', '252', '2025-11-18 00:00:00', 'absent', '1', NULL, '2025-11-18 11:45:16');
INSERT INTO `student_attendance` VALUES ('42', '102', '252', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:45:16');
INSERT INTO `student_attendance` VALUES ('43', '103', '252', '2025-11-18 00:00:00', 'absent', '0', NULL, '2025-11-18 11:45:16');
INSERT INTO `student_attendance` VALUES ('44', '104', '252', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:45:16');
INSERT INTO `student_attendance` VALUES ('45', '105', '252', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:45:16');
INSERT INTO `student_attendance` VALUES ('46', '106', '252', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:45:16');
INSERT INTO `student_attendance` VALUES ('47', '107', '252', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:45:16');
INSERT INTO `student_attendance` VALUES ('48', '108', '252', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:45:16');
INSERT INTO `student_attendance` VALUES ('49', '109', '252', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:45:16');
INSERT INTO `student_attendance` VALUES ('50', '110', '252', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:45:16');
INSERT INTO `student_attendance` VALUES ('51', '111', '252', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:45:16');
INSERT INTO `student_attendance` VALUES ('52', '112', '252', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:45:16');
INSERT INTO `student_attendance` VALUES ('53', '113', '252', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:45:16');
INSERT INTO `student_attendance` VALUES ('54', '114', '252', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:45:16');
INSERT INTO `student_attendance` VALUES ('55', '115', '256', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:45:31');
INSERT INTO `student_attendance` VALUES ('56', '116', '256', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:45:31');
INSERT INTO `student_attendance` VALUES ('57', '117', '256', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:45:31');
INSERT INTO `student_attendance` VALUES ('58', '118', '256', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:45:31');
INSERT INTO `student_attendance` VALUES ('59', '119', '256', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:45:31');
INSERT INTO `student_attendance` VALUES ('60', '120', '256', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:45:31');
INSERT INTO `student_attendance` VALUES ('61', '121', '256', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:45:31');
INSERT INTO `student_attendance` VALUES ('62', '122', '256', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:45:31');
INSERT INTO `student_attendance` VALUES ('63', '123', '256', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:45:31');
INSERT INTO `student_attendance` VALUES ('64', '124', '256', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:45:31');
INSERT INTO `student_attendance` VALUES ('65', '125', '256', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:45:31');
INSERT INTO `student_attendance` VALUES ('66', '126', '256', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:45:31');
INSERT INTO `student_attendance` VALUES ('67', '127', '256', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:45:31');
INSERT INTO `student_attendance` VALUES ('68', '128', '265', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:45:50');
INSERT INTO `student_attendance` VALUES ('69', '129', '265', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:45:50');
INSERT INTO `student_attendance` VALUES ('70', '130', '265', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:45:50');
INSERT INTO `student_attendance` VALUES ('71', '131', '265', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:45:50');
INSERT INTO `student_attendance` VALUES ('72', '132', '265', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:45:50');
INSERT INTO `student_attendance` VALUES ('73', '133', '265', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:45:50');
INSERT INTO `student_attendance` VALUES ('74', '134', '265', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:45:50');
INSERT INTO `student_attendance` VALUES ('75', '135', '265', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:45:50');
INSERT INTO `student_attendance` VALUES ('76', '136', '265', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:45:50');
INSERT INTO `student_attendance` VALUES ('77', '137', '265', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:45:50');
INSERT INTO `student_attendance` VALUES ('78', '138', '265', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:45:50');
INSERT INTO `student_attendance` VALUES ('79', '139', '265', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:45:50');
INSERT INTO `student_attendance` VALUES ('80', '140', '265', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:45:50');
INSERT INTO `student_attendance` VALUES ('81', '141', '265', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:45:50');
INSERT INTO `student_attendance` VALUES ('82', '142', '269', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:46:05');
INSERT INTO `student_attendance` VALUES ('83', '143', '269', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:46:05');
INSERT INTO `student_attendance` VALUES ('84', '144', '269', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:46:05');
INSERT INTO `student_attendance` VALUES ('85', '145', '269', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:46:05');
INSERT INTO `student_attendance` VALUES ('86', '146', '269', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:46:05');
INSERT INTO `student_attendance` VALUES ('87', '147', '269', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:46:05');
INSERT INTO `student_attendance` VALUES ('88', '148', '269', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:46:05');
INSERT INTO `student_attendance` VALUES ('89', '149', '269', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:46:05');
INSERT INTO `student_attendance` VALUES ('90', '150', '269', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:46:05');
INSERT INTO `student_attendance` VALUES ('91', '151', '269', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:46:05');
INSERT INTO `student_attendance` VALUES ('92', '152', '269', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:46:05');
INSERT INTO `student_attendance` VALUES ('93', '142', '268', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:46:13');
INSERT INTO `student_attendance` VALUES ('94', '143', '268', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:46:13');
INSERT INTO `student_attendance` VALUES ('95', '144', '268', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:46:13');
INSERT INTO `student_attendance` VALUES ('96', '145', '268', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:46:13');
INSERT INTO `student_attendance` VALUES ('97', '146', '268', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:46:13');
INSERT INTO `student_attendance` VALUES ('98', '147', '268', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:46:13');
INSERT INTO `student_attendance` VALUES ('99', '148', '268', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:46:13');
INSERT INTO `student_attendance` VALUES ('100', '149', '268', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:46:13');
INSERT INTO `student_attendance` VALUES ('101', '150', '268', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:46:13');
INSERT INTO `student_attendance` VALUES ('102', '151', '268', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:46:13');
INSERT INTO `student_attendance` VALUES ('103', '152', '268', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:46:13');
INSERT INTO `student_attendance` VALUES ('104', '153', '273', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:47:03');
INSERT INTO `student_attendance` VALUES ('105', '154', '273', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:47:03');
INSERT INTO `student_attendance` VALUES ('106', '155', '273', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:47:03');
INSERT INTO `student_attendance` VALUES ('107', '156', '273', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:47:03');
INSERT INTO `student_attendance` VALUES ('108', '157', '273', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:47:03');
INSERT INTO `student_attendance` VALUES ('109', '158', '273', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:47:03');
INSERT INTO `student_attendance` VALUES ('110', '159', '273', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:47:03');
INSERT INTO `student_attendance` VALUES ('111', '160', '273', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:47:03');
INSERT INTO `student_attendance` VALUES ('112', '161', '273', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:47:03');
INSERT INTO `student_attendance` VALUES ('113', '162', '273', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:47:03');
INSERT INTO `student_attendance` VALUES ('114', '163', '273', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:47:03');
INSERT INTO `student_attendance` VALUES ('115', '164', '273', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:47:03');
INSERT INTO `student_attendance` VALUES ('116', '173', '434', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:47:48');
INSERT INTO `student_attendance` VALUES ('117', '174', '434', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:47:48');
INSERT INTO `student_attendance` VALUES ('118', '175', '434', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:47:48');
INSERT INTO `student_attendance` VALUES ('119', '176', '434', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:47:48');
INSERT INTO `student_attendance` VALUES ('120', '177', '434', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:47:48');
INSERT INTO `student_attendance` VALUES ('121', '178', '434', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:47:48');
INSERT INTO `student_attendance` VALUES ('122', '179', '434', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:47:48');
INSERT INTO `student_attendance` VALUES ('123', '180', '434', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:47:48');
INSERT INTO `student_attendance` VALUES ('124', '181', '434', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:47:48');
INSERT INTO `student_attendance` VALUES ('125', '182', '434', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:47:48');
INSERT INTO `student_attendance` VALUES ('126', '183', '434', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:47:48');
INSERT INTO `student_attendance` VALUES ('127', '184', '434', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:47:48');
INSERT INTO `student_attendance` VALUES ('128', '185', '434', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:47:48');
INSERT INTO `student_attendance` VALUES ('129', '186', '434', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:47:48');
INSERT INTO `student_attendance` VALUES ('130', '187', '434', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:47:48');
INSERT INTO `student_attendance` VALUES ('131', '188', '434', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:47:48');
INSERT INTO `student_attendance` VALUES ('132', '189', '434', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:47:48');
INSERT INTO `student_attendance` VALUES ('133', '190', '434', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:47:48');
INSERT INTO `student_attendance` VALUES ('134', '191', '434', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:47:48');
INSERT INTO `student_attendance` VALUES ('135', '173', '433', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:47:58');
INSERT INTO `student_attendance` VALUES ('136', '174', '433', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:47:58');
INSERT INTO `student_attendance` VALUES ('137', '175', '433', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:47:58');
INSERT INTO `student_attendance` VALUES ('138', '176', '433', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:47:58');
INSERT INTO `student_attendance` VALUES ('139', '177', '433', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:47:58');
INSERT INTO `student_attendance` VALUES ('140', '178', '433', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:47:58');
INSERT INTO `student_attendance` VALUES ('141', '179', '433', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:47:58');
INSERT INTO `student_attendance` VALUES ('142', '180', '433', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:47:58');
INSERT INTO `student_attendance` VALUES ('143', '181', '433', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:47:58');
INSERT INTO `student_attendance` VALUES ('144', '182', '433', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:47:58');
INSERT INTO `student_attendance` VALUES ('145', '183', '433', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:47:58');
INSERT INTO `student_attendance` VALUES ('146', '184', '433', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:47:58');
INSERT INTO `student_attendance` VALUES ('147', '185', '433', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:47:58');
INSERT INTO `student_attendance` VALUES ('148', '186', '433', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:47:58');
INSERT INTO `student_attendance` VALUES ('149', '187', '433', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:47:58');
INSERT INTO `student_attendance` VALUES ('150', '188', '433', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:47:58');
INSERT INTO `student_attendance` VALUES ('151', '189', '433', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:47:58');
INSERT INTO `student_attendance` VALUES ('152', '190', '433', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:47:58');
INSERT INTO `student_attendance` VALUES ('153', '191', '433', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:47:58');
INSERT INTO `student_attendance` VALUES ('154', '204', '295', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:49:26');
INSERT INTO `student_attendance` VALUES ('155', '205', '295', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:49:26');
INSERT INTO `student_attendance` VALUES ('156', '206', '295', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:49:26');
INSERT INTO `student_attendance` VALUES ('157', '207', '295', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:49:26');
INSERT INTO `student_attendance` VALUES ('158', '208', '295', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:49:26');
INSERT INTO `student_attendance` VALUES ('159', '209', '295', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:49:26');
INSERT INTO `student_attendance` VALUES ('160', '210', '295', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:49:26');
INSERT INTO `student_attendance` VALUES ('161', '211', '295', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:49:26');
INSERT INTO `student_attendance` VALUES ('162', '212', '295', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:49:26');
INSERT INTO `student_attendance` VALUES ('163', '204', '288', '2025-11-18 00:00:00', 'absent', '0', NULL, '2025-11-18 11:49:32');
INSERT INTO `student_attendance` VALUES ('164', '205', '288', '2025-11-18 00:00:00', 'absent', '0', NULL, '2025-11-18 11:49:32');
INSERT INTO `student_attendance` VALUES ('165', '206', '288', '2025-11-18 00:00:00', 'absent', '0', NULL, '2025-11-18 11:49:32');
INSERT INTO `student_attendance` VALUES ('166', '207', '288', '2025-11-18 00:00:00', 'absent', '0', NULL, '2025-11-18 11:49:32');
INSERT INTO `student_attendance` VALUES ('167', '208', '288', '2025-11-18 00:00:00', 'absent', '0', NULL, '2025-11-18 11:49:32');
INSERT INTO `student_attendance` VALUES ('168', '209', '288', '2025-11-18 00:00:00', 'absent', '0', NULL, '2025-11-18 11:49:32');
INSERT INTO `student_attendance` VALUES ('169', '210', '288', '2025-11-18 00:00:00', 'absent', '0', NULL, '2025-11-18 11:49:32');
INSERT INTO `student_attendance` VALUES ('170', '211', '288', '2025-11-18 00:00:00', 'absent', '0', NULL, '2025-11-18 11:49:32');
INSERT INTO `student_attendance` VALUES ('171', '212', '288', '2025-11-18 00:00:00', 'absent', '0', NULL, '2025-11-18 11:49:32');
INSERT INTO `student_attendance` VALUES ('172', '192', '281', '2025-11-18 00:00:00', 'absent', '0', NULL, '2025-11-18 11:49:41');
INSERT INTO `student_attendance` VALUES ('173', '193', '281', '2025-11-18 00:00:00', 'absent', '0', NULL, '2025-11-18 11:49:41');
INSERT INTO `student_attendance` VALUES ('174', '194', '281', '2025-11-18 00:00:00', 'absent', '0', NULL, '2025-11-18 11:49:41');
INSERT INTO `student_attendance` VALUES ('175', '195', '281', '2025-11-18 00:00:00', 'absent', '0', NULL, '2025-11-18 11:49:41');
INSERT INTO `student_attendance` VALUES ('176', '196', '281', '2025-11-18 00:00:00', 'absent', '0', NULL, '2025-11-18 11:49:41');
INSERT INTO `student_attendance` VALUES ('177', '197', '281', '2025-11-18 00:00:00', 'absent', '0', NULL, '2025-11-18 11:49:41');
INSERT INTO `student_attendance` VALUES ('178', '198', '281', '2025-11-18 00:00:00', 'absent', '0', NULL, '2025-11-18 11:49:41');
INSERT INTO `student_attendance` VALUES ('179', '199', '281', '2025-11-18 00:00:00', 'absent', '0', NULL, '2025-11-18 11:49:41');
INSERT INTO `student_attendance` VALUES ('180', '200', '281', '2025-11-18 00:00:00', 'absent', '0', NULL, '2025-11-18 11:49:41');
INSERT INTO `student_attendance` VALUES ('181', '201', '281', '2025-11-18 00:00:00', 'absent', '0', NULL, '2025-11-18 11:49:41');
INSERT INTO `student_attendance` VALUES ('182', '202', '281', '2025-11-18 00:00:00', 'absent', '0', NULL, '2025-11-18 11:49:41');
INSERT INTO `student_attendance` VALUES ('183', '203', '281', '2025-11-18 00:00:00', 'absent', '0', NULL, '2025-11-18 11:49:41');
INSERT INTO `student_attendance` VALUES ('184', '204', '281', '2025-11-18 00:00:00', 'absent', '0', NULL, '2025-11-18 11:49:41');
INSERT INTO `student_attendance` VALUES ('185', '205', '281', '2025-11-18 00:00:00', 'absent', '0', NULL, '2025-11-18 11:49:41');
INSERT INTO `student_attendance` VALUES ('186', '206', '281', '2025-11-18 00:00:00', 'absent', '0', NULL, '2025-11-18 11:49:41');
INSERT INTO `student_attendance` VALUES ('187', '207', '281', '2025-11-18 00:00:00', 'absent', '0', NULL, '2025-11-18 11:49:41');
INSERT INTO `student_attendance` VALUES ('188', '208', '281', '2025-11-18 00:00:00', 'absent', '0', NULL, '2025-11-18 11:49:41');
INSERT INTO `student_attendance` VALUES ('189', '209', '281', '2025-11-18 00:00:00', 'absent', '0', NULL, '2025-11-18 11:49:41');
INSERT INTO `student_attendance` VALUES ('190', '210', '281', '2025-11-18 00:00:00', 'absent', '0', NULL, '2025-11-18 11:49:41');
INSERT INTO `student_attendance` VALUES ('191', '211', '281', '2025-11-18 00:00:00', 'absent', '0', NULL, '2025-11-18 11:49:41');
INSERT INTO `student_attendance` VALUES ('192', '212', '281', '2025-11-18 00:00:00', 'absent', '0', NULL, '2025-11-18 11:49:41');
INSERT INTO `student_attendance` VALUES ('193', '192', '103', '2025-11-18 00:00:00', 'absent', '1', NULL, '2025-11-18 11:50:11');
INSERT INTO `student_attendance` VALUES ('194', '193', '103', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:50:11');
INSERT INTO `student_attendance` VALUES ('195', '194', '103', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:50:11');
INSERT INTO `student_attendance` VALUES ('196', '195', '103', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:50:11');
INSERT INTO `student_attendance` VALUES ('197', '196', '103', '2025-11-18 00:00:00', 'absent', '1', NULL, '2025-11-18 11:50:11');
INSERT INTO `student_attendance` VALUES ('198', '197', '103', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:50:11');
INSERT INTO `student_attendance` VALUES ('199', '198', '103', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:50:11');
INSERT INTO `student_attendance` VALUES ('200', '199', '103', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:50:11');
INSERT INTO `student_attendance` VALUES ('201', '200', '103', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:50:11');
INSERT INTO `student_attendance` VALUES ('202', '201', '103', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:50:11');
INSERT INTO `student_attendance` VALUES ('203', '202', '103', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:50:11');
INSERT INTO `student_attendance` VALUES ('204', '203', '103', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:50:11');
INSERT INTO `student_attendance` VALUES ('205', '204', '103', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:50:11');
INSERT INTO `student_attendance` VALUES ('206', '205', '103', '2025-11-18 00:00:00', 'absent', '1', NULL, '2025-11-18 11:50:11');
INSERT INTO `student_attendance` VALUES ('207', '206', '103', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:50:11');
INSERT INTO `student_attendance` VALUES ('208', '207', '103', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:50:11');
INSERT INTO `student_attendance` VALUES ('209', '208', '103', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:50:11');
INSERT INTO `student_attendance` VALUES ('210', '209', '103', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:50:11');
INSERT INTO `student_attendance` VALUES ('211', '210', '103', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:50:11');
INSERT INTO `student_attendance` VALUES ('212', '211', '103', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:50:11');
INSERT INTO `student_attendance` VALUES ('213', '212', '103', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:50:11');
INSERT INTO `student_attendance` VALUES ('214', '192', '104', '2025-11-18 00:00:00', 'absent', '0', NULL, '2025-11-18 11:50:57');
INSERT INTO `student_attendance` VALUES ('215', '193', '104', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:50:57');
INSERT INTO `student_attendance` VALUES ('216', '194', '104', '2025-11-18 00:00:00', 'absent', '0', NULL, '2025-11-18 11:50:57');
INSERT INTO `student_attendance` VALUES ('217', '195', '104', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:50:57');
INSERT INTO `student_attendance` VALUES ('218', '196', '104', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:50:57');
INSERT INTO `student_attendance` VALUES ('219', '197', '104', '2025-11-18 00:00:00', 'absent', '1', NULL, '2025-11-18 11:50:57');
INSERT INTO `student_attendance` VALUES ('220', '198', '104', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:50:57');
INSERT INTO `student_attendance` VALUES ('221', '199', '104', '2025-11-18 00:00:00', 'absent', '0', NULL, '2025-11-18 11:50:57');
INSERT INTO `student_attendance` VALUES ('222', '200', '104', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:50:57');
INSERT INTO `student_attendance` VALUES ('223', '201', '104', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:50:57');
INSERT INTO `student_attendance` VALUES ('224', '202', '104', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:50:57');
INSERT INTO `student_attendance` VALUES ('225', '203', '104', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:50:57');
INSERT INTO `student_attendance` VALUES ('226', '204', '104', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:50:57');
INSERT INTO `student_attendance` VALUES ('227', '205', '104', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:50:57');
INSERT INTO `student_attendance` VALUES ('228', '206', '104', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:50:57');
INSERT INTO `student_attendance` VALUES ('229', '207', '104', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:50:57');
INSERT INTO `student_attendance` VALUES ('230', '208', '104', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:50:57');
INSERT INTO `student_attendance` VALUES ('231', '209', '104', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:50:57');
INSERT INTO `student_attendance` VALUES ('232', '210', '104', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:50:57');
INSERT INTO `student_attendance` VALUES ('233', '211', '104', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:50:57');
INSERT INTO `student_attendance` VALUES ('234', '212', '104', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:50:57');
INSERT INTO `student_attendance` VALUES ('235', '213', '302', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:51:18');
INSERT INTO `student_attendance` VALUES ('236', '214', '302', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:51:18');
INSERT INTO `student_attendance` VALUES ('237', '215', '302', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:51:18');
INSERT INTO `student_attendance` VALUES ('238', '216', '302', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:51:18');
INSERT INTO `student_attendance` VALUES ('239', '217', '302', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:51:18');
INSERT INTO `student_attendance` VALUES ('240', '218', '302', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:51:18');
INSERT INTO `student_attendance` VALUES ('241', '219', '302', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:51:18');
INSERT INTO `student_attendance` VALUES ('242', '220', '302', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:51:18');
INSERT INTO `student_attendance` VALUES ('243', '221', '302', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:51:18');
INSERT INTO `student_attendance` VALUES ('244', '222', '302', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:51:18');
INSERT INTO `student_attendance` VALUES ('245', '223', '302', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:51:18');
INSERT INTO `student_attendance` VALUES ('246', '224', '302', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:51:18');
INSERT INTO `student_attendance` VALUES ('247', '225', '302', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:51:18');
INSERT INTO `student_attendance` VALUES ('248', '226', '302', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:51:18');
INSERT INTO `student_attendance` VALUES ('249', '227', '302', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:51:18');
INSERT INTO `student_attendance` VALUES ('250', '228', '302', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:51:18');
INSERT INTO `student_attendance` VALUES ('251', '229', '302', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:51:18');
INSERT INTO `student_attendance` VALUES ('252', '230', '302', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:51:18');
INSERT INTO `student_attendance` VALUES ('253', '231', '302', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:51:18');
INSERT INTO `student_attendance` VALUES ('254', '232', '302', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:51:18');
INSERT INTO `student_attendance` VALUES ('255', '233', '302', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:51:18');
INSERT INTO `student_attendance` VALUES ('256', '234', '302', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:51:18');
INSERT INTO `student_attendance` VALUES ('257', '235', '302', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:51:18');
INSERT INTO `student_attendance` VALUES ('258', '236', '302', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:51:18');
INSERT INTO `student_attendance` VALUES ('259', '237', '302', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:51:18');
INSERT INTO `student_attendance` VALUES ('260', '238', '302', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:51:18');
INSERT INTO `student_attendance` VALUES ('261', '239', '302', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:51:18');
INSERT INTO `student_attendance` VALUES ('262', '240', '302', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:51:18');
INSERT INTO `student_attendance` VALUES ('263', '241', '302', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:51:18');
INSERT INTO `student_attendance` VALUES ('264', '242', '302', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:51:18');
INSERT INTO `student_attendance` VALUES ('265', '243', '302', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:51:18');
INSERT INTO `student_attendance` VALUES ('266', '244', '302', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:51:18');
INSERT INTO `student_attendance` VALUES ('267', '336', '302', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:51:18');
INSERT INTO `student_attendance` VALUES ('268', '213', '93', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:51:28');
INSERT INTO `student_attendance` VALUES ('269', '214', '93', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:51:28');
INSERT INTO `student_attendance` VALUES ('270', '215', '93', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:51:28');
INSERT INTO `student_attendance` VALUES ('271', '216', '93', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:51:28');
INSERT INTO `student_attendance` VALUES ('272', '217', '93', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:51:28');
INSERT INTO `student_attendance` VALUES ('273', '218', '93', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:51:28');
INSERT INTO `student_attendance` VALUES ('274', '219', '93', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:51:28');
INSERT INTO `student_attendance` VALUES ('275', '220', '93', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:51:28');
INSERT INTO `student_attendance` VALUES ('276', '221', '93', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:51:28');
INSERT INTO `student_attendance` VALUES ('277', '222', '93', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:51:28');
INSERT INTO `student_attendance` VALUES ('278', '223', '93', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:51:28');
INSERT INTO `student_attendance` VALUES ('279', '224', '93', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:51:28');
INSERT INTO `student_attendance` VALUES ('280', '225', '93', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:51:28');
INSERT INTO `student_attendance` VALUES ('281', '226', '93', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:51:28');
INSERT INTO `student_attendance` VALUES ('282', '227', '93', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:51:28');
INSERT INTO `student_attendance` VALUES ('283', '228', '93', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:51:28');
INSERT INTO `student_attendance` VALUES ('284', '229', '93', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:51:28');
INSERT INTO `student_attendance` VALUES ('285', '230', '93', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:51:28');
INSERT INTO `student_attendance` VALUES ('286', '231', '93', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:51:28');
INSERT INTO `student_attendance` VALUES ('287', '232', '93', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:51:28');
INSERT INTO `student_attendance` VALUES ('288', '233', '93', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:51:28');
INSERT INTO `student_attendance` VALUES ('289', '234', '93', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:51:28');
INSERT INTO `student_attendance` VALUES ('290', '235', '93', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:51:28');
INSERT INTO `student_attendance` VALUES ('291', '236', '93', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:51:28');
INSERT INTO `student_attendance` VALUES ('292', '237', '93', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:51:28');
INSERT INTO `student_attendance` VALUES ('293', '238', '93', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:51:28');
INSERT INTO `student_attendance` VALUES ('294', '239', '93', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:51:28');
INSERT INTO `student_attendance` VALUES ('295', '240', '93', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:51:28');
INSERT INTO `student_attendance` VALUES ('296', '241', '93', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:51:28');
INSERT INTO `student_attendance` VALUES ('297', '242', '93', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:51:28');
INSERT INTO `student_attendance` VALUES ('298', '243', '93', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:51:28');
INSERT INTO `student_attendance` VALUES ('299', '244', '93', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:51:28');
INSERT INTO `student_attendance` VALUES ('300', '336', '93', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:51:28');
INSERT INTO `student_attendance` VALUES ('301', '213', '94', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:51:34');
INSERT INTO `student_attendance` VALUES ('302', '214', '94', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:51:34');
INSERT INTO `student_attendance` VALUES ('303', '215', '94', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:51:34');
INSERT INTO `student_attendance` VALUES ('304', '216', '94', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:51:34');
INSERT INTO `student_attendance` VALUES ('305', '217', '94', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:51:34');
INSERT INTO `student_attendance` VALUES ('306', '218', '94', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:51:34');
INSERT INTO `student_attendance` VALUES ('307', '219', '94', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:51:34');
INSERT INTO `student_attendance` VALUES ('308', '220', '94', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:51:34');
INSERT INTO `student_attendance` VALUES ('309', '221', '94', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:51:34');
INSERT INTO `student_attendance` VALUES ('310', '222', '94', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:51:34');
INSERT INTO `student_attendance` VALUES ('311', '223', '94', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:51:34');
INSERT INTO `student_attendance` VALUES ('312', '224', '94', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:51:34');
INSERT INTO `student_attendance` VALUES ('313', '225', '94', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:51:34');
INSERT INTO `student_attendance` VALUES ('314', '226', '94', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:51:34');
INSERT INTO `student_attendance` VALUES ('315', '227', '94', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:51:34');
INSERT INTO `student_attendance` VALUES ('316', '228', '94', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:51:34');
INSERT INTO `student_attendance` VALUES ('317', '229', '94', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:51:34');
INSERT INTO `student_attendance` VALUES ('318', '230', '94', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:51:34');
INSERT INTO `student_attendance` VALUES ('319', '231', '94', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:51:34');
INSERT INTO `student_attendance` VALUES ('320', '232', '94', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:51:34');
INSERT INTO `student_attendance` VALUES ('321', '233', '94', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:51:34');
INSERT INTO `student_attendance` VALUES ('322', '234', '94', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:51:34');
INSERT INTO `student_attendance` VALUES ('323', '235', '94', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:51:34');
INSERT INTO `student_attendance` VALUES ('324', '236', '94', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:51:34');
INSERT INTO `student_attendance` VALUES ('325', '237', '94', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:51:34');
INSERT INTO `student_attendance` VALUES ('326', '238', '94', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:51:34');
INSERT INTO `student_attendance` VALUES ('327', '239', '94', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:51:34');
INSERT INTO `student_attendance` VALUES ('328', '240', '94', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:51:34');
INSERT INTO `student_attendance` VALUES ('329', '241', '94', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:51:34');
INSERT INTO `student_attendance` VALUES ('330', '242', '94', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:51:34');
INSERT INTO `student_attendance` VALUES ('331', '243', '94', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:51:34');
INSERT INTO `student_attendance` VALUES ('332', '244', '94', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:51:34');
INSERT INTO `student_attendance` VALUES ('333', '336', '94', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:51:34');
INSERT INTO `student_attendance` VALUES ('334', '213', '306', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:51:49');
INSERT INTO `student_attendance` VALUES ('335', '214', '306', '2025-11-18 00:00:00', 'absent', '1', NULL, '2025-11-18 11:51:49');
INSERT INTO `student_attendance` VALUES ('336', '215', '306', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:51:49');
INSERT INTO `student_attendance` VALUES ('337', '216', '306', '2025-11-18 00:00:00', 'absent', '1', NULL, '2025-11-18 11:51:49');
INSERT INTO `student_attendance` VALUES ('338', '217', '306', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:51:49');
INSERT INTO `student_attendance` VALUES ('339', '218', '306', '2025-11-18 00:00:00', 'absent', '0', NULL, '2025-11-18 11:51:49');
INSERT INTO `student_attendance` VALUES ('340', '219', '306', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:51:49');
INSERT INTO `student_attendance` VALUES ('341', '220', '306', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:51:49');
INSERT INTO `student_attendance` VALUES ('342', '221', '306', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:51:49');
INSERT INTO `student_attendance` VALUES ('343', '222', '306', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:51:49');
INSERT INTO `student_attendance` VALUES ('344', '223', '306', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:51:49');
INSERT INTO `student_attendance` VALUES ('345', '224', '306', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:51:49');
INSERT INTO `student_attendance` VALUES ('346', '225', '306', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:51:49');
INSERT INTO `student_attendance` VALUES ('347', '226', '306', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:51:49');
INSERT INTO `student_attendance` VALUES ('348', '227', '306', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:51:49');
INSERT INTO `student_attendance` VALUES ('349', '228', '306', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:51:49');
INSERT INTO `student_attendance` VALUES ('350', '336', '306', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:51:49');
INSERT INTO `student_attendance` VALUES ('351', '213', '307', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:52:03');
INSERT INTO `student_attendance` VALUES ('352', '214', '307', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:52:03');
INSERT INTO `student_attendance` VALUES ('353', '215', '307', '2025-11-18 00:00:00', 'absent', '0', NULL, '2025-11-18 11:52:03');
INSERT INTO `student_attendance` VALUES ('354', '216', '307', '2025-11-18 00:00:00', 'absent', '0', NULL, '2025-11-18 11:52:03');
INSERT INTO `student_attendance` VALUES ('355', '217', '307', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:52:03');
INSERT INTO `student_attendance` VALUES ('356', '218', '307', '2025-11-18 00:00:00', 'absent', '1', NULL, '2025-11-18 11:52:03');
INSERT INTO `student_attendance` VALUES ('357', '219', '307', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:52:03');
INSERT INTO `student_attendance` VALUES ('358', '220', '307', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:52:03');
INSERT INTO `student_attendance` VALUES ('359', '221', '307', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:52:03');
INSERT INTO `student_attendance` VALUES ('360', '222', '307', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:52:03');
INSERT INTO `student_attendance` VALUES ('361', '223', '307', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:52:03');
INSERT INTO `student_attendance` VALUES ('362', '224', '307', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:52:03');
INSERT INTO `student_attendance` VALUES ('363', '225', '307', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:52:03');
INSERT INTO `student_attendance` VALUES ('364', '226', '307', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:52:03');
INSERT INTO `student_attendance` VALUES ('365', '227', '307', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:52:03');
INSERT INTO `student_attendance` VALUES ('366', '228', '307', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:52:03');
INSERT INTO `student_attendance` VALUES ('367', '336', '307', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:52:03');
INSERT INTO `student_attendance` VALUES ('368', '316', '123', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:52:45');
INSERT INTO `student_attendance` VALUES ('369', '317', '123', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:52:45');
INSERT INTO `student_attendance` VALUES ('370', '318', '123', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:52:45');
INSERT INTO `student_attendance` VALUES ('371', '319', '123', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:52:45');
INSERT INTO `student_attendance` VALUES ('372', '320', '123', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:52:45');
INSERT INTO `student_attendance` VALUES ('373', '321', '123', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:52:45');
INSERT INTO `student_attendance` VALUES ('374', '322', '123', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:52:45');
INSERT INTO `student_attendance` VALUES ('375', '323', '123', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:52:45');
INSERT INTO `student_attendance` VALUES ('376', '324', '123', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:52:45');
INSERT INTO `student_attendance` VALUES ('377', '325', '123', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:52:45');
INSERT INTO `student_attendance` VALUES ('378', '326', '123', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:52:45');
INSERT INTO `student_attendance` VALUES ('379', '327', '123', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:52:45');
INSERT INTO `student_attendance` VALUES ('380', '328', '123', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:52:45');
INSERT INTO `student_attendance` VALUES ('381', '329', '123', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:52:45');
INSERT INTO `student_attendance` VALUES ('382', '330', '123', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:52:45');
INSERT INTO `student_attendance` VALUES ('383', '331', '123', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:52:45');
INSERT INTO `student_attendance` VALUES ('384', '332', '123', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:52:45');
INSERT INTO `student_attendance` VALUES ('385', '333', '123', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:52:45');
INSERT INTO `student_attendance` VALUES ('386', '334', '123', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:52:45');
INSERT INTO `student_attendance` VALUES ('387', '335', '123', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:52:45');
INSERT INTO `student_attendance` VALUES ('388', '316', '124', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:55:08');
INSERT INTO `student_attendance` VALUES ('389', '317', '124', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:55:08');
INSERT INTO `student_attendance` VALUES ('390', '318', '124', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:55:08');
INSERT INTO `student_attendance` VALUES ('391', '319', '124', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:55:08');
INSERT INTO `student_attendance` VALUES ('392', '320', '124', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:55:08');
INSERT INTO `student_attendance` VALUES ('393', '321', '124', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:55:08');
INSERT INTO `student_attendance` VALUES ('394', '322', '124', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:55:08');
INSERT INTO `student_attendance` VALUES ('395', '323', '124', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:55:08');
INSERT INTO `student_attendance` VALUES ('396', '324', '124', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:55:08');
INSERT INTO `student_attendance` VALUES ('397', '325', '124', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:55:08');
INSERT INTO `student_attendance` VALUES ('398', '326', '124', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:55:08');
INSERT INTO `student_attendance` VALUES ('399', '327', '124', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:55:08');
INSERT INTO `student_attendance` VALUES ('400', '328', '124', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:55:08');
INSERT INTO `student_attendance` VALUES ('401', '329', '124', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:55:08');
INSERT INTO `student_attendance` VALUES ('402', '330', '124', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:55:08');
INSERT INTO `student_attendance` VALUES ('403', '331', '124', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:55:08');
INSERT INTO `student_attendance` VALUES ('404', '332', '124', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:55:08');
INSERT INTO `student_attendance` VALUES ('405', '333', '124', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:55:08');
INSERT INTO `student_attendance` VALUES ('406', '334', '124', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:55:08');
INSERT INTO `student_attendance` VALUES ('407', '335', '124', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:55:08');
INSERT INTO `student_attendance` VALUES ('408', '316', '335', '2025-11-18 00:00:00', 'absent', '0', NULL, '2025-11-18 11:55:17');
INSERT INTO `student_attendance` VALUES ('409', '317', '335', '2025-11-18 00:00:00', 'absent', '0', NULL, '2025-11-18 11:55:17');
INSERT INTO `student_attendance` VALUES ('410', '318', '335', '2025-11-18 00:00:00', 'absent', '0', NULL, '2025-11-18 11:55:17');
INSERT INTO `student_attendance` VALUES ('411', '319', '335', '2025-11-18 00:00:00', 'absent', '0', NULL, '2025-11-18 11:55:17');
INSERT INTO `student_attendance` VALUES ('412', '320', '335', '2025-11-18 00:00:00', 'absent', '0', NULL, '2025-11-18 11:55:17');
INSERT INTO `student_attendance` VALUES ('413', '321', '335', '2025-11-18 00:00:00', 'absent', '0', NULL, '2025-11-18 11:55:17');
INSERT INTO `student_attendance` VALUES ('414', '322', '335', '2025-11-18 00:00:00', 'absent', '0', NULL, '2025-11-18 11:55:17');
INSERT INTO `student_attendance` VALUES ('415', '323', '335', '2025-11-18 00:00:00', 'absent', '0', NULL, '2025-11-18 11:55:17');
INSERT INTO `student_attendance` VALUES ('416', '324', '335', '2025-11-18 00:00:00', 'absent', '0', NULL, '2025-11-18 11:55:17');
INSERT INTO `student_attendance` VALUES ('417', '325', '335', '2025-11-18 00:00:00', 'absent', '0', NULL, '2025-11-18 11:55:17');
INSERT INTO `student_attendance` VALUES ('418', '316', '334', '2025-11-18 00:00:00', 'absent', '0', NULL, '2025-11-18 11:55:22');
INSERT INTO `student_attendance` VALUES ('419', '317', '334', '2025-11-18 00:00:00', 'absent', '0', NULL, '2025-11-18 11:55:22');
INSERT INTO `student_attendance` VALUES ('420', '318', '334', '2025-11-18 00:00:00', 'absent', '0', NULL, '2025-11-18 11:55:22');
INSERT INTO `student_attendance` VALUES ('421', '319', '334', '2025-11-18 00:00:00', 'absent', '0', NULL, '2025-11-18 11:55:22');
INSERT INTO `student_attendance` VALUES ('422', '320', '334', '2025-11-18 00:00:00', 'absent', '0', NULL, '2025-11-18 11:55:22');
INSERT INTO `student_attendance` VALUES ('423', '321', '334', '2025-11-18 00:00:00', 'absent', '0', NULL, '2025-11-18 11:55:22');
INSERT INTO `student_attendance` VALUES ('424', '322', '334', '2025-11-18 00:00:00', 'absent', '0', NULL, '2025-11-18 11:55:22');
INSERT INTO `student_attendance` VALUES ('425', '323', '334', '2025-11-18 00:00:00', 'absent', '0', NULL, '2025-11-18 11:55:22');
INSERT INTO `student_attendance` VALUES ('426', '324', '334', '2025-11-18 00:00:00', 'absent', '0', NULL, '2025-11-18 11:55:22');
INSERT INTO `student_attendance` VALUES ('427', '325', '334', '2025-11-18 00:00:00', 'absent', '0', NULL, '2025-11-18 11:55:22');
INSERT INTO `student_attendance` VALUES ('428', '326', '341', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:55:36');
INSERT INTO `student_attendance` VALUES ('429', '327', '341', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:55:36');
INSERT INTO `student_attendance` VALUES ('430', '328', '341', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:55:36');
INSERT INTO `student_attendance` VALUES ('431', '329', '341', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:55:36');
INSERT INTO `student_attendance` VALUES ('432', '330', '341', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:55:36');
INSERT INTO `student_attendance` VALUES ('433', '331', '341', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:55:36');
INSERT INTO `student_attendance` VALUES ('434', '332', '341', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:55:36');
INSERT INTO `student_attendance` VALUES ('435', '333', '341', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:55:36');
INSERT INTO `student_attendance` VALUES ('436', '334', '341', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:55:36');
INSERT INTO `student_attendance` VALUES ('437', '335', '341', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:55:36');
INSERT INTO `student_attendance` VALUES ('438', '254', '326', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:55:46');
INSERT INTO `student_attendance` VALUES ('439', '255', '326', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:55:46');
INSERT INTO `student_attendance` VALUES ('440', '256', '326', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:55:46');
INSERT INTO `student_attendance` VALUES ('441', '257', '326', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:55:46');
INSERT INTO `student_attendance` VALUES ('442', '258', '326', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:55:46');
INSERT INTO `student_attendance` VALUES ('443', '259', '326', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:55:46');
INSERT INTO `student_attendance` VALUES ('444', '260', '326', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:55:46');
INSERT INTO `student_attendance` VALUES ('445', '261', '326', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:55:46');
INSERT INTO `student_attendance` VALUES ('446', '262', '326', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:55:46');
INSERT INTO `student_attendance` VALUES ('447', '263', '326', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:55:46');
INSERT INTO `student_attendance` VALUES ('448', '305', '366', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:56:11');
INSERT INTO `student_attendance` VALUES ('449', '306', '366', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:56:11');
INSERT INTO `student_attendance` VALUES ('450', '307', '366', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:56:11');
INSERT INTO `student_attendance` VALUES ('451', '308', '366', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:56:11');
INSERT INTO `student_attendance` VALUES ('452', '309', '366', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:56:11');
INSERT INTO `student_attendance` VALUES ('453', '310', '366', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:56:11');
INSERT INTO `student_attendance` VALUES ('454', '337', '366', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:56:11');
INSERT INTO `student_attendance` VALUES ('455', '305', '367', '2025-11-18 00:00:00', 'absent', '0', NULL, '2025-11-18 11:56:17');
INSERT INTO `student_attendance` VALUES ('456', '306', '367', '2025-11-18 00:00:00', 'absent', '0', NULL, '2025-11-18 11:56:17');
INSERT INTO `student_attendance` VALUES ('457', '307', '367', '2025-11-18 00:00:00', 'absent', '0', NULL, '2025-11-18 11:56:17');
INSERT INTO `student_attendance` VALUES ('458', '308', '367', '2025-11-18 00:00:00', 'absent', '0', NULL, '2025-11-18 11:56:17');
INSERT INTO `student_attendance` VALUES ('459', '309', '367', '2025-11-18 00:00:00', 'absent', '0', NULL, '2025-11-18 11:56:17');
INSERT INTO `student_attendance` VALUES ('460', '310', '367', '2025-11-18 00:00:00', 'absent', '0', NULL, '2025-11-18 11:56:17');
INSERT INTO `student_attendance` VALUES ('461', '337', '367', '2025-11-18 00:00:00', 'absent', '0', NULL, '2025-11-18 11:56:17');
INSERT INTO `student_attendance` VALUES ('462', '311', '360', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:56:25');
INSERT INTO `student_attendance` VALUES ('463', '312', '360', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:56:25');
INSERT INTO `student_attendance` VALUES ('464', '313', '360', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:56:25');
INSERT INTO `student_attendance` VALUES ('465', '314', '360', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:56:25');
INSERT INTO `student_attendance` VALUES ('466', '315', '360', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:56:25');
INSERT INTO `student_attendance` VALUES ('467', '292', '399', '2025-11-18 00:00:00', 'absent', '0', NULL, '2025-11-18 11:56:53');
INSERT INTO `student_attendance` VALUES ('468', '293', '399', '2025-11-18 00:00:00', 'absent', '0', NULL, '2025-11-18 11:56:53');
INSERT INTO `student_attendance` VALUES ('469', '294', '399', '2025-11-18 00:00:00', 'absent', '0', NULL, '2025-11-18 11:56:53');
INSERT INTO `student_attendance` VALUES ('470', '295', '399', '2025-11-18 00:00:00', 'absent', '0', NULL, '2025-11-18 11:56:53');
INSERT INTO `student_attendance` VALUES ('471', '296', '399', '2025-11-18 00:00:00', 'absent', '0', NULL, '2025-11-18 11:56:53');
INSERT INTO `student_attendance` VALUES ('472', '297', '399', '2025-11-18 00:00:00', 'absent', '0', NULL, '2025-11-18 11:56:53');
INSERT INTO `student_attendance` VALUES ('473', '298', '399', '2025-11-18 00:00:00', 'absent', '0', NULL, '2025-11-18 11:56:53');
INSERT INTO `student_attendance` VALUES ('474', '299', '399', '2025-11-18 00:00:00', 'absent', '0', NULL, '2025-11-18 11:56:53');
INSERT INTO `student_attendance` VALUES ('475', '300', '399', '2025-11-18 00:00:00', 'absent', '0', NULL, '2025-11-18 11:56:53');
INSERT INTO `student_attendance` VALUES ('476', '301', '399', '2025-11-18 00:00:00', 'absent', '0', NULL, '2025-11-18 11:56:53');
INSERT INTO `student_attendance` VALUES ('477', '302', '399', '2025-11-18 00:00:00', 'absent', '0', NULL, '2025-11-18 11:56:53');
INSERT INTO `student_attendance` VALUES ('478', '284', '407', '2025-11-18 00:00:00', 'absent', '0', NULL, '2025-11-18 11:57:26');
INSERT INTO `student_attendance` VALUES ('479', '285', '407', '2025-11-18 00:00:00', 'absent', '0', NULL, '2025-11-18 11:57:26');
INSERT INTO `student_attendance` VALUES ('480', '286', '407', '2025-11-18 00:00:00', 'absent', '0', NULL, '2025-11-18 11:57:26');
INSERT INTO `student_attendance` VALUES ('481', '287', '407', '2025-11-18 00:00:00', 'absent', '0', NULL, '2025-11-18 11:57:26');
INSERT INTO `student_attendance` VALUES ('482', '288', '407', '2025-11-18 00:00:00', 'absent', '0', NULL, '2025-11-18 11:57:26');
INSERT INTO `student_attendance` VALUES ('483', '289', '407', '2025-11-18 00:00:00', 'absent', '0', NULL, '2025-11-18 11:57:26');
INSERT INTO `student_attendance` VALUES ('484', '290', '407', '2025-11-18 00:00:00', 'absent', '0', NULL, '2025-11-18 11:57:26');
INSERT INTO `student_attendance` VALUES ('485', '291', '407', '2025-11-18 00:00:00', 'absent', '0', NULL, '2025-11-18 11:57:26');
INSERT INTO `student_attendance` VALUES ('486', '284', '406', '2025-11-18 00:00:00', 'absent', '0', NULL, '2025-11-18 11:57:31');
INSERT INTO `student_attendance` VALUES ('487', '285', '406', '2025-11-18 00:00:00', 'absent', '0', NULL, '2025-11-18 11:57:31');
INSERT INTO `student_attendance` VALUES ('488', '286', '406', '2025-11-18 00:00:00', 'absent', '0', NULL, '2025-11-18 11:57:31');
INSERT INTO `student_attendance` VALUES ('489', '287', '406', '2025-11-18 00:00:00', 'absent', '0', NULL, '2025-11-18 11:57:31');
INSERT INTO `student_attendance` VALUES ('490', '288', '406', '2025-11-18 00:00:00', 'absent', '0', NULL, '2025-11-18 11:57:31');
INSERT INTO `student_attendance` VALUES ('491', '289', '406', '2025-11-18 00:00:00', 'absent', '0', NULL, '2025-11-18 11:57:31');
INSERT INTO `student_attendance` VALUES ('492', '290', '406', '2025-11-18 00:00:00', 'absent', '0', NULL, '2025-11-18 11:57:31');
INSERT INTO `student_attendance` VALUES ('493', '291', '406', '2025-11-18 00:00:00', 'absent', '0', NULL, '2025-11-18 11:57:31');
/*!40000 ALTER TABLE `student_attendance` ENABLE KEYS */;
UNLOCK TABLES;

-- --------------------------------------------------------

-- Estructura de tabla para la tabla `student_files`

DROP TABLE IF EXISTS `student_files`;
CREATE TABLE `student_files` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NOT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `file_path` varchar(255) DEFAULT NULL,
  `uploaded_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

-- Estructura de tabla para la tabla `students`

DROP TABLE IF EXISTS `students`;
CREATE TABLE `students` (
  `student_id` int(11) NOT NULL AUTO_INCREMENT,
  `last_name` varchar(50) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `DNI` varchar(20) DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `age` int(11) NOT NULL,
  `birth_place` varchar(100) DEFAULT NULL,
  `previous_school` varchar(100) DEFAULT NULL,
  `address` varchar(150) DEFAULT NULL,
  `course_id` int(11) NOT NULL,
  `group_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `gender` enum('Masculino','Femenino','No binario','Género fluido','Otro','Prefiero no decir') NOT NULL DEFAULT 'Prefiero no decir',
  PRIMARY KEY (`student_id`),
  KEY `course_id` (`course_id`),
  KEY `group_id` (`group_id`),
  CONSTRAINT `students_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`),
  CONSTRAINT `students_ibfk_2` FOREIGN KEY (`group_id`) REFERENCES `groups` (`group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=338 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcado de datos para la tabla `students`

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES ('2', 'ARDITE', 'Constantino', NULL, NULL, '0', NULL, NULL, NULL, '1', '1', '2025-10-28 15:47:14', '2025-11-15 22:57:45', 'Masculino');
INSERT INTO `students` VALUES ('3', 'BONIFACIO', 'Leonardo A', NULL, NULL, '0', NULL, NULL, NULL, '1', '1', '2025-10-28 15:59:18', '2025-11-16 10:19:27', 'Masculino');
INSERT INTO `students` VALUES ('4', 'CURRUHINCA NEGRO', 'Luisana', NULL, NULL, '0', NULL, NULL, NULL, '1', '1', '2025-10-28 16:00:22', '2025-11-16 10:13:29', 'Femenino');
INSERT INTO `students` VALUES ('5', 'FLORES', 'Dylan', NULL, NULL, '0', NULL, NULL, NULL, '1', '1', '2025-10-28 16:01:30', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('6', 'GARCIA', 'Tiziano', NULL, NULL, '0', NULL, NULL, NULL, '1', '1', '2025-10-28 16:02:03', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('7', 'MACRI', 'Santino Lorenzo', NULL, NULL, '0', NULL, NULL, NULL, '1', '1', '2025-10-28 16:02:44', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('8', 'MARTINEZ FALCON', 'Ian', NULL, NULL, '0', NULL, NULL, NULL, '1', '1', '2025-10-28 16:03:32', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('9', 'PEÑA MULLER', 'Renata', NULL, NULL, '0', NULL, NULL, NULL, '1', '1', '2025-10-28 16:04:15', '2025-11-16 10:13:40', 'Femenino');
INSERT INTO `students` VALUES ('10', 'QUINTERO ANTIPAN T', 'Yanara', NULL, NULL, '0', NULL, NULL, NULL, '1', '1', '2025-10-28 16:05:13', '2025-11-16 10:13:46', 'Femenino');
INSERT INTO `students` VALUES ('11', 'ULLUA', 'Melani Marlene', NULL, NULL, '0', NULL, NULL, NULL, '1', '1', '2025-10-28 16:05:52', '2025-11-16 10:13:50', 'Femenino');
INSERT INTO `students` VALUES ('12', 'CAÑULEF', 'Ciro Jeremias', NULL, NULL, '0', NULL, NULL, NULL, '1', '2', '2025-10-28 16:06:51', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('13', 'COLIPI', 'Thiago', NULL, NULL, '0', NULL, NULL, NULL, '1', '2', '2025-10-28 16:08:15', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('14', 'CRESPO', 'Juan Bautista', NULL, NULL, '0', NULL, NULL, NULL, '1', '2', '2025-10-28 16:09:01', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('15', 'FERNANDEZ FOGELMAN', 'Amparo', NULL, NULL, '0', NULL, NULL, NULL, '1', '2', '2025-10-28 16:10:06', '2025-11-16 10:14:02', 'Femenino');
INSERT INTO `students` VALUES ('18', 'FERRADA DENETT', 'Zacarias', NULL, NULL, '0', NULL, NULL, NULL, '1', '2', '2025-10-28 16:12:15', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('19', 'GUANCA', 'Lican Tahiel', NULL, NULL, '0', NULL, NULL, NULL, '1', '2', '2025-10-28 16:12:52', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('20', 'JARA VILLEGAS', 'Bastian', NULL, NULL, '0', NULL, NULL, NULL, '1', '2', '2025-10-28 16:13:46', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('21', 'LILLO', 'Xiomara Ailyn', NULL, NULL, '0', NULL, NULL, NULL, '1', '2', '2025-10-28 16:14:36', '2025-11-16 10:14:57', 'Femenino');
INSERT INTO `students` VALUES ('22', 'MULATO', 'Francisco', NULL, NULL, '0', NULL, NULL, NULL, '1', '2', '2025-10-28 16:15:26', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('23', 'PATTUSSI', 'Nair Uziel', NULL, NULL, '0', NULL, NULL, NULL, '1', '2', '2025-10-28 16:19:09', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('24', 'PERALTA DESPOS', 'Francisco', NULL, NULL, '0', NULL, NULL, NULL, '1', '2', '2025-10-28 16:20:14', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('25', 'SCHNEIDER', 'Victoria P', NULL, NULL, '0', NULL, NULL, NULL, '1', '2', '2025-10-28 16:21:09', '2025-11-16 10:15:06', 'Femenino');
INSERT INTO `students` VALUES ('26', 'ACUÑA', 'Mateo Estefano', NULL, NULL, '0', NULL, NULL, NULL, '2', '3', '2025-10-28 16:23:09', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('27', 'ALVAREZ', 'Milagors Jazmin', NULL, NULL, '0', NULL, NULL, NULL, '2', '3', '2025-10-28 16:23:59', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('28', 'CORDOBA', 'Thiago', NULL, NULL, '0', NULL, NULL, NULL, '2', '3', '2025-10-28 16:24:45', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('29', 'ESPINOZA', 'Thiago Alejo', NULL, NULL, '0', NULL, NULL, NULL, '2', '3', '2025-10-28 16:25:43', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('30', 'HERRERA', 'Jazmin Araceli', NULL, NULL, '0', NULL, NULL, NULL, '2', '3', '2025-10-28 16:26:57', '2025-11-16 10:15:21', 'Femenino');
INSERT INTO `students` VALUES ('31', 'MENDOZA', 'Thiago Miguel', NULL, NULL, '0', NULL, NULL, NULL, '2', '3', '2025-10-28 16:27:53', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('32', 'PERALTA DESPOS', 'Santiago', NULL, NULL, '0', NULL, NULL, NULL, '2', '3', '2025-10-28 16:31:39', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('33', 'RIOS DIETZ', 'Iara Martina', NULL, NULL, '0', NULL, NULL, NULL, '2', '3', '2025-10-28 16:32:45', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('34', 'RUIZ GOROSITO', 'Simon', NULL, NULL, '0', NULL, NULL, NULL, '2', '3', '2025-10-28 16:33:15', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('35', 'SUAREZ CUESTA', 'Federico', NULL, NULL, '0', NULL, NULL, NULL, '2', '3', '2025-10-28 16:33:54', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('36', 'TRINCHANT ESCOVEDO', 'Fausto', NULL, NULL, '0', NULL, NULL, NULL, '2', '3', '2025-10-28 16:34:29', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('37', 'ALMEIDA', 'Thiago Ezequiel', NULL, NULL, '0', NULL, NULL, NULL, '2', '4', '2025-10-28 16:35:36', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('38', 'ENTRAIGAS', 'Valentino', NULL, NULL, '0', NULL, NULL, NULL, '2', '4', '2025-10-28 16:36:09', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('39', 'GARCIA WOLCAN', 'Eva Paloma', NULL, NULL, '0', NULL, NULL, NULL, '2', '4', '2025-10-28 16:36:38', '2025-11-16 10:26:46', 'Femenino');
INSERT INTO `students` VALUES ('40', 'KLEIN', 'Aaron Nahir', NULL, NULL, '0', NULL, NULL, NULL, '2', '4', '2025-10-28 16:37:08', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('41', 'LLANOS', 'Santino Gael', NULL, NULL, '0', NULL, NULL, NULL, '2', '4', '2025-10-28 16:37:43', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('42', 'MILLAPI', 'Emma Abigail', NULL, NULL, '0', NULL, NULL, NULL, '2', '4', '2025-10-28 16:38:09', '2025-11-16 10:26:46', 'Femenino');
INSERT INTO `students` VALUES ('43', 'MUÑOZ', 'Benjamin Leonel', NULL, NULL, '0', NULL, NULL, NULL, '2', '4', '2025-10-28 16:38:48', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('44', 'ORTENZI', 'Gloria', NULL, NULL, '0', NULL, NULL, NULL, '2', '4', '2025-10-28 16:39:13', '2025-11-16 10:26:46', 'Femenino');
INSERT INTO `students` VALUES ('45', 'PICHON', 'Alex Joaquin', NULL, NULL, '0', NULL, NULL, NULL, '2', '4', '2025-10-28 16:39:38', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('46', 'RELMUAN', 'Bautista Salomon', NULL, NULL, '0', NULL, NULL, NULL, '2', '4', '2025-10-28 16:40:01', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('47', 'SOSA', 'Ernesto Fabian', NULL, NULL, '0', NULL, NULL, NULL, '2', '4', '2025-10-28 16:40:27', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('48', 'SUGOSKY GIMENEZ', 'Santiago', NULL, NULL, '0', NULL, NULL, NULL, '2', '4', '2025-10-28 16:40:53', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('49', 'VASQUEZ RODRIGUEZ', 'Lariza Aladuz', NULL, NULL, '0', NULL, NULL, NULL, '2', '4', '2025-10-28 16:41:18', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('50', 'ANDRADA', 'Sofia Nataly', NULL, NULL, '0', NULL, NULL, NULL, '3', '5', '2025-10-28 16:43:23', '2025-11-16 10:26:46', 'Femenino');
INSERT INTO `students` VALUES ('51', 'BARRA MARTINEZ', 'Theo', NULL, NULL, '0', NULL, NULL, NULL, '3', '5', '2025-10-28 16:43:52', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('52', 'CALVO MORALES', 'Agustin Emanuel', NULL, NULL, '0', NULL, NULL, NULL, '3', '5', '2025-10-28 16:44:25', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('53', 'ESQUIVEL CONTRERAS', 'Elias', NULL, NULL, '0', NULL, NULL, NULL, '3', '5', '2025-10-28 16:44:50', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('54', 'FRANCO LOPEZ', 'Juan Pablo', NULL, NULL, '0', NULL, NULL, NULL, '3', '5', '2025-10-28 16:45:13', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('55', 'FUENTES', 'Celina Soraya', NULL, NULL, '0', NULL, NULL, NULL, '3', '5', '2025-10-28 16:45:36', '2025-11-16 10:26:46', 'Femenino');
INSERT INTO `students` VALUES ('56', 'GARCIA', 'Goran Karim', NULL, NULL, '0', NULL, NULL, NULL, '3', '5', '2025-10-28 16:46:01', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('57', 'HUBERT', 'Ambar Lucia', NULL, NULL, '0', NULL, NULL, NULL, '3', '5', '2025-10-28 16:46:21', '2025-11-16 10:26:46', 'Femenino');
INSERT INTO `students` VALUES ('58', 'LENCURA', 'Kevin Leonel', NULL, NULL, '0', NULL, NULL, NULL, '3', '5', '2025-10-28 16:46:46', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('59', 'MORAGA GARCES', 'Mateo', NULL, NULL, '0', NULL, NULL, NULL, '3', '5', '2025-10-28 16:47:16', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('60', 'SANDOVAL', 'Mateo', NULL, NULL, '0', NULL, NULL, NULL, '3', '5', '2025-10-28 16:47:42', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('61', 'BATILIER', 'Malena Pia', NULL, NULL, '0', NULL, NULL, NULL, '3', '6', '2025-10-28 16:48:18', '2025-11-16 10:26:46', 'Femenino');
INSERT INTO `students` VALUES ('62', 'BIDINOSTI', 'Dante Omar', NULL, NULL, '0', NULL, NULL, NULL, '3', '6', '2025-10-28 16:48:50', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('63', 'CAUQUOZ', 'Renato Alexander', NULL, NULL, '0', NULL, NULL, NULL, '3', '6', '2025-10-28 16:49:12', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('64', 'FARINELLI', 'Valentino Ian', NULL, NULL, '0', NULL, NULL, NULL, '3', '6', '2025-10-28 16:50:07', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('65', 'GUERRA FERREIRA', 'Francesca Milagros', NULL, NULL, '0', NULL, NULL, NULL, '3', '6', '2025-10-28 16:50:48', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('66', 'MAYORGA', 'Santino Benjamin', NULL, NULL, '0', NULL, NULL, NULL, '3', '6', '2025-10-28 16:51:11', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('67', 'ROLLA', 'Martina Enriqueta', NULL, NULL, '0', NULL, NULL, NULL, '3', '6', '2025-10-28 16:51:54', '2025-11-16 10:26:46', 'Femenino');
INSERT INTO `students` VALUES ('68', 'RUBILAR', 'Simon Evaristo', NULL, NULL, '0', NULL, NULL, NULL, '3', '6', '2025-10-28 16:54:02', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('69', 'SIDE TELLO', 'Mijail Alexis', NULL, NULL, '0', NULL, NULL, NULL, '3', '6', '2025-10-28 16:55:17', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('70', 'BAUNGATNER ROJAS', 'Leonel I', NULL, NULL, '0', NULL, NULL, NULL, '4', '7', '2025-10-28 16:57:53', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('71', 'ENTRAIGAS BARBIERI', 'Blas Andres', NULL, NULL, '0', NULL, NULL, NULL, '4', '7', '2025-10-28 16:59:26', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('72', 'FRANCO ACOSTA', 'Ciro Mateo', NULL, NULL, '0', NULL, NULL, NULL, '4', '7', '2025-10-28 16:59:59', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('73', 'LANG PEÑA', 'German Lautaro', NULL, NULL, '0', NULL, NULL, NULL, '4', '7', '2025-10-28 17:02:26', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('74', 'MENDEZ', 'Amancay', NULL, NULL, '0', NULL, NULL, NULL, '4', '7', '2025-10-28 17:02:48', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('75', 'NABONI', 'Tobias Martin', NULL, NULL, '0', NULL, NULL, NULL, '4', '7', '2025-10-28 17:03:12', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('76', 'PEILMAN', 'Julieta Jazmin', NULL, NULL, '0', NULL, NULL, NULL, '4', '7', '2025-10-28 17:03:39', '2025-11-16 10:26:46', 'Femenino');
INSERT INTO `students` VALUES ('77', 'PEREZ', 'Tahiel Jail Emanuel', NULL, NULL, '0', NULL, NULL, NULL, '4', '7', '2025-10-28 17:04:04', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('78', 'PRESTA', 'Aylin', NULL, NULL, '0', NULL, NULL, NULL, '4', '7', '2025-10-28 17:04:37', '2025-11-16 10:26:46', 'Femenino');
INSERT INTO `students` VALUES ('79', 'REYES', 'Ezequiel Jose Tobias', NULL, NULL, '0', NULL, NULL, NULL, '4', '7', '2025-10-28 17:05:05', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('80', 'ROMANO ECHARRI', 'Juana', NULL, NULL, '0', NULL, NULL, NULL, '4', '7', '2025-10-28 17:05:32', '2025-11-16 10:26:46', 'Femenino');
INSERT INTO `students` VALUES ('81', 'SCAHNDER BURGO', 'Derek B', NULL, NULL, '0', NULL, NULL, NULL, '4', '7', '2025-10-28 17:06:13', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('82', 'SECO LOPEZ', 'Juan Ignacio', NULL, NULL, '0', NULL, NULL, NULL, '4', '7', '2025-10-28 17:07:03', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('83', 'SEQUEIROS KRENZ', 'Martin', NULL, NULL, '0', NULL, NULL, NULL, '4', '7', '2025-10-28 17:07:59', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('84', 'BISTERFELD', 'Adrian Ezequiel', NULL, NULL, '0', NULL, NULL, NULL, '4', '8', '2025-10-28 17:08:35', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('85', 'CASTILLO', 'Lautaro Martin', NULL, NULL, '0', NULL, NULL, NULL, '4', '8', '2025-10-28 17:09:01', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('86', 'CEBALLE', 'Jazmin Elunei', NULL, NULL, '0', NULL, NULL, NULL, '4', '8', '2025-10-28 17:09:34', '2025-11-16 10:26:46', 'Femenino');
INSERT INTO `students` VALUES ('87', 'CRESPO', 'Luis Ezequiel', NULL, NULL, '0', NULL, NULL, NULL, '4', '8', '2025-10-28 17:10:12', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('88', 'DINAMARCA', 'Felipe', NULL, NULL, '0', NULL, NULL, NULL, '4', '8', '2025-10-28 17:10:56', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('89', 'GABLOSKY', 'Martina', NULL, NULL, '0', NULL, NULL, NULL, '4', '8', '2025-10-28 17:11:32', '2025-11-16 10:26:46', 'Femenino');
INSERT INTO `students` VALUES ('90', 'GARCIA ITALIANO', 'Antonella Peggy', NULL, NULL, '0', NULL, NULL, NULL, '4', '8', '2025-10-28 17:12:05', '2025-11-16 10:26:46', 'Femenino');
INSERT INTO `students` VALUES ('91', 'HUBERT', 'Uma Jazmin', NULL, NULL, '0', NULL, NULL, NULL, '4', '8', '2025-10-28 17:12:51', '2025-11-16 10:26:46', 'Femenino');
INSERT INTO `students` VALUES ('92', 'LAGOS GONZALO', 'Alvaro Estefano', NULL, NULL, '0', NULL, NULL, NULL, '4', '8', '2025-10-28 17:13:19', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('93', 'MIGLIERINI VASILOFF', 'Felipe D', NULL, NULL, '0', NULL, NULL, NULL, '4', '8', '2025-10-28 17:13:43', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('94', 'PONCE', 'Joaquin Ezequiel', NULL, NULL, '0', NULL, NULL, NULL, '4', '8', '2025-10-28 17:14:51', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('95', 'SCHEPISI SALDAÑA', 'Santino Efrain', NULL, NULL, '0', NULL, NULL, NULL, '4', '8', '2025-10-28 17:16:26', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('96', 'STADLER', 'Luisana Morena', NULL, NULL, '0', NULL, NULL, NULL, '4', '8', '2025-10-28 17:16:55', '2025-11-16 10:26:46', 'Femenino');
INSERT INTO `students` VALUES ('97', 'TAPIA', 'Tiziano Valentino', NULL, NULL, '0', NULL, NULL, NULL, '4', '8', '2025-10-28 17:19:05', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('98', 'FRANK', 'Ignacio', NULL, NULL, '0', NULL, NULL, NULL, '4', '8', '2025-10-28 17:19:36', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('99', 'ARANDA', 'Tomas Agustin', NULL, NULL, '0', NULL, NULL, NULL, '5', '9', '2025-10-28 17:21:42', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('100', 'BENITEZ', 'Nazareno Martin', NULL, NULL, '0', NULL, NULL, NULL, '5', '9', '2025-10-28 17:22:29', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('101', 'BUSTOS HERRERA', 'Iara Geraldine', NULL, NULL, '0', NULL, NULL, NULL, '5', '9', '2025-10-28 17:22:58', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('102', 'CARDOSO ROLLA', 'Lautaro Ian', NULL, NULL, '0', NULL, NULL, NULL, '5', '9', '2025-10-28 17:24:09', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('103', 'CUMILAF', 'Sofia Sahiel', NULL, NULL, '0', NULL, NULL, NULL, '5', '9', '2025-10-28 17:24:54', '2025-11-16 10:26:46', 'Femenino');
INSERT INTO `students` VALUES ('104', 'DIETZ CORDOBA', 'Santiago Marcelo', NULL, NULL, '0', NULL, NULL, NULL, '5', '9', '2025-10-28 17:25:29', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('105', 'GARCES', 'Malena Sahiel', NULL, NULL, '0', NULL, NULL, NULL, '5', '9', '2025-10-28 17:25:52', '2025-11-16 10:26:46', 'Femenino');
INSERT INTO `students` VALUES ('106', 'GOMEZ DIAZ', 'Joaquin Tobias', NULL, NULL, '0', NULL, NULL, NULL, '5', '9', '2025-10-28 17:26:15', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('107', 'GRULD DI GREGORIO', 'Augusto Jose', NULL, NULL, '0', NULL, NULL, NULL, '5', '9', '2025-10-28 17:26:50', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('108', 'MEZQUITA', 'Baltazar', NULL, NULL, '0', NULL, NULL, NULL, '5', '9', '2025-10-28 17:27:51', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('109', 'NAVARRO CUFRE', 'Aime Mailen', NULL, NULL, '0', NULL, NULL, NULL, '5', '9', '2025-10-28 17:28:15', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('110', 'ORTIZ', 'Juanita Martina', NULL, NULL, '0', NULL, NULL, NULL, '5', '9', '2025-10-28 17:28:43', '2025-11-16 10:26:46', 'Femenino');
INSERT INTO `students` VALUES ('111', 'PUÑALEF', 'Katherine F', NULL, NULL, '0', NULL, NULL, NULL, '5', '9', '2025-10-28 17:29:05', '2025-11-16 10:26:46', 'Femenino');
INSERT INTO `students` VALUES ('112', 'ROMERO', 'Ian Bautista', NULL, NULL, '0', NULL, NULL, NULL, '5', '9', '2025-10-28 17:29:50', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('113', 'SIGUERO CALBUCURA', 'Derek A', NULL, NULL, '0', NULL, NULL, NULL, '5', '9', '2025-10-28 17:31:13', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('114', 'URRA CASTILLO', 'Jana', NULL, NULL, '0', NULL, NULL, NULL, '5', '9', '2025-10-28 17:31:33', '2025-11-16 10:26:46', 'Femenino');
INSERT INTO `students` VALUES ('115', 'BELLINI', 'Bruno Agustin', NULL, NULL, '0', NULL, NULL, NULL, '5', '10', '2025-10-28 17:32:08', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('116', 'CABRERA', 'Paulo Tomas', NULL, NULL, '0', NULL, NULL, NULL, '5', '10', '2025-10-28 17:32:56', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('117', 'CARRASCO', 'Sabrina Aylin', NULL, NULL, '0', NULL, NULL, NULL, '5', '10', '2025-10-28 17:33:24', '2025-11-16 10:26:46', 'Femenino');
INSERT INTO `students` VALUES ('118', 'CORIA', 'Alexis', NULL, NULL, '0', NULL, NULL, NULL, '5', '10', '2025-10-28 19:42:13', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('119', 'ESPINOZA', 'Luz Sarai', NULL, NULL, '0', NULL, NULL, NULL, '5', '10', '2025-10-28 19:42:45', '2025-11-16 10:26:46', 'Femenino');
INSERT INTO `students` VALUES ('120', 'LIENDAF', 'Blas Baltazar', NULL, NULL, '0', NULL, NULL, NULL, '5', '10', '2025-10-28 19:43:59', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('121', 'LINARES ACOSTA', 'Bianca Nahiara', NULL, NULL, '0', NULL, NULL, NULL, '5', '10', '2025-10-28 19:44:25', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('122', 'OJEDA SCHEFFER', 'Morena Priscila', NULL, NULL, '0', NULL, NULL, NULL, '5', '10', '2025-10-28 19:44:55', '2025-11-16 10:26:46', 'Femenino');
INSERT INTO `students` VALUES ('123', 'OLIVARES ROLLA', 'Tiziano Efren', NULL, NULL, '0', NULL, NULL, NULL, '5', '10', '2025-10-28 19:45:25', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('124', 'PEÑA BAIER', 'Juana', NULL, NULL, '0', NULL, NULL, NULL, '5', '10', '2025-10-28 19:45:51', '2025-11-16 10:26:46', 'Femenino');
INSERT INTO `students` VALUES ('125', 'PEREYRA', 'Luciana Belen', NULL, NULL, '0', NULL, NULL, NULL, '5', '10', '2025-10-28 19:46:21', '2025-11-16 10:26:46', 'Femenino');
INSERT INTO `students` VALUES ('126', 'SILVA', 'Ian Lucas', NULL, NULL, '0', NULL, NULL, NULL, '5', '10', '2025-10-28 19:46:57', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('127', 'TUREDA', 'Denisse', NULL, NULL, '0', NULL, NULL, NULL, '5', '10', '2025-10-28 19:47:44', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('128', 'AGUILAR', 'Luciano', NULL, NULL, '0', NULL, NULL, NULL, '6', '11', '2025-10-28 19:50:29', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('129', 'ALMADA', 'Santino', NULL, NULL, '0', NULL, NULL, NULL, '6', '11', '2025-10-28 19:51:01', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('130', 'BARILA', 'Diego', NULL, NULL, '0', NULL, NULL, NULL, '6', '11', '2025-10-28 19:51:41', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('131', 'CARRASCO', 'Ciro', NULL, NULL, '0', NULL, NULL, NULL, '6', '11', '2025-10-28 19:53:38', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('132', 'HIDALGO SAN MARTIN', 'Jean Franco', NULL, NULL, '0', NULL, NULL, NULL, '6', '11', '2025-10-28 19:54:27', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('133', 'JAUREGUI', 'Maria Luz', NULL, NULL, '0', NULL, NULL, NULL, '6', '11', '2025-10-28 19:54:52', '2025-11-16 10:26:46', 'Femenino');
INSERT INTO `students` VALUES ('134', 'MERLO', 'Donato', NULL, NULL, '0', NULL, NULL, NULL, '6', '11', '2025-10-28 19:55:14', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('135', 'SALDIVIA DURAN', 'Victoria', NULL, NULL, '0', NULL, NULL, NULL, '6', '11', '2025-10-28 19:56:07', '2025-11-16 10:26:46', 'Femenino');
INSERT INTO `students` VALUES ('136', 'TOLOZA', 'Kiara', NULL, NULL, '0', NULL, NULL, NULL, '6', '11', '2025-10-28 19:56:28', '2025-11-16 10:26:46', 'Femenino');
INSERT INTO `students` VALUES ('137', 'VILLEGAS', 'Gino', NULL, NULL, '0', NULL, NULL, NULL, '6', '11', '2025-10-28 19:56:57', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('138', 'VARANO', 'Ignacio', NULL, NULL, '0', NULL, NULL, NULL, '6', '11', '2025-10-28 19:57:18', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('139', 'SAN MARTIN', 'Linda', NULL, NULL, '0', NULL, NULL, NULL, '6', '11', '2025-10-28 19:58:16', '2025-11-16 10:26:46', 'Femenino');
INSERT INTO `students` VALUES ('140', 'ENTRAIGAS', 'Santino', NULL, NULL, '0', NULL, NULL, NULL, '6', '11', '2025-10-28 19:58:45', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('141', 'MAIDANA', 'Mia', NULL, NULL, '0', NULL, NULL, NULL, '6', '11', '2025-10-28 19:59:32', '2025-11-16 10:26:46', 'Femenino');
INSERT INTO `students` VALUES ('142', 'ETCHEVERRY ROSALES', 'Lara', NULL, NULL, '0', NULL, NULL, NULL, '6', '12', '2025-10-28 20:00:11', '2025-11-16 10:26:46', 'Femenino');
INSERT INTO `students` VALUES ('143', 'MARTINEZ ALVAREZ', 'Alma', NULL, NULL, '0', NULL, NULL, NULL, '6', '12', '2025-10-28 20:00:47', '2025-11-16 10:26:46', 'Femenino');
INSERT INTO `students` VALUES ('144', 'BELTRAN', 'Bautista', NULL, NULL, '0', NULL, NULL, NULL, '6', '12', '2025-10-28 20:02:59', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('145', 'PUCH', 'Alejo', NULL, NULL, '0', NULL, NULL, NULL, '6', '12', '2025-10-28 20:03:22', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('146', 'FIRMAPAZ', 'Nahiara', NULL, NULL, '0', NULL, NULL, NULL, '6', '12', '2025-10-28 20:03:57', '2025-11-16 10:26:46', 'Femenino');
INSERT INTO `students` VALUES ('147', 'BONIFACCIO', 'Melanie', NULL, NULL, '0', NULL, NULL, NULL, '6', '12', '2025-10-28 20:04:19', '2025-11-16 10:26:46', 'Femenino');
INSERT INTO `students` VALUES ('148', 'FERRANDI GUERRERO', 'Luana', NULL, NULL, '0', NULL, NULL, NULL, '6', '12', '2025-10-28 20:04:41', '2025-11-16 10:26:46', 'Femenino');
INSERT INTO `students` VALUES ('149', 'VEGA ANDRADE', 'Thiago', NULL, NULL, '0', NULL, NULL, NULL, '6', '12', '2025-10-28 20:05:01', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('150', 'STANOLI', 'Enzo', NULL, NULL, '0', NULL, NULL, NULL, '6', '12', '2025-10-28 20:08:00', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('151', 'GALVAN FARIAS', 'Agustin', NULL, NULL, '0', NULL, NULL, NULL, '6', '12', '2025-10-28 20:08:33', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('152', 'GOMEZ DIAZ', 'Juan Leonel', NULL, NULL, '0', NULL, NULL, NULL, '6', '12', '2025-10-28 20:08:56', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('153', 'BRAGA GAMARRA', 'Benjamin', NULL, NULL, '0', NULL, NULL, NULL, '7', '13', '2025-10-28 20:10:27', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('154', 'CHURRARIN ALVAREZ', 'Ezequiel', NULL, NULL, '0', NULL, NULL, NULL, '7', '13', '2025-10-28 20:10:53', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('155', 'DELBARES FALCON', 'Joaquin', NULL, NULL, '0', NULL, NULL, NULL, '7', '13', '2025-10-28 20:11:35', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('156', 'GARCIA', 'Tahiel', NULL, NULL, '0', NULL, NULL, NULL, '7', '13', '2025-10-28 20:11:57', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('157', 'HUILCAN', 'Lautaro', NULL, NULL, '0', NULL, NULL, NULL, '7', '13', '2025-10-28 20:12:25', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('158', 'MARTINEZ', 'Valentino', NULL, NULL, '0', NULL, NULL, NULL, '7', '13', '2025-10-28 20:13:40', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('159', 'MULATO GALLARDO', 'Thiago', NULL, NULL, '0', NULL, NULL, NULL, '7', '13', '2025-10-28 20:15:16', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('160', 'OYON', 'Candela', NULL, NULL, '0', NULL, NULL, NULL, '7', '13', '2025-10-28 20:15:46', '2025-11-16 10:26:46', 'Femenino');
INSERT INTO `students` VALUES ('161', 'QUINTRILEF', 'Benjamin', NULL, NULL, '0', NULL, NULL, NULL, '7', '13', '2025-10-28 20:16:17', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('162', 'QUINTRILEF', 'Rocio', NULL, NULL, '0', NULL, NULL, NULL, '7', '13', '2025-10-28 20:17:00', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('163', 'RUPPEL LOPEZ', 'Jose', NULL, NULL, '0', NULL, NULL, NULL, '7', '13', '2025-10-28 20:17:58', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('164', 'BUSTO', 'Keila', NULL, NULL, '0', NULL, NULL, NULL, '7', '13', '2025-10-28 20:19:35', '2025-11-16 10:26:46', 'Femenino');
INSERT INTO `students` VALUES ('165', 'GOMEZ URIZ', 'Josefina', NULL, NULL, '0', NULL, NULL, NULL, '7', '14', '2025-10-28 20:21:40', '2025-11-16 10:26:46', 'Femenino');
INSERT INTO `students` VALUES ('166', 'HUECHE', 'Roman', NULL, NULL, '0', NULL, NULL, NULL, '7', '14', '2025-10-28 20:23:08', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('167', 'HUINCAL PEREZ', 'Felipe', NULL, NULL, '0', NULL, NULL, NULL, '7', '14', '2025-10-28 20:24:49', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('168', 'KLUG', 'Yesica', NULL, NULL, '0', NULL, NULL, NULL, '7', '14', '2025-10-28 20:25:12', '2025-11-16 10:26:46', 'Femenino');
INSERT INTO `students` VALUES ('169', 'MORON', 'Ariana Romanella', NULL, NULL, '0', NULL, NULL, NULL, '7', '14', '2025-10-28 20:25:42', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('170', 'ORELLANA', 'Ursula', NULL, NULL, '0', NULL, NULL, NULL, '7', '14', '2025-10-28 20:26:03', '2025-11-16 10:26:46', 'Femenino');
INSERT INTO `students` VALUES ('171', 'TORRES', 'Ignacio', NULL, NULL, '0', NULL, NULL, NULL, '7', '14', '2025-10-28 20:26:26', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('172', 'VILLEGAS', 'Tobias', NULL, NULL, '0', NULL, NULL, NULL, '7', '14', '2025-10-28 20:27:11', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('173', 'BELIU OLIVERA', 'Sofia', NULL, NULL, '0', NULL, NULL, NULL, '8', '15', '2025-10-28 20:33:38', '2025-11-16 10:26:46', 'Femenino');
INSERT INTO `students` VALUES ('174', 'CARRANZA CASTRO', 'Martin', NULL, NULL, '0', NULL, NULL, NULL, '8', '15', '2025-10-28 20:34:01', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('175', 'CORAZZA', 'Luciano', NULL, NULL, '0', NULL, NULL, NULL, '8', '15', '2025-10-28 20:34:24', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('176', 'DIEGO', 'Leandro', NULL, NULL, '0', NULL, NULL, NULL, '8', '15', '2025-10-28 20:35:12', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('177', 'FIRMAPAZ', 'Francisco', NULL, NULL, '0', NULL, NULL, NULL, '8', '15', '2025-10-28 20:36:11', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('178', 'LINARES ZINNGONI', 'Ali', NULL, NULL, '0', NULL, NULL, NULL, '8', '15', '2025-10-28 20:36:49', '2025-11-16 10:26:46', 'Femenino');
INSERT INTO `students` VALUES ('179', 'MUSURUANA', 'Maximo', NULL, NULL, '0', NULL, NULL, NULL, '8', '15', '2025-10-28 20:37:09', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('180', 'PAILLALEF', 'Emerson', NULL, NULL, '0', NULL, NULL, NULL, '8', '15', '2025-10-28 20:37:31', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('181', 'ROSELLO ESPERON', 'Joaquin', NULL, NULL, '0', NULL, NULL, NULL, '8', '15', '2025-10-28 20:37:53', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('182', 'CARRANZA LEDESMA', 'Luciana', NULL, NULL, '0', NULL, NULL, NULL, '8', '16', '2025-10-28 20:38:23', '2025-11-16 10:26:46', 'Femenino');
INSERT INTO `students` VALUES ('183', 'CUITIÑO', 'Valentina', NULL, NULL, '0', NULL, NULL, NULL, '8', '16', '2025-10-28 20:38:49', '2025-11-16 10:26:46', 'Femenino');
INSERT INTO `students` VALUES ('184', 'FERNANDEZ', 'Zaira', NULL, NULL, '0', NULL, NULL, NULL, '8', '16', '2025-10-28 20:39:23', '2025-11-16 10:26:46', 'Femenino');
INSERT INTO `students` VALUES ('185', 'GOMEZ', 'Emiliano', NULL, NULL, '0', NULL, NULL, NULL, '8', '16', '2025-10-28 20:40:31', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('186', 'MANQUILEF RUPPEL', 'Jose', NULL, NULL, '0', NULL, NULL, NULL, '8', '16', '2025-10-28 20:41:00', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('187', 'MANQUENAO', 'Luz', NULL, NULL, '0', NULL, NULL, NULL, '8', '16', '2025-10-28 20:41:35', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('188', 'MELLAO', 'Jazmin', NULL, NULL, '0', NULL, NULL, NULL, '8', '16', '2025-10-28 20:42:05', '2025-11-16 10:26:46', 'Femenino');
INSERT INTO `students` VALUES ('189', 'MOYANO', 'Alejo', NULL, NULL, '0', NULL, NULL, NULL, '8', '16', '2025-10-28 20:42:52', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('190', 'SANCHEZ', 'Benjamin', NULL, NULL, '0', NULL, NULL, NULL, '8', '16', '2025-10-28 20:43:17', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('191', 'SEVILLANO ARACENA', 'Mariano', NULL, NULL, '0', NULL, NULL, NULL, '8', '16', '2025-10-28 20:43:46', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('192', 'ARANDA', 'Camila', NULL, NULL, '0', NULL, NULL, NULL, '10', '19', '2025-10-28 20:53:33', '2025-11-16 10:26:46', 'Femenino');
INSERT INTO `students` VALUES ('193', 'CASTILLO', 'Thiago', NULL, NULL, '0', NULL, NULL, NULL, '10', '19', '2025-10-28 20:54:34', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('194', 'CARRIZO', 'Bautista Benjamin', NULL, NULL, '0', NULL, NULL, NULL, '10', '19', '2025-10-28 20:55:19', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('195', 'FLORES CENDRA', 'Juliana', NULL, NULL, '0', NULL, NULL, NULL, '10', '19', '2025-10-28 20:56:42', '2025-11-16 10:26:46', 'Femenino');
INSERT INTO `students` VALUES ('196', 'LOBATO TINTA', 'Juan', NULL, NULL, '0', NULL, NULL, NULL, '10', '19', '2025-10-28 20:57:24', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('197', 'MARTINEZ HUECHE', 'Milagros', NULL, NULL, '0', NULL, NULL, NULL, '10', '19', '2025-10-28 20:57:55', '2025-11-16 10:26:46', 'Femenino');
INSERT INTO `students` VALUES ('198', 'MUÑOZ', 'Jazmin', NULL, NULL, '0', NULL, NULL, NULL, '10', '19', '2025-10-28 20:59:28', '2025-11-16 10:26:46', 'Femenino');
INSERT INTO `students` VALUES ('199', 'OLMOS', 'Solange', NULL, NULL, '0', NULL, NULL, NULL, '10', '19', '2025-10-28 20:59:51', '2025-11-16 10:26:46', 'Femenino');
INSERT INTO `students` VALUES ('200', 'ORTIZ', 'Yantal', NULL, NULL, '0', NULL, NULL, NULL, '10', '19', '2025-10-28 21:00:42', '2025-11-16 10:26:46', 'Femenino');
INSERT INTO `students` VALUES ('201', 'RAMIREZ DELGADO', 'Joaquin', NULL, NULL, '0', NULL, NULL, NULL, '10', '19', '2025-10-28 21:01:04', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('202', 'VENEGAS', 'Bautista', NULL, NULL, '0', NULL, NULL, NULL, '10', '19', '2025-10-28 21:02:09', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('203', 'VAZQUEZ', 'Luz', NULL, NULL, '0', NULL, NULL, NULL, '10', '19', '2025-10-28 21:02:34', '2025-11-16 10:26:46', 'Femenino');
INSERT INTO `students` VALUES ('204', 'BUENOPIL COLLOMILLA', 'Jeremias Eliel', '49.542.923', '2009-10-01', '0', 'Patagones', 'EP Nº 11', 'M. Gonzales 561', '10', '20', '2025-10-28 21:03:20', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('205', 'CABEZA', 'Joaquin', '49.466.328', '2008-11-18', '0', 'San Antonio', 'EP Nº 2', 'P. Moreno 51', '10', '20', '2025-10-28 21:03:45', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('206', 'GONGORA GUEVARA', 'Barbara Celeste', '50.166.164', '2009-04-25', '0', 'Viedma', 'EESTNº 6', 'Doc Baraja 224', '10', '20', '2025-10-28 21:04:07', '2025-11-16 10:26:46', 'Femenino');
INSERT INTO `students` VALUES ('207', 'HETCHELEITNER', 'Valentina', NULL, NULL, '0', NULL, NULL, NULL, '10', '20', '2025-10-28 21:05:27', '2025-11-16 10:26:46', 'Femenino');
INSERT INTO `students` VALUES ('208', 'IBAÑEZ', 'Francisco', NULL, NULL, '0', NULL, NULL, NULL, '10', '20', '2025-10-28 21:05:43', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('209', 'LONGHURST', 'Ibi Agostina', '48.964.50', '2008-08-08', '0', 'Comodoro Rivadavia', 'EP Nº64', 'San Lorenzo 170', '10', '20', '2025-10-29 03:53:40', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('210', 'PERALTA', 'Juan Daniel', '50.166.113', '2010-02-27', '0', 'Viedma', 'EP Nº 14', 'C. Namuncura 406', '10', '20', '2025-10-29 03:53:51', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('211', 'VAZQUEZ', 'Ezequiel', NULL, NULL, '0', NULL, NULL, NULL, '10', '20', '2025-10-29 03:54:10', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('212', 'WEINBENDER', 'Daniksa', NULL, NULL, '0', NULL, NULL, NULL, '10', '20', '2025-10-29 03:54:18', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('213', 'ALVAREZ', 'Benjamin Gonzalo', '49.958.692', '2010-05-09', '0', 'Patagones', 'EP Nº 14', 'Oris de Roa 370', '9', '17', '2025-10-29 03:54:35', '2025-11-02 21:12:37', 'Masculino');
INSERT INTO `students` VALUES ('214', 'AMBROSIONI SILVERA', 'Thiago', '49.542.884', '2009-09-11', '0', 'Patagones', NULL, 'Bella Flor 171', '9', '17', '2025-10-29 03:54:47', '2025-11-02 21:11:56', 'Masculino');
INSERT INTO `students` VALUES ('215', 'BIAGETTI', 'Milagros', '49.846.688', '2009-10-16', '0', NULL, 'E.E.S Nº 8', 'J. de la Piedra', '9', '17', '2025-10-29 03:54:59', '2025-11-16 10:26:46', 'Femenino');
INSERT INTO `students` VALUES ('216', 'GUGENHEIN', 'Vladimir Isaias', '49.958.640', '2010-03-07', '0', 'Patagones', 'EP Nº 14', 'M. Crespo 307', '9', '17', '2025-10-29 03:55:09', '2025-11-02 21:15:20', 'Masculino');
INSERT INTO `students` VALUES ('217', 'MANTEROLA', 'Lautaro', NULL, NULL, '0', NULL, NULL, NULL, '9', '17', '2025-10-29 03:55:18', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('218', 'MARTINEZ PARDAL', 'Sebastian Julian', '50.267.524', '2010-06-12', '0', 'Patagones', 'IMA', 'S. Lorenzo 725', '9', '17', '2025-10-29 03:55:28', '2025-11-02 21:19:54', 'Masculino');
INSERT INTO `students` VALUES ('219', 'MENDEZ', 'Facundo', '50.259.583', '2010-05-10', '0', 'Patagones', NULL, 'Alsina 737', '9', '17', '2025-10-29 03:55:39', '2025-11-02 21:21:25', 'Masculino');
INSERT INTO `students` VALUES ('220', 'MUÑOZ', 'Jazmin', NULL, NULL, '0', NULL, NULL, NULL, '9', '17', '2025-10-29 03:55:51', '2025-11-16 10:26:46', 'Femenino');
INSERT INTO `students` VALUES ('221', 'PACHADO', 'Thiago Yain', '49.542.893', '2009-02-22', '0', 'Patagones', 'EP Nº 2', 'A. Garcia 715', '9', '17', '2025-10-29 03:57:15', '2025-11-16 10:34:06', 'Masculino');
INSERT INTO `students` VALUES ('222', 'RAINQUEO MELI', 'Isaias Alexander', '49.542.978', '2009-12-08', '0', 'Patagones', 'EP Nº 14', 'Fourmantin 400', '9', '17', '2025-10-29 04:05:14', '2025-11-02 21:44:56', 'Masculino');
INSERT INTO `students` VALUES ('223', 'ROLLA ALEMAN', 'Lautaro', '49.958.670', '2010-04-16', '0', 'Patagones', 'EP Nº 2', 'C. Pereyra 324', '9', '17', '2025-10-29 04:05:27', '2025-11-02 21:18:42', 'Masculino');
INSERT INTO `students` VALUES ('224', 'RUPPEL', 'Nahuel Alan', '49.958.608', '2010-01-26', '0', 'Patagones', 'EP Nº 14', 'Bertorelo 580', '9', '17', '2025-10-29 04:05:38', '2025-11-02 21:46:06', 'Masculino');
INSERT INTO `students` VALUES ('225', 'SANCHEZ', 'Francisco', '50.267.544', '2010-06-27', '0', 'Patagones', 'EP Nº 14', 'S Cabral 476', '9', '17', '2025-10-29 04:05:47', '2025-11-02 21:47:18', 'Masculino');
INSERT INTO `students` VALUES ('226', 'ULLUA', 'Katerhina', NULL, NULL, '0', NULL, NULL, NULL, '9', '17', '2025-10-29 04:05:56', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('227', 'ANCAPAN', 'Luciano', NULL, NULL, '0', NULL, NULL, NULL, '9', '17', '2025-10-29 04:06:11', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('228', 'IBAÑEZ', 'Francisco', NULL, NULL, '0', NULL, NULL, NULL, '9', '17', '2025-10-29 04:06:21', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('229', 'AZAROFF ZELMER', 'Elal Santiago', '49.542.897', '2009-09-17', '0', 'Viedma', 'EP Nº 2', 'R. S. Peña 161', '9', '18', '2025-10-29 07:06:30', '2025-11-03 00:49:27', 'Masculino');
INSERT INTO `students` VALUES ('230', 'BEJARANO GUENOFIL', 'Lander Quimey', '49.704.338', '2009-08-13', '0', 'Viedma', 'EP Nº 2', 'F. Arró 613', '9', '18', '2025-10-29 04:06:39', '2025-11-02 21:53:14', 'Masculino');
INSERT INTO `students` VALUES ('231', 'DIAZ', 'Ainara', '49.542.941', '2009-11-02', '0', 'Patagones', 'EP Nº 2', 'Fco de León 115', '9', '18', '2025-10-29 04:06:47', '2025-11-16 10:26:46', 'Femenino');
INSERT INTO `students` VALUES ('232', 'DENEZIO DELRI', 'Tomas', '50.118.717', '2010-05-18', '0', 'Rio Gallegos', 'EP Nº 14', 'Yanquetruz 292', '9', '18', '2025-10-29 04:06:59', '2025-11-02 21:54:36', 'Masculino');
INSERT INTO `students` VALUES ('233', 'LUNA', 'Enzo', '49.551.173', '2009-09-05', '0', NULL, NULL, 'C.Namuncura 286 Vma', '9', '18', '2025-10-29 04:07:08', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('234', 'MAYER', 'Zahira', '49.542.952', '2009-11-18', '0', 'Patagones', NULL, 'Belgrano 119', '9', '18', '2025-10-29 04:07:18', '2025-11-16 10:26:46', 'Femenino');
INSERT INTO `students` VALUES ('235', 'MELILLAN', 'Leonel', '49.542.862', '2009-08-18', '0', 'Patagones', 'EP Nº 11', 'Belgrano 82', '9', '18', '2025-10-29 04:07:27', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('236', 'NICONIELLO', 'Valentin', '49.950.482', '2010-01-15', '0', NULL, NULL, 'P. Serrano 175 Vma', '9', '18', '2025-10-29 04:07:36', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('237', 'PAEZ', 'Theo Manuel', '49.805.511', '2009-10-22', '0', 'Ba. Blanca', 'EP Nº 2', 'Olivera 196', '9', '18', '2025-10-29 04:07:45', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('238', 'QUINTRILEF', 'Leonel', '48.123.034', NULL, '0', NULL, NULL, 'Matanera 227 Vma', '9', '18', '2025-10-29 04:07:53', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('239', 'REY TRINCHANT', 'Juan C', '49.542.920', '2009-10-01', '0', NULL, NULL, 'Dr Baraja 245', '9', '18', '2025-10-29 04:08:02', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('240', 'SOSA MIÑO', 'Bastian Emanuel', '50.267.535', '2010-06-26', '0', 'Patagones', 'EP Nº 14', 'C Pereira 324', '9', '18', '2025-10-29 04:08:10', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('241', 'TOLABA ANAYA', 'Adrian Elias Joaquin', '49.542.844', '2009-08-03', '0', 'Patagones', 'EP Nº 14', 'Alem 214', '9', '18', '2025-10-29 04:08:19', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('242', 'WEINZETEL', 'Giuliano', '50.166.118', '2010-03-01', '0', NULL, NULL, 'L Martinez 235', '9', '18', '2025-10-29 04:08:28', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('243', 'BUENOPIL', 'Elial', NULL, NULL, '0', NULL, NULL, NULL, '9', '18', '2025-10-29 04:08:36', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('244', 'PALMA', 'Jazmin', '48.941.189', '2008-08-06', '0', NULL, NULL, 'Laprida 873 Vma', '9', '18', '2025-10-29 04:08:43', '2025-11-16 10:26:46', 'Femenino');
INSERT INTO `students` VALUES ('245', 'BARRA', 'Santiago', NULL, NULL, '0', NULL, NULL, NULL, '11', '21', '2025-10-29 04:20:53', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('246', 'CALVO', 'Priscila', NULL, NULL, '0', NULL, NULL, NULL, '11', '21', '2025-10-29 04:21:02', '2025-11-16 10:26:46', 'Femenino');
INSERT INTO `students` VALUES ('247', 'CARRANZA', 'Bruno', NULL, NULL, '0', NULL, NULL, NULL, '11', '21', '2025-10-29 04:21:10', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('248', 'CORIA', 'Bautista Alejandro', NULL, NULL, '0', NULL, NULL, NULL, '11', '21', '2025-10-29 04:21:21', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('249', 'ESPINOZA', 'Juan', NULL, NULL, '0', NULL, NULL, NULL, '11', '21', '2025-10-29 04:21:28', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('250', 'FAHN', 'Camila', NULL, NULL, '0', NULL, NULL, NULL, '11', '21', '2025-10-29 04:21:35', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('251', 'FAVEZ', 'Fabricio', NULL, NULL, '0', NULL, NULL, NULL, '11', '21', '2025-10-29 04:21:51', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('252', 'PRESTA', 'Alina', NULL, NULL, '0', NULL, NULL, NULL, '11', '21', '2025-10-29 04:21:59', '2025-11-16 10:26:46', 'Femenino');
INSERT INTO `students` VALUES ('253', 'ROSSELLO', 'Sofia', NULL, NULL, '0', NULL, NULL, NULL, '11', '21', '2025-10-29 04:22:06', '2025-11-16 10:26:46', 'Femenino');
INSERT INTO `students` VALUES ('254', 'FERRANDI', 'Simon', NULL, NULL, '0', NULL, NULL, NULL, '11', '22', '2025-10-29 04:22:15', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('255', 'FRANCO', 'James', NULL, NULL, '0', NULL, NULL, NULL, '11', '22', '2025-10-29 04:22:25', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('256', 'GARRIDO', 'Tomas', NULL, NULL, '0', NULL, NULL, NULL, '11', '22', '2025-10-29 04:22:33', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('257', 'MASTRANGELO', 'Juan C', NULL, NULL, '0', NULL, NULL, NULL, '11', '22', '2025-10-29 04:22:41', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('258', 'MONSALVO', 'Ivo', NULL, NULL, '0', NULL, NULL, NULL, '11', '22', '2025-10-29 04:22:49', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('259', 'MURIAS', 'Felipe', NULL, NULL, '0', NULL, NULL, NULL, '11', '22', '2025-10-29 04:22:56', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('260', 'RUIZ', 'Facundo', NULL, NULL, '0', NULL, NULL, NULL, '11', '22', '2025-10-29 04:23:03', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('261', 'SALAS', 'Alejo Benjamin', NULL, NULL, '0', NULL, NULL, NULL, '11', '22', '2025-10-29 04:23:15', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('262', 'VELAZQUEZ', 'Brian', NULL, NULL, '0', NULL, NULL, NULL, '11', '22', '2025-10-29 04:23:25', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('263', 'VIDELA', 'Mateo Tomas', NULL, NULL, '0', NULL, NULL, NULL, '11', '22', '2025-10-29 04:23:32', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('264', 'CANCLINI', 'Juan Cruz', NULL, NULL, '0', NULL, NULL, NULL, '13', '27', '2025-10-29 04:26:43', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('265', 'CAYUMIL', 'Santiago Fernando', '48.216.459', '2007-10-06', '0', 'Patagones', 'EP Nº 14', 'Sor Vallese 725', '13', '27', '2025-10-29 04:26:52', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('266', 'CORDOBA', 'Priscila', NULL, NULL, '0', NULL, NULL, NULL, '13', '27', '2025-10-29 04:27:02', '2025-11-16 10:26:46', 'Femenino');
INSERT INTO `students` VALUES ('267', 'ROSSELLO', 'Maximo', NULL, NULL, '0', NULL, NULL, NULL, '13', '27', '2025-10-29 04:27:11', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('268', 'ALBANESI', 'Juan Pedro', '48.731.150', '2008-04-05', '0', 'Ba. Blanca', 'EP Nº 2', 'Sor Vallese 433', '13', '28', '2025-10-29 04:27:35', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('269', 'BARRERA', 'Mía Geraldine', '48.497.149', '2008-01-07', '0', 'Ba. Blanca', NULL, 'Mejico 403 Viedma', '13', '28', '2025-10-29 04:27:50', '2025-11-16 10:26:46', 'Femenino');
INSERT INTO `students` VALUES ('270', 'GARIGLIO', 'Ivan', '48.659.956', '2008-02-20', '0', 'Viedma', 'EP N° 2 Viedma', 'Leblanc 919', '13', '28', '2025-10-29 04:27:59', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('271', 'GOMEZ', 'Leonel', NULL, NULL, '0', NULL, NULL, NULL, '13', '28', '2025-10-29 04:28:08', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('272', 'PEÑA MULLER', 'Tobias Ariel', '48.497.210', '2008-03-10', '0', 'Viedma', 'EP Nº 14', 'Luis Py 531', '13', '28', '2025-10-29 04:28:17', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('273', 'PINO BELMAR', 'Mercedita Guadalupe', '48.391.764', '2007-12-19', '0', 'Viedma', 'EP Nº 2', 'Lavalle 672', '13', '28', '2025-10-29 04:28:27', '2025-11-16 10:26:46', 'Femenino');
INSERT INTO `students` VALUES ('274', 'RODRIGUEZ', 'Dante Nehuen', '48.849.061', '2008-06-15', '0', 'La Plata', 'Esc 296 Viedma', 'Fco Abel 387', '13', '28', '2025-10-29 04:28:36', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('275', 'ROLLA', 'Valentina Micaela', '48.866.837', '2008-05-11', '0', 'Viedma', 'IMA', 'L. Winter 622', '13', '28', '2025-10-29 04:28:43', '2025-11-16 10:26:46', 'Femenino');
INSERT INTO `students` VALUES ('276', 'ALCATRAZ', 'Cielo', NULL, NULL, '0', NULL, NULL, NULL, '16', '30', '2025-10-29 23:06:01', '2025-11-16 10:26:46', 'Femenino');
INSERT INTO `students` VALUES ('277', 'FIERRO', 'Carlos', NULL, NULL, '0', NULL, NULL, NULL, '16', '30', '2025-10-29 23:06:19', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('278', 'FUIGUERDA', 'Alejandra', NULL, NULL, '0', NULL, NULL, NULL, '16', '30', '2025-10-29 23:06:39', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('279', 'MILNE', 'Jesus', NULL, NULL, '0', NULL, NULL, NULL, '16', '30', '2025-10-29 23:06:52', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('280', 'PAVON PATUSI', 'Pilar', NULL, NULL, '0', NULL, NULL, NULL, '16', '30', '2025-10-29 23:07:09', '2025-11-16 10:26:46', 'Femenino');
INSERT INTO `students` VALUES ('281', 'QUINTRILEF', 'Jeremias', NULL, NULL, '0', NULL, NULL, NULL, '16', '30', '2025-10-29 23:07:25', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('282', 'ROMERO', 'Nicolas', NULL, NULL, '0', NULL, NULL, NULL, '16', '30', '2025-10-29 23:07:38', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('283', 'TRAVERSI', 'Maximiliano', NULL, NULL, '0', NULL, NULL, NULL, '16', '30', '2025-10-29 23:08:18', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('284', 'ARANDA', 'Matias', NULL, NULL, '0', NULL, NULL, NULL, '16', '31', '2025-10-29 23:08:36', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('285', 'EZCURRA', 'Lara', NULL, NULL, '0', NULL, NULL, NULL, '16', '31', '2025-10-29 23:08:54', '2025-11-16 10:26:46', 'Femenino');
INSERT INTO `students` VALUES ('286', 'EZCURRA', 'Valentina', NULL, NULL, '0', NULL, NULL, NULL, '16', '31', '2025-10-29 23:09:15', '2025-11-16 10:26:46', 'Femenino');
INSERT INTO `students` VALUES ('287', 'FAVEZ', 'Bibiana', NULL, NULL, '0', NULL, NULL, NULL, '16', '31', '2025-10-29 23:09:39', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('288', 'FLORES', 'Tomas', NULL, NULL, '0', NULL, NULL, NULL, '16', '31', '2025-10-29 23:10:02', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('289', 'LIPIANTE', 'Florencia', NULL, NULL, '0', NULL, NULL, NULL, '16', '31', '2025-10-29 23:10:19', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('290', 'MEZQUITA', 'Mateo', NULL, NULL, '0', NULL, NULL, NULL, '16', '31', '2025-10-29 23:10:34', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('291', 'STUBBE', 'Thiago', NULL, NULL, '0', NULL, NULL, NULL, '16', '31', '2025-10-29 23:10:48', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('292', 'APELHANZ', 'Santiago', NULL, NULL, '0', NULL, NULL, NULL, '15', '34', '2025-10-29 23:11:16', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('293', 'BADIA', 'Marco', NULL, NULL, '0', NULL, NULL, NULL, '15', '34', '2025-10-29 23:11:33', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('294', 'EPUL', 'Benjamin', NULL, NULL, '0', NULL, NULL, NULL, '15', '34', '2025-10-29 23:11:48', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('295', 'MARTINEZ', 'Santiago', '46699470', '2005-11-24', '0', 'Patagones', 'EP N°8', NULL, '15', '34', '2025-10-29 23:12:00', '2025-11-17 11:47:56', 'Masculino');
INSERT INTO `students` VALUES ('296', 'MORALES', 'Agustin', NULL, NULL, '0', NULL, NULL, NULL, '15', '34', '2025-10-29 23:12:10', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('297', 'SAN MARTIN', 'Yamila', NULL, NULL, '0', NULL, NULL, NULL, '15', '34', '2025-10-29 23:12:23', '2025-11-16 10:26:46', 'Femenino');
INSERT INTO `students` VALUES ('298', 'SCHEPiSI', 'Jeremias', NULL, NULL, '0', NULL, NULL, NULL, '15', '34', '2025-10-29 23:12:40', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('299', 'SWERIDIUK', 'Pablo', NULL, NULL, '0', NULL, NULL, NULL, '15', '34', '2025-10-29 23:12:57', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('300', 'VEGA', 'Amparo', NULL, NULL, '0', NULL, NULL, NULL, '15', '34', '2025-10-29 23:13:08', '2025-11-16 10:26:46', 'Femenino');
INSERT INTO `students` VALUES ('301', 'MULET', 'Sebastian', NULL, NULL, '0', NULL, NULL, NULL, '15', '34', '2025-10-29 23:13:22', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('302', 'LOBOS', 'Jean Pierre', '48843819', '2007-01-19', '0', 'Carmen de patagones', 'Escuela N°21', 'Luis Py 366', '15', '34', '2025-10-29 23:14:08', '2025-10-29 23:59:54', 'Masculino');
INSERT INTO `students` VALUES ('305', 'ORTIZ', 'Sol Maria del Mar', NULL, NULL, '0', NULL, NULL, NULL, '14', '26', '2025-10-31 03:39:24', '2025-11-16 10:38:39', 'Femenino');
INSERT INTO `students` VALUES ('306', 'CUELLO', 'Brisa Morena', '48.731.156', '2008-04-29', '0', 'Viedma', 'EP Nº 2', 'J J Biedma 90', '14', '26', '2025-10-31 03:40:51', '2025-11-16 10:26:46', 'Femenino');
INSERT INTO `students` VALUES ('307', 'DINAMARCA', 'Martina', '46.828.538', '2007-07-29', '0', 'Necochea', 'EP Nº 2', 'S. Juan 270', '14', '26', '2025-10-31 03:41:09', '2025-11-16 10:26:46', 'Femenino');
INSERT INTO `students` VALUES ('308', 'FRANCOLINO', 'Rodrigo Valentina', '48.216.453', '2007-09-25', '0', 'Patagones', 'Paulo VI', 'Zambonini 580', '14', '26', '2025-10-31 03:41:27', '2025-11-16 10:26:46', 'Femenino');
INSERT INTO `students` VALUES ('309', 'LOPEZ', 'Jonathan Mariano', '48.216.487', '2007-08-10', '0', 'Viedma', 'EP Nº 2', 'Julian Murga 703', '14', '26', '2025-10-31 03:41:49', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('310', 'PEREZ', 'Benicio Nazareno', '48.348.815', '2007-11-10', '0', 'Patagones', 'EP Nº 2', 'Cramer 989', '14', '26', '2025-10-31 03:42:19', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('311', 'ALVAREZ', 'Agustina Micaela', '48.216.415', '2007-08-14', '0', 'Patagones', 'EP Nº 14', 'J. Bertolone 585', '14', '25', '2025-10-31 03:43:17', '2025-11-16 10:26:46', 'Femenino');
INSERT INTO `students` VALUES ('312', 'DIETZ CORDOBA', 'Juan Ignacio', NULL, NULL, '0', NULL, NULL, NULL, '14', '25', '2025-10-31 03:43:37', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('313', 'OSSES', 'Tiago Nain', NULL, NULL, '0', NULL, NULL, NULL, '14', '25', '2025-10-31 03:44:05', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('314', 'RIOS', 'Benjamin', NULL, NULL, '0', NULL, NULL, NULL, '14', '25', '2025-10-31 03:44:19', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('315', 'SCHAFER', 'Marylind Belen', NULL, NULL, '0', NULL, NULL, NULL, '14', '25', '2025-10-31 03:44:37', '2025-11-16 10:26:46', 'Femenino');
INSERT INTO `students` VALUES ('316', 'AILLPAN', 'Sharon Gisela', NULL, NULL, '0', NULL, NULL, NULL, '12', '23', '2025-10-31 03:47:17', '2025-11-16 10:26:46', 'Femenino');
INSERT INTO `students` VALUES ('317', 'BONIFACIO', 'Joscelyn Jazmin', NULL, NULL, '0', NULL, NULL, NULL, '12', '23', '2025-10-31 03:47:41', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('318', 'BUENOPIL COLLOMILLA', 'Javier Itamar', NULL, NULL, '0', NULL, NULL, NULL, '12', '23', '2025-10-31 03:48:10', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('319', 'CASTILLO', 'Nerina Yamel', NULL, NULL, '0', NULL, NULL, NULL, '12', '23', '2025-10-31 03:48:30', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('320', 'CUMILAF', 'Morena Eluney', NULL, NULL, '0', NULL, NULL, NULL, '12', '23', '2025-10-31 03:48:46', '2025-11-16 10:26:46', 'Femenino');
INSERT INTO `students` VALUES ('321', 'HENRIQUEZ', 'Nicolas Kevin', NULL, NULL, '0', NULL, NULL, NULL, '12', '23', '2025-10-31 03:49:07', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('322', 'IVANCICH SALLES', 'Bautista Alejandro', NULL, NULL, '0', NULL, NULL, NULL, '12', '23', '2025-10-31 03:49:35', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('323', 'MOYANO', 'Joel Javier', NULL, NULL, '0', NULL, NULL, NULL, '12', '23', '2025-10-31 03:50:01', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('324', 'MARTINEZ', 'Gaston Ferenando', NULL, NULL, '0', NULL, NULL, NULL, '12', '23', '2025-10-31 03:50:19', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('325', 'MUÑOZ RUBIO', 'Samuel Benjamin', NULL, NULL, '0', NULL, NULL, NULL, '12', '23', '2025-10-31 03:50:38', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('326', 'BUENOPIL BLANCO', 'Sofia Pilar', NULL, NULL, '0', NULL, NULL, NULL, '12', '24', '2025-10-31 03:52:14', '2025-11-16 10:26:46', 'Femenino');
INSERT INTO `students` VALUES ('327', 'DENEZIO', 'Florencia', NULL, NULL, '0', NULL, NULL, NULL, '12', '24', '2025-10-31 03:52:28', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('328', 'DESPOS ALAVREZ', 'Jazmin Emilce', NULL, NULL, '0', NULL, NULL, NULL, '12', '24', '2025-10-31 03:52:56', '2025-11-16 10:13:20', 'Masculino');
INSERT INTO `students` VALUES ('329', 'DOBLET', 'Fernanda Sofia', NULL, NULL, '0', NULL, NULL, NULL, '12', '24', '2025-10-31 03:53:11', '2025-11-16 10:26:46', 'Femenino');
INSERT INTO `students` VALUES ('330', 'HUECHE', 'Lucrecia Magali', NULL, NULL, '0', NULL, NULL, NULL, '12', '24', '2025-10-31 03:53:27', '2025-11-16 10:26:46', 'Femenino');
INSERT INTO `students` VALUES ('331', 'PEILMAN', 'Ximena Valentina', NULL, NULL, '0', NULL, NULL, NULL, '12', '24', '2025-10-31 03:53:49', '2025-11-16 10:26:46', 'Femenino');
INSERT INTO `students` VALUES ('332', 'PERALTA', 'Isis Nataly', NULL, NULL, '0', NULL, NULL, NULL, '12', '24', '2025-10-31 03:54:04', '2025-11-16 10:26:46', 'Femenino');
INSERT INTO `students` VALUES ('333', 'PERALTA', 'Melani Morena', NULL, NULL, '0', NULL, NULL, NULL, '12', '24', '2025-10-31 03:54:31', '2025-11-16 10:26:46', 'Femenino');
INSERT INTO `students` VALUES ('334', 'TRIPAILAO JOMYN', 'Mia Noel', NULL, NULL, '0', NULL, NULL, NULL, '12', '24', '2025-10-31 03:54:59', '2025-11-16 10:26:46', 'Femenino');
INSERT INTO `students` VALUES ('335', 'YNALAF', 'Angeles Daiana', NULL, NULL, '0', NULL, NULL, NULL, '12', '24', '2025-10-31 03:55:16', '2025-11-16 10:26:46', 'Femenino');
INSERT INTO `students` VALUES ('336', 'MUÑOZ ROSELLO', 'Valentin', '49.958.643', '2010-03-16', '0', 'Patagones', 'EP Nº 11', 'Colon 55', '9', '17', '2025-11-02 21:23:41', '2025-11-02 21:23:41', 'Masculino');
INSERT INTO `students` VALUES ('337', 'PACHECO DIAZ', 'Lucero Anabel', '48.034.536', '2007-07-17', '0', 'Quilmes', 'EP Nº 8', 'Quinta 113 Mz 113 B', '14', '26', '2025-11-02 22:48:24', '2025-11-16 10:26:46', 'Femenino');
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;

-- --------------------------------------------------------

-- Estructura de tabla para la tabla `subject_positions`

DROP TABLE IF EXISTS `subject_positions`;
CREATE TABLE `subject_positions` (
  `position_id` int(11) NOT NULL AUTO_INCREMENT,
  `teacher_id` int(11) DEFAULT NULL,
  `course_id` int(11) NOT NULL,
  `group_id` int(11) DEFAULT NULL,
  `subject_name` varchar(150) NOT NULL,
  `cupof` varchar(50) DEFAULT NULL,
  `pid` varchar(40) DEFAULT NULL,
  `shift` enum('Mañana','Tarde','Noche') DEFAULT NULL,
  `employment_status` enum('Titular','Provisional','Interino','Suplente') NOT NULL,
  `possession_date` date DEFAULT NULL,
  `hours_modules` varchar(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`position_id`),
  KEY `teacher_id` (`teacher_id`),
  KEY `course_id` (`course_id`),
  KEY `group_id` (`group_id`),
  CONSTRAINT `subject_positions_fk_course` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subject_positions_fk_group` FOREIGN KEY (`group_id`) REFERENCES `groups` (`group_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `subject_positions_fk_teacher` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`teacher_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

-- Estructura de tabla para la tabla `subjects`

DROP TABLE IF EXISTS `subjects`;
CREATE TABLE `subjects` (
  `subject_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `pid` varchar(40) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `turno` enum('mañana','tarde') NOT NULL,
  PRIMARY KEY (`subject_id`)
) ENGINE=InnoDB AUTO_INCREMENT=349 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcado de datos para la tabla `subjects`

LOCK TABLES `subjects` WRITE;
/*!40000 ALTER TABLE `subjects` DISABLE KEYS */;
INSERT INTO `subjects` VALUES ('3', 'Ciencia Sociales', 'CSC', '', '1', 'mañana');
INSERT INTO `subjects` VALUES ('4', 'Ciencia Naturales', 'CNT', '', '1', 'mañana');
INSERT INTO `subjects` VALUES ('5', 'Ingles', 'IGS', '', '1', 'mañana');
INSERT INTO `subjects` VALUES ('6', 'Matematicas', 'MTM', '', '1', 'mañana');
INSERT INTO `subjects` VALUES ('7', 'Practica Del Lenguaje', 'PLG', '', '1', 'mañana');
INSERT INTO `subjects` VALUES ('8', 'Contruccion De La Ciudadania', 'CCD', '', '1', 'mañana');
INSERT INTO `subjects` VALUES ('9', 'Lenguaje Tecnologico', 'LTS', '', '1', 'tarde');
INSERT INTO `subjects` VALUES ('10', 'Sistemas Tecnologicos', 'STS', '', '1', 'tarde');
INSERT INTO `subjects` VALUES ('11', 'Procedimientos Tecnicos', 'PCT', '', '1', 'tarde');
INSERT INTO `subjects` VALUES ('48', 'Ciencia Sociales', 'CSC', '', '2', 'mañana');
INSERT INTO `subjects` VALUES ('49', 'Ciencia Naturales', 'CNT', '', '2', 'mañana');
INSERT INTO `subjects` VALUES ('50', 'Ingles', 'IGS', '', '2', 'mañana');
INSERT INTO `subjects` VALUES ('51', 'Matematicas', 'MTM', '', '2', 'mañana');
INSERT INTO `subjects` VALUES ('52', 'Practica Del Lenguaje', 'PLG', '', '2', 'mañana');
INSERT INTO `subjects` VALUES ('53', 'Contruccion De La Ciudadania', 'CCD', '', '2', 'mañana');
INSERT INTO `subjects` VALUES ('54', 'Lenguaje Tecnologico', 'LTS', '', '2', 'tarde');
INSERT INTO `subjects` VALUES ('55', 'Sistemas Tecnologicos', 'STS', '', '2', 'tarde');
INSERT INTO `subjects` VALUES ('56', 'Procedimientos Tecnicos', 'PCT', '', '2', 'tarde');
INSERT INTO `subjects` VALUES ('57', 'Ciencia Sociales', 'CSC', '', '3', 'mañana');
INSERT INTO `subjects` VALUES ('58', 'Ciencia Naturales', 'CNT', '', '3', 'mañana');
INSERT INTO `subjects` VALUES ('59', 'Ingles', 'IGS', '', '3', 'mañana');
INSERT INTO `subjects` VALUES ('60', 'Matematicas', 'MTM', '', '3', 'mañana');
INSERT INTO `subjects` VALUES ('61', 'Practica Del Lenguaje', 'PLG', '', '3', 'mañana');
INSERT INTO `subjects` VALUES ('62', 'Contruccion De La Ciudadania', 'CCD', '', '3', 'mañana');
INSERT INTO `subjects` VALUES ('63', 'Lenguaje Tecnologico', 'LTS', '', '3', 'tarde');
INSERT INTO `subjects` VALUES ('64', 'Sistemas Tecnologicos', 'STS', '', '3', 'tarde');
INSERT INTO `subjects` VALUES ('65', 'Procedimientos Tecnicos', 'PCT', '', '3', 'tarde');
INSERT INTO `subjects` VALUES ('66', 'Biología', 'BLG', '', '4', 'mañana');
INSERT INTO `subjects` VALUES ('67', 'Fisico Quimica', 'FQA', '', '4', 'mañana');
INSERT INTO `subjects` VALUES ('68', 'Geografía', 'GGF', '', '4', 'mañana');
INSERT INTO `subjects` VALUES ('69', 'Historia', 'HTR', '', '4', 'mañana');
INSERT INTO `subjects` VALUES ('70', 'Ingles', 'IGS', '', '4', 'mañana');
INSERT INTO `subjects` VALUES ('71', 'Matematica', 'MTM', '', '4', 'mañana');
INSERT INTO `subjects` VALUES ('72', 'Practica Del Lenguaje', 'PLG', '', '4', 'mañana');
INSERT INTO `subjects` VALUES ('73', 'Contruccion De La Ciudadania', 'CCD', '', '4', 'mañana');
INSERT INTO `subjects` VALUES ('74', 'Lenguaje Tecnologico', 'LTE', '', '4', 'tarde');
INSERT INTO `subjects` VALUES ('75', 'Sistemas Tecnologicos', 'ST2', '', '4', 'tarde');
INSERT INTO `subjects` VALUES ('76', 'Procedimientos Tecnicos', 'PCE', '', '4', 'tarde');
INSERT INTO `subjects` VALUES ('77', 'Biología', 'BLG', '', '5', 'mañana');
INSERT INTO `subjects` VALUES ('78', 'Fisico Quimica', 'FQA', '', '5', 'mañana');
INSERT INTO `subjects` VALUES ('79', 'Geografía', 'GGF', '', '5', 'mañana');
INSERT INTO `subjects` VALUES ('80', 'Historia', 'HTR', '', '5', 'mañana');
INSERT INTO `subjects` VALUES ('81', 'Ingles', 'IGS', '', '5', 'mañana');
INSERT INTO `subjects` VALUES ('82', 'Matematica', 'MTM', '', '5', 'mañana');
INSERT INTO `subjects` VALUES ('83', 'Practica Del Lenguaje', 'PLG', '', '5', 'mañana');
INSERT INTO `subjects` VALUES ('84', 'Contruccion De La Ciudadania', 'CCD', '', '5', 'mañana');
INSERT INTO `subjects` VALUES ('85', 'Lenguaje Tecnologico', 'LTE', '', '5', 'tarde');
INSERT INTO `subjects` VALUES ('86', 'Sistemas Tecnologicos', 'ST2', '', '5', 'tarde');
INSERT INTO `subjects` VALUES ('87', 'Procedimientos Tecnicos', 'PCE', '', '5', 'tarde');
INSERT INTO `subjects` VALUES ('88', 'Biología', 'BLG', '', '6', 'mañana');
INSERT INTO `subjects` VALUES ('89', 'Fisico Quimica', 'FQA', '', '6', 'mañana');
INSERT INTO `subjects` VALUES ('90', 'Geografía', 'GGF', '', '6', 'mañana');
INSERT INTO `subjects` VALUES ('91', 'Historia', 'HTR', '', '6', 'mañana');
INSERT INTO `subjects` VALUES ('92', 'Ingles', 'IGS', '', '6', 'mañana');
INSERT INTO `subjects` VALUES ('93', 'Matematica', 'MTM', '', '6', 'mañana');
INSERT INTO `subjects` VALUES ('94', 'Practica Del Lenguaje', 'PLG', '', '6', 'mañana');
INSERT INTO `subjects` VALUES ('95', 'Contruccion De La Ciudadania', 'CCD', '', '6', 'mañana');
INSERT INTO `subjects` VALUES ('96', 'Lenguaje Tecnologico', 'LTE', '', '6', 'tarde');
INSERT INTO `subjects` VALUES ('97', 'Sistemas Tecnologicos', 'ST2', '', '6', 'tarde');
INSERT INTO `subjects` VALUES ('98', 'Procedimientos Tecnicos', 'PCE', '', '6', 'tarde');
INSERT INTO `subjects` VALUES ('99', 'Biología', 'BLG', '', '7', 'mañana');
INSERT INTO `subjects` VALUES ('100', 'Fisico Quimica', 'FQA', '', '7', 'mañana');
INSERT INTO `subjects` VALUES ('101', 'Geografía', 'GGF', '', '7', 'mañana');
INSERT INTO `subjects` VALUES ('102', 'Historia', 'HTR', '', '7', 'mañana');
INSERT INTO `subjects` VALUES ('103', 'Ingles', 'IGS', '', '7', 'mañana');
INSERT INTO `subjects` VALUES ('104', 'Matematica', 'MTM', '', '7', 'mañana');
INSERT INTO `subjects` VALUES ('105', 'Practica Del Lenguaje', 'PLG', '', '7', 'mañana');
INSERT INTO `subjects` VALUES ('106', 'Contruccion De La Ciudadania', 'CCD', '', '7', 'mañana');
INSERT INTO `subjects` VALUES ('107', 'Lenguaje Tecnologico', 'LTE', '', '7', 'tarde');
INSERT INTO `subjects` VALUES ('108', 'Sistemas Tecnologicos', 'ST2', '', '7', 'tarde');
INSERT INTO `subjects` VALUES ('109', 'Procedimientos Tecnicos', 'PCE', '', '7', 'tarde');
INSERT INTO `subjects` VALUES ('110', 'Biología', 'BLG', '', '8', 'mañana');
INSERT INTO `subjects` VALUES ('111', 'Fisico Quimica', 'FQA', '', '8', 'mañana');
INSERT INTO `subjects` VALUES ('112', 'Geografía', 'GGF', '', '8', 'mañana');
INSERT INTO `subjects` VALUES ('113', 'Historia', 'HTR', '', '8', 'mañana');
INSERT INTO `subjects` VALUES ('114', 'Ingles', 'IGS', '', '8', 'mañana');
INSERT INTO `subjects` VALUES ('115', 'Matematica', 'MTM', '', '8', 'mañana');
INSERT INTO `subjects` VALUES ('116', 'Practica Del Lenguaje', 'PLG', '', '8', 'mañana');
INSERT INTO `subjects` VALUES ('117', 'Contruccion De La Ciudadania', 'CCD', '', '8', 'mañana');
INSERT INTO `subjects` VALUES ('118', 'Lenguaje Tecnologico', 'LTE', '', '8', 'tarde');
INSERT INTO `subjects` VALUES ('119', 'Sistemas Tecnologicos', 'ST2', '', '8', 'tarde');
INSERT INTO `subjects` VALUES ('120', 'Procedimientos Tecnicos', 'PCE', '', '8', 'tarde');
INSERT INTO `subjects` VALUES ('122', 'Fisica', 'FIS', '', '9', 'mañana');
INSERT INTO `subjects` VALUES ('123', 'Geografía', 'GGF', '', '9', 'mañana');
INSERT INTO `subjects` VALUES ('124', 'Historia', 'HTR', '', '9', 'mañana');
INSERT INTO `subjects` VALUES ('125', 'Ingles', 'IGS', '', '9', 'mañana');
INSERT INTO `subjects` VALUES ('126', 'Matematica de Clico Superior', 'MCS', '', '9', 'mañana');
INSERT INTO `subjects` VALUES ('127', 'Literatura', 'LIT', '', '9', 'mañana');
INSERT INTO `subjects` VALUES ('132', 'Salud y Adolescencia', 'SYA', '', '9', 'mañana');
INSERT INTO `subjects` VALUES ('133', 'Química', 'QMC', '', '9', 'mañana');
INSERT INTO `subjects` VALUES ('134', 'Tecnologias Electronicas', 'TEE', '', '9', 'mañana');
INSERT INTO `subjects` VALUES ('135', 'Laboratorio De Programacion', 'LPR', '', '9', 'tarde');
INSERT INTO `subjects` VALUES ('136', 'Laboratorio De Hardware', 'LHW', '', '9', 'tarde');
INSERT INTO `subjects` VALUES ('137', 'Laboratorio De Sistemas Operativos', 'LSO', '', '9', 'tarde');
INSERT INTO `subjects` VALUES ('138', 'Laboratorio De Aplicaciones', 'LAP', '', '9', 'tarde');
INSERT INTO `subjects` VALUES ('165', 'Fisica', 'FIS', '', '10', 'mañana');
INSERT INTO `subjects` VALUES ('166', 'Geografía', 'GGF', '', '10', 'mañana');
INSERT INTO `subjects` VALUES ('167', 'Historia', 'HTR', '', '10', 'mañana');
INSERT INTO `subjects` VALUES ('168', 'Ingles', 'IGS', '', '10', 'mañana');
INSERT INTO `subjects` VALUES ('169', 'Matematica de Clico Superior', 'MCS', '', '10', 'mañana');
INSERT INTO `subjects` VALUES ('170', 'Literatura', 'LIT', '', '10', 'mañana');
INSERT INTO `subjects` VALUES ('171', 'Salud y Adolescencia', 'SYA', '', '10', 'mañana');
INSERT INTO `subjects` VALUES ('172', 'Química', 'QMC', '', '10', 'mañana');
INSERT INTO `subjects` VALUES ('173', 'Tecnologias Electronicas', 'TEE', '', '10', 'mañana');
INSERT INTO `subjects` VALUES ('178', 'Conocimiento De Los Materiales', 'CMM', '', '10', 'tarde');
INSERT INTO `subjects` VALUES ('179', 'Dibujo Tecnológico', 'DTM', '', '10', 'tarde');
INSERT INTO `subjects` VALUES ('180', 'Interpretación de Obra', 'IAN', '', '10', 'tarde');
INSERT INTO `subjects` VALUES ('181', 'Planificación de Obra', 'POB', '', '10', 'tarde');
INSERT INTO `subjects` VALUES ('182', 'Sistemas Constructivos', 'SCO', '', '10', 'tarde');
INSERT INTO `subjects` VALUES ('183', 'Proyecto', 'QRP', '', '10', 'tarde');
INSERT INTO `subjects` VALUES ('239', 'Fisica', 'FIS', '', '11', 'mañana');
INSERT INTO `subjects` VALUES ('240', 'Geografía', 'GGF', '', '11', 'mañana');
INSERT INTO `subjects` VALUES ('241', 'Historia', 'HTR', '', '11', 'mañana');
INSERT INTO `subjects` VALUES ('242', 'Ingles', 'IGS', '', '11', 'mañana');
INSERT INTO `subjects` VALUES ('243', 'Analisis Matematico', 'AM', '', '11', 'mañana');
INSERT INTO `subjects` VALUES ('244', 'Literatura', 'LIT', '', '11', 'mañana');
INSERT INTO `subjects` VALUES ('245', 'Politica y Ciudadania', 'PYC', '', '11', 'mañana');
INSERT INTO `subjects` VALUES ('246', 'Modelos Y Sistemas', 'MYS', '', '11', 'mañana');
INSERT INTO `subjects` VALUES ('247', 'Laboratorio De Base De Datos', '', '', '11', 'tarde');
INSERT INTO `subjects` VALUES ('248', 'Laboratorio De Programacion', 'LPR', '', '11', 'tarde');
INSERT INTO `subjects` VALUES ('249', 'Laboratorio De Diseño Web', 'LDW', '', '11', 'tarde');
INSERT INTO `subjects` VALUES ('250', 'Laboratorio De Sistemas Operativos', 'LSO', '', '11', 'tarde');
INSERT INTO `subjects` VALUES ('251', 'laboratorio De Redes Informaticas', 'LRI', '', '11', 'tarde');
INSERT INTO `subjects` VALUES ('252', 'Base de Datos', 'BDD', '', '11', 'mañana');
INSERT INTO `subjects` VALUES ('253', 'Sistemas Digitales', 'SD', '', '11', 'mañana');
INSERT INTO `subjects` VALUES ('255', 'Fisica', 'FIS', '', '12', 'mañana');
INSERT INTO `subjects` VALUES ('256', 'Geografía', 'GGF', '', '12', 'mañana');
INSERT INTO `subjects` VALUES ('257', 'Historia', 'HTR', '', '12', 'mañana');
INSERT INTO `subjects` VALUES ('258', 'Ingles', 'IGS', '', '12', 'mañana');
INSERT INTO `subjects` VALUES ('259', 'Analisis Matematico', 'AM', '', '12', 'mañana');
INSERT INTO `subjects` VALUES ('260', 'Literatura', 'LIT', '', '12', 'mañana');
INSERT INTO `subjects` VALUES ('261', 'Politica y Ciudadania', 'PYC', '', '12', 'mañana');
INSERT INTO `subjects` VALUES ('268', 'Base de Datos', 'BDD', '', '12', 'mañana');
INSERT INTO `subjects` VALUES ('270', 'Resistencia y Ensayos de Materiales', 'REM', '', '12', 'mañana');
INSERT INTO `subjects` VALUES ('271', 'Instalaciones Electricas', 'IE', '', '12', 'mañana');
INSERT INTO `subjects` VALUES ('272', 'Proyecto', 'ORP', '', '12', 'tarde');
INSERT INTO `subjects` VALUES ('273', 'Sistemas Constructivos', 'SCO', '', '12', 'tarde');
INSERT INTO `subjects` VALUES ('274', 'Materiales de Obra', 'MAO', '', '12', 'tarde');
INSERT INTO `subjects` VALUES ('275', 'Documentacion Tecnica', 'DOT', '', '12', 'tarde');
INSERT INTO `subjects` VALUES ('279', 'Ingles', 'IGS', '', '13', 'mañana');
INSERT INTO `subjects` VALUES ('281', 'Literatura', 'LIT', '', '13', 'mañana');
INSERT INTO `subjects` VALUES ('283', 'Laboratorio De Aplicaciones Web Estatico', '', '', '13', 'tarde');
INSERT INTO `subjects` VALUES ('285', 'Laboratorio De Programacion', 'LPR', '', '13', 'tarde');
INSERT INTO `subjects` VALUES ('286', 'Desarrollo de Aplicaciones Web Dinamica', 'DWD', '', '13', 'tarde');
INSERT INTO `subjects` VALUES ('288', 'laboratorio De Procesos Industriales', 'LPI', '', '13', 'tarde');
INSERT INTO `subjects` VALUES ('290', 'Sistemas Digitales', 'SD', '', '13', 'mañana');
INSERT INTO `subjects` VALUES ('291', 'Filosofía', 'FIA', '', '13', 'mañana');
INSERT INTO `subjects` VALUES ('292', 'Arte', 'RTE', '', '13', 'mañana');
INSERT INTO `subjects` VALUES ('293', 'Matematica Discreta', 'MDI', '', '13', 'mañana');
INSERT INTO `subjects` VALUES ('294', 'Sistemas de Gestion y Autogetion', 'SGA', '', '13', 'mañana');
INSERT INTO `subjects` VALUES ('295', 'Seguridad Informatica', 'INS', '', '13', 'mañana');
INSERT INTO `subjects` VALUES ('296', 'Derechos del Trabajo', 'DET', '', '13', 'mañana');
INSERT INTO `subjects` VALUES ('297', 'Ingles', 'IGS', '', '14', 'mañana');
INSERT INTO `subjects` VALUES ('298', 'Literatura', 'LIT', '', '14', 'mañana');
INSERT INTO `subjects` VALUES ('304', 'Filosofía', 'FIA', '', '14', 'mañana');
INSERT INTO `subjects` VALUES ('305', 'Arte', 'RTE', '', '14', 'mañana');
INSERT INTO `subjects` VALUES ('306', 'Matematica Aplicada', 'MAP', '', '14', 'mañana');
INSERT INTO `subjects` VALUES ('309', 'Derechos del Trabajo', 'DET', '', '14', 'mañana');
INSERT INTO `subjects` VALUES ('310', 'Estructuras', 'ESR', '', '14', 'mañana');
INSERT INTO `subjects` VALUES ('311', 'Instalaciones Saniarias y de Gas', 'ISI', '', '14', 'mañana');
INSERT INTO `subjects` VALUES ('312', 'Proyecto de instalaciones', 'PIN', '', '14', 'tarde');
INSERT INTO `subjects` VALUES ('313', 'Direccion de ejecucion de instalaciones', 'DEJ', '', '14', 'tarde');
INSERT INTO `subjects` VALUES ('314', 'Sistemas Constructivos', 'SCO', '', '14', 'tarde');
INSERT INTO `subjects` VALUES ('315', 'Proyecto', 'ORP', '', '14', 'tarde');
INSERT INTO `subjects` VALUES ('316', 'Emprendimientos Productivos y de Desarrollo Local', 'TECPREM7', '', '15', 'mañana');
INSERT INTO `subjects` VALUES ('317', 'Evaluacion De Proyectos', 'TECPREV7', '', '15', 'tarde');
INSERT INTO `subjects` VALUES ('318', 'Organizacion y Metodos', 'OYM', '', '15', 'mañana');
INSERT INTO `subjects` VALUES ('319', 'proyecto diseño e implementacion de sistemas computacionales', 'TECPRPYD7', '', '15', 'tarde');
INSERT INTO `subjects` VALUES ('320', 'Proyecto de implementacion de sitios web dinamicos', 'PWD', '', '15', 'tarde');
INSERT INTO `subjects` VALUES ('321', 'Practicas Profesionalizantes Del Sector Informatico', 'TECPRPP7', '', '15', 'mañana');
INSERT INTO `subjects` VALUES ('322', 'Modelos Y Sistemas', 'MYS', '', '15', 'mañana');
INSERT INTO `subjects` VALUES ('323', 'Proyecto de desarrollo de software para plataformas moviles', 'TECPRPY7', '', '15', 'mañana');
INSERT INTO `subjects` VALUES ('324', 'Estructuras', 'ESR', '', '16', 'mañana');
INSERT INTO `subjects` VALUES ('325', 'Emprendimientos Productivos y de Desarrollo Local', 'ZTECMMEM7', '', '16', 'mañana');
INSERT INTO `subjects` VALUES ('326', 'Instalaciones de Acondicionamiento del Aire', 'ZTECMMIN7', '', '16', 'mañana');
INSERT INTO `subjects` VALUES ('327', 'Proyecto Final', 'PRF', '', '16', 'mañana');
INSERT INTO `subjects` VALUES ('328', 'Ejercicio Profesional de la Construccion', 'EPC', '', '16', 'mañana');
INSERT INTO `subjects` VALUES ('329', 'Direccion de Obra', 'TECMMDI7', '', '16', 'mañana');
INSERT INTO `subjects` VALUES ('330', 'Practicas Profesionalizantes Del Sector Contrucciones Edilicias', 'ZTECMMPP7', '', '16', 'mañana');
INSERT INTO `subjects` VALUES ('331', 'Musica', '', '', '1', 'mañana');
INSERT INTO `subjects` VALUES ('332', 'Musica', '', '', '2', 'mañana');
INSERT INTO `subjects` VALUES ('333', 'Musica', '', '', '3', 'mañana');
INSERT INTO `subjects` VALUES ('334', 'Educacion Fisica', '', '', '1', 'mañana');
INSERT INTO `subjects` VALUES ('335', 'Educacion Fisica', '', '', '2', 'mañana');
INSERT INTO `subjects` VALUES ('336', 'Educacion Fisica', '', '', '3', 'mañana');
INSERT INTO `subjects` VALUES ('337', 'Educacion Fisica', '', '', '4', 'mañana');
INSERT INTO `subjects` VALUES ('338', 'Educacion Fisica', '', '', '5', 'mañana');
INSERT INTO `subjects` VALUES ('339', 'Educacion Fisica', '', '', '6', 'mañana');
INSERT INTO `subjects` VALUES ('340', 'Educacion Fisica', '', '', '7', 'mañana');
INSERT INTO `subjects` VALUES ('341', 'Educacion Fisica', '', '', '8', 'mañana');
INSERT INTO `subjects` VALUES ('342', 'Educacion Fisica', '', '', '10', 'mañana');
INSERT INTO `subjects` VALUES ('343', 'Educacion Fisica', '', '', '9', 'mañana');
INSERT INTO `subjects` VALUES ('344', 'Educacion Fisica', '', '', '12', 'mañana');
INSERT INTO `subjects` VALUES ('345', 'Educacion Fisica', '', '', '11', 'mañana');
INSERT INTO `subjects` VALUES ('346', 'Educacion Fisica', '', '', '14', 'mañana');
INSERT INTO `subjects` VALUES ('347', 'Educacion Fisica', '', '', '13', 'mañana');
/*!40000 ALTER TABLE `subjects` ENABLE KEYS */;
UNLOCK TABLES;

-- --------------------------------------------------------

-- Estructura de tabla para la tabla `teacher_attendance`

DROP TABLE IF EXISTS `teacher_attendance`;
CREATE TABLE `teacher_attendance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `teacher_id` int(11) NOT NULL,
  `schedule_id` int(11) NOT NULL,
  `attendance_date` datetime NOT NULL,
  `status` enum('present','absent') NOT NULL,
  `justification` tinyint(1) DEFAULT 0,
  `justification_file` varchar(255) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `teacher_id` (`teacher_id`),
  KEY `schedule_id` (`schedule_id`),
  CONSTRAINT `teacher_attendance_ibfk_1` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`teacher_id`),
  CONSTRAINT `teacher_attendance_ibfk_2` FOREIGN KEY (`schedule_id`) REFERENCES `schedules` (`schedule_id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcado de datos para la tabla `teacher_attendance`

LOCK TABLES `teacher_attendance` WRITE;
/*!40000 ALTER TABLE `teacher_attendance` DISABLE KEYS */;
INSERT INTO `teacher_attendance` VALUES ('1', '83', '225', '2025-11-18 00:00:00', 'absent', '0', NULL, '2025-11-18 10:53:07');
INSERT INTO `teacher_attendance` VALUES ('2', '114', '219', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:43:58');
INSERT INTO `teacher_attendance` VALUES ('3', '75', '240', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:44:39');
INSERT INTO `teacher_attendance` VALUES ('4', '62', '252', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:45:16');
INSERT INTO `teacher_attendance` VALUES ('5', '165', '256', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:45:31');
INSERT INTO `teacher_attendance` VALUES ('6', '174', '265', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:45:50');
INSERT INTO `teacher_attendance` VALUES ('7', '87', '269', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:46:05');
INSERT INTO `teacher_attendance` VALUES ('8', '153', '268', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:46:13');
INSERT INTO `teacher_attendance` VALUES ('9', '83', '273', '2025-11-18 00:00:00', 'absent', '0', NULL, '2025-11-18 11:47:03');
INSERT INTO `teacher_attendance` VALUES ('10', '16', '434', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:47:48');
INSERT INTO `teacher_attendance` VALUES ('11', '129', '433', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:47:58');
INSERT INTO `teacher_attendance` VALUES ('12', '71', '295', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:49:26');
INSERT INTO `teacher_attendance` VALUES ('13', '167', '288', '2025-11-18 00:00:00', 'absent', '0', NULL, '2025-11-18 11:49:32');
INSERT INTO `teacher_attendance` VALUES ('14', '176', '281', '2025-11-18 00:00:00', 'absent', '0', NULL, '2025-11-18 11:49:41');
INSERT INTO `teacher_attendance` VALUES ('15', '66', '103', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:50:11');
INSERT INTO `teacher_attendance` VALUES ('16', '28', '104', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:50:57');
INSERT INTO `teacher_attendance` VALUES ('17', '152', '302', '2025-11-18 00:00:00', 'absent', '1', NULL, '2025-11-18 11:51:18');
INSERT INTO `teacher_attendance` VALUES ('18', '124', '93', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:51:28');
INSERT INTO `teacher_attendance` VALUES ('19', '51', '94', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:51:34');
INSERT INTO `teacher_attendance` VALUES ('20', '108', '306', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:51:49');
INSERT INTO `teacher_attendance` VALUES ('21', '55', '307', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:52:03');
INSERT INTO `teacher_attendance` VALUES ('22', '157', '123', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:52:45');
INSERT INTO `teacher_attendance` VALUES ('23', '87', '124', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:55:08');
INSERT INTO `teacher_attendance` VALUES ('24', '70', '335', '2025-11-18 00:00:00', 'absent', '0', NULL, '2025-11-18 11:55:17');
INSERT INTO `teacher_attendance` VALUES ('25', '70', '334', '2025-11-18 00:00:00', 'absent', '0', NULL, '2025-11-18 11:55:22');
INSERT INTO `teacher_attendance` VALUES ('26', '68', '341', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:55:36');
INSERT INTO `teacher_attendance` VALUES ('27', '110', '326', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:55:46');
INSERT INTO `teacher_attendance` VALUES ('28', '111', '366', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:56:11');
INSERT INTO `teacher_attendance` VALUES ('29', '111', '367', '2025-11-18 00:00:00', 'absent', '0', NULL, '2025-11-18 11:56:17');
INSERT INTO `teacher_attendance` VALUES ('30', '6', '360', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:56:25');
INSERT INTO `teacher_attendance` VALUES ('31', '48', '399', '2025-11-18 00:00:00', 'absent', '0', NULL, '2025-11-18 11:56:53');
INSERT INTO `teacher_attendance` VALUES ('32', '179', '407', '2025-11-18 00:00:00', 'absent', '0', NULL, '2025-11-18 11:57:26');
INSERT INTO `teacher_attendance` VALUES ('33', '53', '406', '2025-11-18 00:00:00', 'absent', '0', NULL, '2025-11-18 11:57:31');
/*!40000 ALTER TABLE `teacher_attendance` ENABLE KEYS */;
UNLOCK TABLES;

-- --------------------------------------------------------

-- Estructura de tabla para la tabla `teacher_files`

DROP TABLE IF EXISTS `teacher_files`;
CREATE TABLE `teacher_files` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `teacher_id` int(11) NOT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `file_path` varchar(255) DEFAULT NULL,
  `uploaded_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `teacher_id` (`teacher_id`),
  CONSTRAINT `teacher_files_ibfk_1` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`teacher_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

-- Estructura de tabla para la tabla `teacher_student_attendance`

DROP TABLE IF EXISTS `teacher_student_attendance`;
CREATE TABLE `teacher_student_attendance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `teacher_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `schedule_id` int(11) NOT NULL,
  `attendance_date` datetime NOT NULL,
  `status` enum('present','absent') NOT NULL,
  `justification` tinyint(1) DEFAULT 0,
  `justification_file` varchar(255) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `teacher_id` (`teacher_id`,`student_id`,`schedule_id`),
  KEY `student_id` (`student_id`),
  KEY `schedule_id` (`schedule_id`),
  CONSTRAINT `teacher_student_attendance_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `teacher_student_attendance_ibfk_2` FOREIGN KEY (`schedule_id`) REFERENCES `schedules` (`schedule_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `teacher_student_attendance_ibfk_3` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`teacher_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcado de datos para la tabla `teacher_student_attendance`

LOCK TABLES `teacher_student_attendance` WRITE;
/*!40000 ALTER TABLE `teacher_student_attendance` DISABLE KEYS */;
INSERT INTO `teacher_student_attendance` VALUES ('1', '4', '292', '451', '2025-11-18 00:00:00', 'absent', '0', NULL, '2025-11-18 11:23:34');
INSERT INTO `teacher_student_attendance` VALUES ('2', '4', '293', '451', '2025-11-18 00:00:00', 'absent', '0', NULL, '2025-11-18 11:23:34');
INSERT INTO `teacher_student_attendance` VALUES ('3', '4', '294', '451', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:23:34');
INSERT INTO `teacher_student_attendance` VALUES ('4', '4', '295', '451', '2025-11-18 00:00:00', 'absent', '0', NULL, '2025-11-18 11:23:34');
INSERT INTO `teacher_student_attendance` VALUES ('5', '4', '296', '451', '2025-11-18 00:00:00', 'absent', '0', NULL, '2025-11-18 11:23:34');
INSERT INTO `teacher_student_attendance` VALUES ('6', '4', '297', '451', '2025-11-18 00:00:00', 'absent', '0', NULL, '2025-11-18 11:23:34');
INSERT INTO `teacher_student_attendance` VALUES ('7', '4', '298', '451', '2025-11-18 00:00:00', 'absent', '0', NULL, '2025-11-18 11:23:34');
INSERT INTO `teacher_student_attendance` VALUES ('8', '4', '299', '451', '2025-11-18 00:00:00', 'absent', '0', NULL, '2025-11-18 11:23:34');
INSERT INTO `teacher_student_attendance` VALUES ('9', '4', '300', '451', '2025-11-18 00:00:00', 'absent', '0', NULL, '2025-11-18 11:23:34');
INSERT INTO `teacher_student_attendance` VALUES ('10', '4', '301', '451', '2025-11-18 00:00:00', 'absent', '0', NULL, '2025-11-18 11:23:34');
INSERT INTO `teacher_student_attendance` VALUES ('11', '4', '302', '451', '2025-11-18 00:00:00', 'present', '0', NULL, '2025-11-18 11:23:34');
/*!40000 ALTER TABLE `teacher_student_attendance` ENABLE KEYS */;
UNLOCK TABLES;

-- --------------------------------------------------------

-- Estructura de tabla para la tabla `teachers`

DROP TABLE IF EXISTS `teachers`;
CREATE TABLE `teachers` (
  `teacher_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `cuil` varchar(20) DEFAULT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `address` varchar(150) DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `abc_email` varchar(150) DEFAULT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  PRIMARY KEY (`teacher_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `teachers_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=184 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcado de datos para la tabla `teachers`

LOCK TABLES `teachers` WRITE;
/*!40000 ALTER TABLE `teachers` DISABLE KEYS */;
INSERT INTO `teachers` VALUES ('1', NULL, '27266456722', '', '', '1988-07-31', '', 'MAYDA', 'AGUIRRE');
INSERT INTO `teachers` VALUES ('2', NULL, '27178381569', '', '', '1966-04-13', '', 'ISABEL', 'ANTINORI');
INSERT INTO `teachers` VALUES ('3', NULL, NULL, NULL, NULL, NULL, NULL, 'PABLO JESÚS', 'ARRIZABALAGA');
INSERT INTO `teachers` VALUES ('4', NULL, NULL, NULL, NULL, NULL, NULL, 'AGUSTIN', 'AVILA');
INSERT INTO `teachers` VALUES ('5', NULL, NULL, NULL, NULL, NULL, NULL, 'LEANDRO', 'BORBIN');
INSERT INTO `teachers` VALUES ('6', NULL, '27249429916', '', '', '1977-06-07', '', 'MARIANELA', 'BEZICH');
INSERT INTO `teachers` VALUES ('7', NULL, NULL, NULL, NULL, NULL, NULL, 'MAURA', 'BIANCA');
INSERT INTO `teachers` VALUES ('8', NULL, '27219731685', '', '', '1971-01-05', '', 'ANDREA', 'CABRERA');
INSERT INTO `teachers` VALUES ('9', NULL, '27215035595', '', '', '1970-03-12', '', 'MARIANA', 'CAMOU');
INSERT INTO `teachers` VALUES ('10', NULL, NULL, NULL, NULL, NULL, NULL, 'SEBASTIAN', 'CAPITAN');
INSERT INTO `teachers` VALUES ('11', NULL, NULL, NULL, NULL, NULL, NULL, 'DANIELA', 'CICCIOLI');
INSERT INTO `teachers` VALUES ('12', NULL, NULL, NULL, NULL, NULL, NULL, 'FEDERICO', 'CUELLO');
INSERT INTO `teachers` VALUES ('13', NULL, '27327948356', '', '', '1987-04-19', '', 'MARIA ALFONSINA', 'CONSTANTINO');
INSERT INTO `teachers` VALUES ('14', NULL, NULL, NULL, NULL, NULL, NULL, 'CRISTIAN', 'COÑOMILLA');
INSERT INTO `teachers` VALUES ('15', NULL, NULL, NULL, NULL, NULL, NULL, 'DIANA', 'CORRALGUR');
INSERT INTO `teachers` VALUES ('16', NULL, NULL, NULL, NULL, NULL, NULL, 'MARIA DE LOS ANGELES', 'DAVERIO');
INSERT INTO `teachers` VALUES ('17', NULL, '23218625169', '', '', '1971-01-13', '', 'PABLO', 'DE ABAJO');
INSERT INTO `teachers` VALUES ('18', NULL, NULL, NULL, NULL, NULL, NULL, 'CLAUDIO', 'DIUK');
INSERT INTO `teachers` VALUES ('19', NULL, '20290682313', '', '', '1981-10-26', '', 'MARIO JESUS', 'DUARTE');
INSERT INTO `teachers` VALUES ('20', NULL, '23241346714', '', '', '1974-12-26', '', 'NATALIA', 'ECHARREN');
INSERT INTO `teachers` VALUES ('21', NULL, '27262786612', '', '', '1977-12-27', '', 'PATRICIA', 'ESCALADA');
INSERT INTO `teachers` VALUES ('22', NULL, '27377855901', '', '', '1993-11-30', '', 'JULIANA', 'FATTUTA');
INSERT INTO `teachers` VALUES ('23', NULL, '27283843438', '', '', '1980-09-01', '', 'ANDREA', 'FERRARI');
INSERT INTO `teachers` VALUES ('24', NULL, NULL, NULL, NULL, NULL, NULL, 'ABIGAIL', 'FIORDA');
INSERT INTO `teachers` VALUES ('25', NULL, '27263816647', '', '', '1977-09-09', '', 'GIANNINA', 'FUMAROLA');
INSERT INTO `teachers` VALUES ('26', NULL, '27278286768', '', '', '1980-04-08', '', 'LILIANA', 'GRAZIOLI');
INSERT INTO `teachers` VALUES ('27', NULL, NULL, NULL, NULL, NULL, NULL, 'LUDMILA', 'GUIDI');
INSERT INTO `teachers` VALUES ('28', NULL, '27327948771', '', '', '1985-07-31', '', 'MARIANELA', 'IBAÑEZ');
INSERT INTO `teachers` VALUES ('29', NULL, '27314551465', '', '', '1985-06-07', '', 'DANIELA', 'IGUACEL');
INSERT INTO `teachers` VALUES ('30', NULL, NULL, NULL, NULL, NULL, NULL, 'ANEL', 'ILLANER');
INSERT INTO `teachers` VALUES ('31', NULL, '27402246753', '', '', '1997-07-25', '', 'ANTONELA', 'JARA');
INSERT INTO `teachers` VALUES ('32', NULL, NULL, NULL, NULL, NULL, NULL, 'SAMANTA', 'JORGE');
INSERT INTO `teachers` VALUES ('33', NULL, NULL, NULL, NULL, NULL, NULL, 'LEONARDO', 'KAUFMAN');
INSERT INTO `teachers` VALUES ('34', NULL, '27238512463', '', '', '1974-03-21', '', 'PAULA', 'KUNUSCH');
INSERT INTO `teachers` VALUES ('35', NULL, '27306983453', '', '', '1984-04-30', '', 'VANINA', 'LAMAS');
INSERT INTO `teachers` VALUES ('36', NULL, '27273071224', '', '', '1979-04-05', '', 'PAULINA', 'LEDESMA');
INSERT INTO `teachers` VALUES ('37', NULL, NULL, NULL, NULL, NULL, NULL, 'LAURA', 'LEON');
INSERT INTO `teachers` VALUES ('38', NULL, NULL, NULL, NULL, NULL, NULL, 'CARINA', 'LIDIA');
INSERT INTO `teachers` VALUES ('39', NULL, '27145275666', '', '', '1961-03-18', '', 'CARINA LIDIA', 'MALASPINA');
INSERT INTO `teachers` VALUES ('40', NULL, NULL, NULL, NULL, NULL, NULL, 'GUILLERMO', 'MATTIO');
INSERT INTO `teachers` VALUES ('41', NULL, NULL, NULL, NULL, NULL, NULL, 'NANCY', 'MICHELENA');
INSERT INTO `teachers` VALUES ('42', NULL, NULL, NULL, NULL, NULL, NULL, 'PAMELA', 'MISSIMER');
INSERT INTO `teachers` VALUES ('43', NULL, '27332296456', '', '', '1988-06-10', '', 'GLENDA', 'MORALES RIOS');
INSERT INTO `teachers` VALUES ('44', NULL, '27278299932', '', '', '1981-07-19', '', 'CARLA', 'MULLER');
INSERT INTO `teachers` VALUES ('45', NULL, '20278287069', '', '', '1980-04-18', '', 'BRUNO', 'AMICO');
INSERT INTO `teachers` VALUES ('46', NULL, NULL, NULL, NULL, NULL, NULL, 'LAZARO', 'ANTON MILTITTE');
INSERT INTO `teachers` VALUES ('47', NULL, NULL, NULL, NULL, NULL, NULL, 'DANIEL', 'ARROCA');
INSERT INTO `teachers` VALUES ('48', NULL, '27278286350', '', '', '1980-02-27', '', 'NATALIA', 'BENITEZ');
INSERT INTO `teachers` VALUES ('49', NULL, '27213874085', '', '', '1970-07-23', '', 'MIRIAM', 'BEZIC');
INSERT INTO `teachers` VALUES ('50', NULL, NULL, NULL, NULL, NULL, NULL, 'DENISE', 'BERGESSE');
INSERT INTO `teachers` VALUES ('51', NULL, '20323621811', '', '', '1986-11-10', '', 'PABLO', 'CAFERATTA');
INSERT INTO `teachers` VALUES ('52', NULL, NULL, NULL, NULL, NULL, NULL, 'LUIS', 'CALA');
INSERT INTO `teachers` VALUES ('53', NULL, '27373698143', '', '', '1993-04-07', '', 'MALENA', 'CAMPOS');
INSERT INTO `teachers` VALUES ('54', NULL, '23346660929', '', '', '1989-07-27', '', 'IVAN', 'CEVOLI');
INSERT INTO `teachers` VALUES ('55', NULL, '20398670370', '', '', '1996-10-04', '', 'JAVIER', 'CHAVARRIA');
INSERT INTO `teachers` VALUES ('56', NULL, NULL, NULL, NULL, NULL, NULL, 'DALMA', 'CORREA');
INSERT INTO `teachers` VALUES ('57', NULL, '27383816403', '', '', '1994-10-19', '', 'GISELA', 'CUÑA');
INSERT INTO `teachers` VALUES ('58', NULL, '27350360242', '', '', '1990-05-31', '', 'MAGALI', 'DAVICO');
INSERT INTO `teachers` VALUES ('59', NULL, NULL, NULL, NULL, NULL, NULL, 'DIEGO', 'DE VITA');
INSERT INTO `teachers` VALUES ('60', NULL, NULL, NULL, NULL, NULL, NULL, 'DANIELA', 'DEL TRAN');
INSERT INTO `teachers` VALUES ('61', NULL, NULL, NULL, NULL, NULL, NULL, 'MARCIA', 'ESCAYA');
INSERT INTO `teachers` VALUES ('62', NULL, '27317949001', '', '', '1985-10-18', '', 'MARIA LAURA', 'ELFI');
INSERT INTO `teachers` VALUES ('63', NULL, NULL, NULL, NULL, NULL, NULL, 'MAURO', 'ESCUDERO');
INSERT INTO `teachers` VALUES ('64', NULL, NULL, NULL, NULL, NULL, NULL, 'VERÓNICA', 'FABRES');
INSERT INTO `teachers` VALUES ('65', NULL, NULL, NULL, NULL, NULL, NULL, 'FABIO', 'FERMIN');
INSERT INTO `teachers` VALUES ('66', NULL, '20204722839', '', '', '1968-10-30', '', 'FABIO', 'FIORAVANTI');
INSERT INTO `teachers` VALUES ('67', NULL, NULL, NULL, NULL, NULL, NULL, 'GERMAN', 'GARAY ANDREA');
INSERT INTO `teachers` VALUES ('68', NULL, '27208076553', '', '', '1969-09-05', '', 'NATALIA', 'GIANNI');
INSERT INTO `teachers` VALUES ('69', NULL, NULL, NULL, NULL, NULL, NULL, 'MIGUEL', 'GIMENEZ');
INSERT INTO `teachers` VALUES ('70', NULL, '20311686462', '', '', '1985-01-26', '', 'RODRIGO', 'GOROSTEGUI');
INSERT INTO `teachers` VALUES ('71', NULL, '20298982510', '', '', '1983-07-15', '', 'ERNESTO', 'GUIDI');
INSERT INTO `teachers` VALUES ('72', NULL, NULL, NULL, NULL, NULL, NULL, 'ANGELINA', 'HENNING');
INSERT INTO `teachers` VALUES ('73', NULL, '20384284508', '', '', '1994-07-09', '', 'EDUARDO', 'KEES');
INSERT INTO `teachers` VALUES ('74', NULL, '27223787121', '', '', '1971-08-07', '', 'MARCELA', 'LABBE');
INSERT INTO `teachers` VALUES ('75', NULL, '20334666167', '', '', '1987-11-03', '', 'GERMAN', 'LECHNER');
INSERT INTO `teachers` VALUES ('76', NULL, '27117955899', '', '', '1955-10-01', '', 'MIRIAM', 'LOPEZ');
INSERT INTO `teachers` VALUES ('77', NULL, NULL, NULL, NULL, NULL, NULL, 'MARCELO', 'MARTI');
INSERT INTO `teachers` VALUES ('78', '4', '23229765779', '', '', '1973-01-11', '', 'ALEJANDRO', 'MEZQUITA');
INSERT INTO `teachers` VALUES ('79', NULL, NULL, NULL, NULL, NULL, NULL, 'LILIANA', 'MERLO');
INSERT INTO `teachers` VALUES ('80', NULL, NULL, NULL, NULL, NULL, NULL, 'CLAUDIA', 'MUÑOZ');
INSERT INTO `teachers` VALUES ('81', NULL, '27305819986', '', '', '1984-06-28', '', 'CLAUDIA', 'NEUMAN');
INSERT INTO `teachers` VALUES ('82', NULL, NULL, NULL, NULL, NULL, NULL, 'GUSTAVO', 'PAEZ');
INSERT INTO `teachers` VALUES ('83', NULL, '27338237613', '', '', '1988-06-27', '', 'NADIA', 'OLIVES');
INSERT INTO `teachers` VALUES ('84', NULL, NULL, NULL, NULL, NULL, NULL, 'DIEGO', 'PALMERO');
INSERT INTO `teachers` VALUES ('85', NULL, NULL, NULL, NULL, NULL, NULL, 'CRISTIAN', 'PARRA JUAN');
INSERT INTO `teachers` VALUES ('86', NULL, '20214509599', '', '', '1970-01-29', '', 'ANGEL', 'PICHON');
INSERT INTO `teachers` VALUES ('87', NULL, '20183055896', '', '', '1966-12-10', '', 'SERGIO', 'PIZARRO');
INSERT INTO `teachers` VALUES ('88', NULL, '20314550456', '', '', '1985-02-05', '', 'NICOLAS', 'RECCHI');
INSERT INTO `teachers` VALUES ('89', NULL, NULL, NULL, NULL, NULL, NULL, 'BELYNDA', 'RIVAMAR');
INSERT INTO `teachers` VALUES ('90', NULL, '20283094880', '', '', '1980-08-06', '', 'JUAN MANUEL', 'RODRIGUEZ MOURE');
INSERT INTO `teachers` VALUES ('91', NULL, '20345803050', '', '', '1989-04-29', '', 'CARLOS', 'MULLER');
INSERT INTO `teachers` VALUES ('92', NULL, '27066705671', '', '', '1951-07-18', '', 'CLERIA', 'OLIVARES');
INSERT INTO `teachers` VALUES ('93', NULL, NULL, NULL, NULL, NULL, NULL, 'MIRI', 'PAZ');
INSERT INTO `teachers` VALUES ('94', NULL, '27300383934', '', '', '1983-02-21', '', 'LOREANA', 'QUINTANILLA');
INSERT INTO `teachers` VALUES ('95', NULL, NULL, NULL, NULL, NULL, NULL, 'JULIETA', 'QUIÑONES MEIER');
INSERT INTO `teachers` VALUES ('96', NULL, '23273321624', '', '', '1993-09-29', '', 'CAROLINA', 'REIMER');
INSERT INTO `teachers` VALUES ('97', NULL, NULL, NULL, NULL, NULL, NULL, 'MICAELA', 'RIOS MOSQUERA');
INSERT INTO `teachers` VALUES ('98', NULL, '27267578937', '', '', '1978-05-01', '', 'NADIA', 'ROBLEDO');
INSERT INTO `teachers` VALUES ('99', NULL, NULL, NULL, NULL, NULL, NULL, 'CARINA', 'RODRIGO');
INSERT INTO `teachers` VALUES ('100', NULL, NULL, NULL, NULL, NULL, NULL, 'CARLOS', 'ROSAS');
INSERT INTO `teachers` VALUES ('101', NULL, NULL, NULL, NULL, NULL, NULL, 'FLORENCIA', 'SALINAS');
INSERT INTO `teachers` VALUES ('102', NULL, NULL, NULL, NULL, NULL, NULL, 'SILVIA', 'SERRA');
INSERT INTO `teachers` VALUES ('103', NULL, '20318609277', '', '', '1986-02-02', '', 'FERNANDO', 'SUELDO');
INSERT INTO `teachers` VALUES ('104', NULL, NULL, NULL, NULL, NULL, NULL, 'JULIANA', 'VENEKKE');
INSERT INTO `teachers` VALUES ('105', NULL, NULL, NULL, NULL, NULL, NULL, 'DANIELA', 'VERA');
INSERT INTO `teachers` VALUES ('107', NULL, '20372125110', '', '', '1992-02-05', '', 'LAUTARO', 'ROHT');
INSERT INTO `teachers` VALUES ('108', NULL, '20206636379', '', '', '1969-05-12', '', 'MARIO', 'ROSAS');
INSERT INTO `teachers` VALUES ('109', NULL, '27338237877', '', '', '1988-05-26', '', 'EVANGELINA', 'RUIZ');
INSERT INTO `teachers` VALUES ('110', NULL, '23326631884', '', '', '1986-12-28', '', 'JULIETA', 'RUIZ');
INSERT INTO `teachers` VALUES ('111', NULL, '27295048986', '', '', '1982-11-22', '', 'MARIA CECILIA', 'SPETTEL');
INSERT INTO `teachers` VALUES ('112', NULL, NULL, NULL, NULL, NULL, NULL, 'VANESA', 'STERN MARINA');
INSERT INTO `teachers` VALUES ('113', NULL, '27332451842', '', '', '1988-02-05', '', 'NATALI ANDREA', 'URSINO GRUDL');
INSERT INTO `teachers` VALUES ('114', NULL, '27285210564', '', '', '1980-12-30', '', 'MARIA LAURA', 'YUNES');
INSERT INTO `teachers` VALUES ('115', NULL, NULL, NULL, NULL, NULL, NULL, 'ENRIQUE', 'DIEGO');
INSERT INTO `teachers` VALUES ('116', NULL, NULL, NULL, NULL, NULL, NULL, 'NOEL', 'VALDIVIA');
INSERT INTO `teachers` VALUES ('117', NULL, NULL, NULL, NULL, NULL, NULL, 'MARIA', 'AYALA');
INSERT INTO `teachers` VALUES ('118', NULL, NULL, NULL, NULL, NULL, NULL, 'MARCELA', 'GUEVARA');
INSERT INTO `teachers` VALUES ('119', NULL, NULL, NULL, NULL, NULL, NULL, 'GRISELDA', 'KERAVATTI');
INSERT INTO `teachers` VALUES ('120', NULL, '27331077114', '', '', '1987-11-11', '', 'NOELIA', 'PEREZ');
INSERT INTO `teachers` VALUES ('121', NULL, NULL, NULL, NULL, NULL, NULL, 'MARIA LAURA', 'PEREZ');
INSERT INTO `teachers` VALUES ('122', NULL, '20444160714', '', '', '2002-10-04', '', 'EZEQUIEL', 'PICHIÑAN');
INSERT INTO `teachers` VALUES ('123', NULL, NULL, NULL, NULL, NULL, NULL, 'SILVINA', 'LOPEZ');
INSERT INTO `teachers` VALUES ('124', NULL, '27321549158', '', '', '1986-03-22', '', 'LUCIA', 'BEROQUI');
INSERT INTO `teachers` VALUES ('125', NULL, NULL, NULL, NULL, NULL, NULL, 'LEANDRO', 'DUARTE');
INSERT INTO `teachers` VALUES ('126', NULL, NULL, NULL, NULL, NULL, NULL, 'ROLANDO', 'ARRIZABALAGA');
INSERT INTO `teachers` VALUES ('127', NULL, '23323027854', '', '', '1986-07-08', '', 'TAMARA', 'GONZALEZ');
INSERT INTO `teachers` VALUES ('128', NULL, NULL, NULL, NULL, NULL, NULL, 'MAYRA', 'CORTES');
INSERT INTO `teachers` VALUES ('129', NULL, '20347212076', '', '', '1990-04-20', '', 'JOSE MANUEL', 'UGARTE');
INSERT INTO `teachers` VALUES ('130', NULL, '27377855367', '', '', '1993-09-29', '', 'VICTORIA', 'TALAVERA');
INSERT INTO `teachers` VALUES ('131', NULL, NULL, NULL, NULL, NULL, NULL, 'GABRIELA', 'VENEGAS');
INSERT INTO `teachers` VALUES ('133', NULL, NULL, NULL, NULL, NULL, NULL, 'LAZARO', 'ARTOLA');
INSERT INTO `teachers` VALUES ('134', NULL, '27255762856', '', '', '1976-12-24', '', 'FLAVIA', 'ILGNER');
INSERT INTO `teachers` VALUES ('135', NULL, '27338490408', '', '', '1988-11-21', '', 'DAIANA', 'COÑUEGUIR');
INSERT INTO `teachers` VALUES ('136', NULL, NULL, NULL, NULL, NULL, NULL, 'Patricia', 'Lafquen');
INSERT INTO `teachers` VALUES ('137', NULL, '20289504371', '', '', '1981-07-17', '', 'DAMIAN', 'MISSIATI');
INSERT INTO `teachers` VALUES ('138', NULL, '20249794458', '', '', '1975-12-04', '', 'FACUNDO', 'VILLANI');
INSERT INTO `teachers` VALUES ('140', NULL, '20297646460', '', '', '1982-11-21', '', 'FEDERICO', 'CLUIGT');
INSERT INTO `teachers` VALUES ('141', NULL, NULL, NULL, NULL, NULL, NULL, 'Agustín', 'Ávila');
INSERT INTO `teachers` VALUES ('142', NULL, '27170469076', '', '', '1964-10-05', '', 'JULIANA', 'VERBEKE');
INSERT INTO `teachers` VALUES ('143', NULL, NULL, NULL, NULL, NULL, NULL, 'Belén', 'Richian');
INSERT INTO `teachers` VALUES ('145', NULL, NULL, NULL, NULL, NULL, NULL, 'Meier', 'Quiñones');
INSERT INTO `teachers` VALUES ('147', NULL, '27335306312', '', '', '1988-07-18', '', 'FABIANA', 'FOIS');
INSERT INTO `teachers` VALUES ('148', NULL, '27332451230', '', '', '1987-11-29', '', 'MARIA LAURA', 'SCHVIND');
INSERT INTO `teachers` VALUES ('149', NULL, '20252159127', '', '', '1976-11-20', '', 'GUILERMO', 'MAYER');
INSERT INTO `teachers` VALUES ('150', NULL, NULL, NULL, NULL, NULL, NULL, 'Ivone', 'Conejeros');
INSERT INTO `teachers` VALUES ('151', NULL, '27422932319', '', '', '1999-12-10', '', 'VALENTINA', 'GARCIA');
INSERT INTO `teachers` VALUES ('152', NULL, '20307534372', '', '', '1984-08-28', '', 'OSCAR', 'MUÑOZ');
INSERT INTO `teachers` VALUES ('153', NULL, '27293601475', '', '', '1982-02-14', '', 'ELIANA', 'MUÑOZ');
INSERT INTO `teachers` VALUES ('155', NULL, '20333688736', '', '', '1988-09-16', '', 'LUIS', 'CALLEA');
INSERT INTO `teachers` VALUES ('156', NULL, '20203636602', '', '', '1968-08-06', '', 'JORGE', 'CABREA');
INSERT INTO `teachers` VALUES ('157', NULL, NULL, NULL, NULL, NULL, NULL, 'Susana', 'López');
INSERT INTO `teachers` VALUES ('159', NULL, '20287530529', '', '', '1981-03-09', '', 'DIEGO', 'DE VEGA');
INSERT INTO `teachers` VALUES ('160', NULL, '20246567132', '', '', '1975-07-20', '', 'CLAUDIO', 'DIUMACAN');
INSERT INTO `teachers` VALUES ('161', NULL, '24373572167', '', '', '1993-03-21', '', 'JUAN SEBASTIAN', 'PEÑA');
INSERT INTO `teachers` VALUES ('163', NULL, '27325784372', '', '', '1986-11-19', '', 'VERONICA', 'EZCURRA');
INSERT INTO `teachers` VALUES ('165', NULL, '27263530891', '', '', '1977-11-23', '', 'MARIA VANESA', 'SURIN');
INSERT INTO `teachers` VALUES ('167', NULL, '27116558837', '', '', '1954-06-19', '', 'SUSANA', 'NOCETI');
INSERT INTO `teachers` VALUES ('168', NULL, '20334639658', '', '', '1987-09-10', '', 'MARCELO RAFAEL', 'MENDOZA');
INSERT INTO `teachers` VALUES ('169', NULL, NULL, NULL, NULL, NULL, NULL, 'DIEGO', 'DAMIAN');
INSERT INTO `teachers` VALUES ('170', NULL, '27279526363', '', '', '1980-01-24', '', 'JORGELINA', 'HENRIQUEZ');
INSERT INTO `teachers` VALUES ('171', NULL, '27236386487', '', '', '1974-01-23', '', 'GABRIELA', 'VIDAL');
INSERT INTO `teachers` VALUES ('172', NULL, NULL, NULL, NULL, NULL, NULL, 'CRISTIAN', 'CAJOMILLA');
INSERT INTO `teachers` VALUES ('174', NULL, '20187806101', '', '', '1969-07-24', '', 'SEBASTIAN', 'CANELO');
INSERT INTO `teachers` VALUES ('175', NULL, '27363880881', '', '', '1991-12-10', '', 'MAGALI', 'LAI');
INSERT INTO `teachers` VALUES ('176', NULL, NULL, NULL, NULL, NULL, NULL, 'ivan', 'grasso');
INSERT INTO `teachers` VALUES ('177', NULL, '20323028495', '', '', '1986-08-26', '', 'GERMAN GASTON', 'GASTAMINZA');
INSERT INTO `teachers` VALUES ('178', NULL, NULL, NULL, NULL, NULL, NULL, 'Angel', 'Roberto');
INSERT INTO `teachers` VALUES ('179', NULL, '20262371426', '', '', '1977-11-28', '', 'DANIEL', 'BENGOCHEA');
INSERT INTO `teachers` VALUES ('180', NULL, '20273181815', '', '', '1979-05-02', '', 'CARLOS', 'MANGIALINO');
INSERT INTO `teachers` VALUES ('181', NULL, NULL, NULL, NULL, NULL, NULL, 'Rodrigo', 'Figueroa');
INSERT INTO `teachers` VALUES ('183', NULL, '54354353543', '0292041043', 'Barbi N°20', '2025-11-07', 'Agustin500cm@gmail.com', 'pul', 'Benja');
/*!40000 ALTER TABLE `teachers` ENABLE KEYS */;
UNLOCK TABLES;

-- --------------------------------------------------------

-- Estructura de tabla para la tabla `user_courses`

DROP TABLE IF EXISTS `user_courses`;
CREATE TABLE `user_courses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `course_id` (`course_id`),
  CONSTRAINT `user_courses_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  CONSTRAINT `user_courses_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcado de datos para la tabla `user_courses`

LOCK TABLES `user_courses` WRITE;
/*!40000 ALTER TABLE `user_courses` DISABLE KEYS */;
INSERT INTO `user_courses` VALUES ('2', '1', '1', '2025-10-29 05:46:52');
INSERT INTO `user_courses` VALUES ('3', '1', '2', '2025-10-30 18:36:04');
INSERT INTO `user_courses` VALUES ('4', '1', '3', '2025-10-30 18:36:07');
INSERT INTO `user_courses` VALUES ('5', '1', '4', '2025-10-30 18:36:09');
INSERT INTO `user_courses` VALUES ('6', '1', '5', '2025-10-30 18:36:12');
INSERT INTO `user_courses` VALUES ('7', '1', '6', '2025-10-30 18:36:15');
INSERT INTO `user_courses` VALUES ('8', '1', '7', '2025-10-30 18:36:17');
INSERT INTO `user_courses` VALUES ('9', '1', '8', '2025-10-30 18:36:18');
INSERT INTO `user_courses` VALUES ('10', '1', '10', '2025-10-30 18:36:20');
INSERT INTO `user_courses` VALUES ('11', '1', '9', '2025-10-30 18:36:22');
INSERT INTO `user_courses` VALUES ('12', '1', '12', '2025-10-30 18:36:25');
INSERT INTO `user_courses` VALUES ('13', '1', '11', '2025-10-30 18:36:27');
INSERT INTO `user_courses` VALUES ('14', '1', '14', '2025-10-30 18:36:29');
INSERT INTO `user_courses` VALUES ('15', '1', '13', '2025-10-30 18:36:31');
INSERT INTO `user_courses` VALUES ('16', '1', '15', '2025-10-30 18:36:33');
INSERT INTO `user_courses` VALUES ('17', '1', '16', '2025-10-30 18:36:35');
INSERT INTO `user_courses` VALUES ('18', '4', '1', '2025-11-17 10:55:57');
INSERT INTO `user_courses` VALUES ('19', '4', '2', '2025-11-18 09:05:52');
INSERT INTO `user_courses` VALUES ('20', '4', '3', '2025-11-18 09:05:57');
INSERT INTO `user_courses` VALUES ('21', '4', '4', '2025-11-18 09:06:00');
INSERT INTO `user_courses` VALUES ('22', '4', '5', '2025-11-18 09:06:03');
INSERT INTO `user_courses` VALUES ('23', '4', '6', '2025-11-18 09:06:07');
INSERT INTO `user_courses` VALUES ('24', '4', '7', '2025-11-18 09:06:09');
INSERT INTO `user_courses` VALUES ('25', '4', '8', '2025-11-18 09:06:15');
INSERT INTO `user_courses` VALUES ('26', '4', '10', '2025-11-18 09:06:20');
INSERT INTO `user_courses` VALUES ('27', '4', '9', '2025-11-18 09:06:23');
INSERT INTO `user_courses` VALUES ('28', '4', '12', '2025-11-18 09:06:28');
INSERT INTO `user_courses` VALUES ('29', '4', '11', '2025-11-18 09:06:32');
INSERT INTO `user_courses` VALUES ('30', '4', '14', '2025-11-18 09:06:34');
INSERT INTO `user_courses` VALUES ('31', '4', '13', '2025-11-18 09:06:35');
INSERT INTO `user_courses` VALUES ('32', '4', '16', '2025-11-18 09:06:38');
INSERT INTO `user_courses` VALUES ('33', '4', '15', '2025-11-18 09:06:39');
/*!40000 ALTER TABLE `user_courses` ENABLE KEYS */;
UNLOCK TABLES;

-- --------------------------------------------------------

-- Estructura de tabla para la tabla `users`

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `password` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `role_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `email` (`email`),
  KEY `fk_users_roles` (`role_id`),
  CONSTRAINT `fk_users_roles` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcado de datos para la tabla `users`

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('1', 'Jean Pierre', 'Lobos', 'Agustin500cm@gmail.com', '$2y$10$uhoL6DN1v/J2cxIKuss.luqSCWqJsE/O3s.M.8qRJe.76MWZwfNsS', '1', '2025-10-27 14:04:37', '2');
INSERT INTO `users` VALUES ('4', 'Alejandro', 'Mezquita', 'admin@admin.com', '$2y$10$2kBFP9GrBfKFFKD4xQhnuOpJSE29vpN0jjaWLvZy0hmIVB76XUsru', '1', '2025-11-14 18:02:32', '2');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

SET FOREIGN_KEY_CHECKS=1;

COMMIT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
