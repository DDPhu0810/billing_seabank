use billing_server;

UPDATE `config` SET `id`='63' WHERE  `id`=62;
UPDATE `config` SET `id`='62' WHERE  `id`=61;
UPDATE `config` SET `id`='61' WHERE  `id`=60;
UPDATE `config` SET `id`='60' WHERE  `id`=59;
UPDATE `config` SET `id`='59' WHERE  `id`=58;
UPDATE `config` SET `id`='58' WHERE  `id`=57;
UPDATE `config` SET `id`='57' WHERE  `id`=56;
UPDATE `config` SET `id`='56' WHERE  `id`=55;
UPDATE `config` SET `id`='55' WHERE  `id`=54;
UPDATE `config` SET `id`='54' WHERE  `id`=53;
UPDATE `config` SET `id`='53' WHERE  `id`=52;
UPDATE `config` SET `id`='52' WHERE  `id`=51;
UPDATE `config` SET `id`='51' WHERE  `id`=50;

UPDATE `config` SET `id`='50' WHERE  `id`=49;
UPDATE `config` SET `id`='49' WHERE  `id`=48;
UPDATE `config` SET `id`='48' WHERE  `id`=47;
UPDATE `config` SET `id`='47' WHERE  `id`=46;
UPDATE `config` SET `id`='46' WHERE  `id`=45;
UPDATE `config` SET `id`='45' WHERE  `id`=44;
UPDATE `config` SET `id`='44' WHERE  `id`=43;
UPDATE `config` SET `id`='43' WHERE  `id`=42;
UPDATE `config` SET `id`='42' WHERE  `id`=41;
UPDATE `config` SET `id`='41' WHERE  `id`=40;

UPDATE `config` SET `id`='40' WHERE  `id`=39;
UPDATE `config` SET `id`='39' WHERE  `id`=38;
UPDATE `config` SET `id`='38' WHERE  `id`=37;
UPDATE `config` SET `id`='37' WHERE  `id`=36;
UPDATE `config` SET `id`='36' WHERE  `id`=35;
UPDATE `config` SET `id`='35' WHERE  `id`=34;
UPDATE `config` SET `id`='34' WHERE  `id`=33;
UPDATE `config` SET `id`='33' WHERE  `id`=32;
UPDATE `config` SET `id`='32' WHERE  `id`=31;
UPDATE `config` SET `id`='31' WHERE  `id`=30;

UPDATE `config` SET `id`='30' WHERE  `id`=29;
UPDATE `config` SET `id`='29' WHERE  `id`=28;
UPDATE `config` SET `id`='28' WHERE  `id`=27;
UPDATE `config` SET `id`='27' WHERE  `id`=26;
UPDATE `config` SET `id`='26' WHERE  `id`=25;
UPDATE `config` SET `id`='25' WHERE  `id`=24;
UPDATE `config` SET `id`='24' WHERE  `id`=23;
UPDATE `config` SET `id`='23' WHERE  `id`=22;
UPDATE `config` SET `id`='22' WHERE  `id`=21;
UPDATE `config` SET `id`='21' WHERE  `id`=20;

UPDATE `config` SET `id`='20' WHERE  `id`=19;
UPDATE `config` SET `id`='19' WHERE  `id`=18;
UPDATE `config` SET `id`='18' WHERE  `id`=17;
UPDATE `config` SET `id`='17' WHERE  `id`=16;
UPDATE `config` SET `id`='16' WHERE  `id`=15;
UPDATE `config` SET `id`='15' WHERE  `id`=14;
UPDATE `config` SET `id`='14' WHERE  `id`=13;
UPDATE `config` SET `id`='13' WHERE  `id`=12;
UPDATE `config` SET `id`='12' WHERE  `id`=11;
UPDATE `config` SET `id`='11' WHERE  `id`=10;

UPDATE `config` SET `id`='10' WHERE  `id`=9;
UPDATE `config` SET `id`='9' WHERE  `id`=8;
UPDATE `config` SET `id`='8' WHERE  `id`=7;
UPDATE `config` SET `id`='7' WHERE  `id`=6;
UPDATE `config` SET `id`='6' WHERE  `id`=5;
UPDATE `config` SET `id`='5' WHERE  `id`=4;
UPDATE `config` SET `id`='4' WHERE  `id`=3;
UPDATE `config` SET `id`='3' WHERE  `id`=2;
UPDATE `config` SET `id`='2' WHERE  `id`=1;


INSERT INTO `price_config` (`id`, `gateway_id`, `operator`, `type`, `price_minute`) VALUES ('1', 'PREFIX_1900', 'PREFIX_1900', 'prefix_1900', '1500');


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

SELECT user_name, display_name, from_phone_number, dest_device_name, department, to_phone_number, SUM(duration),
		 CEIL(SUM(duration)/60) * (SELECT price_minute FROM price_config WHERE `type` = 'prefix_1900') AS cost, min(called_at)
FROM call_histories_cdr
WHERE LENGTH(calling_party_number) > 9 AND calling_party_number NOT LIKE 'b%' AND duration > 0
		AND called_at >= case when p_startTime IS NULL then called_at else p_startTime END 
      AND called_at <=  case when p_endTime IS NULL then called_at else p_endTime END 
      AND (case when COALESCE(p_usernames, 'ALL') = 'ALL' then 1 when COALESCE(p_usernames, 'ALL')<> 'ALL' and FIND_IN_SET(user_name,p_usernames) then 1 else 0 end) = 1 
      AND (case when COALESCE(p_groupnames, 'ALL') = 'ALL' then 1 when COALESCE(p_groupnames, 'ALL')<> 'ALL' and FIND_IN_SET(department,p_groupnames)then 1 else 0 end) = 1
      AND (case when COALESCE(p_gatewaynames, 'ALL') = 'ALL' then 1 when COALESCE(p_gatewaynames, 'ALL')<> 'ALL' and FIND_IN_SET(dest_device_name,p_gatewaynames) then 1 else 0 end) = 1
		AND FIND_IN_SET(to_phone_number, (SELECT value_config FROM `config` WHERE key_config = 'IVR_prefix_1900')) AND in_out = "Inbound"
GROUP BY orig_leg_call_identifier;
                    
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

SELECT user_name, display_name, from_phone_number, dest_device_name, department, to_phone_number, SUM(duration),
		 CEIL(SUM(duration)/60) * (SELECT price_minute FROM price_config WHERE `type` = 'prefix_1900') AS cost, min(called_at)
FROM call_histories_cdr
WHERE LENGTH(calling_party_number) > 9 AND calling_party_number NOT LIKE 'b%' AND duration > 0
		AND called_at >= case when p_startTime IS NULL then called_at else p_startTime END 
      AND called_at <=  case when p_endTime IS NULL then called_at else p_endTime END 
      AND (case when COALESCE(p_usernames, 'ALL') = 'ALL' then 1 when COALESCE(p_usernames, 'ALL')<> 'ALL' and FIND_IN_SET(user_name,p_usernames) then 1 else 0 end) = 1 
      AND (case when COALESCE(p_groupnames, 'ALL') = 'ALL' then 1 when COALESCE(p_groupnames, 'ALL')<> 'ALL' and FIND_IN_SET(department,p_groupnames) then 1 else 0 end) = 1
      AND (case when COALESCE(p_gatewaynames, 'ALL') = 'ALL' then 1 when COALESCE(p_gatewaynames, 'ALL')<> 'ALL' and FIND_IN_SET(dest_device_name,p_gatewaynames) then 1 else 0 end) = 1
		AND FIND_IN_SET(c.userName,p_users_condition)
		AND FIND_IN_SET(to_phone_number, (SELECT value_config FROM `config` WHERE key_config = 'IVR_prefix_1900')) AND in_out = "Inbound"
GROUP BY orig_leg_call_identifier;
                    
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

SELECT user_name, calling_party_number, dest_device_name, department, to_phone_number, SUM(duration), 
		 CEIL(SUM(duration)/60) * (SELECT price_minute FROM price_config WHERE `type` = 'prefix_1900') AS cost, min(called_at)
FROM call_histories_cdr
WHERE LENGTH(calling_party_number) > 9 AND calling_party_number NOT LIKE 'b%' AND duration > 0
		AND called_at >= case when p_startTime IS NULL then called_at else p_startTime END 
      AND called_at <=  case when p_endTime IS NULL then called_at else p_endTime END 
      AND (case when COALESCE(p_usernames, 'ALL') = 'ALL' then 1 when COALESCE(p_usernames, 'ALL')<> 'ALL' and FIND_IN_SET(user_name,p_usernames) then 1 else 0 end) = 1 
      AND (case when COALESCE(p_groupnames, 'ALL') = 'ALL' then 1 when COALESCE(p_groupnames, 'ALL')<> 'ALL' and FIND_IN_SET(department,p_groupnames) then 1 else 0 end) = 1
      AND (case when COALESCE(p_gatewaynames, 'ALL') = 'ALL' then 1 when COALESCE(p_gatewaynames, 'ALL')<> 'ALL' and FIND_IN_SET(dest_device_name,p_gatewaynames) then 1 else 0 end) = 1
		AND (to_phone_number = p_ipphone)
		AND FIND_IN_SET(to_phone_number, (SELECT value_config FROM `config` WHERE key_config = 'IVR_prefix_1900')) AND in_out = "Inbound"
GROUP BY orig_leg_call_identifier;
                    
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

SELECT user_name, calling_party_number, dest_device_name, department, to_phone_number, SUM(duration), 
		 CEIL(SUM(duration)/60) * (SELECT price_minute FROM price_config WHERE `type` = 'prefix_1900') AS cost, min(called_at)
FROM call_histories_cdr
WHERE LENGTH(calling_party_number) > 9 AND calling_party_number NOT LIKE 'b%' AND duration > 0
		AND called_at >= case when p_startTime IS NULL then called_at else p_startTime END 
      AND called_at <=  case when p_endTime IS NULL then called_at else p_endTime END 
      AND (case when COALESCE(p_usernames, 'ALL') = 'ALL' then 1 when COALESCE(p_usernames, 'ALL')<> 'ALL' and FIND_IN_SET(user_name,p_usernames) then 1 else 0 end) = 1 
      AND (case when COALESCE(p_groupnames, 'ALL') = 'ALL' then 1 when COALESCE(p_groupnames, 'ALL')<> 'ALL' and FIND_IN_SET(department,p_groupnames) then 1 else 0 end) = 1
      AND (case when COALESCE(p_gatewaynames, 'ALL') = 'ALL' then 1 when COALESCE(p_gatewaynames, 'ALL')<> 'ALL' and FIND_IN_SET(dest_device_name,p_gatewaynames) then 1 else 0 end) = 1
		AND (to_phone_number = p_ipphone OR FIND_IN_SET(dest_device_name,p_gateway_managers))
		AND FIND_IN_SET(to_phone_number, (SELECT value_config FROM `config` WHERE key_config = 'IVR_prefix_1900')) AND in_out = "Inbound"
GROUP BY orig_leg_call_identifier;
                    
END//
DELIMITER ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;

-- 1792, 1794, 1781, 244918, 244858, 244933, 244950, 244945, 244886,244911, 244935, 244952,244951, 244963, 244932, 244955,244936, 244912, 244919, 244929, 244940, 244978, 244948, 244962, 244941, 244913, 44937, 244866, 244931, 244971, 244967, 244947, 244848, 244964, 244957, 244972, 244928, 244970, 244903, 244926, 244968,244924, 244965, 244954, 244975, 244976, 244828, 244958, 244979, 244915, 244961, 244922, 244942, 244925, 244943, 244956, 244939, 244927, 244923, 244906, 244888, 244905, 244946, 244930, 244909, 244916, 248054, 244908, 244999, 244921, 244966, 244938