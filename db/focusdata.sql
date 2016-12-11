-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Dec 11, 2016 at 04:52 PM
-- Server version: 10.1.10-MariaDB
-- PHP Version: 5.6.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;


--
-- Database: `focusdata`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get7daysTimeslots` (IN `dateIN` DATE, IN `suburbIN` VARCHAR(50), IN `postcodeIN` VARCHAR(50), IN `stateIN` VARCHAR(50), IN `doctorTypeIN` VARCHAR(50), IN `clinicNameIN` VARCHAR(100), IN `doctorNameIN` VARCHAR(100))  READS SQL DATA
BEGIN 
  IF ( datein >= CURRENT_DATE() + 4 ) THEN 
    SELECT t1.appointment_date, 
    		t1.doctor_id,
           t2.doctor_photo, 
           t2.doctor_name, 
           t4.clinic_name, 
           t4.clinic_addr, 
           t1.appointment_time 
    FROM   fd_rel_doctor_appointment_time t1 
           LEFT JOIN fd_doctor t2 
                  ON t1.doctor_id = t2.doctor_id 
           LEFT JOIN fd_rel_clinic_doctor t3 
                  ON t2.doctor_id = t3.doctor_id 
           LEFT JOIN fd_clinic_user t4 
                  ON t3.clinic_user_id = t4.clinic_user_id
           left join fd_dict_state t5
           			on t4.STATE_ID=t5.STATE_ID
    WHERE  t1.active_status = 1 
           AND t1.appointment_date >= datein - 3 
           AND t1.appointment_date <= datein + 3 
           AND CONCAT(t1.appointment_date, ' ', t1.appointment_time) > Now() 
           AND (t5.STATE_NAME=stateIN or stateIN='')
           AND (t4.CLINIC_SUBURB=suburbIN or suburbIN='')
           AND (t4.CLINIC_POSTCODE=postcodeIN or postcodeIN='')
           and (t2.DOCTOR_TYPE=doctorTypeIN or doctorTypeIN='')
           and (t4.CLINIC_NAME=clinicNameIN or clinicNameIN='')
           and (t2.DOCTOR_NAME= doctorNameIN or doctorNameIN='')
    ORDER BY t1.appointment_date asc, 
              t1.doctor_id asc,
              t1.APPOINTMENT_TIME asc; 
  ELSE 
    SELECT t1.appointment_date, 
    t1.doctor_id,
           t2.doctor_photo, 
           t2.doctor_name, 
           t4.clinic_name, 
           t4.clinic_addr, 
           t1.appointment_time 
    FROM   fd_rel_doctor_appointment_time t1 
           LEFT JOIN fd_doctor t2 
                  ON t1.doctor_id = t2.doctor_id 
           LEFT JOIN fd_rel_clinic_doctor t3 
                  ON t2.doctor_id = t3.doctor_id 
           LEFT JOIN fd_clinic_user t4 
                  ON t3.clinic_user_id = t4.clinic_user_id 
           left join fd_dict_state t5
           			on t4.STATE_ID=t5.STATE_ID
    WHERE  t1.active_status = 1 
           AND t1.appointment_date >= CURRENT_DATE() 
           AND t1.appointment_date <= datein + 6 
           AND CONCAT(t1.appointment_date, ' ', t1.appointment_time) > Now() 
           AND (t5.STATE_NAME=stateIN or stateIN='')
           AND (t4.CLINIC_SUBURB=suburbIN or suburbIN='')
           AND (t4.CLINIC_POSTCODE=postcodeIN or postcodeIN='')
           and (t2.DOCTOR_TYPE=doctorTypeIN or doctorTypeIN='')
           and (t4.CLINIC_NAME=clinicNameIN or clinicNameIN='')
           and (t2.DOCTOR_NAME= doctorNameIN or doctorNameIN='')
    ORDER BY t1.appointment_date asc, 
              t1.doctor_id asc,
              t1.APPOINTMENT_TIME asc; 
  END IF; 
  

END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `ap_patient`
--

CREATE TABLE `ap_patient` (
  `id` int(11) NOT NULL,
  `CUSTOMER_USER_ID` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `gender` varchar(50) NOT NULL,
  `dob` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone_mobile` varchar(50) NOT NULL,
  `medicare_no` varchar(50) NOT NULL,
  `medicare_ref` varchar(50) NOT NULL,
  `CREATE_USER` varchar(50) NOT NULL,
  `CREATE_DATE` datetime NOT NULL,
  `UPDATE_USER` varchar(50) NOT NULL,
  `UPDATE_DATE` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ap_patient`
--

INSERT INTO `ap_patient` (`id`, `CUSTOMER_USER_ID`, `title`, `first_name`, `last_name`, `gender`, `dob`, `email`, `phone_mobile`, `medicare_no`, `medicare_ref`, `CREATE_USER`, `CREATE_DATE`, `UPDATE_USER`, `UPDATE_DATE`) VALUES
(22, 184, 'Mr', 'x', 'x', 'M', '11/11/1983', 'fudanyinxin@gmail.com', '0412341234', '1231231231', '1', 'fudanyinxin@gmail.com', '2016-10-03 18:42:22', '', '0000-00-00 00:00:00'),
(23, 187, 'Mr', 'xin', 'yin', 'M', '11/11/1983', 'fudanyinxin@gmail.com', '0412341234', '1231231231', '1', 'fudanyinxin@gmail.com', '2016-12-02 09:59:13', '', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `fd_admin`
--

CREATE TABLE `fd_admin` (
  `ADMIN_ID` int(11) NOT NULL,
  `ADMIN_NAME` varchar(50) NOT NULL,
  `ADMIN_PWD` varchar(50) NOT NULL,
  `CREATE_USER` varchar(50) NOT NULL,
  `CREATE_DATE` datetime NOT NULL,
  `UPDATE_USER` varchar(50) NOT NULL,
  `UPDATE_DATE` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fd_admin`
--

INSERT INTO `fd_admin` (`ADMIN_ID`, `ADMIN_NAME`, `ADMIN_PWD`, `CREATE_USER`, `CREATE_DATE`, `UPDATE_USER`, `UPDATE_DATE`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', '', '0000-00-00 00:00:00', 'admin', '2016-09-24 17:53:48');

-- --------------------------------------------------------

--
-- Table structure for table `fd_clinic_user`
--

CREATE TABLE `fd_clinic_user` (
  `CLINIC_USER_ID` int(11) NOT NULL,
  `CLINIC_USER_NAME` varchar(50) NOT NULL,
  `CLINIC_USER_PWD` varchar(50) NOT NULL,
  `CLINIC_USER_MAIL` varchar(50) NOT NULL,
  `CLINIC_NAME` varchar(200) NOT NULL,
  `CLINIC_ADDR` varchar(200) NOT NULL,
  `CLINIC_POSTCODE` varchar(50) NOT NULL,
  `CLINIC_SUBURB` varchar(50) NOT NULL,
  `STATE_ID` int(11) NOT NULL,
  `ACTIVE_STATUS` int(11) DEFAULT '1',
  `NOTE` varchar(200) DEFAULT NULL,
  `CREATE_USER` varchar(50) NOT NULL,
  `CREATE_DATE` datetime NOT NULL,
  `UPDATE_USER` varchar(50) NOT NULL,
  `UPDATE_DATE` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fd_clinic_user`
--

INSERT INTO `fd_clinic_user` (`CLINIC_USER_ID`, `CLINIC_USER_NAME`, `CLINIC_USER_PWD`, `CLINIC_USER_MAIL`, `CLINIC_NAME`, `CLINIC_ADDR`, `CLINIC_POSTCODE`, `CLINIC_SUBURB`, `STATE_ID`, `ACTIVE_STATUS`, `NOTE`, `CREATE_USER`, `CREATE_DATE`, `UPDATE_USER`, `UPDATE_DATE`) VALUES
(1, 'shelleymyl', '21232f297a57a5a743894a0e4a801fc3', 'shelleymyl@gmail.com11', 'Clinic for test 1 Whitehorse Road', '1 Whitehorse Road', '3128', 'Box Hill', 7, 1, NULL, 'shelleymyl', '2016-08-13 12:11:10', 'admin', '2016-09-24 17:38:31'),
(2, 'shelleymyl', '3d9017e3b14d093e63b205487bee0354', 'shelleymyl@gmail.com', '市诊所', '146-148 Glebe Point Road', '130012', 'Glebe', 2, 0, NULL, 'shelleymyl', '2016-08-13 12:11:39', 'admin', '2016-09-11 21:50:55'),
(3, 'shelleymylee1', '80db46b43939c503e20d5c28b61a689e', 'shelleymyl@gmail.com', '朝阳区诊所1', '朝阳区1', '130012', '绿园区', 8, 0, NULL, 'shelleymyl', '2016-08-13 12:11:50', 'admin', '2016-09-11 21:50:22'),
(4, 'shelleymyl221', 'myl1102', 'shelleymyl@gmail.com1', '绿园区诊所1', '绿园区1', '130012', '绿园区', 2, 0, NULL, 'shelleymyl', '2016-08-15 12:08:47', 'admin', '2016-09-01 16:20:53'),
(5, 'yinxin', 'yinxin', 'shelleymyl@gmail.com', '1', '1', '130012', '朝阳区', 2, 1, NULL, 'shelleymyl', '2016-08-24 16:28:50', 'shelleymyl', '2016-08-24 16:28:50'),
(6, 'Miaoyl', 'bdfb51e038e40bde21cbd1219c971b55', 'shelleymyl@gmail.com', '1', '1', '130012', '绿园区', 3, 1, NULL, 'shelleymyl', '2016-08-24 16:31:50', 'admin', '2016-09-10 10:47:19'),
(7, 'shelleymyl111', 'myl1102111', 'shelleymyl@gmail.com', '1', '1', '130012', '绿园区', 2, 1, NULL, 'shelleymyl', '2016-08-24 16:33:17', 'shelleymyl', '2016-08-24 16:33:17'),
(8, 'yinxin123', 'yinxin123', 'shelleymyl@gmail.com', '1', '1', '130012', '绿园区', 7, 1, NULL, 'yinxin123', '2016-08-24 21:42:45', 'admin', '2016-09-10 10:47:06'),
(9, 'mao', 'mao', 'shelleymyl@gmail.com', '1', '1', '130012', '绿园区', 2, 0, NULL, 'mao', '2016-08-24 21:43:42', 'admin', '2016-09-13 15:59:18'),
(10, 'miao', 'miao', 'shelleymyl@gmail.com', '1', '1', '130012', '绿园区', 2, 0, NULL, 'miao', '2016-09-01 15:07:02', 'miao', '2016-09-01 15:07:02'),
(11, 'admin', '21232f297a57a5a743894a0e4a801fc3', 'shelleymyl@gmail.com', '吉大一院', '碧水云天14#3门806室', '130012', '绿园区', 6, 1, NULL, 'admin', '2016-09-01 16:53:28', 'admin', '2016-09-24 17:43:04'),
(12, 'fuy', '1', 'shelleymyl@gmail.com', '吉林大学第一医院', '新民广场1102号', '130012', '绿园区', 2, 1, NULL, 'fuy', '2016-09-06 10:30:19', 'admin', '2016-09-06 11:26:52'),
(13, 'miaoyz', '422a1cd6e66f71337187fe049e7e64a8', 'shelleymyl@gmail.com', '1', '1', '130012', '绿园区', 1, 1, NULL, 'miaoyz', '2016-09-08 23:14:42', 'admin', '2016-09-10 10:52:03'),
(14, '111', '6512bd43d9caa6e02c990b0a82652dca', 'shelleymyl@gmail.com', '1', '11', '130012', '绿园区', 3, 1, NULL, '111', '2016-09-12 21:32:27', '111', '2016-09-12 21:32:27'),
(15, '耗子想猫猫', '21232f297a57a5a743894a0e4a801fc3', 'shelleymyl@gmail.com', '吉林人民诊所', '人民大街881号', '130012', '绿园区', 1, 1, NULL, '耗子想猫猫', '2016-09-12 21:33:01', '耗子想猫猫', '2016-09-12 21:39:39'),
(16, '小石头', '21232f297a57a5a743894a0e4a801fc3', 'shelleymyl@gmail.com', '南阳路诊所', '南阳路881号', '130012', '绿园区', 4, 1, NULL, '小石头', '2016-09-13 09:28:26', '小石头', '2016-09-13 09:28:26'),
(17, '123', 'c4ca4238a0b923820dcc509a6f75849b', 'shelleymyl@gmail.com', '1', '1', '130012', '绿园区', 3, 1, NULL, '123', '2016-09-13 10:15:38', '123', '2016-09-13 10:15:38'),
(18, '123222', '202cb962ac59075b964b07152d234b70', 'shelleymyl@gmail.com', '1', '1', '130012', '', 3, 1, NULL, '123222', '2016-09-13 10:16:35', '123222', '2016-09-13 10:16:35'),
(19, '11', '7863dceeedcb1d9c33675e020e808df5', 'shelleymyl@gmail.com', '1', '1', '130088', '绿园区1', 2, 0, NULL, '11', '2016-09-13 10:21:04', 'admin', '2016-09-23 15:35:20'),
(20, 'shelleymyl', '21232f297a57a5a743894a0e4a801fc3', 'shelleymyl@gmail.com11', '中华人民共和国吉林省长春市吉林大学第一医院', '1 Kangerong Rd', '130066', 'Box Hill', 7, 0, NULL, 'shelleymyl', '2016-08-13 12:11:10', 'admin', '2016-09-24 17:38:31');

-- --------------------------------------------------------

--
-- Table structure for table `fd_customer_user`
--

CREATE TABLE `fd_customer_user` (
  `CUSTOMER_USER_ID` int(11) NOT NULL,
  `CUSTOMER_USER_NAME` varchar(50) NOT NULL,
  `CUSTOMER_USER_PWD` varchar(50) NOT NULL,
  `CUSTOMER_USER_MAIL` varchar(50) NOT NULL,
  `CUSTOMER_NAME` varchar(50) NOT NULL,
  `CUSTOMER_GENDER` varchar(10) NOT NULL,
  `CUSTOMER_BIRTHDAY` varchar(50) NOT NULL,
  `CUSTOMER_ADDR` varchar(200) NOT NULL,
  `CUSTOMER_POSTCODE` varchar(50) NOT NULL,
  `CUSTOMER_SUBURB` varchar(50) NOT NULL,
  `STATE_ID` int(11) NOT NULL,
  `CUSTOMER_PHONE_NO` varchar(50) NOT NULL,
  `MEDICAL_CARD_NO` varchar(50) NOT NULL,
  `ACTIVE_STATUS` int(11) NOT NULL DEFAULT '1',
  `NOTE` varchar(200) NOT NULL,
  `CREATE_USER` varchar(50) NOT NULL,
  `CREATE_DATE` datetime NOT NULL,
  `UPDATE_USER` varchar(50) NOT NULL,
  `UPDATE_DATE` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fd_customer_user`
--

INSERT INTO `fd_customer_user` (`CUSTOMER_USER_ID`, `CUSTOMER_USER_NAME`, `CUSTOMER_USER_PWD`, `CUSTOMER_USER_MAIL`, `CUSTOMER_NAME`, `CUSTOMER_GENDER`, `CUSTOMER_BIRTHDAY`, `CUSTOMER_ADDR`, `CUSTOMER_POSTCODE`, `CUSTOMER_SUBURB`, `STATE_ID`, `CUSTOMER_PHONE_NO`, `MEDICAL_CARD_NO`, `ACTIVE_STATUS`, `NOTE`, `CREATE_USER`, `CREATE_DATE`, `UPDATE_USER`, `UPDATE_DATE`) VALUES
(185, 'kitty', 'cd880b726e0a0dbd4237f10d15da46f4', 'kitty@gmail.com', 'kitty', 'Female', '1', '1', '1', '1', 3, '1514416056', '1', 1, '', 'kitty', '2016-11-12 07:33:35', 'kitty', '2016-11-12 07:33:35'),
(186, 'dodo', '721c6ff80a6d3e4ad4ffa52a04c60085', 'dodo', 'dodo', 'Male', '1', '1', '1', '1', 3, '1', '1', 1, '', 'dodo', '2016-11-12 07:46:31', 'dodo', '2016-11-12 07:46:31'),
(187, 'fudanyinxin@gmail.com', '3b5fa279e25dbae4e5535c97535d4cde', 'fudanyinxin@gmail.com', 'xin yin', 'M', '1983-11-11', '', '', '', 1, '0412341234', '1231231231', 1, '', 'xin yin', '2016-12-02 09:59:13', '', '0000-00-00 00:00:00'),
(188, 'orochigalois', '3b5fa279e25dbae4e5535c97535d4cde', 'fudanyinxin@gmail.com', '1', 'Male', '1', '1', '1', '1', 3, '1', '1', 1, '', 'orochigalois', '2016-12-11 12:34:54', 'orochigalois', '2016-12-11 12:34:54'),
(189, 'qwe', '3b5fa279e25dbae4e5535c97535d4cde', 'fudanyinxin@gmail.com', '1', 'Male', '1', '1', '1', '1', 3, '1', '1', 1, '', 'qwe', '2016-12-11 12:46:10', 'qwe', '2016-12-11 12:46:10'),
(190, 'lop', '3b5fa279e25dbae4e5535c97535d4cde', 'fudanyinxin@gmail.com', '1', 'Male', '1', '1', '1', '1', 3, '1', '1', 1, '', 'lop', '2016-12-11 12:51:10', 'lop', '2016-12-11 12:51:10'),
(191, 'dongfangbubai', '3b5fa279e25dbae4e5535c97535d4cde', 'fudanyinxin@gmail.com', '1', 'Male', '1', '1', '1', '1', 3, '1', '1', 1, '', 'dongfangbubai', '2016-12-11 12:53:36', 'dongfangbubai', '2016-12-11 12:53:36');

-- --------------------------------------------------------

--
-- Table structure for table `fd_dict_appointment_status`
--

CREATE TABLE `fd_dict_appointment_status` (
  `APPOINTMENT_STATUS_ID` int(11) NOT NULL,
  `APPOINTMENT_STATUS` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fd_dict_appointment_status`
--

INSERT INTO `fd_dict_appointment_status` (`APPOINTMENT_STATUS_ID`, `APPOINTMENT_STATUS`) VALUES
(1, 'booked'),
(2, 'cancelled'),
(3, '已就诊'),
(4, '未就诊');

-- --------------------------------------------------------

--
-- Table structure for table `fd_dict_log_type`
--

CREATE TABLE `fd_dict_log_type` (
  `LOG_TYPE_ID` int(11) NOT NULL,
  `LOG_TYPE` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `fd_dict_search`
--

CREATE TABLE `fd_dict_search` (
  `SEARCH_ID` int(11) NOT NULL,
  `SEARCH_CONTENT` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fd_dict_search`
--

INSERT INTO `fd_dict_search` (`SEARCH_ID`, `SEARCH_CONTENT`) VALUES
(1, '诊所区域'),
(2, '诊所名称'),
(3, '医生类别'),
(4, '医生姓名'),
(5, '预约时间'),
(6, '医生距离');

-- --------------------------------------------------------

--
-- Table structure for table `fd_dict_state`
--

CREATE TABLE `fd_dict_state` (
  `STATE_ID` int(11) NOT NULL,
  `STATE_NAME` varchar(50) NOT NULL,
  `STATE_POSTCODE` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fd_dict_state`
--

INSERT INTO `fd_dict_state` (`STATE_ID`, `STATE_NAME`, `STATE_POSTCODE`) VALUES
(1, 'QLD', ''),
(2, 'NSW', ''),
(3, 'ACT', ''),
(4, 'NT', ''),
(5, 'SA', ''),
(6, 'TAS', ''),
(7, 'VIC', ''),
(8, 'WA', '');

-- --------------------------------------------------------

--
-- Table structure for table `fd_doctor`
--

CREATE TABLE `fd_doctor` (
  `DOCTOR_ID` int(11) NOT NULL,
  `DOCTOR_TYPE` varchar(50) NOT NULL,
  `DOCTOR_NAME` varchar(50) NOT NULL,
  `DOCTOR_GENDER` varchar(50) NOT NULL,
  `ACTIVE_STATUS` int(11) NOT NULL,
  `DOCTOR_PHOTO` varchar(200) NOT NULL,
  `DOCTOR_INFO` varchar(2000) NOT NULL,
  `NOTE` varchar(200) NOT NULL,
  `DOCTOR_ID_IMPORT` int(11) NOT NULL,
  `CREATE_USER` varchar(50) NOT NULL,
  `CREATE_DATE` datetime NOT NULL,
  `UPDATE_USER` varchar(50) NOT NULL,
  `UPDATE_DATE` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fd_doctor`
--

INSERT INTO `fd_doctor` (`DOCTOR_ID`, `DOCTOR_TYPE`, `DOCTOR_NAME`, `DOCTOR_GENDER`, `ACTIVE_STATUS`, `DOCTOR_PHOTO`, `DOCTOR_INFO`, `NOTE`, `DOCTOR_ID_IMPORT`, `CREATE_USER`, `CREATE_DATE`, `UPDATE_USER`, `UPDATE_DATE`) VALUES
(61337, 'GP', '孙思邈', '', 1, 'img/doctors/test_sunsimiao.jpg', '', '', 6, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(61338, 'GP', '华佗', '', 1, 'img/doctors/test_huatuo.jpg', '', '', 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(61339, 'GP', '扁鹊', '', 1, 'img/doctors/test_bianque.jpg', '', '', 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(61340, 'GP', '李时珍', '', 1, 'img/doctors/test_lishizhen.jpg', '', '', 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `fd_function`
--

CREATE TABLE `fd_function` (
  `FUNCTION_ID` int(11) NOT NULL,
  `FUNCTION_CODE` varchar(50) NOT NULL,
  `FUNCTION_NAME` varchar(50) NOT NULL,
  `NOTE` varchar(200) NOT NULL,
  `CREATE_USER` varchar(50) NOT NULL,
  `CREATE_DATE` datetime NOT NULL,
  `UPDATE_USER` varchar(50) NOT NULL,
  `UPDATE_DATE` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `fd_log`
--

CREATE TABLE `fd_log` (
  `LOG_ID` int(11) NOT NULL,
  `LOG_TYPE_ID` int(11) NOT NULL,
  `FUNCTION_ID` varchar(50) NOT NULL,
  `FUNCTION_NAME` varchar(50) NOT NULL,
  `LOG_CONTENT` varchar(200) NOT NULL,
  `CREATE_DATE` datetime NOT NULL,
  `CREATE_USER` varchar(50) NOT NULL,
  `UPDATE_USER` varchar(50) NOT NULL,
  `UPDATE_DATE` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `fd_rel_clinic_doctor`
--

CREATE TABLE `fd_rel_clinic_doctor` (
  `CLINIC_DOCTOR_ID` int(11) NOT NULL,
  `CLINIC_USER_ID` int(11) NOT NULL,
  `DOCTOR_ID` int(11) NOT NULL,
  `CREATE_USER` varchar(50) NOT NULL,
  `CREATE_DATE` datetime NOT NULL,
  `UPDATE_USER` varchar(50) NOT NULL,
  `UPDATE_DATE` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fd_rel_clinic_doctor`
--

INSERT INTO `fd_rel_clinic_doctor` (`CLINIC_DOCTOR_ID`, `CLINIC_USER_ID`, `DOCTOR_ID`, `CREATE_USER`, `CREATE_DATE`, `UPDATE_USER`, `UPDATE_DATE`) VALUES
(1, 1, 61337, 'admin', '2016-08-16 00:00:00', 'admin', '2016-08-16 00:00:00'),
(2, 1, 61338, 'admin', '2016-08-16 00:00:00', 'admin', '2016-08-16 00:00:00'),
(3, 1, 61339, 'admin', '2016-08-22 00:00:00', 'admin', '2016-08-22 00:00:00'),
(4, 1, 61340, 'admin', '2016-08-22 00:00:00', 'admin', '2016-08-22 00:00:00'),
(5, 2, 5, 'admin', '2016-08-22 00:00:00', 'admin', '2016-08-22 00:00:00'),
(6, 3, 6, 'admin', '2016-08-22 00:00:00', 'admin', '2016-08-22 00:00:00'),
(7, 2, 7, 'admin', '2016-08-22 00:00:00', 'admin', '2016-08-22 00:00:00'),
(8, 3, 8, 'admin', '2016-08-22 00:00:00', 'admin', '2016-08-22 00:00:00'),
(9, 2, 9, 'admin', '2016-08-22 00:00:00', 'admin', '2016-08-22 00:00:00'),
(10, 3, 10, 'admin', '2016-08-22 00:00:00', 'admin', '2016-08-22 00:00:00'),
(11, 11, 11, 'admin', '2016-08-22 00:00:00', 'admin', '2016-08-22 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `fd_rel_customer_appointment`
--

CREATE TABLE `fd_rel_customer_appointment` (
  `CUSTOMER_APPOINTMENT_ID` int(11) NOT NULL,
  `CUSTOMER_USER_ID` int(11) NOT NULL,
  `DOCTOR_ID` int(11) NOT NULL,
  `DOCTOR_APPOINTMENT_TIME_ID` int(11) NOT NULL,
  `APPOINTMENT_STATUS_ID` int(11) NOT NULL,
  `NOTE` varchar(200) NOT NULL,
  `CREATE_USER` varchar(50) NOT NULL,
  `CREATE_DATE` datetime NOT NULL,
  `UPDATE_USER` varchar(50) NOT NULL,
  `UPDATE_DATE` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `fd_rel_customer_appointment_his`
--

CREATE TABLE `fd_rel_customer_appointment_his` (
  `CUSTOMER_APPOINTMENT_ID` int(11) NOT NULL,
  `CUSTOMER_USER_ID` int(11) NOT NULL,
  `DOCTOR_ID` int(11) NOT NULL,
  `DOCTOR_APPOINTMENT_TIME_ID` int(11) NOT NULL,
  `APPOINTMENT_STATUS_ID` varchar(50) NOT NULL,
  `OPERATOR_STATUS` varchar(50) NOT NULL,
  `NOTE` varchar(200) NOT NULL,
  `CREATE_USER` varchar(50) NOT NULL,
  `CREATE_DATE` datetime NOT NULL,
  `UPDATE_USER` varchar(50) NOT NULL,
  `UPDATE_DATE` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fd_rel_customer_appointment_his`
--

INSERT INTO `fd_rel_customer_appointment_his` (`CUSTOMER_APPOINTMENT_ID`, `CUSTOMER_USER_ID`, `DOCTOR_ID`, `DOCTOR_APPOINTMENT_TIME_ID`, `APPOINTMENT_STATUS_ID`, `OPERATOR_STATUS`, `NOTE`, `CREATE_USER`, `CREATE_DATE`, `UPDATE_USER`, `UPDATE_DATE`) VALUES
(85, 184, 1, 36, '1', 'A', '', 'fudanyinxin@gmail.com', '2016-10-03 18:42:45', 'fudanyinxin@gmail.com', '2016-10-03 18:42:45'),
(86, 184, 1, 37, '1', 'A', '', 'fudanyinxin@gmail.com', '2016-10-03 18:43:02', 'fudanyinxin@gmail.com', '2016-10-03 18:43:02'),
(87, 185, 61337, 15068, '1', 'A', '', 'kitty', '2016-11-12 07:33:36', 'kitty', '2016-11-12 07:33:36'),
(88, 186, 61337, 15130, '1', 'A', '', 'dodo', '2016-11-12 07:46:31', 'dodo', '2016-11-12 07:46:31'),
(89, 187, 61337, 15132, '1', 'A', '', 'fudanyinxin@gmail.com', '2016-12-11 06:29:43', 'fudanyinxin@gmail.com', '2016-12-11 06:29:43'),
(90, 187, 0, 15132, '1', 'A', '', 'fudanyinxin@gmail.com', '2016-12-11 06:32:26', 'fudanyinxin@gmail.com', '2016-12-11 06:32:26'),
(91, 187, 61337, 15184, '1', 'A', '', 'fudanyinxin@gmail.com', '2016-12-11 09:05:02', 'fudanyinxin@gmail.com', '2016-12-11 09:05:02'),
(92, 187, 61337, 15190, '1', 'A', '', 'fudanyinxin@gmail.com', '2016-12-11 09:06:26', 'fudanyinxin@gmail.com', '2016-12-11 09:06:26'),
(93, 187, 61337, 15198, '1', 'A', '', 'fudanyinxin@gmail.com', '2016-12-11 09:17:24', 'fudanyinxin@gmail.com', '2016-12-11 09:17:24'),
(94, 187, 61337, 15191, '1', 'A', '', 'fudanyinxin@gmail.com', '2016-12-11 09:46:33', 'fudanyinxin@gmail.com', '2016-12-11 09:46:33'),
(95, 187, 61337, 15192, '1', 'A', '', 'fudanyinxin@gmail.com', '2016-12-11 09:49:01', 'fudanyinxin@gmail.com', '2016-12-11 09:49:01'),
(96, 187, 61337, 15193, '1', 'A', '', 'fudanyinxin@gmail.com', '2016-12-11 09:49:14', 'fudanyinxin@gmail.com', '2016-12-11 09:49:14'),
(97, 187, 61337, 15194, '1', 'A', '', 'fudanyinxin@gmail.com', '2016-12-11 09:49:22', 'fudanyinxin@gmail.com', '2016-12-11 09:49:22'),
(98, 187, 61337, 15195, '1', 'A', '', 'fudanyinxin@gmail.com', '2016-12-11 09:49:33', 'fudanyinxin@gmail.com', '2016-12-11 09:49:33'),
(99, 187, 61337, 15196, '1', 'A', '', 'fudanyinxin@gmail.com', '2016-12-11 11:07:26', 'fudanyinxin@gmail.com', '2016-12-11 11:07:26'),
(100, 189, 0, 15197, '1', 'A', '', 'qwe', '2016-12-11 12:49:48', 'qwe', '2016-12-11 12:49:48'),
(101, 189, 61337, 15197, '1', 'A', '', 'qwe', '2016-12-11 12:49:51', 'qwe', '2016-12-11 12:49:51'),
(102, 190, 61339, 15187, '1', 'A', '', 'lop', '2016-12-11 12:51:40', 'lop', '2016-12-11 12:51:40'),
(103, 191, 61339, 15189, '1', 'A', '', 'dongfangbubai', '2016-12-11 12:53:36', 'dongfangbubai', '2016-12-11 12:53:36'),
(104, 191, 61337, 15134, '1', 'A', '', 'dongfangbubai', '2016-12-11 12:53:54', 'dongfangbubai', '2016-12-11 12:53:54');

-- --------------------------------------------------------

--
-- Table structure for table `fd_rel_customer_doctor`
--

CREATE TABLE `fd_rel_customer_doctor` (
  `CUSTOMER_DOCTOR_ID` int(11) NOT NULL,
  `CUSTOMER_USER_ID` int(11) NOT NULL,
  `DOCTOR_ID` int(11) NOT NULL,
  `NOTE` varchar(200) NOT NULL,
  `CREATE_USER` varchar(50) NOT NULL,
  `CREATE_DATE` datetime NOT NULL,
  `UPDATE_USER` varchar(50) NOT NULL,
  `UPDATE_DATE` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `fd_rel_doctor_appointment_time`
--

CREATE TABLE `fd_rel_doctor_appointment_time` (
  `DOCTOR_APPOINTMENT_TIME_ID` int(11) NOT NULL,
  `DOCTOR_ID` int(11) NOT NULL,
  `APPOINTMENT_DATE` date NOT NULL,
  `APPOINTMENT_TIME` time NOT NULL,
  `ACTIVE_STATUS` int(11) NOT NULL,
  `NOTE` varchar(200) NOT NULL,
  `REQUESTING_FLAG` int(11) NOT NULL,
  `REQUESTING_USER_ID` int(11) NOT NULL,
  `SUCCESSFUL_FLAG` int(11) NOT NULL,
  `CREATE_USER` varchar(50) NOT NULL,
  `CREATE_DATE` datetime NOT NULL,
  `UPDATE_USER` varchar(50) NOT NULL,
  `UPDATE_DATE` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fd_rel_doctor_appointment_time`
--

INSERT INTO `fd_rel_doctor_appointment_time` (`DOCTOR_APPOINTMENT_TIME_ID`, `DOCTOR_ID`, `APPOINTMENT_DATE`, `APPOINTMENT_TIME`, `ACTIVE_STATUS`, `NOTE`, `REQUESTING_FLAG`, `REQUESTING_USER_ID`, `SUCCESSFUL_FLAG`, `CREATE_USER`, `CREATE_DATE`, `UPDATE_USER`, `UPDATE_DATE`) VALUES
(15124, 61337, '2016-12-14', '09:00:00', 1, '', 0, 0, 2, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(15125, 61337, '2016-12-14', '10:00:00', 1, '', 0, 0, 1, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(15126, 61337, '2016-12-14', '11:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(15127, 61337, '2016-12-14', '13:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(15128, 61337, '2016-12-14', '14:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(15129, 61337, '2016-12-14', '15:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(15199, 61338, '2016-12-14', '09:00:00', 1, '', 0, 0, 2, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(15200, 61338, '2016-12-14', '10:00:00', 1, '', 0, 0, 1, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(15201, 61338, '2016-12-14', '11:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(15202, 61338, '2016-12-14', '13:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(15203, 61338, '2016-12-14', '14:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(15204, 61338, '2016-12-14', '15:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(15205, 61339, '2016-12-14', '09:00:00', 1, '', 0, 0, 2, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(15206, 61339, '2016-12-14', '10:00:00', 1, '', 0, 0, 1, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(15207, 61339, '2016-12-14', '11:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(15208, 61339, '2016-12-14', '13:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(15209, 61339, '2016-12-14', '14:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(15210, 61339, '2016-12-14', '15:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(15211, 61340, '2016-12-14', '09:00:00', 1, '', 0, 0, 2, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(15212, 61340, '2016-12-14', '10:00:00', 1, '', 0, 0, 1, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(15213, 61340, '2016-12-14', '11:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(15214, 61340, '2016-12-14', '13:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(15215, 61340, '2016-12-14', '14:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(15216, 61340, '2016-12-14', '15:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(15217, 61337, '2016-12-15', '09:00:00', 1, '', 0, 0, 2, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(15218, 61337, '2016-12-15', '10:00:00', 1, '', 0, 0, 1, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(15219, 61337, '2016-12-15', '11:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(15220, 61337, '2016-12-15', '13:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(15221, 61337, '2016-12-15', '14:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(15222, 61337, '2016-12-15', '15:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(15223, 61338, '2016-12-16', '09:00:00', 1, '', 0, 0, 2, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(15224, 61338, '2016-12-16', '10:00:00', 1, '', 0, 0, 1, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(15225, 61338, '2016-12-16', '11:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(15226, 61338, '2016-12-16', '13:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(15227, 61338, '2016-12-16', '14:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(15228, 61338, '2016-12-16', '15:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(15229, 61339, '2016-12-17', '09:00:00', 1, '', 0, 0, 2, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(15230, 61339, '2016-12-17', '10:00:00', 1, '', 0, 0, 1, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(15231, 61339, '2016-12-17', '11:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(15232, 61339, '2016-12-17', '13:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(15233, 61339, '2016-12-17', '14:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
(15234, 61339, '2016-12-17', '15:00:00', 1, '', 0, 0, 0, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `fd_rel_doctor_appointment_time_his`
--

CREATE TABLE `fd_rel_doctor_appointment_time_his` (
  `DOCTOR_APPOINTMENT_TIME_ID` int(11) NOT NULL,
  `DOCTOR_ID` int(11) NOT NULL,
  `APPOINTMENT_DATE` datetime NOT NULL,
  `ACTIVE_STATUS` int(11) NOT NULL,
  `NOTE` varchar(200) NOT NULL,
  `OPERATOR_STATUS` varchar(50) NOT NULL,
  `CREATE_USER` varchar(50) NOT NULL,
  `CREATE_DATE` datetime NOT NULL,
  `UPDATE_USER` varchar(50) NOT NULL,
  `UPDATE_DATE` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `fd_role`
--

CREATE TABLE `fd_role` (
  `ROLE_ID` int(11) NOT NULL,
  `ROLE_NAME` varchar(50) NOT NULL,
  `NOTE` varchar(200) DEFAULT NULL,
  `CREATE_USER` varchar(50) NOT NULL,
  `CREATE_DATE` datetime NOT NULL,
  `UPDATE_USER` varchar(50) NOT NULL,
  `UPDATE_DATE` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `fd_save_search`
--

CREATE TABLE `fd_save_search` (
  `CUSTOMER_SEARCH_ID` int(11) NOT NULL,
  `CUSTOMER_USER_ID` int(11) NOT NULL,
  `SEARCH_NAME` varchar(50) NOT NULL,
  `CLINIC_SUBURB` varchar(50) NOT NULL,
  `STATE_ID` varchar(50) NOT NULL,
  `CLINIC_NAME` varchar(50) NOT NULL,
  `DOCTOR_TYPE` varchar(50) NOT NULL,
  `DOCTOR_NAME` varchar(50) NOT NULL,
  `DISTANCE` varchar(50) NOT NULL,
  `CREATE_USER` varchar(50) NOT NULL,
  `CREATE_DATE` datetime NOT NULL,
  `UPDATE_USER` varchar(50) NOT NULL,
  `UPDATE_DATE` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `fd_service`
--

CREATE TABLE `fd_service` (
  `SERVICE_CODE` int(11) NOT NULL,
  `SERVICE_ID` varchar(50) NOT NULL,
  `DES` varchar(50) NOT NULL,
  `SERVICE_JS` varchar(50) NOT NULL,
  `URL` varchar(50) NOT NULL,
  `INPUT_PARA` varchar(300) NOT NULL,
  `OUTPUT_PARA` varchar(50) NOT NULL,
  `NOTE` varchar(50) NOT NULL,
  `CREATE_USER` varchar(50) NOT NULL,
  `CREATE_DATE` datetime NOT NULL,
  `UPDATE_USER` varchar(50) NOT NULL,
  `UPDATE_DATE` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fd_service`
--

INSERT INTO `fd_service` (`SERVICE_CODE`, `SERVICE_ID`, `DES`, `SERVICE_JS`, `URL`, `INPUT_PARA`, `OUTPUT_PARA`, `NOTE`, `CREATE_USER`, `CREATE_DATE`, `UPDATE_USER`, `UPDATE_DATE`) VALUES
(4, 'UI01', '用户登录', 'sign_in.js', 'url: "classes/class.sign_in.php",', '页面所有输入框', '', '', 'admin', '2016-09-09 00:00:00', 'admin', '2016-09-09 00:00:00'),
(5, 'UI02', '获取用户详细信息(条件用户名)', 'appointmentDoctor.js', 'url: "classes/class.UserDetail.php",', 'username: username', '用户详细信息', '', 'admin', '2016-09-09 00:00:00', 'admin', '2016-09-09 00:00:00'),
(6, 'UI03', '获取用户详细信息(条件用户ID)', 'userUpdPersonInfo.js', 'url: "classes/class.UserDetail.php",', 'action_type: "view", CUSTOMER_USER_ID: fd_userid', '', '', 'admin', '2016-09-09 00:00:00', 'admin', '2016-09-09 00:00:00'),
(7, 'UU01', '个人用户注册(游客通过预约,自动注册)', 'appointmentDoctor.js', 'url: "classes/class.sign_up_person.php",', '页面所有输入框', '', '', 'admin', '2016-09-09 00:00:00', 'admin', '2016-09-09 00:00:00'),
(8, 'UU02', '个人用户注册(通过注册页面注册)', 'sign_up_person.js', 'url: "classes/class.sign_up_person.php",', '页面所有输入框', '', '', 'admin', '2016-09-09 00:00:00', 'admin', '2016-09-09 00:00:00'),
(9, 'UU03', '修改个人用户信息', 'userUpdPersonInfo.j', 'url: "classes/class.UserDetail.php",', '页面所有输入框', '', '', 'admin', '2016-09-09 00:00:00', 'admin', '2016-09-09 00:00:00'),
(10, 'UU04', '修改个人用户密码', 'userUpdPersonPwd.js', 'url: "classes/class.UserDetail.php",', 'action_type:"update", CUSTOMER_USER_ID:fd_userid, CUSTOMER_USER_PWD:$(''#CUSTOMER_USER_NEWPWD'').val()', '', '', 'admin', '2016-09-09 00:00:00', 'admin', '2016-09-09 00:00:00'),
(11, 'CU01', '诊所用户注册', 'sign_up_clinic.js', 'url: "classes/class.signup_clinic.php",', '页面所有输入框', '', '', 'admin', '2016-09-09 00:00:00', 'admin', '2016-09-09 00:00:00'),
(12, 'CU02', '获取诊所用户详细信息', 'clinicUpdUserInfo.js', 'url: "classes/class.ClinicDetail.php",', 'action_type: "view",\r\nCLINIC_USER_ID: fd_userid', '', '', 'admin', '2016-09-09 00:00:00', 'admin', '2016-09-09 00:00:00'),
(13, 'CU03', '修改诊所用户信息', 'clinicUpdUserInfo.js', 'url: "classes/class.ClinicDetail.php",', '页面所有输入框', '', '', 'admin', '2016-09-09 00:00:00', 'admin', '2016-09-09 00:00:00'),
(16, 'CU04', '修改诊所用户密码', 'clinicUpdUserPwd.js', 'url: "classes/class.ClinicDetail.php",', 'action_type:"update",\r\nCLINIC_USER_ID:fd_userid,\r\nCLINIC_USER_PWD:$(''#CUSTOMER_USER_NEWPWD'').val()', '', '', 'admin', '2016-09-09 00:00:00', 'admin', '2016-09-09 00:00:00'),
(17, 'CU05', '诊所用户搜索医生', 'clinicQryDoctor.js', 'url: "classes/class.ClinicOprDoctor.php",', 'CLINIC_USER_ID: fd_userid,\r\n    DOCTOR_TYPE: $(''#DOCTOR_TYPE'').val(),\r\n    DOCTOR_NAME: $(''#DOCTOR_NAME'').val(),', '', '', 'admin', '2016-09-09 00:00:00', 'admin', '2016-09-09 00:00:00'),
(18, 'CU06', '修改医生为inactive/active', 'clinicQryDoctor.js', 'url: "classes/class.ClinicOprDoctor.php",', 'action_type: "update",\r\n      ACTIVE_STATUS: 0|1,\r\n      DOCTOR_ID: DOCTOR_ID', '', '', 'admin', '2016-09-09 00:00:00', 'admin', '2016-09-09 00:00:00'),
(19, 'CU07', '修改医生基本信息', 'clinicUpdDoctorDetail.js', 'url: "classes/class.ClinicOprDoctor.php",', '页面所有输入框', '', '', 'admin', '2016-09-09 00:00:00', 'admin', '2016-09-09 00:00:00'),
(20, 'SD01', '搜索医生(主页全体条件 or)', 'searchDoctor.js', 'url: "classes/class.searchDoctor.php",', '见首页输入框', '诊所，医生，及预约时间（预约医生所需全部内容）', '入参requesttype = 0 查询条件or', 'admin', '2016-09-09 00:00:00', 'admin', '2016-09-09 00:00:00'),
(21, 'SD02', '搜索医生(主页全体条件 and)', 'searchDoctor.js', 'url: "classes/class.searchDoctor.php",', '搜索医生也点击搜索按钮，全体输入框', '诊所，医生，及预约时间（预约医生所需全部内容）', '入参requesttype = 1 查询条件and', 'admin', '2016-09-09 00:00:00', 'admin', '2016-09-09 00:00:00'),
(22, 'ST01', '搜索医生预约时间ID(条件医生ID,预约时间日期，时间)', 'appointmentDoctor.js', 'url: "classes/class.searchAppTimeID.php",', 'DOCTOR_ID: $(''#DOCTOR_ID'').val(),\r\nAPPOINTMENT_DATE:\r\nAPPOINTMENT_TIME: radio_txt', '搜索医生预约时间ID', '', 'admin', '2016-09-09 00:00:00', 'admin', '2016-09-09 00:00:00'),
(23, 'SP01', '搜索预约状态（填充下拉框）', 'userAppointmentRecoder.js', 'url: "classes/class.getAppointmentStatus.php",', 'para="";', '', '', 'admin', '2016-09-09 00:00:00', 'admin', '2016-09-09 00:00:00'),
(24, 'SP02', '搜索预约记录', 'userAppointmentRecoder.js', 'url: "classes/class.AppointmentRecoder.php",', 'CUSTOMER_USER_ID: userid,\r\nCREATE_DATE_BEGIN:  $(''#begin_time'').val(),\r\nCREATE_DATE_END:  $(''#end_time'').val(),\r\nAPPOINTMENT_STATUS_ID : $(''#app_status'').val()', '', '', 'admin', '2016-09-09 00:00:00', 'admin', '2016-09-09 00:00:00'),
(25, 'AD01', '预约医生', 'appointmentDoctor.js', 'url: "classes/class.appointmentDoctor.php",', 'action_type: ""create"",\r\nCUSTOMER_USER_NAME: $(''#CUSTOMER_USER_NAME'').val(),\r\nCUSTOMER_USER_PWD: $(''#CUSTOMER_USER_PWD'').val(),\r\nCUSTOMER_USER_ID: custom_user_id,\r\nDOCTOR_ID: $(''#DOCTOR_ID'').val(),\r\nDOCTOR_APPOINTMENT_TIME_ID:time_id,\r\nAPPOINTMENT_STATUS_ID:1', '预约成功', '', 'admin', '2016-09-09 00:00:00', 'admin', '2016-09-09 00:00:00'),
(26, 'AD02', '取消预约', 'userAppointmentRecoder.js', 'url: "classes/class.AppointmentRecoder.php",', 'action_type: ""update"",\r\nCUSTOMER_USER_ID: CUSTOMER_USER_ID,\r\nDOCTOR_ID: DOCTOR_ID,\r\nCREATE_DATE: CREATE_DATE', '', '', 'admin', '2016-09-09 00:00:00', 'admin', '2016-09-09 00:00:00'),
(27, 'S001', '收藏医生', 'appointmentDoctor.js', 'url: "classes/class.saveDoctor.php",', 'action_type:""create"",\r\nCUSTOMER_USER_ID:$(''#CUSTOMER_USER_ID'').val(),\r\nDOCTOR_ID:$(''#DOCTOR_ID'').val()', '', '', 'admin', '2016-09-09 00:00:00', 'admin', '2016-09-09 00:00:00'),
(28, 'S002', '搜索收藏的医生', 'userSaveDoctor.js', 'url: "classes/class.saveDoctor.php",', '页面所有输入框', '', '', 'admin', '2016-09-09 00:00:00', 'admin', '2016-09-09 00:00:00'),
(29, 'S003', '删除收藏医生', 'userSaveDoctor.js', 'url: "classes/class.saveDoctor.php",', 'action_type: ""remove"",\r\nCUSTOMER_USER_ID: CUSTOMER_USER_ID,\r\nDOCTOR_ID: DOCTOR_ID', '', '', 'admin', '2016-09-09 00:00:00', 'admin', '2016-09-09 00:00:00'),
(30, 'SS01', '保存为常用搜索条件', 'searchDoctor.js', 'url: "classes/class.saveSearch.php",', '页面所有输入框', '', '', 'admin', '2016-09-09 00:00:00', 'admin', '2016-09-09 00:00:00'),
(31, 'SS02', '搜索常用搜索条件', 'userSaveSearch.js', 'url: "classes/class.saveSearch.php",', 'CUSTOMER_USER_ID: fd_userid', '', '', 'admin', '2016-09-09 00:00:00', 'admin', '2016-09-09 00:00:00'),
(32, 'SS03', '删除常用搜索条件', 'userSaveSearch.js', 'url: "classes/class.saveSearch.php",', 'action_type: "remove",\r\nCUSTOMER_USER_ID: CUSTOMER_USER_ID,\r\nCUSTOMER_SEARCH_ID: CUSTOMER_SEARCH_ID', '', '', 'admin', '2016-09-09 00:00:00', 'admin', '2016-09-09 00:00:00'),
(36, 'AU01', '修改管理员密码', 'adminUpdPwd.js', 'url: "classes/class.AdminDetail.php",', 'action_type: "update",\r\nADMIN_ID:fd_userid,\r\nADMIN_PWD:$(''#CUSTOMER_USER_NEWPWD'').val()', '', '', 'admin', '2016-09-09 00:00:00', 'admin', '2016-09-09 00:00:00'),
(37, 'AU02', '查询诊所用户', 'adminQryClinic.js', 'url: "classes/class.ClinicDetail.php",', '页面输入条件', '', '', 'admin', '2016-09-09 00:00:00', 'admin', '2016-09-09 00:00:00'),
(38, 'AU03', '查询个人用户', 'adminQryUser.js', 'url: "classes/class.UserDetail.php",', '页面所有输入框', '', '', 'admin', '2016-09-09 00:00:00', 'admin', '2016-09-09 00:00:00'),
(39, 'AU06', '修改诊所用户为inactive/active', 'adminQryClinic.js', 'url: "classes/class.ClinicDetail.php",', 'action_type: "update_active",\r\nACTIVE_STATUS: 0,\r\nCLINIC_USER_ID: CLINIC_USER_ID', '', '', 'admin', '2016-09-09 00:00:00', 'admin', '2016-09-09 00:00:00'),
(40, 'AU07', '修改个人用户为inactive/active', 'adminQryUser.js', 'url: "classes/class.UserDetail.php",', 'action_type: "update_active",\r\nACTIVE_STATUS: 1/0,\r\nCUSTOMER_USER_ID: CUSTOMER_USER_ID', '', '', 'admin', '2016-09-09 00:00:00', 'admin', '2016-09-09 00:00:00'),
(41, 'SSTE', '填充州下拉列表', 'adminQryUser.js', 'url: "classes/class.getState.php",', '空', '州所有内容', '全部查询，无需条件', 'admin', '2016-09-09 00:00:00', 'admin', '2016-09-09 00:00:00'),
(42, 'SDTY', '填充医生类别', 'adminQryDoctor.js', 'url: "classes/class.getDoctorType.php",', '无', '医生所有类别', '查询全部内容', 'admin', '2016-09-10 00:00:00', 'admin', '2016-09-10 00:00:00'),
(43, 'SSUB', '填充区', 'userSaveDoctor.js', 'url: "classes/class.getSuburb.php",', '无', '全部诊所区', '查询全部，无条件', 'admin', '2016-09-13 00:00:00', 'admin', '2016-09-13 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `fd_user`
--

CREATE TABLE `fd_user` (
  `USER_ID` int(11) NOT NULL,
  `LOGIN_NAME` varchar(50) NOT NULL,
  `LOGIN_PWD` varchar(50) NOT NULL,
  `USER_NAME` varchar(50) NOT NULL,
  `USER_GENDER` varchar(50) NOT NULL,
  `USER_TEL` varchar(50) NOT NULL,
  `ROLE_ID` varchar(50) NOT NULL,
  `USER_ADDR` varchar(200) NOT NULL,
  `NOTE` varchar(200) DEFAULT NULL,
  `CONTAIN_USER` varchar(50) NOT NULL,
  `CREATE_USER` varchar(50) NOT NULL,
  `CREATE_DATE` datetime NOT NULL,
  `UPDATE_USER` varchar(50) NOT NULL,
  `UPDATE_DATE` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ap_patient`
--
ALTER TABLE `ap_patient`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fd_admin`
--
ALTER TABLE `fd_admin`
  ADD PRIMARY KEY (`ADMIN_ID`);

--
-- Indexes for table `fd_clinic_user`
--
ALTER TABLE `fd_clinic_user`
  ADD PRIMARY KEY (`CLINIC_USER_ID`),
  ADD KEY `FK_fd_clinic_user_2` (`STATE_ID`);

--
-- Indexes for table `fd_customer_user`
--
ALTER TABLE `fd_customer_user`
  ADD PRIMARY KEY (`CUSTOMER_USER_ID`),
  ADD KEY `FK_fd_customer_user_7` (`STATE_ID`);

--
-- Indexes for table `fd_dict_appointment_status`
--
ALTER TABLE `fd_dict_appointment_status`
  ADD PRIMARY KEY (`APPOINTMENT_STATUS_ID`);

--
-- Indexes for table `fd_dict_log_type`
--
ALTER TABLE `fd_dict_log_type`
  ADD PRIMARY KEY (`LOG_TYPE_ID`);

--
-- Indexes for table `fd_dict_search`
--
ALTER TABLE `fd_dict_search`
  ADD PRIMARY KEY (`SEARCH_ID`);

--
-- Indexes for table `fd_dict_state`
--
ALTER TABLE `fd_dict_state`
  ADD PRIMARY KEY (`STATE_ID`),
  ADD UNIQUE KEY `STATE_NAME` (`STATE_NAME`);

--
-- Indexes for table `fd_doctor`
--
ALTER TABLE `fd_doctor`
  ADD PRIMARY KEY (`DOCTOR_ID`);

--
-- Indexes for table `fd_function`
--
ALTER TABLE `fd_function`
  ADD PRIMARY KEY (`FUNCTION_ID`);

--
-- Indexes for table `fd_log`
--
ALTER TABLE `fd_log`
  ADD PRIMARY KEY (`LOG_ID`);

--
-- Indexes for table `fd_rel_clinic_doctor`
--
ALTER TABLE `fd_rel_clinic_doctor`
  ADD PRIMARY KEY (`CLINIC_DOCTOR_ID`),
  ADD KEY `FK_fd_rel_clinic_doctor_1` (`DOCTOR_ID`),
  ADD KEY `FK_fd_rel_clinic_doctor_2` (`CLINIC_USER_ID`);

--
-- Indexes for table `fd_rel_customer_appointment`
--
ALTER TABLE `fd_rel_customer_appointment`
  ADD PRIMARY KEY (`CUSTOMER_APPOINTMENT_ID`),
  ADD KEY `FK_fd_rel_customer_appointment_1` (`CUSTOMER_USER_ID`),
  ADD KEY `FK_fd_rel_customer_appointment_2` (`DOCTOR_ID`),
  ADD KEY `FK_fd_rel_customer_appointment_3` (`DOCTOR_APPOINTMENT_TIME_ID`),
  ADD KEY `FK_fd_rel_customer_appointment_4` (`APPOINTMENT_STATUS_ID`);

--
-- Indexes for table `fd_rel_customer_appointment_his`
--
ALTER TABLE `fd_rel_customer_appointment_his`
  ADD PRIMARY KEY (`CUSTOMER_APPOINTMENT_ID`);

--
-- Indexes for table `fd_rel_customer_doctor`
--
ALTER TABLE `fd_rel_customer_doctor`
  ADD PRIMARY KEY (`CUSTOMER_DOCTOR_ID`),
  ADD KEY `FK_fd_rel_customer_doctor_1` (`CUSTOMER_USER_ID`),
  ADD KEY `FK_fd_rel_customer_doctor_2` (`DOCTOR_ID`);

--
-- Indexes for table `fd_rel_doctor_appointment_time`
--
ALTER TABLE `fd_rel_doctor_appointment_time`
  ADD PRIMARY KEY (`DOCTOR_APPOINTMENT_TIME_ID`),
  ADD KEY `FK_fd_rel_doctor_appointment_time_1` (`DOCTOR_ID`);

--
-- Indexes for table `fd_rel_doctor_appointment_time_his`
--
ALTER TABLE `fd_rel_doctor_appointment_time_his`
  ADD PRIMARY KEY (`DOCTOR_APPOINTMENT_TIME_ID`);

--
-- Indexes for table `fd_role`
--
ALTER TABLE `fd_role`
  ADD PRIMARY KEY (`ROLE_ID`);

--
-- Indexes for table `fd_save_search`
--
ALTER TABLE `fd_save_search`
  ADD PRIMARY KEY (`CUSTOMER_SEARCH_ID`),
  ADD KEY `FK_FD_SAVE_SEARCH_1` (`CUSTOMER_USER_ID`);

--
-- Indexes for table `fd_service`
--
ALTER TABLE `fd_service`
  ADD PRIMARY KEY (`SERVICE_CODE`),
  ADD UNIQUE KEY `SERVICE_ID` (`SERVICE_ID`);

--
-- Indexes for table `fd_user`
--
ALTER TABLE `fd_user`
  ADD PRIMARY KEY (`USER_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ap_patient`
--
ALTER TABLE `ap_patient`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT for table `fd_admin`
--
ALTER TABLE `fd_admin`
  MODIFY `ADMIN_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `fd_clinic_user`
--
ALTER TABLE `fd_clinic_user`
  MODIFY `CLINIC_USER_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `fd_customer_user`
--
ALTER TABLE `fd_customer_user`
  MODIFY `CUSTOMER_USER_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=192;
--
-- AUTO_INCREMENT for table `fd_dict_appointment_status`
--
ALTER TABLE `fd_dict_appointment_status`
  MODIFY `APPOINTMENT_STATUS_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `fd_dict_search`
--
ALTER TABLE `fd_dict_search`
  MODIFY `SEARCH_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `fd_dict_state`
--
ALTER TABLE `fd_dict_state`
  MODIFY `STATE_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `fd_doctor`
--
ALTER TABLE `fd_doctor`
  MODIFY `DOCTOR_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61341;
--
-- AUTO_INCREMENT for table `fd_function`
--
ALTER TABLE `fd_function`
  MODIFY `FUNCTION_ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `fd_log`
--
ALTER TABLE `fd_log`
  MODIFY `LOG_ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `fd_rel_clinic_doctor`
--
ALTER TABLE `fd_rel_clinic_doctor`
  MODIFY `CLINIC_DOCTOR_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `fd_rel_customer_appointment`
--
ALTER TABLE `fd_rel_customer_appointment`
  MODIFY `CUSTOMER_APPOINTMENT_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=124;
--
-- AUTO_INCREMENT for table `fd_rel_customer_appointment_his`
--
ALTER TABLE `fd_rel_customer_appointment_his`
  MODIFY `CUSTOMER_APPOINTMENT_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;
--
-- AUTO_INCREMENT for table `fd_rel_customer_doctor`
--
ALTER TABLE `fd_rel_customer_doctor`
  MODIFY `CUSTOMER_DOCTOR_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `fd_rel_doctor_appointment_time`
--
ALTER TABLE `fd_rel_doctor_appointment_time`
  MODIFY `DOCTOR_APPOINTMENT_TIME_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15235;
--
-- AUTO_INCREMENT for table `fd_rel_doctor_appointment_time_his`
--
ALTER TABLE `fd_rel_doctor_appointment_time_his`
  MODIFY `DOCTOR_APPOINTMENT_TIME_ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `fd_role`
--
ALTER TABLE `fd_role`
  MODIFY `ROLE_ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `fd_save_search`
--
ALTER TABLE `fd_save_search`
  MODIFY `CUSTOMER_SEARCH_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `fd_service`
--
ALTER TABLE `fd_service`
  MODIFY `SERVICE_CODE` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;
--
-- AUTO_INCREMENT for table `fd_user`
--
ALTER TABLE `fd_user`
  MODIFY `USER_ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `fd_clinic_user`
--
ALTER TABLE `fd_clinic_user`
  ADD CONSTRAINT `FK_fd_clinic_user_2` FOREIGN KEY (`STATE_ID`) REFERENCES `fd_dict_state` (`STATE_ID`);

--
-- Constraints for table `fd_customer_user`
--
ALTER TABLE `fd_customer_user`
  ADD CONSTRAINT `FK_fd_customer_user_7` FOREIGN KEY (`STATE_ID`) REFERENCES `fd_dict_state` (`STATE_ID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
