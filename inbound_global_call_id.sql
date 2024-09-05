
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

SELECT global_callid_call_id, user_name, display_name, from_phone_number, dest_device_name, department, to_phone_number, SUM(duration),
		 CEIL(SUM(duration)/60) * (SELECT price_minute FROM price_config WHERE `type` = 'prefix_1900') AS cost, min(called_at)
FROM call_histories_cdr
WHERE LENGTH(calling_party_number) > 9 AND calling_party_number NOT LIKE 'b%' AND duration > 0
		AND called_at >= case when p_startTime IS NULL then called_at else p_startTime END 
      AND called_at <=  case when p_endTime IS NULL then called_at else p_endTime END 
      AND (case when COALESCE(p_usernames, 'ALL') = 'ALL' then 1 when COALESCE(p_usernames, 'ALL')<> 'ALL' and FIND_IN_SET(user_name,p_usernames) then 1 else 0 end) = 1 
      AND (case when COALESCE(p_groupnames, 'ALL') = 'ALL' then 1 when COALESCE(p_groupnames, 'ALL')<> 'ALL' and FIND_IN_SET(department,p_groupnames)then 1 else 0 end) = 1
      AND (case when COALESCE(p_gatewaynames, 'ALL') = 'ALL' then 1 when COALESCE(p_gatewaynames, 'ALL')<> 'ALL' and FIND_IN_SET(dest_device_name,p_gatewaynames) then 1 else 0 end) = 1
GROUP BY global_callid_call_id
HAVING FIND_IN_SET(to_phone_number, (SELECT value_config FROM `config` WHERE key_config = 'IVR_prefix_1900'));
                    
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

SELECT global_callid_call_id, user_name, display_name, from_phone_number, dest_device_name, department, to_phone_number, SUM(duration),
		 CEIL(SUM(duration)/60) * (SELECT price_minute FROM price_config WHERE `type` = 'prefix_1900') AS cost, min(called_at)
FROM call_histories_cdr
WHERE LENGTH(calling_party_number) > 9 AND calling_party_number NOT LIKE 'b%' AND duration > 0
		AND called_at >= case when p_startTime IS NULL then called_at else p_startTime END 
      AND called_at <=  case when p_endTime IS NULL then called_at else p_endTime END 
      AND (case when COALESCE(p_usernames, 'ALL') = 'ALL' then 1 when COALESCE(p_usernames, 'ALL')<> 'ALL' and FIND_IN_SET(user_name,p_usernames) then 1 else 0 end) = 1 
      AND (case when COALESCE(p_groupnames, 'ALL') = 'ALL' then 1 when COALESCE(p_groupnames, 'ALL')<> 'ALL' and FIND_IN_SET(department,p_groupnames) then 1 else 0 end) = 1
      AND (case when COALESCE(p_gatewaynames, 'ALL') = 'ALL' then 1 when COALESCE(p_gatewaynames, 'ALL')<> 'ALL' and FIND_IN_SET(dest_device_name,p_gatewaynames) then 1 else 0 end) = 1
		AND FIND_IN_SET(c.userName,p_users_condition)
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

SELECT global_callid_call_id, user_name, display_name, from_phone_number, dest_device_name, department, to_phone_number, SUM(duration), 
		 CEIL(SUM(duration)/60) * (SELECT price_minute FROM price_config WHERE `type` = 'prefix_1900') AS cost, min(called_at)
FROM call_histories_cdr
WHERE LENGTH(calling_party_number) > 9 AND calling_party_number NOT LIKE 'b%' AND duration > 0
		AND called_at >= case when p_startTime IS NULL then called_at else p_startTime END 
      AND called_at <=  case when p_endTime IS NULL then called_at else p_endTime END 
      AND (case when COALESCE(p_usernames, 'ALL') = 'ALL' then 1 when COALESCE(p_usernames, 'ALL')<> 'ALL' and FIND_IN_SET(user_name,p_usernames) then 1 else 0 end) = 1 
      AND (case when COALESCE(p_groupnames, 'ALL') = 'ALL' then 1 when COALESCE(p_groupnames, 'ALL')<> 'ALL' and FIND_IN_SET(department,p_groupnames) then 1 else 0 end) = 1
      AND (case when COALESCE(p_gatewaynames, 'ALL') = 'ALL' then 1 when COALESCE(p_gatewaynames, 'ALL')<> 'ALL' and FIND_IN_SET(dest_device_name,p_gatewaynames) then 1 else 0 end) = 1
		AND (to_phone_number = p_ipphone)
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

SELECT global_callid_call_id, user_name, display_name, from_phone_number, dest_device_name, department, to_phone_number, SUM(duration), 
		 CEIL(SUM(duration)/60) * (SELECT price_minute FROM price_config WHERE `type` = 'prefix_1900') AS cost, min(called_at)
FROM call_histories_cdr
WHERE LENGTH(calling_party_number) > 9 AND calling_party_number NOT LIKE 'b%' AND duration > 0
		AND called_at >= case when p_startTime IS NULL then called_at else p_startTime END 
      AND called_at <=  case when p_endTime IS NULL then called_at else p_endTime END 
      AND (case when COALESCE(p_usernames, 'ALL') = 'ALL' then 1 when COALESCE(p_usernames, 'ALL')<> 'ALL' and FIND_IN_SET(user_name,p_usernames) then 1 else 0 end) = 1 
      AND (case when COALESCE(p_groupnames, 'ALL') = 'ALL' then 1 when COALESCE(p_groupnames, 'ALL')<> 'ALL' and FIND_IN_SET(department,p_groupnames) then 1 else 0 end) = 1
      AND (case when COALESCE(p_gatewaynames, 'ALL') = 'ALL' then 1 when COALESCE(p_gatewaynames, 'ALL')<> 'ALL' and FIND_IN_SET(dest_device_name,p_gatewaynames) then 1 else 0 end) = 1
		AND (to_phone_number = p_ipphone OR FIND_IN_SET(dest_device_name,p_gateway_managers))
GROUP BY global_callid_call_id
HAVING FIND_IN_SET(to_phone_number, (SELECT value_config FROM `config` WHERE key_config = 'IVR_prefix_1900'));
                    
END//
DELIMITER ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
