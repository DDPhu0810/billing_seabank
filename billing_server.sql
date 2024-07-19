-- --------------------------------------------------------
-- Host:                         10.168.40.77
-- Server version:               10.2.44-MariaDB - MariaDB Server
-- Server OS:                    Linux
-- HeidiSQL Version:             11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for billing_server_test
CREATE DATABASE IF NOT EXISTS `billing_server_test` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;
USE `billing_server_test`;

-- Dumping structure for table billing_server_test.access_code
CREATE TABLE IF NOT EXISTS `access_code` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(100) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `auth_level` varchar(10) DEFAULT NULL,
  `uuid` varchar(50) DEFAULT NULL,
  `monthly_limited_cost` decimal(15,2) NOT NULL DEFAULT 0.00,
  `monthly_used_cost` decimal(15,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NOT NULL DEFAULT '1990-01-01 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '1990-01-01 00:00:00',
  `sent_warning_mail` varchar(10) DEFAULT NULL,
  `sent_warning_sms` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- Dumping data for table billing_server_test.access_code: ~3 rows (approximately)
/*!40000 ALTER TABLE `access_code` DISABLE KEYS */;
INSERT INTO `access_code` (`id`, `code`, `name`, `auth_level`, `uuid`, `monthly_limited_cost`, `monthly_used_cost`, `created_at`, `updated_at`, `sent_warning_mail`, `sent_warning_sms`) VALUES
	(1, '3245', 'Test23', '4', '{A48BE886-A191-EA04-9393-82AF7940AD09}', -1.00, 0.00, '2020-04-06 18:12:14', '2020-04-06 18:12:29', 'N', 'N'),
	(5, '12333', 'Bay', '4', '{BBD93292-9ED2-F124-1632-89F76C1F56CA}', 200000.00, 0.00, '2020-04-06 18:13:27', '2020-04-27 17:00:02', 'N', 'N'),
	(9, '5555', 'Nam', '6', '{5264C29F-E262-8BBF-16B0-CBF4ABF9CEA3}', 100000.00, 0.00, '2020-04-07 03:57:12', '2020-04-27 17:00:02', 'N', 'N');
/*!40000 ALTER TABLE `access_code` ENABLE KEYS */;

-- Dumping structure for table billing_server_test.ad_group
CREATE TABLE IF NOT EXISTS `ad_group` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `directory_string` varchar(255) DEFAULT '',
  `description` varchar(255) DEFAULT '',
  `created_at` timestamp NOT NULL DEFAULT '1990-01-01 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- Dumping data for table billing_server_test.ad_group: ~0 rows (approximately)
/*!40000 ALTER TABLE `ad_group` DISABLE KEYS */;
INSERT INTO `ad_group` (`id`, `directory_string`, `description`, `created_at`, `updated_at`) VALUES
	(1, 'R&D', '', '1990-01-01 00:00:00', '2022-10-19 11:10:07');
/*!40000 ALTER TABLE `ad_group` ENABLE KEYS */;

-- Dumping structure for table billing_server_test.call_histories
CREATE TABLE IF NOT EXISTS `call_histories` (
  `pkid` varchar(50) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `from_phone_number` varchar(255) CHARACTER SET utf8 NOT NULL,
  `to_phone_number` varchar(255) CHARACTER SET utf8 NOT NULL,
  `duration` int(11) NOT NULL COMMENT 'number seconds',
  `cost` decimal(11,2) NOT NULL,
  `to_number_type` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '1990-01-01 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `called_at` timestamp NOT NULL DEFAULT '1990-01-01 00:00:00',
  `in_out` varchar(50) DEFAULT NULL,
  `calling_operator` varchar(255) DEFAULT NULL,
  `called_operator` varchar(255) DEFAULT NULL,
  `display_name` varchar(255) DEFAULT NULL,
  `department` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `gateway_name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`pkid`) USING BTREE,
  KEY `idx_hisuser` (`user_name`),
  KEY `idx_callat` (`called_at`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table billing_server_test.call_histories: ~0 rows (approximately)
/*!40000 ALTER TABLE `call_histories` DISABLE KEYS */;
/*!40000 ALTER TABLE `call_histories` ENABLE KEYS */;

-- Dumping structure for table billing_server_test.call_histories_cdr
CREATE TABLE IF NOT EXISTS `call_histories_cdr` (
  `pkid` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `auth_code_description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `authorization_code_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `authorization_level` int(11) DEFAULT NULL,
  `call_secured_status` int(11) DEFAULT NULL,
  `called_party_pattern_usage` int(11) DEFAULT NULL,
  `calling_party_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `calling_party_number_partition` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `calling_party_unicode_login_userid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `calling_party_number_uri` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cdr_record_type` int(11) DEFAULT NULL,
  `client_matter_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `current_routing_reason` int(11) DEFAULT NULL,
  `date_time_connect` int(11) DEFAULT NULL,
  `date_time_disconnect` int(11) DEFAULT NULL,
  `date_time_origination` int(11) DEFAULT NULL,
  `dest_call_termination_on_behalf_of` int(11) DEFAULT NULL,
  `dest_conversation_id` int(11) DEFAULT NULL,
  `destdtmfmethod` int(11) DEFAULT NULL,
  `dest_device_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dest_device_sessionid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dest_device_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dest_ip_addr` int(11) DEFAULT NULL,
  `dest_ipv4v6addr` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dest_leg_identifier` int(11) DEFAULT NULL,
  `dest_mobile_call_duration` int(11) DEFAULT NULL,
  `dest_mobile_device_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dest_node_id` int(11) DEFAULT NULL,
  `dest_precedence_level` int(11) DEFAULT NULL,
  `destrsvpaudio_stat` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `destrsvpvideo_stat` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dest_span` int(11) DEFAULT NULL,
  `dest_cause_location` int(11) DEFAULT NULL,
  `dest_cause_value` int(11) DEFAULT NULL,
  `dest_media_cap_bandwidth` int(11) DEFAULT NULL,
  `dest_media_cap_g723bit_rate` int(11) DEFAULT NULL,
  `dest_media_cap_max_frames_per_packet` int(11) DEFAULT NULL,
  `dest_media_cap_payload_capability` int(11) DEFAULT NULL,
  `dest_media_transport_address_ip` int(11) DEFAULT NULL,
  `dest_media_transport_address_port` int(11) DEFAULT NULL,
  `dest_video_cap_bandwidth` int(11) DEFAULT NULL,
  `dest_video_cap_bandwidth_channel2` int(11) DEFAULT NULL,
  `dest_video_cap_codec` int(11) DEFAULT NULL,
  `dest_video_cap_codec_channel2` int(11) DEFAULT NULL,
  `dest_video_cap_resolution` int(11) DEFAULT NULL,
  `dest_video_cap_resolution_channel2` int(11) DEFAULT NULL,
  `dest_video_channel_role_channel2` int(11) DEFAULT NULL,
  `dest_video_transport_address_ip` int(11) DEFAULT NULL,
  `dest_video_transport_address_ip_channel2` int(11) DEFAULT NULL,
  `dest_video_transport_address_port` int(11) DEFAULT NULL,
  `dest_video_transport_address_port_channel2` int(11) DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `final_called_party_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `final_called_party_number_partition` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `final_called_party_pattern` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `final_called_party_unicode_login_userid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `final_mobile_called_party_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `final_called_party_number_uri` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `global_callid_call_id` int(11) DEFAULT NULL,
  `global_callid_call_manager_id` int(11) DEFAULT NULL,
  `global_call_id_clusterid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `hunt_pilotdn` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `hunt_pilot_partition` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `hunt_pilot_pattern` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `incomingicid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `incoming_origioi` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `incoming_protocol_call_ref` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `incoming_protocolid` int(11) DEFAULT NULL,
  `incoming_termioi` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `join_on_behalf_of` int(11) DEFAULT NULL,
  `last_redirect_dn` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_redirect_dn_partition` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_redirect_redirect_on_behalf_of` int(11) DEFAULT NULL,
  `last_redirect_redirect_reason` int(11) DEFAULT NULL,
  `last_redirecting_party_pattern` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_redirecting_routing_reason` int(11) DEFAULT NULL,
  `last_redirect_dn_uri` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mobile_call_type` int(11) DEFAULT NULL,
  `mobile_calling_party_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `orig_call_termination_on_behalf_of` int(11) DEFAULT NULL,
  `orig_called_party_redirect_on_behalf_of` int(11) DEFAULT NULL,
  `orig_called_party_redirect_reason` int(11) DEFAULT NULL,
  `orig_conversation_id` int(11) DEFAULT NULL,
  `origdtmfmethod` int(11) DEFAULT NULL,
  `orig_device_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `orig_device_sessionid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `orig_device_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `orig_ip_addr` int(11) DEFAULT NULL,
  `orig_ipv4v6addr` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `orig_leg_call_identifier` int(11) DEFAULT NULL,
  `orig_mobile_call_duration` int(11) DEFAULT NULL,
  `orig_mobile_device_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `orig_node_id` int(11) DEFAULT NULL,
  `orig_precedence_level` int(11) DEFAULT NULL,
  `origrsvpaudio_stat` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `origrsvpvideo_stat` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `orig_routing_reason` int(11) DEFAULT NULL,
  `orig_span` int(11) DEFAULT NULL,
  `orig_cause_location` int(11) DEFAULT NULL,
  `orig_cause_value` int(11) DEFAULT NULL,
  `original_called_party_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `original_called_party_number_partition` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `original_called_party_pattern` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `original_called_party_number_uri` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `orig_media_cap_bandwidth` int(11) DEFAULT NULL,
  `orig_media_cap_g723bit_rate` int(11) DEFAULT NULL,
  `orig_media_cap_max_frames_per_packet` int(11) DEFAULT NULL,
  `orig_media_cap_payload_capability` int(11) DEFAULT NULL,
  `orig_media_transport_address_ip` int(11) DEFAULT NULL,
  `orig_media_transport_address_port` int(11) DEFAULT NULL,
  `orig_video_cap_bandwidth` int(11) DEFAULT NULL,
  `orig_video_cap_bandwidth_channel2` int(11) DEFAULT NULL,
  `orig_video_cap_codec` int(11) DEFAULT NULL,
  `orig_video_cap_codec_channel2` int(11) DEFAULT NULL,
  `orig_video_cap_resolution` int(11) DEFAULT NULL,
  `orig_video_cap_resolution_channel2` int(11) DEFAULT NULL,
  `orig_video_channel_role_channel2` int(11) DEFAULT NULL,
  `orig_video_transport_address_ip` int(11) DEFAULT NULL,
  `orig_video_transport_address_ip_channel2` int(11) DEFAULT NULL,
  `orig_video_transport_address_port` int(11) DEFAULT NULL,
  `orig_video_transport_address_port_channel2` int(11) DEFAULT NULL,
  `outgoingicid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `outgoing_origioi` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `outgoing_protocol_call_ref` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `outgoing_protocolid` int(11) DEFAULT NULL,
  `outgoing_termioi` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `outpulsed_called_party_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `outpulsed_calling_party_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `outpulsed_last_redirecting_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `outpulsed_original_called_party_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `total_wait_time_in_queue` int(11) DEFAULT NULL,
  `was_call_queued` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `user_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `from_phone_number` varchar(255) CHARACTER SET utf8 NOT NULL,
  `to_phone_number` varchar(255) CHARACTER SET utf8 NOT NULL,
  `cost` decimal(11,2) NOT NULL,
  `to_number_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '1990-01-01 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `called_at` timestamp NOT NULL DEFAULT '1990-01-01 00:00:00',
  `in_out` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `calling_location` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `calling_operator` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `called_location` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `called_operator` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `called_type` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `direction_type` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `file_id` int(20) DEFAULT NULL,
  `cost_value` double(255,5) DEFAULT NULL,
  `department` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `display_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`pkid`),
  KEY `idx_hisuser` (`user_name`),
  KEY `idx_callat` (`called_at`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table billing_server_test.call_histories_cdr: 0 rows
/*!40000 ALTER TABLE `call_histories_cdr` DISABLE KEYS */;
/*!40000 ALTER TABLE `call_histories_cdr` ENABLE KEYS */;

-- Dumping structure for table billing_server_test.call_histories_cdr_backup
CREATE TABLE IF NOT EXISTS `call_histories_cdr_backup` (
  `cdrRecordType` int(11) DEFAULT NULL,
  `globalCallID_callManagerId` int(11) DEFAULT NULL,
  `globalCallID_callId` int(11) DEFAULT NULL,
  `origLegCallIdentifier` int(11) DEFAULT NULL,
  `dateTimeOrigination` int(11) DEFAULT NULL,
  `origNodeId` int(11) DEFAULT NULL,
  `origSpan` int(11) DEFAULT NULL,
  `origIpAddr` int(11) DEFAULT NULL,
  `callingPartyNumber` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `callingPartyUnicodeLoginUserID` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `origCause_location` int(11) DEFAULT NULL,
  `origCause_value` int(11) DEFAULT NULL,
  `origPrecedenceLevel` int(11) DEFAULT NULL,
  `origMediaTransportAddress_IP` int(11) DEFAULT NULL,
  `origMediaTransportAddress_Port` int(11) DEFAULT NULL,
  `origMediaCap_payloadCapability` int(11) DEFAULT NULL,
  `origMediaCap_maxFramesPerPacket` int(11) DEFAULT NULL,
  `origMediaCap_g723BitRate` int(11) DEFAULT NULL,
  `origVideoCap_Codec` int(11) DEFAULT NULL,
  `origVideoCap_Bandwidth` int(11) DEFAULT NULL,
  `origVideoCap_Resolution` int(11) DEFAULT NULL,
  `origVideoTransportAddress_IP` int(11) DEFAULT NULL,
  `origVideoTransportAddress_Port` int(11) DEFAULT NULL,
  `origRSVPAudioStat` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `origRSVPVideoStat` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `destLegIdentifier` int(11) DEFAULT NULL,
  `destNodeId` int(11) DEFAULT NULL,
  `destSpan` int(11) DEFAULT NULL,
  `destIpAddr` int(11) DEFAULT NULL,
  `originalCalledPartyNumber` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `finalCalledPartyNumber` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `finalCalledPartyUnicodeLoginUserID` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `destCause_location` int(11) DEFAULT NULL,
  `destCause_value` int(11) DEFAULT NULL,
  `destPrecedenceLevel` int(11) DEFAULT NULL,
  `destMediaTransportAddress_IP` int(11) DEFAULT NULL,
  `destMediaTransportAddress_Port` int(11) DEFAULT NULL,
  `destMediaCap_payloadCapability` int(11) DEFAULT NULL,
  `destMediaCap_maxFramesPerPacket` int(11) DEFAULT NULL,
  `destMediaCap_g723BitRate` int(11) DEFAULT NULL,
  `destVideoCap_Codec` int(11) DEFAULT NULL,
  `destVideoCap_Bandwidth` int(11) DEFAULT NULL,
  `destVideoCap_Resolution` int(11) DEFAULT NULL,
  `destVideoTransportAddress_IP` int(11) DEFAULT NULL,
  `destVideoTransportAddress_Port` int(11) DEFAULT NULL,
  `destRSVPAudioStat` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `destRSVPVideoStat` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateTimeConnect` int(11) DEFAULT NULL,
  `dateTimeDisconnect` int(11) DEFAULT NULL,
  `lastRedirectDn` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pkid` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `originalCalledPartyNumberPartition` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `callingPartyNumberPartition` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `finalCalledPartyNumberPartition` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastRedirectDnPartition` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `origDeviceName` varchar(129) COLLATE utf8_unicode_ci DEFAULT NULL,
  `destDeviceName` varchar(129) COLLATE utf8_unicode_ci DEFAULT NULL,
  `origCallTerminationOnBehalfOf` int(11) DEFAULT NULL,
  `destCallTerminationOnBehalfOf` int(11) DEFAULT NULL,
  `origCalledPartyRedirectOnBehalfOf` int(11) DEFAULT NULL,
  `lastRedirectRedirectOnBehalfOf` int(11) DEFAULT NULL,
  `origCalledPartyRedirectReason` int(11) DEFAULT NULL,
  `lastRedirectRedirectReason` int(11) DEFAULT NULL,
  `destConversationId` int(11) DEFAULT NULL,
  `globalCallId_ClusterID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `joinOnBehalfOf` int(11) DEFAULT NULL,
  `comment` varchar(2048) COLLATE utf8_unicode_ci DEFAULT NULL,
  `authCodeDescription` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `authorizationLevel` int(11) DEFAULT NULL,
  `clientMatterCode` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `origDTMFMethod` int(11) DEFAULT NULL,
  `destDTMFMethod` int(11) DEFAULT NULL,
  `callSecuredStatus` int(11) DEFAULT NULL,
  `origConversationId` int(11) DEFAULT NULL,
  `origMediaCap_Bandwidth` int(11) DEFAULT NULL,
  `destMediaCap_Bandwidth` int(11) DEFAULT NULL,
  `authorizationCodeValue` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `outpulsedCallingPartyNumber` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `outpulsedCalledPartyNumber` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `origIpv4v6Addr` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `destIpv4v6Addr` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `origVideoCap_Codec_Channel2` int(11) DEFAULT NULL,
  `origVideoCap_Bandwidth_Channel2` int(11) DEFAULT NULL,
  `origVideoCap_Resolution_Channel2` int(11) DEFAULT NULL,
  `origVideoTransportAddress_IP_Channel2` int(11) DEFAULT NULL,
  `origVideoTransportAddress_Port_Channel2` int(11) DEFAULT NULL,
  `origVideoChannel_Role_Channel2` int(11) DEFAULT NULL,
  `destVideoCap_Codec_Channel2` int(11) DEFAULT NULL,
  `destVideoCap_Bandwidth_Channel2` int(11) DEFAULT NULL,
  `destVideoCap_Resolution_Channel2` int(11) DEFAULT NULL,
  `destVideoTransportAddress_IP_Channel2` int(11) DEFAULT NULL,
  `destVideoTransportAddress_Port_Channel2` int(11) DEFAULT NULL,
  `destVideoChannel_Role_Channel2` int(11) DEFAULT NULL,
  `IncomingProtocolID` int(11) DEFAULT NULL,
  `IncomingProtocolCallRef` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `OutgoingProtocolID` int(11) DEFAULT NULL,
  `OutgoingProtocolCallRef` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `currentRoutingReason` int(11) DEFAULT NULL,
  `origRoutingReason` int(11) DEFAULT NULL,
  `lastRedirectingRoutingReason` int(11) DEFAULT NULL,
  `huntPilotPartition` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `huntPilotDN` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `calledPartyPatternUsage` int(11) DEFAULT NULL,
  `IncomingICID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `IncomingOrigIOI` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `IncomingTermIOI` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `OutgoingICID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `OutgoingOrigIOI` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `OutgoingTermIOI` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `outpulsedOriginalCalledPartyNumber` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `outpulsedLastRedirectingNumber` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `wasCallQueued` int(11) DEFAULT NULL,
  `totalWaitTimeInQueue` int(11) DEFAULT NULL,
  `callingPartyNumber_uri` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `originalCalledPartyNumber_uri` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `finalCalledPartyNumber_uri` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastRedirectDn_uri` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mobileCallingPartyNumber` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `finalMobileCalledPartyNumber` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `origMobileDeviceName` varchar(129) COLLATE utf8_unicode_ci DEFAULT NULL,
  `destMobileDeviceName` varchar(129) COLLATE utf8_unicode_ci DEFAULT NULL,
  `origMobileCallDuration` int(11) DEFAULT NULL,
  `destMobileCallDuration` int(11) DEFAULT NULL,
  `mobileCallType` int(11) DEFAULT NULL,
  `originalCalledPartyPattern` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `finalCalledPartyPattern` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastRedirectingPartyPattern` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `huntPilotPattern` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `origDeviceType` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `destDeviceType` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `origDeviceSessionID` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `destDeviceSessionID` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table billing_server_test.call_histories_cdr_backup: ~0 rows (approximately)
/*!40000 ALTER TABLE `call_histories_cdr_backup` DISABLE KEYS */;
/*!40000 ALTER TABLE `call_histories_cdr_backup` ENABLE KEYS */;

-- Dumping structure for table billing_server_test.call_histories_cdr_rebilling
CREATE TABLE IF NOT EXISTS `call_histories_cdr_rebilling` (
  `pkid` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `auth_code_description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `authorization_code_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `authorization_level` int(11) DEFAULT NULL,
  `call_secured_status` int(11) DEFAULT NULL,
  `called_party_pattern_usage` int(11) DEFAULT NULL,
  `calling_party_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `calling_party_number_partition` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `calling_party_unicode_login_userid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `calling_party_number_uri` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cdr_record_type` int(11) DEFAULT NULL,
  `client_matter_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `current_routing_reason` int(11) DEFAULT NULL,
  `date_time_connect` int(11) DEFAULT NULL,
  `date_time_disconnect` int(11) DEFAULT NULL,
  `date_time_origination` int(11) DEFAULT NULL,
  `dest_call_termination_on_behalf_of` int(11) DEFAULT NULL,
  `dest_conversation_id` int(11) DEFAULT NULL,
  `destdtmfmethod` int(11) DEFAULT NULL,
  `dest_device_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dest_device_sessionid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dest_device_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dest_ip_addr` int(11) DEFAULT NULL,
  `dest_ipv4v6addr` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dest_leg_identifier` int(11) DEFAULT NULL,
  `dest_mobile_call_duration` int(11) DEFAULT NULL,
  `dest_mobile_device_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dest_node_id` int(11) DEFAULT NULL,
  `dest_precedence_level` int(11) DEFAULT NULL,
  `destrsvpaudio_stat` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `destrsvpvideo_stat` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dest_span` int(11) DEFAULT NULL,
  `dest_cause_location` int(11) DEFAULT NULL,
  `dest_cause_value` int(11) DEFAULT NULL,
  `dest_media_cap_bandwidth` int(11) DEFAULT NULL,
  `dest_media_cap_g723bit_rate` int(11) DEFAULT NULL,
  `dest_media_cap_max_frames_per_packet` int(11) DEFAULT NULL,
  `dest_media_cap_payload_capability` int(11) DEFAULT NULL,
  `dest_media_transport_address_ip` int(11) DEFAULT NULL,
  `dest_media_transport_address_port` int(11) DEFAULT NULL,
  `dest_video_cap_bandwidth` int(11) DEFAULT NULL,
  `dest_video_cap_bandwidth_channel2` int(11) DEFAULT NULL,
  `dest_video_cap_codec` int(11) DEFAULT NULL,
  `dest_video_cap_codec_channel2` int(11) DEFAULT NULL,
  `dest_video_cap_resolution` int(11) DEFAULT NULL,
  `dest_video_cap_resolution_channel2` int(11) DEFAULT NULL,
  `dest_video_channel_role_channel2` int(11) DEFAULT NULL,
  `dest_video_transport_address_ip` int(11) DEFAULT NULL,
  `dest_video_transport_address_ip_channel2` int(11) DEFAULT NULL,
  `dest_video_transport_address_port` int(11) DEFAULT NULL,
  `dest_video_transport_address_port_channel2` int(11) DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `final_called_party_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `final_called_party_number_partition` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `final_called_party_pattern` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `final_called_party_unicode_login_userid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `final_mobile_called_party_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `final_called_party_number_uri` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `global_callid_call_id` int(11) DEFAULT NULL,
  `global_callid_call_manager_id` int(11) DEFAULT NULL,
  `global_call_id_clusterid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `hunt_pilotdn` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `hunt_pilot_partition` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `hunt_pilot_pattern` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `incomingicid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `incoming_origioi` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `incoming_protocol_call_ref` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `incoming_protocolid` int(11) DEFAULT NULL,
  `incoming_termioi` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `join_on_behalf_of` int(11) DEFAULT NULL,
  `last_redirect_dn` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_redirect_dn_partition` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_redirect_redirect_on_behalf_of` int(11) DEFAULT NULL,
  `last_redirect_redirect_reason` int(11) DEFAULT NULL,
  `last_redirecting_party_pattern` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_redirecting_routing_reason` int(11) DEFAULT NULL,
  `last_redirect_dn_uri` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mobile_call_type` int(11) DEFAULT NULL,
  `mobile_calling_party_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `orig_call_termination_on_behalf_of` int(11) DEFAULT NULL,
  `orig_called_party_redirect_on_behalf_of` int(11) DEFAULT NULL,
  `orig_called_party_redirect_reason` int(11) DEFAULT NULL,
  `orig_conversation_id` int(11) DEFAULT NULL,
  `origdtmfmethod` int(11) DEFAULT NULL,
  `orig_device_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `orig_device_sessionid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `orig_device_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `orig_ip_addr` int(11) DEFAULT NULL,
  `orig_ipv4v6addr` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `orig_leg_call_identifier` int(11) DEFAULT NULL,
  `orig_mobile_call_duration` int(11) DEFAULT NULL,
  `orig_mobile_device_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `orig_node_id` int(11) DEFAULT NULL,
  `orig_precedence_level` int(11) DEFAULT NULL,
  `origrsvpaudio_stat` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `origrsvpvideo_stat` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `orig_routing_reason` int(11) DEFAULT NULL,
  `orig_span` int(11) DEFAULT NULL,
  `orig_cause_location` int(11) DEFAULT NULL,
  `orig_cause_value` int(11) DEFAULT NULL,
  `original_called_party_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `original_called_party_number_partition` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `original_called_party_pattern` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `original_called_party_number_uri` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `orig_media_cap_bandwidth` int(11) DEFAULT NULL,
  `orig_media_cap_g723bit_rate` int(11) DEFAULT NULL,
  `orig_media_cap_max_frames_per_packet` int(11) DEFAULT NULL,
  `orig_media_cap_payload_capability` int(11) DEFAULT NULL,
  `orig_media_transport_address_ip` int(11) DEFAULT NULL,
  `orig_media_transport_address_port` int(11) DEFAULT NULL,
  `orig_video_cap_bandwidth` int(11) DEFAULT NULL,
  `orig_video_cap_bandwidth_channel2` int(11) DEFAULT NULL,
  `orig_video_cap_codec` int(11) DEFAULT NULL,
  `orig_video_cap_codec_channel2` int(11) DEFAULT NULL,
  `orig_video_cap_resolution` int(11) DEFAULT NULL,
  `orig_video_cap_resolution_channel2` int(11) DEFAULT NULL,
  `orig_video_channel_role_channel2` int(11) DEFAULT NULL,
  `orig_video_transport_address_ip` int(11) DEFAULT NULL,
  `orig_video_transport_address_ip_channel2` int(11) DEFAULT NULL,
  `orig_video_transport_address_port` int(11) DEFAULT NULL,
  `orig_video_transport_address_port_channel2` int(11) DEFAULT NULL,
  `outgoingicid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `outgoing_origioi` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `outgoing_protocol_call_ref` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `outgoing_protocolid` int(11) DEFAULT NULL,
  `outgoing_termioi` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `outpulsed_called_party_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `outpulsed_calling_party_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `outpulsed_last_redirecting_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `outpulsed_original_called_party_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `total_wait_time_in_queue` int(11) DEFAULT NULL,
  `was_call_queued` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `user_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `from_phone_number` varchar(255) CHARACTER SET utf8 NOT NULL,
  `to_phone_number` varchar(255) CHARACTER SET utf8 NOT NULL,
  `cost` decimal(11,2) NOT NULL,
  `to_number_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '1990-01-01 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `called_at` timestamp NOT NULL DEFAULT '1990-01-01 00:00:00',
  `in_out` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `calling_location` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `calling_operator` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `called_location` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `called_operator` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `called_type` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `direction_type` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `file_id` int(20) DEFAULT NULL,
  `cost_value` double(255,5) DEFAULT NULL,
  `department` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `display_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`pkid`),
  KEY `idx_hisuser` (`user_name`),
  KEY `idx_callat` (`called_at`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table billing_server_test.call_histories_cdr_rebilling: 0 rows
/*!40000 ALTER TABLE `call_histories_cdr_rebilling` DISABLE KEYS */;
/*!40000 ALTER TABLE `call_histories_cdr_rebilling` ENABLE KEYS */;

-- Dumping structure for table billing_server_test.cdr_file
CREATE TABLE IF NOT EXISTS `cdr_file` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `file_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `read_status` int(255) DEFAULT NULL,
  `record_count` int(255) DEFAULT NULL,
  `insert_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table billing_server_test.cdr_file: ~0 rows (approximately)
/*!40000 ALTER TABLE `cdr_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `cdr_file` ENABLE KEYS */;

-- Dumping structure for table billing_server_test.config
CREATE TABLE IF NOT EXISTS `config` (
  `id` int(11) NOT NULL,
  `key_config` varchar(50) NOT NULL,
  `value_config` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `custom_config` longtext DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '1990-01-01 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `checking_config_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table billing_server_test.config: ~41 rows (approximately)
/*!40000 ALTER TABLE `config` DISABLE KEYS */;
INSERT INTO `config` (`id`, `key_config`, `value_config`, `description`, `custom_config`, `created_at`, `updated_at`, `checking_config_url`) VALUES
	(1, 'dir_file', '/opt/billing/cdr/', 'Folder Get File', NULL, '1990-01-01 00:00:00', '2024-05-03 14:54:11', NULL),
	(3, 'path_backup', '/opt/billing/cdr/backup', 'Backup Folder', NULL, '1990-01-01 00:00:00', '2024-05-03 14:54:11', NULL),
	(4, 'path_error', '/opt/billing/cdr/error', 'Save Record Error', NULL, '1990-01-01 00:00:00', '2024-05-03 14:54:11', NULL),
	(5, 'path_backup_history', '/opt/billing/cdr/backup', NULL, NULL, '1990-01-01 00:00:00', '2024-05-03 14:54:11', NULL),
	(6, 'regex_check_name_file', '^cdr*', 'Check Name File', NULL, '1990-01-01 00:00:00', '2024-05-03 14:54:11', NULL),
	(7, 'max_thread', '10', 'Max Thread', NULL, '1990-01-01 00:00:00', '2024-05-03 14:54:11', NULL),
	(8, 'rebilling_worker_process', '10', NULL, NULL, '1990-01-01 00:00:00', '2024-05-03 14:54:11', NULL),
	(9, 'max_size_record', '3000', 'Max size record in file', NULL, '1990-01-01 00:00:00', '2024-05-03 14:54:11', NULL),
	(10, 'percent_warning', '80.0', '% Warning', NULL, '1990-01-01 00:00:00', '2024-05-03 14:54:11', NULL),
	(11, 'block_status', '', 'Block status', NULL, '1990-01-01 00:00:00', '2024-05-03 14:54:11', NULL),
	(12, 'unblock_status', 'Internal', NULL, NULL, '1990-01-01 00:00:00', '2024-05-03 14:54:11', NULL),
	(13, 'date_begin_charge', '30', 'date', NULL, '1990-01-01 00:00:00', '2024-05-03 14:54:11', NULL),
	(14, 'mail_host', 'smtp.gmail.com', 'server mail', NULL, '1990-01-01 00:00:00', '2024-05-03 14:54:11', NULL),
	(15, 'mail_port', '587', 'Mail Port', NULL, '1990-01-01 00:00:00', '2024-05-03 14:54:11', NULL),
	(16, 'mail_username', 'noreplay.hrm@gmail.com', 'User Mail', NULL, '1990-01-01 00:00:00', '2024-05-03 14:54:11', NULL),
	(17, 'mail_password', 'admin@#060394', 'Password Mail', NULL, '1990-01-01 00:00:00', '2024-05-03 14:54:11', NULL),
	(18, 'provider.url', '', 'Url LDAP', NULL, '1990-01-01 00:00:00', '2024-07-12 13:48:00', '/api/config/checkLdapConnect'),
	(19, 'ad.username', '', 'Username LDAP1', NULL, '1990-01-01 00:00:00', '2024-07-12 13:48:01', NULL),
	(20, 'ad.password', '', 'Password LDAP1', NULL, '1990-01-01 00:00:00', '2024-07-12 13:48:03', NULL),
	(21, 'user.container', 'DC=sbdlab,DC=net', 'User Container', NULL, '1990-01-01 00:00:00', '2024-05-03 14:54:11', NULL),
	(22, 'ad.security.principal', 'DC=sbdlab,DC=net', 'sercurity', NULL, '1990-01-01 00:00:00', '2024-05-03 14:54:11', NULL),
	(23, 'ad.security.authentication', 'simple', NULL, NULL, '1990-01-01 00:00:00', '2024-05-03 14:54:11', NULL),
	(24, 'ad.user.seachbase', 'DC=sbdlab,DC=net', 'searchbase', NULL, '1990-01-01 00:00:00', '2024-05-03 14:54:11', NULL),
	(45, 'validator_url_cluster1', '', 'URL AXL Cluster1', NULL, '1990-01-01 00:00:00', '2024-07-12 13:46:31', '/api/config/checkCUCMConnect'),
	(46, 'axl_username_cluster1', '', 'axl_username Cluster1', NULL, '1990-01-01 00:00:00', '2024-07-12 13:46:29', NULL),
	(47, 'axl_password_cluster1', '', 'axl_password Cluster1', NULL, '1990-01-01 00:00:00', '2024-07-12 13:46:25', NULL),
	(48, 'validator_url_cluster2', '', 'URL AXL Cluster 2', NULL, '1990-01-01 00:00:00', '2024-05-03 14:54:11', '/api/config/checkCUCMConnect'),
	(49, 'axl_username_cluster2', '', 'axl_username Cluster 2', NULL, '1990-01-01 00:00:00', '2024-05-03 14:54:11', NULL),
	(50, 'axl_password_cluster2', '', 'axl_password Cluster 2', NULL, '1990-01-01 00:00:00', '2024-05-03 14:54:11', NULL),
	(51, 'validator_url_cluster3', '', 'URL AXL Cluster 3', NULL, '1990-01-01 00:00:00', '2024-05-03 14:54:11', '/api/config/checkCUCMConnect'),
	(52, 'axl_username_cluster3', NULL, 'axl_username Cluster 3', NULL, '1990-01-01 00:00:00', '2024-05-03 14:54:11', NULL),
	(53, 'axl_password_cluster3', NULL, 'axl_password Cluster 3', NULL, '1990-01-01 00:00:00', '2024-05-03 14:54:11', NULL),
	(54, 'validator_url_cluster4', NULL, 'URL AXL Cluster 4', NULL, '1990-01-01 00:00:00', '2024-05-03 14:54:11', '/api/config/checkCUCMConnect'),
	(55, 'axl_username_cluster4', NULL, 'axl_username Cluster 4', NULL, '1990-01-01 00:00:00', '2024-05-03 14:54:11', NULL),
	(56, 'axl_password_cluster4', NULL, 'axl_password Cluster 4', NULL, '1990-01-01 00:00:00', '2024-05-03 14:54:11', NULL),
	(57, 'validator_url_cluster5', NULL, 'URL AXL Cluster 5', NULL, '1990-01-01 00:00:00', '2024-05-03 14:54:11', '/api/config/checkCUCMConnect'),
	(58, 'axl_username_cluster5', NULL, 'axl_username Cluster 5', NULL, '1990-01-01 00:00:00', '2024-05-03 14:54:11', NULL),
	(59, 'axl_password_cluster5', NULL, 'axl_password Cluster 5', NULL, '1990-01-01 00:00:00', '2024-05-03 14:54:11', NULL),
	(60, 'validator_url_cluster6', NULL, 'URL AXL Cluster 6', NULL, '1990-01-01 00:00:00', '2024-05-03 14:54:11', '/api/config/checkCUCMConnect'),
	(61, 'axl_username_cluster6', NULL, 'axl_username Cluster 6', NULL, '1990-01-01 00:00:00', '2024-05-03 14:54:11', NULL),
	(62, 'axl_password_cluster6', NULL, 'axl_password Cluster 6', NULL, '1990-01-01 00:00:00', '2024-05-03 14:54:11', NULL);
/*!40000 ALTER TABLE `config` ENABLE KEYS */;

-- Dumping structure for table billing_server_test.configdev
CREATE TABLE IF NOT EXISTS `configdev` (
  `id` int(11) NOT NULL,
  `key_config` varchar(50) CHARACTER SET utf8 NOT NULL,
  `value_config` varchar(255) CHARACTER SET utf8 NOT NULL,
  `description` varchar(255) CHARACTER SET utf8 NOT NULL,
  `date_begin_charge` int(11) NOT NULL DEFAULT 28,
  `custom_config` longtext CHARACTER SET utf8 DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '1990-01-01 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table billing_server_test.configdev: ~12 rows (approximately)
/*!40000 ALTER TABLE `configdev` DISABLE KEYS */;
INSERT INTO `configdev` (`id`, `key_config`, `value_config`, `description`, `date_begin_charge`, `custom_config`, `created_at`, `updated_at`) VALUES
	(1, 'dir_file', 'D:\\SBD\\billing-core\\data', 'Folder Get File', 28, NULL, '1990-01-01 00:00:00', '2022-01-11 11:25:16'),
	(2, 'max_size_record', '3000', 'Max size record in file', 28, NULL, '1990-01-01 00:00:00', '2021-12-13 08:36:27'),
	(3, 'path_backup', '.\\\\backup', 'Backup Folder', 28, NULL, '1990-01-01 00:00:00', '2021-12-30 09:11:25'),
	(4, 'max_thread', '10', 'Max Thread', 28, NULL, '1990-01-01 00:00:00', '2021-12-13 08:40:39'),
	(5, 'regex_check_name_file', '^cdr*', 'Check Name File', 28, NULL, '1990-01-01 00:00:00', '2021-12-30 09:26:10'),
	(6, 'percent_warning', '80.0', '% Warning', 28, NULL, '1990-01-01 00:00:00', '2021-12-16 13:51:43'),
	(7, 'block_status', '', 'Block status', 28, NULL, '1990-01-01 00:00:00', '2021-12-16 13:54:56'),
	(8, 'mail_username', 'noreplay.hrm@gmail.com', 'User Mail', 28, NULL, '1990-01-01 00:00:00', '2021-12-20 15:01:47'),
	(10, 'mail_password', 'admin@#060394', 'Password Mail', 28, NULL, '1990-01-01 00:00:00', '2021-12-20 15:01:47'),
	(11, 'mail_host', 'smtp.gmail.com', 'Server Mail', 28, NULL, '1990-01-01 00:00:00', '2021-12-20 13:48:01'),
	(12, 'mail_port', '587', 'Mail Port', 28, NULL, '1990-01-01 00:00:00', '2021-12-20 13:48:41'),
	(13, 'path_error', '.\\\\error', 'Save Record Error', 28, NULL, '1990-01-01 00:00:00', '2021-12-30 09:11:25');
/*!40000 ALTER TABLE `configdev` ENABLE KEYS */;

-- Dumping structure for table billing_server_test.config_province_code
CREATE TABLE IF NOT EXISTS `config_province_code` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone_code` varchar(50) NOT NULL DEFAULT '',
  `local_phone_code` varchar(255) NOT NULL DEFAULT '',
  `created_at` timestamp NOT NULL DEFAULT '1990-01-01 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `phone_local` (`local_phone_code`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;

-- Dumping data for table billing_server_test.config_province_code: ~21 rows (approximately)
/*!40000 ALTER TABLE `config_province_code` DISABLE KEYS */;
INSERT INTO `config_province_code` (`id`, `phone_code`, `local_phone_code`, `created_at`, `updated_at`) VALUES
	(1, '24', '34', '2020-06-29 06:48:50', '2020-06-29 06:48:50'),
	(3, '24', '10', '2020-06-29 06:49:01', '2020-06-29 06:49:01'),
	(5, '24', '14', '2020-06-29 06:49:08', '2020-06-29 06:49:08'),
	(7, '28', '32', '2020-06-29 06:50:31', '2020-06-29 06:50:31'),
	(9, '28', '44', '2020-06-29 06:50:41', '2020-06-29 06:50:41'),
	(13, '28', '38', '2020-06-29 06:51:15', '2020-06-29 06:51:15'),
	(15, '28', '30', '2020-06-29 06:51:25', '2020-06-29 06:51:25'),
	(17, '24', '46', '2020-06-29 06:55:19', '2020-06-29 06:55:19'),
	(19, '28', '86', '2020-06-29 07:05:21', '2020-06-29 07:05:21'),
	(21, '225', '55', '2020-06-29 07:33:43', '2020-06-29 07:33:43'),
	(23, '204', '22', '2020-08-06 08:12:05', '2020-08-06 08:12:05'),
	(25, '271', '33', '2020-08-06 08:12:09', '2020-08-06 08:12:09'),
	(29, '206', '54', '2020-08-06 08:12:18', '2020-08-06 08:12:18'),
	(33, '212', '12', '2020-08-06 08:12:28', '2020-08-06 08:12:28'),
	(37, '273', '65', '2020-08-06 08:12:38', '2020-08-06 08:12:38'),
	(39, '290', '67', '2020-08-06 08:13:19', '2020-08-06 08:13:19'),
	(41, '271', '143', '2020-08-06 08:13:25', '2020-08-06 08:13:25'),
	(43, '269', '144', '2020-08-06 08:13:35', '2020-08-06 08:13:35'),
	(45, '269', '145', '2020-08-06 08:13:42', '2020-08-06 08:13:42'),
	(47, '292', '146', '2020-08-06 08:13:46', '2020-08-06 08:13:46'),
	(49, '235', '147', '2020-08-06 08:13:55', '2020-08-06 08:13:55');
/*!40000 ALTER TABLE `config_province_code` ENABLE KEYS */;

-- Dumping structure for table billing_server_test.config_system
CREATE TABLE IF NOT EXISTS `config_system` (
  `id` int(11) NOT NULL,
  `source_dir` varchar(50) NOT NULL DEFAULT '',
  `error_dir` varchar(255) NOT NULL DEFAULT '',
  `validator_url` varchar(255) NOT NULL DEFAULT '',
  `axl_username` varchar(255) NOT NULL DEFAULT '',
  `axl_password` varchar(255) NOT NULL DEFAULT '',
  `percent_warning` float NOT NULL DEFAULT 0,
  `block_status` varchar(255) NOT NULL DEFAULT '',
  `unblock_status` varchar(255) NOT NULL DEFAULT '',
  `number_fac` int(10) NOT NULL DEFAULT 999999,
  `level_fac` int(10) NOT NULL DEFAULT 10,
  `is_sync_ad` varchar(10) NOT NULL DEFAULT 'N',
  `user_container` varchar(255) NOT NULL DEFAULT '',
  `provider_url` varchar(255) NOT NULL DEFAULT '',
  `security_principal` varchar(255) NOT NULL DEFAULT '',
  `ad_username` varchar(255) NOT NULL DEFAULT '',
  `ad_password` varchar(255) NOT NULL DEFAULT '',
  `date_begin_charge` int(11) NOT NULL DEFAULT 28,
  `custom_config` longtext DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '1990-01-01 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table billing_server_test.config_system: ~0 rows (approximately)
/*!40000 ALTER TABLE `config_system` DISABLE KEYS */;
INSERT INTO `config_system` (`id`, `source_dir`, `error_dir`, `validator_url`, `axl_username`, `axl_password`, `percent_warning`, `block_status`, `unblock_status`, `number_fac`, `level_fac`, `is_sync_ad`, `user_container`, `provider_url`, `security_principal`, `ad_username`, `ad_password`, `date_begin_charge`, `custom_config`, `created_at`, `updated_at`) VALUES
	(1, '/billing/mysftpuser/source', '/billing/mysftpuser/source/error', 'https://10.168.30.11:8443/axl/', 'admin', 'PDdy2Co+UTdrDe2CXHY4TA==', 80, '', 'Internal', 4, 20, 'N', 'DC=sbdlab,DC=net', 'ldap://10.168.10.10:389', 'cn=users,dc=saobacdau,dc=vn', 'tuanta@sbdlab.net', 'PDdy2Co+UTdrDe2CXHY4TA==', 30, '', '1990-01-01 00:00:00', '2021-05-21 13:47:46');
/*!40000 ALTER TABLE `config_system` ENABLE KEYS */;

-- Dumping structure for table billing_server_test.DATABASECHANGELOG
CREATE TABLE IF NOT EXISTS `DATABASECHANGELOG` (
  `ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `AUTHOR` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `FILENAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DATEEXECUTED` datetime NOT NULL,
  `ORDEREXECUTED` int(11) NOT NULL,
  `EXECTYPE` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `MD5SUM` varchar(35) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `COMMENTS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TAG` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LIQUIBASE` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CONTEXTS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LABELS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DEPLOYMENT_ID` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table billing_server_test.DATABASECHANGELOG: ~0 rows (approximately)
/*!40000 ALTER TABLE `DATABASECHANGELOG` DISABLE KEYS */;
/*!40000 ALTER TABLE `DATABASECHANGELOG` ENABLE KEYS */;

-- Dumping structure for table billing_server_test.DATABASECHANGELOGLOCK
CREATE TABLE IF NOT EXISTS `DATABASECHANGELOGLOCK` (
  `ID` int(11) NOT NULL,
  `LOCKED` bit(1) NOT NULL,
  `LOCKGRANTED` datetime DEFAULT NULL,
  `LOCKEDBY` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table billing_server_test.DATABASECHANGELOGLOCK: ~0 rows (approximately)
/*!40000 ALTER TABLE `DATABASECHANGELOGLOCK` DISABLE KEYS */;
/*!40000 ALTER TABLE `DATABASECHANGELOGLOCK` ENABLE KEYS */;

-- Dumping structure for table billing_server_test.ductemp
CREATE TABLE IF NOT EXISTS `ductemp` (
  `id` text COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table billing_server_test.ductemp: ~0 rows (approximately)
/*!40000 ALTER TABLE `ductemp` DISABLE KEYS */;
/*!40000 ALTER TABLE `ductemp` ENABLE KEYS */;

-- Dumping structure for table billing_server_test.file_scans
CREATE TABLE IF NOT EXISTS `file_scans` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `path_file` varchar(255) CHARACTER SET utf8 NOT NULL,
  `status` enum('waiting','processing','success','failed') NOT NULL DEFAULT 'waiting',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table billing_server_test.file_scans: ~0 rows (approximately)
/*!40000 ALTER TABLE `file_scans` DISABLE KEYS */;
/*!40000 ALTER TABLE `file_scans` ENABLE KEYS */;

-- Dumping structure for table billing_server_test.gateway_operator
CREATE TABLE IF NOT EXISTS `gateway_operator` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gateway_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `operator` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `calling_number` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `manager` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cost_difference` decimal(10,2) NOT NULL DEFAULT 100.00,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `gateway_name` (`gateway_name`)
) ENGINE=InnoDB AUTO_INCREMENT=161 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table billing_server_test.gateway_operator: ~5 rows (approximately)
/*!40000 ALTER TABLE `gateway_operator` DISABLE KEYS */;
INSERT INTO `gateway_operator` (`id`, `gateway_name`, `operator`, `calling_number`, `manager`, `cost_difference`) VALUES
	(152, '10.17.34.4', 'VNPT', '02426276628', '', 100.00),
	(160, 'CUCM001_HO_STRUNK_GW_10.17.8.12', NULL, NULL, NULL, 100.00);
/*!40000 ALTER TABLE `gateway_operator` ENABLE KEYS */;

-- Dumping structure for table billing_server_test.groups
CREATE TABLE IF NOT EXISTS `groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `monthly_limited_cost` decimal(15,2) DEFAULT NULL,
  `monthly_used_cost` decimal(15,2) DEFAULT NULL,
  `time` int(11) DEFAULT NULL,
  `description` text CHARACTER SET utf8 DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '1990-01-01 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `sent_warning_mail` varchar(10) DEFAULT NULL,
  `sent_warning_sms` varchar(10) DEFAULT NULL,
  `id_parent` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table billing_server_test.groups: ~0 rows (approximately)
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `groups` ENABLE KEYS */;

-- Dumping structure for table billing_server_test.jhi_authority
CREATE TABLE IF NOT EXISTS `jhi_authority` (
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table billing_server_test.jhi_authority: ~3 rows (approximately)
/*!40000 ALTER TABLE `jhi_authority` DISABLE KEYS */;
INSERT INTO `jhi_authority` (`name`) VALUES
	('ROLE_ADMIN'),
	('ROLE_LEADER'),
	('ROLE_VIEW_ALL');
/*!40000 ALTER TABLE `jhi_authority` ENABLE KEYS */;

-- Dumping structure for table billing_server_test.jhi_persistent_audit_event
CREATE TABLE IF NOT EXISTS `jhi_persistent_audit_event` (
  `event_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `principal` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `event_date` timestamp NULL DEFAULT NULL,
  `event_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`event_id`),
  KEY `idx_persistent_audit_event` (`principal`,`event_date`)
) ENGINE=InnoDB AUTO_INCREMENT=1252 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table billing_server_test.jhi_persistent_audit_event: ~0 rows (approximately)
/*!40000 ALTER TABLE `jhi_persistent_audit_event` DISABLE KEYS */;
/*!40000 ALTER TABLE `jhi_persistent_audit_event` ENABLE KEYS */;

-- Dumping structure for table billing_server_test.jhi_persistent_audit_evt_data
CREATE TABLE IF NOT EXISTS `jhi_persistent_audit_evt_data` (
  `event_id` bigint(20) NOT NULL,
  `name` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`event_id`,`name`),
  KEY `idx_persistent_audit_evt_data` (`event_id`),
  CONSTRAINT `fk_evt_pers_audit_evt_data` FOREIGN KEY (`event_id`) REFERENCES `jhi_persistent_audit_event` (`event_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table billing_server_test.jhi_persistent_audit_evt_data: ~0 rows (approximately)
/*!40000 ALTER TABLE `jhi_persistent_audit_evt_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `jhi_persistent_audit_evt_data` ENABLE KEYS */;

-- Dumping structure for table billing_server_test.jhi_user
CREATE TABLE IF NOT EXISTS `jhi_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `login` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `first_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image_url` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `activated` bit(1) NOT NULL,
  `lang_key` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `activation_key` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reset_key` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_by` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `created_date` timestamp NULL DEFAULT NULL,
  `reset_date` timestamp NULL DEFAULT NULL,
  `last_modified_by` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_modified_date` timestamp NULL DEFAULT NULL,
  `end_user_id` int(10) unsigned DEFAULT NULL,
  `login_type` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `role_group_id` int(11) DEFAULT NULL,
  `ip_phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ux_user_login` (`login`),
  UNIQUE KEY `ux_user_email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=759 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table billing_server_test.jhi_user: ~2 rows (approximately)
/*!40000 ALTER TABLE `jhi_user` DISABLE KEYS */;
INSERT INTO `jhi_user` (`id`, `login`, `password_hash`, `first_name`, `last_name`, `email`, `image_url`, `activated`, `lang_key`, `activation_key`, `reset_key`, `created_by`, `created_date`, `reset_date`, `last_modified_by`, `last_modified_date`, `end_user_id`, `login_type`, `role_group_id`, `ip_phone`) VALUES
	(1, 'system', '$2a$10$mE.qmcV0mFU5NcKh73TZx.z4ueI/.bDWbj0T1BYyqP481kGGarKLG', 'System', 'System', 'system@localhost', '', b'1', 'en', NULL, NULL, 'system', NULL, NULL, 'ducdq', '2022-12-01 10:15:03', NULL, 'LOCAL', NULL, NULL),
	(3, 'admin', '$2a$10$NBrBkIReo47y.yx7lniILucMNSZAlkyhE4uXYbkiFMHXR3xx5PLma', 'Administrator123', 'Administrator', 'admin@localhost', '', b'1', 'en', NULL, NULL, 'system', NULL, NULL, 'admin', '2022-01-16 20:46:50', NULL, 'LOCAL', NULL, NULL);
/*!40000 ALTER TABLE `jhi_user` ENABLE KEYS */;

-- Dumping structure for table billing_server_test.jhi_user_authority
CREATE TABLE IF NOT EXISTS `jhi_user_authority` (
  `user_id` bigint(20) NOT NULL,
  `authority_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`user_id`,`authority_name`),
  KEY `fk_authority_name` (`authority_name`),
  CONSTRAINT `fk_authority_name` FOREIGN KEY (`authority_name`) REFERENCES `jhi_authority` (`name`),
  CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `jhi_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table billing_server_test.jhi_user_authority: ~2 rows (approximately)
/*!40000 ALTER TABLE `jhi_user_authority` DISABLE KEYS */;
INSERT INTO `jhi_user_authority` (`user_id`, `authority_name`) VALUES
	(1, 'ROLE_ADMIN'),
	(3, 'ROLE_ADMIN');
/*!40000 ALTER TABLE `jhi_user_authority` ENABLE KEYS */;

-- Dumping structure for procedure billing_server_test.load_rebilling_session
DELIMITER //
CREATE PROCEDURE `load_rebilling_session`()
BEGIN
	#Routine body goes here...
declare v_id int;
	declare v_cnt bigint;
	declare v_starttime TIMESTAMP;
	declare v_endtime TIMESTAMP;
	
	select id into v_id from rebilling_session where status='RUNNING' limit 1;
	
	
	if (v_id is null or v_id<=0) then
			select id,start_time,end_time into v_id, v_starttime, v_endtime from rebilling_session where status='WAITING' order by insert_time limit 1;
	
			if (v_id>0) then
						insert into call_histories_cdr_rebilling select * from call_histories_cdr where called_at between v_starttime and v_endtime;
					 	select count(1) into v_cnt from call_histories_cdr_rebilling;
						
						update rebilling_session set status='RUNNING',update_time=CURRENT_TIMESTAMP, total_records=v_cnt where id=v_id;
			end if;
	else
			IF  not Exists  (select * from call_histories_cdr_rebilling) THEN			
					update rebilling_session set status='FINISHED',update_time=CURRENT_TIMESTAMP where status='RUNNING';
			else
				 	select count(1) into v_cnt from call_histories_cdr_rebilling;
					update rebilling_session set processed_records=total_records-v_cnt,update_time=CURRENT_TIMESTAMP where id=v_id;
			end if;
	end if;
	commit;
	
END//
DELIMITER ;

-- Dumping structure for table billing_server_test.log
CREATE TABLE IF NOT EXISTS `log` (
  `id` int(11) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_at` timestamp NOT NULL DEFAULT '1990-01-01 00:00:00',
  `event` varchar(45) NOT NULL,
  `log` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table billing_server_test.log: ~0 rows (approximately)
/*!40000 ALTER TABLE `log` DISABLE KEYS */;
/*!40000 ALTER TABLE `log` ENABLE KEYS */;

-- Dumping structure for table billing_server_test.manage_group
CREATE TABLE IF NOT EXISTS `manage_group` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ad_group_id` int(11) unsigned DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '1990-01-01 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=189 DEFAULT CHARSET=utf8;

-- Dumping data for table billing_server_test.manage_group: ~0 rows (approximately)
/*!40000 ALTER TABLE `manage_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `manage_group` ENABLE KEYS */;

-- Dumping structure for table billing_server_test.m_province
CREATE TABLE IF NOT EXISTS `m_province` (
  `phone_code` varchar(50) NOT NULL DEFAULT '',
  `province` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`phone_code`),
  UNIQUE KEY `phone_code` (`phone_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table billing_server_test.m_province: ~63 rows (approximately)
/*!40000 ALTER TABLE `m_province` DISABLE KEYS */;
INSERT INTO `m_province` (`phone_code`, `province`) VALUES
	('203', 'Quảng Ninh'),
	('204', 'Bắc Giang'),
	('205', 'Lạng Sơn'),
	('206', 'Cao Bằng'),
	('207', 'Tuyên Quang'),
	('208', 'Thái Nguyên'),
	('209', 'Bắc Cạn'),
	('210', 'Phú Thọ'),
	('211', 'Vĩnh Phúc'),
	('212', 'Sơn La'),
	('213', 'Lai Châu'),
	('214', 'Lào Cai'),
	('215', 'Điện Biên'),
	('216', 'Yên Bái'),
	('218', 'Hòa Bình'),
	('219', 'Hà Giang'),
	('220', 'Hải Dương'),
	('221', 'Hưng Yên'),
	('222', 'Bắc Ninh'),
	('225', 'Hải Phòng'),
	('226', 'Hà Nam'),
	('227', 'Thái Bình'),
	('228', 'Nam Định'),
	('229', 'Ninh Bình'),
	('232', 'Quảng Bình'),
	('233', 'Quảng Trị'),
	('234', 'Thừa Thiên Huế'),
	('235', 'Quảng Nam'),
	('236', 'Đà Nẵng'),
	('237', 'Thanh Hóa'),
	('238', 'Nghệ An'),
	('239', 'Hà Tĩnh'),
	('24', 'Hà Nội'),
	('251', 'Đồng Nai'),
	('252', 'Bình Thuận'),
	('254', 'Bà Rịa Vũng Tàu'),
	('255', 'Quảng Ngãi'),
	('256', 'Bình Định'),
	('257', 'Phú Yên'),
	('258', 'Khánh Hòa'),
	('259', 'Ninh Thuận'),
	('260', 'Kon Tum'),
	('261', 'Đắk Nông'),
	('262', 'Đắk Lắk'),
	('263', 'Lâm Đồng'),
	('269', 'Gia Lai'),
	('270', 'Vĩnh Long'),
	('271', 'Bình Phước'),
	('272', 'Long An'),
	('273', 'Tiền Giang'),
	('274', 'Bình Dương'),
	('275', 'Bến Tre'),
	('276', 'Tây Ninh'),
	('277', 'Đồng Tháp'),
	('28', 'Hồ Chí Minh'),
	('290', 'Cà Mau'),
	('291', 'Bạc Liêu'),
	('292', 'Cần Thơ'),
	('293', 'Hậu Giang'),
	('294', 'Trà Vinh'),
	('296', 'An Giang'),
	('297', 'Kiên Giang'),
	('299', 'Sóc Trăng');
/*!40000 ALTER TABLE `m_province` ENABLE KEYS */;

-- Dumping structure for table billing_server_test.phone
CREATE TABLE IF NOT EXISTS `phone` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone_number` varchar(100) DEFAULT NULL,
  `partition_value` varchar(100) DEFAULT NULL,
  `monthly_limited_cost` decimal(15,2) NOT NULL DEFAULT 0.00,
  `monthly_used_cost` decimal(15,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NOT NULL DEFAULT '1990-01-01 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '1990-01-01 00:00:00',
  `sent_warning_mail` varchar(10) DEFAULT NULL,
  `sent_warning_sms` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table billing_server_test.phone: ~0 rows (approximately)
/*!40000 ALTER TABLE `phone` DISABLE KEYS */;
/*!40000 ALTER TABLE `phone` ENABLE KEYS */;

-- Dumping structure for table billing_server_test.prefix
CREATE TABLE IF NOT EXISTS `prefix` (
  `operator` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `prefix_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `prefix` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`prefix`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table billing_server_test.prefix: ~42 rows (approximately)
/*!40000 ALTER TABLE `prefix` DISABLE KEYS */;
INSERT INTO `prefix` (`operator`, `prefix_type`, `prefix`) VALUES
	('VIETTEL', 'fixline', '2'),
	('EVN', 'fixline', '20'),
	('VNPT', 'fixline', '3'),
	('VIETTEL', 'mobile', '32'),
	('VIETTEL', 'mobile', '33'),
	('VIETTEL', 'mobile', '34'),
	('VIETTEL', 'mobile', '35'),
	('VIETTEL', 'mobile', '36'),
	('VIETTEL', 'mobile', '37'),
	('VIETTEL', 'mobile', '38'),
	('VIETTEL', 'mobile', '39'),
	('VTC', 'fixline', '4'),
	('SPT', 'fixline', '5'),
	('VIETNAMOBILE', 'mobile', '56'),
	('VIETNAMOBILE', 'mobile', '58'),
	('GMOBILE', 'mobile', '59'),
	('VIETTEL', 'fixline', '6'),
	('FTP', 'fixline', '7'),
	('MOBIFONE', 'mobile', '70'),
	('MOBIFONE', 'mobile', '76'),
	('MOBIFONE', 'mobile', '77'),
	('MOBIFONE', 'mobile', '78'),
	('MOBIFONE', 'mobile', '79'),
	('VNPT', 'fixline', '8'),
	('VNPT', 'mobile', '81'),
	('VNPT', 'mobile', '82'),
	('VNPT', 'mobile', '83'),
	('VNPT', 'mobile', '84'),
	('VNPT', 'mobile', '85'),
	('VIETTEL', 'mobile', '86'),
	('ITEL', 'mobile', '87'),
	('VNPT', 'mobile', '88'),
	('MOBIFONE', 'mobile', '89'),
	('MOBIFONE', 'mobile', '90'),
	('VNPT', 'mobile', '91'),
	('VIETNAMOBILE', 'mobile', '92'),
	('MOBIFONE', 'mobile', '93'),
	('VNPT', 'mobile', '94'),
	('VIETTEL', 'mobile', '96'),
	('VIETTEL', 'mobile', '97'),
	('VIETTEL', 'mobile', '98'),
	('GMOBILE', 'mobile', '99');
/*!40000 ALTER TABLE `prefix` ENABLE KEYS */;

-- Dumping structure for table billing_server_test.prefix_location
CREATE TABLE IF NOT EXISTS `prefix_location` (
  `province` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `prefix` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table billing_server_test.prefix_location: ~63 rows (approximately)
/*!40000 ALTER TABLE `prefix_location` DISABLE KEYS */;
INSERT INTO `prefix_location` (`province`, `prefix`) VALUES
	('an_giang', '296'),
	('ba_ria_vung_tau', '254'),
	('bac_can', '209'),
	('bac_giang', '204'),
	('bac_lieu', '291'),
	('bac_ninh', '222'),
	('ben_tre', '275'),
	('binh_dinh', '256'),
	('binh_duong', '274'),
	('binh_phuoc', '271'),
	('binh_thuan', '252'),
	('ca_mau', '290'),
	('can_tho', '292'),
	('cao_bang', '206'),
	('da_nang', '236'),
	('dak_lak', '262'),
	('dak_nong', '261'),
	('dien_bien', '215'),
	('dong_nai', '251'),
	('dong_thap', '277'),
	('gia_lai', '269'),
	('ha_giang', '219'),
	('ha_nam', '226'),
	('ha_noi', '24'),
	('ha_tinh', '239'),
	('hai_duong', '220'),
	('hai_phong', '225'),
	('hau_giang', '293'),
	('ho_chi_minh', '28'),
	('hoa_binh', '218'),
	('hung_yen', '221'),
	('khanh_hoa', '258'),
	('kien_giang', '297'),
	('kon_tum', '260'),
	('lai_chau', '213'),
	('lam_dong', '263'),
	('lang_son', '205'),
	('lao_cai', '214'),
	('long_an', '272'),
	('nam_dinh', '228'),
	('nghe_an', '238'),
	('ninh_binh', '229'),
	('ninh_thuan', '259'),
	('phu_tho', '210'),
	('phu_yen', '257'),
	('quang_binh', '232'),
	('quang_nam', '235'),
	('quang_ngai', '255'),
	('quang_ninh', '203'),
	('quang_tri', '233'),
	('soc_trang', '299'),
	('son_la', '212'),
	('tay_ninh', '276'),
	('thai_binh', '227'),
	('thai_nguyen', '208'),
	('thanh_hoa', '237'),
	('thua_thien_hue', '234'),
	('tien_giang', '273'),
	('tra_vinh', '294'),
	('tuyen_quang', '207'),
	('vinh_long', '270'),
	('vinh_phuc', '211'),
	('yen_bai', '216');
/*!40000 ALTER TABLE `prefix_location` ENABLE KEYS */;

-- Dumping structure for table billing_server_test.price
CREATE TABLE IF NOT EXISTS `price` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `first_number` blob DEFAULT NULL,
  `price_second` float DEFAULT NULL,
  `price_block` float DEFAULT NULL,
  `price_minute` float DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '1990-01-01 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '1990-01-01 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- Dumping data for table billing_server_test.price: ~3 rows (approximately)
/*!40000 ALTER TABLE `price` DISABLE KEYS */;
INSERT INTO `price` (`id`, `name`, `first_number`, `price_second`, `price_block`, `price_minute`, `created_at`, `updated_at`) VALUES
	(2, 'LOCAL', NULL, 80, 13.33, 799.82, '1990-01-01 00:00:00', '2020-05-06 09:58:09'),
	(4, 'MOBILE', NULL, 89, 14.85, 890.9, '1990-01-01 00:00:00', '2020-05-06 09:59:51'),
	(6, 'INTERNATION', NULL, 500, 60, 3740, '1990-01-01 00:00:00', '1990-01-01 00:00:00');
/*!40000 ALTER TABLE `price` ENABLE KEYS */;

-- Dumping structure for table billing_server_test.price_config
CREATE TABLE IF NOT EXISTS `price_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gateway_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `calling_gateway` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `operator` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'mobile_on_net|mobile_off_net|fixline_on_net|fixline_on_net_local|fixline_off_net|fixline_off_net_local|international',
  `price_second` double(255,2) DEFAULT NULL,
  `price_block` double(255,2) DEFAULT NULL,
  `price_minute` double(255,2) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table billing_server_test.price_config: ~14 rows (approximately)
/*!40000 ALTER TABLE `price_config` DISABLE KEYS */;
INSERT INTO `price_config` (`id`, `gateway_id`, `calling_gateway`, `operator`, `type`, `price_second`, `price_block`, `price_minute`) VALUES
	(3, 'GWVNPT', NULL, 'VNPT', 'mobile_on_net', 13.33, 80.00, NULL),
	(5, 'GWVNPT', NULL, 'VNPT', 'mobile_off_net', 14.85, 89.09, NULL),
	(7, 'GWVNPT', NULL, 'VNPT', 'fixline_on_net', 13.33, 80.00, NULL),
	(9, 'GWVNPT', NULL, 'VNPT', 'fixline_on_net_local', NULL, NULL, 201.00),
	(11, 'GWVNPT', NULL, 'VNPT', 'fixline_off_net', 14.85, 89.09, NULL),
	(13, 'GWVNPT', NULL, 'VNPT', 'fixline_off_net_local', 13.33, 80.00, NULL),
	(15, 'GWVNPT', NULL, 'VNPT', 'international', 60.00, 360.00, NULL),
	(19, 'GWVIETEL', NULL, 'VIETTEL', 'mobile_on_net', 13.16, 79.00, NULL),
	(21, 'GWVIETEL', NULL, 'VIETTEL', 'mobile_off_net', 18.17, 109.00, NULL),
	(23, 'GWVIETEL', NULL, 'VIETTEL', 'fixline_on_net', 13.16, 79.00, NULL),
	(25, 'GWVIETEL', NULL, 'VIETTEL', 'fixline_on_net_local', NULL, NULL, 220.00),
	(27, 'GWVIETEL', NULL, 'VIETTEL', 'fixline_off_net', 16.66, 100.00, NULL),
	(29, 'GWVIETEL', NULL, 'VIETTEL', 'fixline_off_net_local', 13.17, 79.00, NULL),
	(31, 'GWVIETEL', NULL, 'VIETTEL', 'international', 60.00, 360.00, NULL);
/*!40000 ALTER TABLE `price_config` ENABLE KEYS */;

-- Dumping structure for table billing_server_test.rebilling_session
CREATE TABLE IF NOT EXISTS `rebilling_session` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `fileid` int(11) DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'WAITING|RUNNING|FINISH|ERROR',
  `insert_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `total_records` bigint(255) DEFAULT NULL,
  `processed_records` bigint(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table billing_server_test.rebilling_session: ~0 rows (approximately)
/*!40000 ALTER TABLE `rebilling_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `rebilling_session` ENABLE KEYS */;

-- Dumping structure for table billing_server_test.role_group
CREATE TABLE IF NOT EXISTS `role_group` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `directory_string` varchar(255) DEFAULT '',
  `role` varchar(255) DEFAULT '',
  `description` varchar(255) DEFAULT '',
  `created_at` timestamp NOT NULL DEFAULT '1990-01-01 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=389 DEFAULT CHARSET=utf8;

-- Dumping data for table billing_server_test.role_group: ~1 rows (approximately)
/*!40000 ALTER TABLE `role_group` DISABLE KEYS */;
INSERT INTO `role_group` (`id`, `directory_string`, `role`, `description`, `created_at`, `updated_at`) VALUES
	(386, 'CN=Group 3,CN=Users,DC=sbdlab,DC=net', 'ROLE_ADMIN', NULL, '2022-12-14 09:40:59', '2022-12-14 09:40:59');
/*!40000 ALTER TABLE `role_group` ENABLE KEYS */;

-- Dumping structure for table billing_server_test.user
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_name` varchar(50) NOT NULL DEFAULT '',
  `display_name` varchar(255) DEFAULT '',
  `email` varchar(100) DEFAULT '',
  `ip_phone` varchar(100) NOT NULL,
  `mobile` varchar(100) DEFAULT NULL,
  `device_name` varchar(200) DEFAULT NULL,
  `authoryze_code` varchar(200) DEFAULT NULL,
  `authoryze_code_level` int(5) DEFAULT NULL,
  `authoryze_code_name` varchar(200) DEFAULT NULL,
  `fac_uuid` varchar(200) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  `monthly_limited_cost` float(15,2) NOT NULL DEFAULT 0.00,
  `monthly_used_cost` float(15,2) NOT NULL DEFAULT 0.00,
  `sent_warning_mail` varchar(10) DEFAULT NULL,
  `sent_warning_sms` varchar(10) DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '1990-01-01 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `is_leader` varchar(10) DEFAULT 'N',
  `css_phone` varchar(100) DEFAULT NULL,
  `css_line` varchar(100) DEFAULT NULL,
  `is_blocked` varchar(10) DEFAULT 'N',
  `department` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_name` (`user_name`),
  UNIQUE KEY `user_name_unique` (`user_name`),
  KEY `idx_username` (`user_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table billing_server_test.user: ~0 rows (approximately)
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
