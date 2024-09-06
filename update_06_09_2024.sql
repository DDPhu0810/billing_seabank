use billing_server;
-- --------------------------------------------------------
-- Host:                         localhost
-- Server version:               10.8.3-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Dumping structure for table billing_server_test.price_prefix_hotline
DROP TABLE IF EXISTS `price_prefix_hotline`;
CREATE TABLE IF NOT EXISTS `price_prefix_hotline` (
  `prefix` varchar(50) CHARACTER SET utf8mb3 NOT NULL,
  `ivr` longtext CHARACTER SET utf8mb3 DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb3 DEFAULT NULL,
  `price_second` double(255,2) DEFAULT NULL,
  `price_block` double(255,2) DEFAULT NULL,
  `price_minute` double(255,2) DEFAULT NULL,
  PRIMARY KEY (`prefix`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- Dumping data for table billing_server_test.price_prefix_hotline: ~1 rows (approximately)
/*!40000 ALTER TABLE `price_prefix_hotline` DISABLE KEYS */;
INSERT INTO `price_prefix_hotline` (`prefix`, `ivr`, `description`, `price_second`, `price_block`, `price_minute`) VALUES
	('1800', NULL, NULL, NULL, NULL, NULL),
	('1900', '1792, 1794, 1781, 244918, 244858, 244933, 244950, 244945, 244886,244911, 244935, 244952,244951, 244963, 244932, 244955,244936, 244912, 244919, 244929, 244940, 244978, 244948, 244962, 244941, 244913, 44937, 244866, 244931, 244971, 244967, 244947, 244848, 244964, 244957, 244972, 244928, 244970, 244903, 244926, 244968,244924, 244965, 244954, 244975, 244976, 244828, 244958, 244979, 244915, 244961, 244922, 244942, 244925, 244943, 244956, 244939, 244927, 244923, 244906, 244888, 244905, 244946, 244930, 244909, 244916, 248054, 244908, 244999, 244921, 244966, 244938', 'Trigger IVR for prefix 1900', NULL, NULL, 1500.00);
/*!40000 ALTER TABLE `price_prefix_hotline` ENABLE KEYS */;

-- Dumping structure for procedure billing_server_test.proc_inbound_call_histories_4_admin
DROP PROCEDURE IF EXISTS `proc_inbound_call_histories_4_admin`;
DELIMITER //
CREATE PROCEDURE `proc_inbound_call_histories_4_admin`(
	IN `p_startTime` DATETIME,
	IN `p_endTime` DATETIME,
	IN `p_usernames` LONGTEXT,
	IN `p_groupnames` LONGTEXT,
	IN `p_gatewaynames` LONGTEXT
)
BEGIN

WITH RankedCalls AS (
    SELECT 
        global_callid_call_id,
        user_name,
        display_name,
        from_phone_number,orig_device_name, department, to_phone_number, duration, called_at,
        ROW_NUMBER() OVER (PARTITION BY global_callid_call_id ORDER BY called_at) AS call_order
    FROM call_histories_cdr WHERE LENGTH(calling_party_number) > 9 AND calling_party_number NOT LIKE 'b%' AND duration > 0
		AND called_at >= case when p_startTime IS NULL then called_at else p_startTime END 
      AND called_at <=  case when p_endTime IS NULL then called_at else p_endTime END 
      AND (case when COALESCE(p_usernames, 'ALL') = 'ALL' then 1 when COALESCE(p_usernames, 'ALL')<> 'ALL' and FIND_IN_SET(user_name,p_usernames) then 1 else 0 end) = 1 
      AND (case when COALESCE(p_groupnames, 'ALL') = 'ALL' then 1 when COALESCE(p_groupnames, 'ALL')<> 'ALL' and FIND_IN_SET(department,p_groupnames)then 1 else 0 end) = 1
      AND (case when COALESCE(p_gatewaynames, 'ALL') = 'ALL' then 1 when COALESCE(p_gatewaynames, 'ALL')<> 'ALL' and FIND_IN_SET(orig_device_name,p_gatewaynames) then 1 else 0 end) = 1
)

SELECT global_callid_call_id, user_name, display_name, from_phone_number, orig_device_name, department, 
	MAX(CASE WHEN call_order = 1 THEN to_phone_number END) AS ivr,
    ifnull(MAX(CASE WHEN call_order > 1 THEN to_phone_number END),MAX(CASE WHEN call_order = 1 THEN to_phone_number END)) AS destination,
 SUM(duration)
-- ,	 CEIL(SUM(duration)/60) * (SELECT price_minute FROM price_config WHERE `type` = 'prefix_1900') AS cost
, min(called_at)
FROM RankedCalls
GROUP BY global_callid_call_id
HAVING FIND_IN_SET(ivr, (SELECT value_config FROM `config` WHERE key_config = 'IVR_prefix_1900'));
                    
END//
DELIMITER ;

-- Dumping structure for procedure billing_server_test.proc_inbound_call_histories_4_leader
DROP PROCEDURE IF EXISTS `proc_inbound_call_histories_4_leader`;
DELIMITER //
CREATE PROCEDURE `proc_inbound_call_histories_4_leader`(
	IN `p_users_condition` LONGTEXT,
	IN `p_startTime` DATETIME,
	IN `p_endTime` DATETIME,
	IN `p_usernames` LONGTEXT,
	IN `p_groupnames` LONGTEXT,
	IN `p_gatewaynames` LONGTEXT
)
BEGIN

WITH RankedCalls AS (
    SELECT 
        global_callid_call_id,
        user_name,
        display_name,
        from_phone_number,orig_device_name, department, to_phone_number, duration, called_at,
        ROW_NUMBER() OVER (PARTITION BY global_callid_call_id ORDER BY called_at) AS call_order
    FROM call_histories_cdr WHERE LENGTH(calling_party_number) > 9 AND calling_party_number NOT LIKE 'b%' AND duration > 0
		AND called_at >= case when p_startTime IS NULL then called_at else p_startTime END 
      AND called_at <=  case when p_endTime IS NULL then called_at else p_endTime END 
      AND (case when COALESCE(p_usernames, 'ALL') = 'ALL' then 1 when COALESCE(p_usernames, 'ALL')<> 'ALL' and FIND_IN_SET(user_name,p_usernames) then 1 else 0 end) = 1 
      AND (case when COALESCE(p_groupnames, 'ALL') = 'ALL' then 1 when COALESCE(p_groupnames, 'ALL')<> 'ALL' and FIND_IN_SET(department,p_groupnames) then 1 else 0 end) = 1
      AND (case when COALESCE(p_gatewaynames, 'ALL') = 'ALL' then 1 when COALESCE(p_gatewaynames, 'ALL')<> 'ALL' and FIND_IN_SET(orig_device_name,p_gatewaynames) then 1 else 0 end) = 1
		AND FIND_IN_SET(c.userName,p_users_condition)
)

SELECT global_callid_call_id, user_name, display_name, from_phone_number, orig_device_name, department, 
	MAX(CASE WHEN call_order = 1 THEN to_phone_number END) AS ivr,
    ifnull(MAX(CASE WHEN call_order > 1 THEN to_phone_number END),MAX(CASE WHEN call_order = 1 THEN to_phone_number END)) AS destination,
 SUM(duration)
-- , CEIL(SUM(duration)/60) * (SELECT price_minute FROM price_config WHERE `type` = 'prefix_1900') AS cost
, min(called_at)
FROM RankedCalls
GROUP BY global_callid_call_id
HAVING FIND_IN_SET(to_phone_number, (SELECT value_config FROM `config` WHERE key_config = 'IVR_prefix_1900'));
                    
END//
DELIMITER ;

-- Dumping structure for procedure billing_server_test.proc_inbound_call_histories_4_view_all
DROP PROCEDURE IF EXISTS `proc_inbound_call_histories_4_view_all`;
DELIMITER //
CREATE PROCEDURE `proc_inbound_call_histories_4_view_all`(
	IN `p_startTime` DATETIME,
	IN `p_endTime` DATETIME,
	IN `p_usernames` LONGTEXT,
	IN `p_groupnames` LONGTEXT,
	IN `p_gatewaynames` LONGTEXT,
	IN `p_ipphone` LONGTEXT
)
BEGIN

WITH RankedCalls AS (
    SELECT 
        global_callid_call_id,
        user_name,
        display_name,
        from_phone_number,orig_device_name, department, to_phone_number, duration, called_at,
        ROW_NUMBER() OVER (PARTITION BY global_callid_call_id ORDER BY called_at) AS call_order
    FROM call_histories_cdr WHERE LENGTH(calling_party_number) > 9 AND calling_party_number NOT LIKE 'b%' AND duration > 0
		AND called_at >= case when p_startTime IS NULL then called_at else p_startTime END 
      AND called_at <=  case when p_endTime IS NULL then called_at else p_endTime END 
      AND (case when COALESCE(p_usernames, 'ALL') = 'ALL' then 1 when COALESCE(p_usernames, 'ALL')<> 'ALL' and FIND_IN_SET(user_name,p_usernames) then 1 else 0 end) = 1 
      AND (case when COALESCE(p_groupnames, 'ALL') = 'ALL' then 1 when COALESCE(p_groupnames, 'ALL')<> 'ALL' and FIND_IN_SET(department,p_groupnames) then 1 else 0 end) = 1
      AND (case when COALESCE(p_gatewaynames, 'ALL') = 'ALL' then 1 when COALESCE(p_gatewaynames, 'ALL')<> 'ALL' and FIND_IN_SET(orig_device_name,p_gatewaynames) then 1 else 0 end) = 1
		AND (to_phone_number = p_ipphone)
)

SELECT global_callid_call_id, user_name, display_name, from_phone_number, orig_device_name, department, 
	MAX(CASE WHEN call_order = 1 THEN to_phone_number END) AS ivr,
    ifnull(MAX(CASE WHEN call_order > 1 THEN to_phone_number END),MAX(CASE WHEN call_order = 1 THEN to_phone_number END)) AS destination,
 SUM(duration)
-- , CEIL(SUM(duration)/60) * (SELECT price_minute FROM price_config WHERE `type` = 'prefix_1900') AS cost
, min(called_at)
FROM call_histories_cdr
GROUP BY global_callid_call_id
HAVING FIND_IN_SET(to_phone_number, (SELECT value_config FROM `config` WHERE key_config = 'IVR_prefix_1900'));
                    
END//
DELIMITER ;

-- Dumping structure for procedure billing_server_test.proc_inbound_call_histories_4_view_all_with_gateway_manager
DROP PROCEDURE IF EXISTS `proc_inbound_call_histories_4_view_all_with_gateway_manager`;
DELIMITER //
CREATE PROCEDURE `proc_inbound_call_histories_4_view_all_with_gateway_manager`(
	IN `p_startTime` DATETIME,
	IN `p_endTime` DATETIME,
	IN `p_usernames` LONGTEXT,
	IN `p_groupnames` LONGTEXT,
	IN `p_gatewaynames` LONGTEXT,
	IN `p_ipphone` LONGTEXT,
	IN `p_gateway_managers` LONGTEXT
)
BEGIN

WITH RankedCalls AS (
    SELECT 
        global_callid_call_id,
        user_name,
        display_name,
        from_phone_number,orig_device_name, department, to_phone_number, duration, called_at,
        ROW_NUMBER() OVER (PARTITION BY global_callid_call_id ORDER BY called_at) AS call_order
    FROM call_histories_cdr WHERE LENGTH(calling_party_number) > 9 AND calling_party_number NOT LIKE 'b%' AND duration > 0
		AND called_at >= case when p_startTime IS NULL then called_at else p_startTime END 
      AND called_at <=  case when p_endTime IS NULL then called_at else p_endTime END 
      AND (case when COALESCE(p_usernames, 'ALL') = 'ALL' then 1 when COALESCE(p_usernames, 'ALL')<> 'ALL' and FIND_IN_SET(user_name,p_usernames) then 1 else 0 end) = 1 
      AND (case when COALESCE(p_groupnames, 'ALL') = 'ALL' then 1 when COALESCE(p_groupnames, 'ALL')<> 'ALL' and FIND_IN_SET(department,p_groupnames) then 1 else 0 end) = 1
      AND (case when COALESCE(p_gatewaynames, 'ALL') = 'ALL' then 1 when COALESCE(p_gatewaynames, 'ALL')<> 'ALL' and FIND_IN_SET(orig_device_name,p_gatewaynames) then 1 else 0 end) = 1
		AND (to_phone_number = p_ipphone OR FIND_IN_SET(orig_device_name,p_gateway_managers))
)

SELECT global_callid_call_id, user_name, display_name, from_phone_number, orig_device_name, department, 
	MAX(CASE WHEN call_order = 1 THEN to_phone_number END) AS ivr,
    ifnull(MAX(CASE WHEN call_order > 1 THEN to_phone_number END),MAX(CASE WHEN call_order = 1 THEN to_phone_number END)) AS destination,
 	SUM(duration)
 	-- ,CEIL(SUM(duration)/60) * (SELECT price_minute FROM price_config WHERE `type` = 'prefix_1900') AS cost
	 , min(called_at)
FROM call_histories_cdr
GROUP BY global_callid_call_id
HAVING FIND_IN_SET(to_phone_number, (SELECT value_config FROM `config` WHERE key_config = 'IVR_prefix_1900'));
                    
END//
DELIMITER ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
