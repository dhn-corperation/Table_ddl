-- 메시지 수신 테이블

CREATE TABLE `DHN_RECEPTION` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '아이디',
  `msgid` varchar(20) DEFAULT NULL COMMENT '메시지 ID',
  `userid` varchar(20) DEFAULT NULL COMMENT '유저 ID',
  `insert_date` timestamp NULL DEFAULT current_timestamp() COMMENT '삽입 날짜',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COMMENT='수신 테이블';

-- 발송계정 세팅용 DHN_CLIENT_LIST 테이블

CREATE TABLE `DHN_CLIENT_LIST` (
  `user_id` varchar(50) DEFAULT NULL,
  `ip` varchar(50) DEFAULT NULL,
  `use_flag` char(1) DEFAULT NULL,
  /* `port` char(5) NOT NULL DEFAULT '9090' */
  `send_limit` varchar(50) DEFAULT NULL,
  `sms_len_check` char(1) DEFAULT 'N',
  `oshot` varchar(100) NOT NULL DEFAULT 'OShot' COMMENT 'oshot 발송 삽입 테이블',
  `dest` varchar(100) DEFAULT NULL COMMENT '발송 목적지(OSHOT(NULL), NANO)',
  `alimtalk` varchar(1) DEFAULT NULL COMMENT '알림톡사용유무',
  `friendtalk` varchar(1) DEFAULT 'N' COMMENT '친구톡사용유무',
  /* `second_send_flag` enum('Y','N') DEFAULT 'Y' COMMENT '2차 발송 플래그', */
  /* `crypto` varchar(255) DEFAULT NULL COMMENT '암호화 컬럼(구분자 , 공백없이)', */
  `nano_tel_seperate` char(1) DEFAULT 'N' COMMENT '나노 010 분리 작업',
  /* `pre_send_type` tinyint(4) DEFAULT 0 COMMENT 'API를 이용한 문자발송 플랫폼 전환 했을 때 전 발송 플랫폼(0 : 에이전트 가동 후 변경X, 1 : oshot, 2 : nano)',
  `pre_update_date` timestamp NULL DEFAULT NULL COMMENT 'API를 이용한 문자발송 플랫폼 전환 했을 때의 시간', */
  `description` varchar(500) DEFAULT NULL COMMENT '업체에 대한 설명 및 비고란'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 친구톡 발송용 DHN_REQUEST 테이블

CREATE TABLE `DHN_REQUEST` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `msgid` varchar(32) NOT NULL,
  `userid` varchar(20) NOT NULL,
  `ad_flag` varchar(1) DEFAULT NULL,
  `button1` longtext DEFAULT NULL,
  `button2` longtext DEFAULT NULL,
  `button3` longtext DEFAULT NULL,
  `button4` longtext DEFAULT NULL,
  `button5` longtext DEFAULT NULL,
  `image_link` longtext DEFAULT NULL,
  `image_url` longtext DEFAULT NULL,
  `message_type` varchar(2) DEFAULT NULL,
  `msg` longtext NOT NULL,
  `msg_sms` longtext DEFAULT NULL,
  `only_sms` varchar(1) DEFAULT NULL COMMENT 'N : 카카오 전용, Y : SMS 전용, D : 카카오 발송후 실패시 SMS',
  `phn` varchar(15) NOT NULL,
  `profile` varchar(50) DEFAULT NULL,
  `p_com` varchar(2) DEFAULT NULL,
  `p_invoice` varchar(100) DEFAULT NULL,
  `reg_dt` varchar(20) NOT NULL,
  `remark1` varchar(50) DEFAULT NULL,
  `remark2` varchar(50) DEFAULT NULL,
  `remark3` varchar(50) DEFAULT NULL,
  `remark4` varchar(50) DEFAULT NULL,
  `remark5` varchar(50) DEFAULT NULL,
  `reserve_dt` varchar(14) NOT NULL,
  `sms_kind` varchar(1) DEFAULT NULL,
  `sms_lms_tit` varchar(120) DEFAULT NULL,
  `sms_sender` varchar(15) DEFAULT NULL,
  `s_code` varchar(2) DEFAULT NULL,
  `tmpl_id` varchar(30) DEFAULT NULL,
  `wide` varchar(1) DEFAULT NULL,
  `send_group` char(15) DEFAULT NULL,
  `supplement` text DEFAULT NULL,
  `price` int(11) DEFAULT 0,
  `currency_type` char(3) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `header` varchar(100) DEFAULT NULL,
  `carousel` longtext DEFAULT NULL,
  `att_items` text DEFAULT NULL,
  `att_coupon` text DEFAULT NULL,
  `mms_image_id` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `send_group` (`send_group`) USING BTREE,
  KEY `msgid` (`msgid`) USING BTREE,
  KEY `IDX_DHN_REQUEST` (`reg_dt`,`userid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 알림톡 발송용 DHN_REQUEST_AT 테이블

CREATE TABLE `DHN_REQUEST_AT` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `msgid` varchar(32) NOT NULL,
  `userid` varchar(20) NOT NULL,
  `ad_flag` varchar(1) DEFAULT NULL,
  `button1` longtext DEFAULT NULL,
  `button2` longtext DEFAULT NULL,
  `button3` longtext DEFAULT NULL,
  `button4` longtext DEFAULT NULL,
  `button5` longtext DEFAULT NULL,
  `image_link` longtext DEFAULT NULL,
  `image_url` longtext DEFAULT NULL,
  `message_type` varchar(2) DEFAULT NULL,
  `msg` longtext NOT NULL,
  `msg_sms` longtext DEFAULT NULL,
  `only_sms` varchar(1) DEFAULT NULL COMMENT 'N : 카카오 전용, Y : SMS 전용, D : 카카오 발송후 실패시 SMS',
  `phn` varchar(15) NOT NULL,
  `profile` varchar(50) DEFAULT NULL,
  `p_com` varchar(2) DEFAULT NULL,
  `p_invoice` varchar(100) DEFAULT NULL,
  `reg_dt` varchar(20) NOT NULL,
  `remark1` varchar(50) DEFAULT NULL,
  `remark2` varchar(50) DEFAULT NULL,
  `remark3` varchar(50) DEFAULT NULL,
  `remark4` varchar(50) DEFAULT NULL,
  `remark5` varchar(50) DEFAULT NULL,
  `reserve_dt` varchar(14) NOT NULL,
  `sms_kind` varchar(1) DEFAULT NULL,
  `sms_lms_tit` varchar(120) DEFAULT NULL,
  `sms_sender` varchar(15) DEFAULT NULL,
  `s_code` varchar(2) DEFAULT NULL,
  `tmpl_id` varchar(30) DEFAULT NULL,
  `wide` varchar(1) DEFAULT NULL,
  `send_group` char(15) DEFAULT NULL,
  `supplement` mediumtext DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `currency_type` char(3) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `header` varchar(100) DEFAULT NULL,
  `carousel` text DEFAULT NULL,
  `attachments` text DEFAULT NULL,
  `link` text DEFAULT NULL,
  `mms_image_id` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `msgid` (`msgid`) USING BTREE,
  KEY `IDX_DHN_REQUEST` (`reg_dt`,`userid`) USING BTREE,
  KEY `send_group` (`send_group`) USING BTREE,
  KEY `DHN_REQUEST_AT_send_group_IDX` (`send_group`,`reserve_dt`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 문자발송 및 비즈메시지 결과저장용 DHN_RESULT 테이블

CREATE TABLE `DHN_RESULT` (
  `msgid` varchar(32) NOT NULL,
  `userid` varchar(20) NOT NULL,
  `ad_flag` varchar(1) DEFAULT NULL,
  `button1` longtext DEFAULT NULL,
  `button2` longtext DEFAULT NULL,
  `button3` longtext DEFAULT NULL,
  `button4` longtext DEFAULT NULL,
  `button5` longtext DEFAULT NULL,
  `code` varchar(4) DEFAULT NULL,
  `image_link` longtext DEFAULT NULL,
  `image_url` longtext DEFAULT NULL,
  `kind` varchar(1) DEFAULT NULL,
  `message` longtext DEFAULT NULL COMMENT '결과값 메시지(1차로 알림톡 2차로 문자를 보낼 시 2차 문자 결과값에 대한 메시지가 들어간다)',
  `message_type` varchar(2) DEFAULT NULL COMMENT '문자발송 타입(1차로 알림톡 2차로 문자를 보낼 시 2차 문자 타입인 PH가 적히게 된다)',
  `msg` longtext NOT NULL COMMENT '발송 결과값 메시지(1차로 알림톡 2차로 문자를 보낼 시 2차 문자의 결과값이 들어간다.)',
  `msg_sms` longtext DEFAULT NULL,
  `only_sms` varchar(1) DEFAULT NULL,
  `p_com` varchar(2) DEFAULT NULL,
  `p_invoice` varchar(100) DEFAULT NULL,
  `phn` varchar(15) NOT NULL,
  `profile` varchar(50) DEFAULT NULL,
  `reg_dt` varchar(20) NOT NULL,
  `remark1` varchar(50) DEFAULT NULL COMMENT '문자 수신 통신사',
  `remark2` varchar(50) DEFAULT NULL COMMENT '문자 발송 시간',
  `remark3` varchar(50) DEFAULT NULL COMMENT '1: 친구톡, 2: 알림톡',
  `remark4` varchar(50) DEFAULT NULL,
  `remark5` varchar(50) DEFAULT NULL,
  `res_dt` varchar(20) DEFAULT NULL,
  `reserve_dt` varchar(14) NOT NULL,
  `result` varchar(1) DEFAULT NULL,
  `s_code` varchar(4) DEFAULT NULL,
  `sms_kind` varchar(1) DEFAULT NULL,
  `sms_lms_tit` varchar(120) DEFAULT NULL,
  `sms_sender` varchar(15) DEFAULT NULL,
  `sync` varchar(1) NOT NULL,
  `tmpl_id` varchar(30) DEFAULT NULL,
  `wide` varchar(1) DEFAULT NULL,
  `send_group` varchar(14) DEFAULT NULL,
  `supplement` text DEFAULT NULL,
  `price` int(11) DEFAULT 0,
  `currency_type` char(3) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `header` varchar(50) DEFAULT NULL,
  `carousel` text DEFAULT NULL,
  `attachments` text DEFAULT NULL,
  `link` text DEFAULT NULL,
  `mms_image_id` varchar(100) DEFAULT NULL,
  `att_items` text DEFAULT NULL,
  `att_coupon` text DEFAULT NULL,
  UNIQUE KEY `DHN_RESULT_userid_IDX` (`userid`,`msgid`) USING BTREE,
  KEY `userid_result_sync` (`userid`,`sync`,`result`) USING BTREE,
  KEY `only_sms_result` (`result`,`only_sms`) USING BTREE,
  KEY `userid_remark4_result` (`result`,`userid`,`remark4`) USING BTREE,
  KEY `result_sync_send_group` (`send_group`,`result`,`sync`) USING BTREE,
  KEY `IDX_DHN_RESULT` (`userid`,`reg_dt`) USING BTREE,
  KEY `userid_result_send_group` (`userid`,`result`,`send_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- kakao.DHN_RESULT_TEMP definition

CREATE TABLE `DHN_RESULT_TEMP` (
  `msgid` varchar(20) NOT NULL,
  `userid` varchar(20) NOT NULL,
  `ad_flag` varchar(1) DEFAULT NULL,
  `button1` longtext DEFAULT NULL,
  `button2` longtext DEFAULT NULL,
  `button3` longtext DEFAULT NULL,
  `button4` longtext DEFAULT NULL,
  `button5` longtext DEFAULT NULL,
  `code` varchar(4) DEFAULT NULL,
  `image_link` longtext DEFAULT NULL,
  `image_url` longtext DEFAULT NULL,
  `kind` varchar(1) DEFAULT NULL,
  `message` longtext DEFAULT NULL,
  `message_type` varchar(2) DEFAULT NULL,
  `msg` longtext NOT NULL,
  `msg_sms` longtext DEFAULT NULL,
  `only_sms` varchar(1) DEFAULT NULL,
  `p_com` varchar(2) DEFAULT NULL,
  `p_invoice` varchar(100) DEFAULT NULL,
  `phn` varchar(15) NOT NULL,
  `profile` varchar(50) DEFAULT NULL,
  `reg_dt` varchar(20) NOT NULL,
  `remark1` varchar(50) DEFAULT NULL,
  `remark2` varchar(50) DEFAULT NULL,
  `remark3` varchar(50) DEFAULT NULL,
  `remark4` varchar(50) DEFAULT NULL,
  `remark5` varchar(50) DEFAULT NULL,
  `res_dt` varchar(20) DEFAULT NULL,
  `reserve_dt` varchar(14) NOT NULL,
  `result` varchar(1) DEFAULT NULL,
  `s_code` varchar(2) DEFAULT NULL,
  `sms_kind` varchar(1) DEFAULT NULL,
  `sms_lms_tit` varchar(120) DEFAULT NULL,
  `sms_sender` varchar(15) DEFAULT NULL,
  `sync` varchar(1) NOT NULL,
  `tmpl_id` varchar(30) DEFAULT NULL,
  `wide` varchar(1) DEFAULT NULL,
  `send_group` varchar(14) DEFAULT NULL,
  `supplement` text DEFAULT NULL,
  `price` int(11) DEFAULT 0,
  `currency_type` char(3) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `header` varchar(50) DEFAULT NULL,
  `carousel` longtext DEFAULT NULL,
  `attachments` text DEFAULT NULL,
  `link` text DEFAULT NULL,
  `mms_image_id` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`msgid`) USING BTREE,
  KEY `userid_result_sync` (`userid`,`sync`,`result`) USING BTREE,
  KEY `only_sms_result` (`result`,`only_sms`) USING BTREE,
  KEY `userid_remark4_result` (`result`,`userid`,`remark4`) USING BTREE,
  KEY `result_sync_send_group` (`send_group`,`result`,`sync`) USING BTREE,
  KEY `IDX_DHN_RESULT` (`userid`,`reg_dt`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- kakao.DHN_RESULT_SUM definition

CREATE TABLE `DHN_RESULT_SUM` (
  `send_date` varchar(255) NOT NULL,
  `userid` varchar(255) NOT NULL,
  `depart` varchar(100) DEFAULT NULL,
  `send_cnt` decimal(10,0) DEFAULT NULL,
  `ats_cnt` decimal(10,0) DEFAULT NULL,
  `ate_cnt` decimal(10,0) DEFAULT NULL,
  `fts_cnt` decimal(10,0) DEFAULT NULL,
  `fte_cnt` decimal(10,0) DEFAULT NULL,
  `ftis_cnt` decimal(10,0) DEFAULT NULL,
  `ftie_cnt` decimal(10,0) DEFAULT NULL,
  `ftws_cnt` decimal(10,0) DEFAULT NULL,
  `ftwe_cnt` decimal(10,0) DEFAULT NULL,
  `smss_cnt` int(11) DEFAULT NULL,
  `smse_cnt` int(11) DEFAULT NULL,
  `mmss_cnt` int(11) DEFAULT NULL,
  `mmse_cnt` int(11) DEFAULT NULL,
  UNIQUE KEY `DHN_RESULT_SUM_send_date_IDX` (`send_date`,`userid`,`depart`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='카카오 발송 결과 요약';

-- KT크로샷 MMS (LMS) 발송용 KT_MMS 테이블

CREATE TABLE `KT_MMS` (
  `userid` varchar(20) NOT NULL COMMENT 'DHN 유저 ID',
  `msgid` varchar(32) NOT NULL COMMENT '메세지ID',
  `MessageSubType` varchar(1) NOT NULL COMMENT '메세지타입',
  `CallbackNumber` varchar(20) NOT NULL COMMENT '회신번호',
  `SendNumber` varchar(20) DEFAULT NULL COMMENT '발신 과금번호',
  `ReserveType` varchar(1) DEFAULT NULL COMMENT '예약 타입(1:즉시, 2:예약)',
  `ReserveTime` varchar(20) DEFAULT NULL COMMENT '예약 시간(즉시 발송 시 사용 안함)',
  `ReserveDTime` varchar(20) DEFAULT NULL COMMENT '예약 만료시간',
  `CustomMessageID` varchar(20) DEFAULT NULL COMMENT 'SP Client에서 지정한 메시지 ID',
  `CDRID` varchar(40) DEFAULT NULL COMMENT '과금지정 ID로 다건발송 ID를 가진 경우 해당컬럼 아이디로 과금하는 기능',
  `CDRTime` varchar(20) DEFAULT NULL COMMENT '과금 정산시간',
  `CallbackURL` varchar(300) DEFAULT NULL COMMENT '회신 URL (콜백 URL SMS전송시에만 사용)',
  `ConvertType` varchar(20) DEFAULT NULL COMMENT '변환타입(TTF_CONV:팩스(FMS), TTS_CONV_F:여성음성(VMS), TTS_CONV_M:남성음성(VMS))',
  `KisaOrigCode` varchar(10) DEFAULT NULL COMMENT '규격정보 (SMS,MMS발송시 사용 - 최초발신 사업자코드9자리,중계사업자는 필수기입)',
  `Bundle_Seq` varchar(10) NOT NULL COMMENT 'index 1부터 차례대로 지정',
  `Bundle_Num` varchar(20) NOT NULL COMMENT '수신번호',
  `Bundle_Content` longtext NOT NULL COMMENT '메시지내용',
  `Bundle_Att_AttachID` varchar(10) DEFAULT NULL COMMENT 'index 1부터 차례대로 지정 (MessageSubType이 url일경우 사용)',
  `Bundle_Att_Path` varchar(300) DEFAULT NULL COMMENT '서버에 등록된 경로 (MessageSubType이 url일경우 사용)',
  `Bundle_Subject` varchar(100) DEFAULT NULL COMMENT '제목',
  `Bundle_CallbackURL` varchar(300) DEFAULT NULL COMMENT '회신 URL',
  `Image_path1` text DEFAULT NULL COMMENT '이미지 경로1',
  `Image_path2` text DEFAULT NULL COMMENT '이미지 경로2',
  `Image_path3` text DEFAULT NULL COMMENT '이미지 경로3',
  `resp_JobID` bigint(20) DEFAULT NULL COMMENT '조회 고유 ID',
  `resp_Time` varchar(20) DEFAULT NULL COMMENT '결과전송받은 시각',
  `resp_SubmitTime` varchar(20) DEFAULT NULL COMMENT '서버에서 전송한 시각',
  `resp_Result` varchar(10) DEFAULT NULL COMMENT '결과값',
  `resp_TelconInfo` tinyint(4) DEFAULT NULL,
  `resp_EndUserID` varchar(100) DEFAULT NULL,
  `resp_ServiceProviderID` varchar(100) DEFAULT NULL,
  `sep_seq` tinyint(4) DEFAULT NULL,
  `dhn_id` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`userid`,`msgid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- KT크로샷 SMS 발송용 KT_SMS 테이블

CREATE TABLE `KT_SMS` (
  `userid` varchar(20) NOT NULL COMMENT 'DHN 유저 ID',
  `msgid` varchar(32) NOT NULL COMMENT '메세지ID',
  `MessageSubType` varchar(1) NOT NULL COMMENT '메세지타입',
  `CallbackNumber` varchar(20) NOT NULL COMMENT '회신번호',
  `SendNumber` varchar(20) DEFAULT NULL COMMENT '발신 과금번호',
  `ReserveType` varchar(1) DEFAULT NULL COMMENT '예약 타입(1:즉시, 2:예약)',
  `ReserveTime` varchar(20) DEFAULT NULL COMMENT '예약 시간(즉시 발송 시 사용 안함)',
  `ReserveDTime` varchar(20) DEFAULT NULL COMMENT '예약 만료시간',
  `CustomMessageID` varchar(20) DEFAULT NULL COMMENT 'SP Client에서 지정한 메시지 ID',
  `CDRID` varchar(40) DEFAULT NULL COMMENT '과금지정 ID로 다건발송 ID를 가진 경우 해당컬럼 아이디로 과금하는 기능',
  `CDRTime` varchar(20) DEFAULT NULL COMMENT '과금 정산시간',
  `CallbackURL` varchar(300) DEFAULT NULL COMMENT '회신 URL (콜백 URL SMS전송시에만 사용)',
  `ConvertType` varchar(20) DEFAULT NULL COMMENT '변환타입(TTF_CONV:팩스(FMS), TTS_CONV_F:여성음성(VMS), TTS_CONV_M:남성음성(VMS))',
  `KisaOrigCode` varchar(10) DEFAULT NULL COMMENT '규격정보 (SMS,MMS발송시 사용 - 최초발신 사업자코드9자리,중계사업자는 필수기입)',
  `Bundle_Seq` varchar(10) NOT NULL COMMENT 'index 1부터 차례대로 지정',
  `Bundle_Num` varchar(20) NOT NULL COMMENT '수신번호',
  `Bundle_Content` longtext NOT NULL COMMENT '메시지내용',
  `Bundle_Att_AttachID` varchar(10) DEFAULT NULL COMMENT 'index 1부터 차례대로 지정 (MessageSubType이 url일경우 사용)',
  `Bundle_Att_Path` varchar(300) DEFAULT NULL COMMENT '서버에 등록된 경로 (MessageSubType이 url일경우 사용)',
  `Bundle_Subject` varchar(100) DEFAULT NULL COMMENT '제목',
  `Bundle_CallbackURL` varchar(300) DEFAULT NULL COMMENT '회신 URL',
  `resp_JobID` bigint(20) DEFAULT NULL COMMENT '조회 고유 ID',
  `resp_Time` varchar(20) DEFAULT NULL COMMENT '결과전송받은 시각',
  `resp_SubmitTime` varchar(20) DEFAULT NULL COMMENT '서버에서 전송한 시각',
  `resp_Result` varchar(10) DEFAULT NULL COMMENT '결과값',
  `resp_TelconInfo` tinyint(4) DEFAULT NULL,
  `resp_EndUserID` varchar(100) DEFAULT NULL,
  `resp_ServiceProviderID` varchar(100) DEFAULT NULL,
  `sep_seq` tinyint(4) DEFAULT NULL,
  `dhn_id` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`userid`,`msgid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- LG MMS (LMS) 발송용 LG_MMS_MSG 테이블

CREATE TABLE `LG_MMS_MSG` (
  `MSGKEY` int(11) NOT NULL AUTO_INCREMENT,
  `SUBJECT` varchar(120) DEFAULT NULL,
  `PHONE` varchar(15) NOT NULL,
  `CALLBACK` varchar(15) NOT NULL,
  `STATUS` varchar(2) NOT NULL DEFAULT '0',
  `REQDATE` datetime NOT NULL,
  `MSG` varchar(4000) DEFAULT NULL,
  `FILE_CNT` int(5) NOT NULL DEFAULT 0,
  `FILE_CNT_REAL` int(5) DEFAULT NULL,
  `FILE_PATH1` varchar(512) DEFAULT NULL,
  `FILE_PATH1_SIZ` int(10) DEFAULT NULL,
  `FILE_PATH2` varchar(512) DEFAULT NULL,
  `FILE_PATH2_SIZ` int(10) DEFAULT NULL,
  `FILE_PATH3` varchar(512) DEFAULT NULL,
  `FILE_PATH3_SIZ` int(10) DEFAULT NULL,
  `FILE_PATH4` varchar(512) DEFAULT NULL,
  `FILE_PATH4_SIZ` int(10) DEFAULT NULL,
  `FILE_PATH5` varchar(512) DEFAULT NULL,
  `FILE_PATH5_SIZ` int(10) DEFAULT NULL,
  `EXPIRETIME` varchar(10) NOT NULL DEFAULT '43200',
  `SENTDATE` datetime DEFAULT NULL,
  `RSLTDATE` datetime DEFAULT NULL,
  `REPORTDATE` datetime DEFAULT NULL,
  `TERMINATEDDATE` datetime DEFAULT NULL,
  `RSLT` varchar(4) DEFAULT NULL,
  `TYPE` varchar(2) NOT NULL DEFAULT '0',
  `TELCOINFO` varchar(10) DEFAULT NULL,
  `ROUTE_ID` varchar(20) DEFAULT NULL,
  `ID` varchar(20) DEFAULT NULL,
  `POST` varchar(20) DEFAULT NULL,
  `ETC1` varchar(64) DEFAULT NULL,
  `ETC2` varchar(32) DEFAULT NULL,
  `ETC3` varchar(32) DEFAULT NULL,
  `ETC4` int(10) DEFAULT NULL,
  `MULTI_SEQ` varchar(10) DEFAULT NULL,
  `KISA_ORIGCODE` varchar(10) DEFAULT NULL,
  `REAL_ID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`MSGKEY`),
  KEY `LG_MMS_MSG_IDX2` (`STATUS`,`REQDATE`),
  KEY `LG_MMS_MSG_IDX3` (`PHONE`),
  KEY `LG_MMS_MSG_IDX4` (`REQDATE`,`RSLT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- LG SMS 발송용 LG_SC_TRAN 테이블

CREATE TABLE `LG_SC_TRAN` (
  `TR_NUM` int(11) NOT NULL AUTO_INCREMENT,
  `TR_SENDDATE` datetime DEFAULT NULL,
  `TR_ID` varchar(16) DEFAULT NULL,
  `TR_SENDSTAT` varchar(1) NOT NULL DEFAULT '0',
  `TR_RSLTSTAT` varchar(2) DEFAULT '00',
  `TR_MSGTYPE` varchar(1) NOT NULL DEFAULT '0',
  `TR_PHONE` varchar(20) NOT NULL DEFAULT '',
  `TR_CALLBACK` varchar(20) NOT NULL DEFAULT '',
  `TR_RSLTDATE` datetime DEFAULT NULL,
  `TR_MODIFIED` datetime DEFAULT NULL,
  `TR_MSG` varchar(160) DEFAULT NULL,
  `TR_NET` varchar(4) DEFAULT NULL,
  `TR_ETC1` varchar(160) DEFAULT NULL,
  `TR_ETC2` varchar(160) DEFAULT NULL,
  `TR_ETC3` varchar(160) DEFAULT NULL,
  `TR_ETC4` varchar(160) DEFAULT NULL,
  `TR_ETC5` varchar(160) DEFAULT NULL,
  `TR_ETC6` varchar(160) DEFAULT NULL,
  `TR_ROUTEID` varchar(20) DEFAULT NULL,
  `TR_REALSENDDATE` datetime DEFAULT NULL,
  `TR_KISAORIGCODE` varchar(10) DEFAULT NULL,
  `TR_REALID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`TR_NUM`),
  KEY `LG_SC_TRAN_IDX1` (`TR_SENDSTAT`,`TR_SENDDATE`),
  KEY `LG_SC_TRAN_IDX2` (`TR_PHONE`),
  KEY `LG_SC_TRAN_IDX3` (`TR_SENDDATE`,`TR_RSLTSTAT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- NANO SMS 발송용 SMS_MSG 테이블

CREATE TABLE `SMS_MSG` (
  `TR_NUM` bigint(20) NOT NULL AUTO_INCREMENT,
  `TR_SENDDATE` datetime DEFAULT NULL,
  `TR_SERIALNUM` int(11) DEFAULT NULL,
  `TR_ID` varchar(16) DEFAULT NULL,
  `TR_SENDSTAT` varchar(1) NOT NULL DEFAULT '0',
  `TR_RSLTSTAT` varchar(10) DEFAULT NULL,
  `TR_MSGTYPE` varchar(1) NOT NULL DEFAULT '0',
  `TR_PHONE` varchar(20) NOT NULL,
  `TR_CALLBACK` varchar(20) NOT NULL,
  `TR_ORG_CALLBACK` varchar(20) DEFAULT NULL,
  `TR_BILL_ID` varchar(20) DEFAULT NULL,
  `TR_RSLTDATE` datetime DEFAULT NULL,
  `TR_MODIFIED` datetime DEFAULT NULL,
  `TR_MSG` varchar(160) DEFAULT NULL,
  `TR_NET` varchar(4) DEFAULT NULL,
  `TR_IDENTIFICATION_CODE` varchar(32) DEFAULT NULL,
  `TR_ETC1` varchar(34) DEFAULT NULL,
  `TR_ETC2` varchar(34) DEFAULT NULL,
  `TR_ETC3` varchar(34) DEFAULT NULL,
  `TR_ETC4` varchar(34) DEFAULT NULL,
  `TR_ETC5` varchar(34) DEFAULT NULL,
  `TR_ETC6` varchar(34) DEFAULT NULL,
  `TR_ETC7` varchar(34) DEFAULT NULL,
  `TR_ETC8` varchar(34) DEFAULT NULL,
  `TR_ETC9` varchar(34) DEFAULT NULL,
  `TR_ETC10` varchar(34) DEFAULT NULL,
  `TR_REALSENDDATE` datetime DEFAULT NULL,
  PRIMARY KEY (`TR_NUM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- NANO SMS 로그용 SMS_LOG 테이블

CREATE TABLE `SMS_LOG` (
  `TR_NUM` bigint(20) NOT NULL AUTO_INCREMENT,
  `TR_SENDDATE` datetime DEFAULT NULL,
  `TR_SERIALNUM` int(11) DEFAULT NULL,
  `TR_ID` varchar(16) DEFAULT NULL,
  `TR_SENDSTAT` varchar(1) NOT NULL DEFAULT '0',
  `TR_RSLTSTAT` varchar(10) DEFAULT NULL,
  `TR_MSGTYPE` varchar(1) NOT NULL DEFAULT '0',
  `TR_PHONE` varchar(20) NOT NULL,
  `TR_CALLBACK` varchar(20) NOT NULL,
  `TR_ORG_CALLBACK` varchar(20) DEFAULT NULL,
  `TR_BILL_ID` varchar(20) DEFAULT NULL,
  `TR_RSLTDATE` datetime DEFAULT NULL,
  `TR_MODIFIED` datetime DEFAULT NULL,
  `TR_MSG` varchar(160) DEFAULT NULL,
  `TR_NET` varchar(4) DEFAULT NULL,
  `TR_IDENTIFICATION_CODE` varchar(32) DEFAULT NULL,
  `TR_ETC1` varchar(34) DEFAULT NULL,
  `TR_ETC2` varchar(34) DEFAULT NULL,
  `TR_ETC3` varchar(34) DEFAULT NULL,
  `TR_ETC4` varchar(34) DEFAULT NULL,
  `TR_ETC5` varchar(34) DEFAULT NULL,
  `TR_ETC6` varchar(34) DEFAULT NULL,
  `TR_ETC7` varchar(34) DEFAULT NULL,
  `TR_ETC8` varchar(34) DEFAULT NULL,
  `TR_ETC9` varchar(34) DEFAULT NULL,
  `TR_ETC10` varchar(34) DEFAULT NULL,
  `TR_REALSENDDATE` datetime DEFAULT NULL,
  PRIMARY KEY (`TR_NUM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- NANO MMS (LMS) 발송용 MMS_MSG 테이블
CREATE TABLE `MMS_MSG` (
  `MSGKEY` bigint(20) NOT NULL AUTO_INCREMENT,
  `SUBJECT` varchar(120) DEFAULT NULL,
  `PHONE` varchar(64) NOT NULL,
  `CALLBACK` varchar(64) NOT NULL,
  `ORG_CALLBACK` varchar(64) DEFAULT '',
  `BILL_ID` varchar(20) DEFAULT '',
  `STATUS` varchar(2) NOT NULL DEFAULT '0',
  `REQDATE` datetime NOT NULL,
  `MSG` varchar(4000) DEFAULT NULL,
  `FILE_CNT` int(10) DEFAULT 0,
  `FILE_CNT_REAL` int(10) DEFAULT 0,
  `FILE_PATH1` varchar(128) DEFAULT NULL,
  `FILE_PATH1_SIZ` int(10) DEFAULT NULL,
  `FILE_PATH2` varchar(128) DEFAULT NULL,
  `FILE_PATH2_SIZ` int(10) DEFAULT NULL,
  `FILE_PATH3` varchar(128) DEFAULT NULL,
  `FILE_PATH3_SIZ` int(10) DEFAULT NULL,
  `FILE_PATH4` varchar(128) DEFAULT NULL,
  `FILE_PATH4_SIZ` int(10) DEFAULT NULL,
  `FILE_PATH5` varchar(128) DEFAULT NULL,
  `FILE_PATH5_SIZ` int(10) DEFAULT NULL,
  `EXPIRETIME` varchar(10) DEFAULT NULL,
  `SENTDATE` datetime DEFAULT NULL,
  `RSLTDATE` datetime DEFAULT NULL,
  `REPORTDATE` datetime DEFAULT NULL,
  `TERMINATEDDATE` datetime DEFAULT NULL,
  `RSLT` varchar(10) DEFAULT NULL,
  `REPCNT` int(10) DEFAULT NULL,
  `TYPE` varchar(2) DEFAULT '0',
  `TELCOINFO` varchar(12) DEFAULT NULL,
  `ID` varchar(32) DEFAULT NULL,
  `POST` varchar(22) DEFAULT NULL,
  `IDENTIFICATION_CODE` varchar(32) DEFAULT NULL,
  `ETC1` varchar(68) DEFAULT NULL,
  `ETC2` varchar(34) DEFAULT NULL,
  `ETC3` varchar(34) DEFAULT NULL,
  `ETC4` int(10) DEFAULT NULL,
  `ETC5` varchar(34) DEFAULT NULL,
  `ETC6` varchar(34) DEFAULT NULL,
  `ETC7` varchar(34) DEFAULT NULL,
  `ETC8` varchar(34) DEFAULT NULL,
  `ETC9` varchar(34) DEFAULT NULL,
  `ETC10` varchar(34) DEFAULT NULL,
  PRIMARY KEY (`MSGKEY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- NANO MMS (LMS) 로그용 MMS_LOG 테이블

CREATE TABLE `MMS_LOG` (
  `MSGKEY` bigint(20) NOT NULL,
  `SUBJECT` varchar(120) DEFAULT NULL,
  `PHONE` varchar(64) NOT NULL,
  `CALLBACK` varchar(64) NOT NULL,
  `ORG_CALLBACK` varchar(64) DEFAULT '',
  `BILL_ID` varchar(20) DEFAULT '',
  `STATUS` varchar(2) NOT NULL DEFAULT '0',
  `REQDATE` datetime NOT NULL,
  `MSG` varchar(4000) DEFAULT NULL,
  `FILE_CNT` int(10) DEFAULT 0,
  `FILE_CNT_REAL` int(10) DEFAULT 0,
  `FILE_PATH1` varchar(128) DEFAULT NULL,
  `FILE_PATH1_SIZ` int(10) DEFAULT NULL,
  `FILE_PATH2` varchar(128) DEFAULT NULL,
  `FILE_PATH2_SIZ` int(10) DEFAULT NULL,
  `FILE_PATH3` varchar(128) DEFAULT NULL,
  `FILE_PATH3_SIZ` int(10) DEFAULT NULL,
  `FILE_PATH4` varchar(128) DEFAULT NULL,
  `FILE_PATH4_SIZ` int(10) DEFAULT NULL,
  `FILE_PATH5` varchar(128) DEFAULT NULL,
  `FILE_PATH5_SIZ` int(10) DEFAULT NULL,
  `EXPIRETIME` varchar(10) DEFAULT NULL,
  `SENTDATE` datetime DEFAULT NULL,
  `RSLTDATE` datetime DEFAULT NULL,
  `REPORTDATE` datetime DEFAULT NULL,
  `TERMINATEDDATE` datetime DEFAULT NULL,
  `RSLT` varchar(10) DEFAULT NULL,
  `REPCNT` int(10) DEFAULT NULL,
  `TYPE` varchar(2) DEFAULT '0',
  `TELCOINFO` varchar(12) DEFAULT NULL,
  `ID` varchar(32) DEFAULT NULL,
  `POST` varchar(22) DEFAULT NULL,
  `IDENTIFICATION_CODE` varchar(32) DEFAULT NULL,
  `ETC1` varchar(68) DEFAULT NULL,
  `ETC2` varchar(34) DEFAULT NULL,
  `ETC3` varchar(34) DEFAULT NULL,
  `ETC4` int(10) DEFAULT NULL,
  `ETC5` varchar(34) DEFAULT NULL,
  `ETC6` varchar(34) DEFAULT NULL,
  `ETC7` varchar(34) DEFAULT NULL,
  `ETC8` varchar(34) DEFAULT NULL,
  `ETC9` varchar(34) DEFAULT NULL,
  `ETC10` varchar(34) DEFAULT NULL,
  KEY `MMS_LOG_202402_IDX1` (`MSGKEY`),
  KEY `MMS_LOG_202402_IDX2` (`MSGKEY`,`REQDATE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- LG OTP SMS 발송용 LG_OTP_SC_TRAN 테이블

CREATE TABLE `LG_OTP_SC_TRAN` (
  `TR_NUM` int(11) NOT NULL AUTO_INCREMENT,
  `TR_SENDDATE` datetime DEFAULT NULL,
  `TR_ID` varchar(16) DEFAULT NULL,
  `TR_SENDSTAT` varchar(1) NOT NULL DEFAULT '0',
  `TR_RSLTSTAT` varchar(2) DEFAULT '00',
  `TR_MSGTYPE` varchar(1) NOT NULL DEFAULT '0',
  `TR_PHONE` varchar(20) NOT NULL DEFAULT '',
  `TR_CALLBACK` varchar(20) NOT NULL DEFAULT '',
  `TR_RSLTDATE` datetime DEFAULT NULL,
  `TR_MODIFIED` datetime DEFAULT NULL,
  `TR_MSG` varchar(160) DEFAULT NULL,
  `TR_NET` varchar(4) DEFAULT NULL,
  `TR_ETC1` varchar(160) DEFAULT NULL,
  `TR_ETC2` varchar(160) DEFAULT NULL,
  `TR_ETC3` varchar(160) DEFAULT NULL,
  `TR_ETC4` varchar(160) DEFAULT NULL,
  `TR_ETC5` varchar(160) DEFAULT NULL,
  `TR_ETC6` varchar(160) DEFAULT NULL,
  `TR_ROUTEID` varchar(20) DEFAULT NULL,
  `TR_REALSENDDATE` datetime DEFAULT NULL,
  `TR_KISAORIGCODE` varchar(10) DEFAULT NULL,
  `TR_REALID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`TR_NUM`),
  KEY `LG_OTP_SC_TRAN_IDX1` (`TR_SENDSTAT`,`TR_SENDDATE`),
  KEY `LG_OTP_SC_TRAN_IDX2` (`TR_PHONE`),
  KEY `LG_OTP_SC_TRAN_IDX3` (`TR_SENDDATE`,`TR_RSLTSTAT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- LG OTP MMS (LMS) 발송용 LG_OTP_MMS_MSG 테이블

CREATE TABLE `LG_OTP_MMS_MSG` (
  `MSGKEY` int(11) NOT NULL AUTO_INCREMENT,
  `SUBJECT` varchar(120) DEFAULT NULL,
  `PHONE` varchar(15) NOT NULL,
  `CALLBACK` varchar(15) NOT NULL,
  `STATUS` varchar(2) NOT NULL DEFAULT '0',
  `REQDATE` datetime NOT NULL,
  `MSG` varchar(4000) DEFAULT NULL,
  `FILE_CNT` int(5) NOT NULL DEFAULT 0,
  `FILE_CNT_REAL` int(5) DEFAULT NULL,
  `FILE_PATH1` varchar(512) DEFAULT NULL,
  `FILE_PATH1_SIZ` int(10) DEFAULT NULL,
  `FILE_PATH2` varchar(512) DEFAULT NULL,
  `FILE_PATH2_SIZ` int(10) DEFAULT NULL,
  `FILE_PATH3` varchar(512) DEFAULT NULL,
  `FILE_PATH3_SIZ` int(10) DEFAULT NULL,
  `FILE_PATH4` varchar(512) DEFAULT NULL,
  `FILE_PATH4_SIZ` int(10) DEFAULT NULL,
  `FILE_PATH5` varchar(512) DEFAULT NULL,
  `FILE_PATH5_SIZ` int(10) DEFAULT NULL,
  `EXPIRETIME` varchar(10) NOT NULL DEFAULT '43200',
  `SENTDATE` datetime DEFAULT NULL,
  `RSLTDATE` datetime DEFAULT NULL,
  `REPORTDATE` datetime DEFAULT NULL,
  `TERMINATEDDATE` datetime DEFAULT NULL,
  `RSLT` varchar(4) DEFAULT NULL,
  `TYPE` varchar(2) NOT NULL DEFAULT '0',
  `TELCOINFO` varchar(10) DEFAULT NULL,
  `ROUTE_ID` varchar(20) DEFAULT NULL,
  `ID` varchar(20) DEFAULT NULL,
  `POST` varchar(20) DEFAULT NULL,
  `ETC1` varchar(64) DEFAULT NULL,
  `ETC2` varchar(32) DEFAULT NULL,
  `ETC3` varchar(32) DEFAULT NULL,
  `ETC4` int(10) DEFAULT NULL,
  `MULTI_SEQ` varchar(10) DEFAULT NULL,
  `KISA_ORIGCODE` varchar(10) DEFAULT NULL,
  `REAL_ID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`MSGKEY`),
  KEY `LG_OTP_MMS_MSG_IDX2` (`STATUS`,`REQDATE`),
  KEY `LG_OTP_MMS_MSG_IDX3` (`PHONE`),
  KEY `LG_OTP_MMS_MSG_IDX4` (`REQDATE`,`RSLT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- NANO OTP SMS 발송용 OTP_SMS_MSG 테이블

CREATE TABLE `OTP_SMS_MSG` (
  `TR_NUM` bigint(20) NOT NULL AUTO_INCREMENT,
  `TR_SENDDATE` datetime DEFAULT NULL,
  `TR_SERIALNUM` int(10) DEFAULT NULL,
  `TR_ID` varchar(32) DEFAULT NULL,
  `TR_SENDSTAT` varchar(1) NOT NULL DEFAULT '0',
  `TR_RSLTSTAT` varchar(10) DEFAULT '00',
  `TR_MSGTYPE` varchar(1) DEFAULT '0',
  `TR_PHONE` varchar(64) NOT NULL,
  `TR_CALLBACK` varchar(64) NOT NULL DEFAULT '',
  `TR_ORG_CALLBACK` varchar(64) DEFAULT '',
  `TR_BILL_ID` varchar(20) DEFAULT '',
  `TR_RSLTDATE` datetime DEFAULT NULL,
  `TR_MODIFIED` datetime DEFAULT NULL,
  `TR_MSG` varchar(160) DEFAULT NULL,
  `TR_NET` varchar(4) DEFAULT NULL,
  `TR_IDENTIFICATION_CODE` varchar(32) DEFAULT NULL,
  `TR_ETC1` varchar(34) DEFAULT NULL,
  `TR_ETC2` varchar(34) DEFAULT NULL,
  `TR_ETC3` varchar(34) DEFAULT NULL,
  `TR_ETC4` varchar(34) DEFAULT NULL,
  `TR_ETC5` varchar(34) DEFAULT NULL,
  `TR_ETC6` varchar(34) DEFAULT NULL,
  `TR_ETC7` varchar(34) DEFAULT NULL,
  `TR_ETC8` varchar(34) DEFAULT NULL,
  `TR_ETC9` varchar(34) DEFAULT NULL,
  `TR_ETC10` varchar(34) DEFAULT NULL,
  `TR_REALSENDDATE` datetime DEFAULT NULL,
  PRIMARY KEY (`TR_NUM`),
  KEY `OTP_SMS_MSG_IDX1` (`TR_SENDSTAT`,`TR_SENDDATE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- NANO OTP SMS 로그용 OTP_SMS_LOG 테이블

CREATE TABLE `OTP_SMS_LOG` (
  `TR_NUM` bigint(20) NOT NULL AUTO_INCREMENT,
  `TR_SENDDATE` datetime DEFAULT NULL,
  `TR_SERIALNUM` int(11) DEFAULT NULL,
  `TR_ID` varchar(16) DEFAULT NULL,
  `TR_SENDSTAT` varchar(1) NOT NULL DEFAULT '0',
  `TR_RSLTSTAT` varchar(10) DEFAULT NULL,
  `TR_MSGTYPE` varchar(1) NOT NULL DEFAULT '0',
  `TR_PHONE` varchar(20) NOT NULL,
  `TR_CALLBACK` varchar(20) NOT NULL,
  `TR_ORG_CALLBACK` varchar(20) DEFAULT NULL,
  `TR_BILL_ID` varchar(20) DEFAULT NULL,
  `TR_RSLTDATE` datetime DEFAULT NULL,
  `TR_MODIFIED` datetime DEFAULT NULL,
  `TR_MSG` varchar(160) DEFAULT NULL,
  `TR_NET` varchar(4) DEFAULT NULL,
  `TR_IDENTIFICATION_CODE` varchar(32) DEFAULT NULL,
  `TR_ETC1` varchar(34) DEFAULT NULL,
  `TR_ETC2` varchar(34) DEFAULT NULL,
  `TR_ETC3` varchar(34) DEFAULT NULL,
  `TR_ETC4` varchar(34) DEFAULT NULL,
  `TR_ETC5` varchar(34) DEFAULT NULL,
  `TR_ETC6` varchar(34) DEFAULT NULL,
  `TR_ETC7` varchar(34) DEFAULT NULL,
  `TR_ETC8` varchar(34) DEFAULT NULL,
  `TR_ETC9` varchar(34) DEFAULT NULL,
  `TR_ETC10` varchar(34) DEFAULT NULL,
  `TR_REALSENDDATE` datetime DEFAULT NULL,
  PRIMARY KEY (`TR_NUM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- NANO OTP MMS (LMS) 발송용 OTP_MMS_MSG 테이블

CREATE TABLE `OTP_MMS_MSG` (
  `MSGKEY` bigint(20) NOT NULL AUTO_INCREMENT,
  `SUBJECT` varchar(120) DEFAULT NULL,
  `PHONE` varchar(64) NOT NULL,
  `CALLBACK` varchar(64) NOT NULL,
  `ORG_CALLBACK` varchar(64) DEFAULT '',
  `BILL_ID` varchar(20) DEFAULT '',
  `STATUS` varchar(2) NOT NULL DEFAULT '0',
  `REQDATE` datetime NOT NULL,
  `MSG` varchar(4000) DEFAULT NULL,
  `FILE_CNT` int(10) DEFAULT 0,
  `FILE_CNT_REAL` int(10) DEFAULT 0,
  `FILE_PATH1` varchar(128) DEFAULT NULL,
  `FILE_PATH1_SIZ` int(10) DEFAULT NULL,
  `FILE_PATH2` varchar(128) DEFAULT NULL,
  `FILE_PATH2_SIZ` int(10) DEFAULT NULL,
  `FILE_PATH3` varchar(128) DEFAULT NULL,
  `FILE_PATH3_SIZ` int(10) DEFAULT NULL,
  `FILE_PATH4` varchar(128) DEFAULT NULL,
  `FILE_PATH4_SIZ` int(10) DEFAULT NULL,
  `FILE_PATH5` varchar(128) DEFAULT NULL,
  `FILE_PATH5_SIZ` int(10) DEFAULT NULL,
  `EXPIRETIME` varchar(10) DEFAULT NULL,
  `SENTDATE` datetime DEFAULT NULL,
  `RSLTDATE` datetime DEFAULT NULL,
  `REPORTDATE` datetime DEFAULT NULL,
  `TERMINATEDDATE` datetime DEFAULT NULL,
  `RSLT` varchar(10) DEFAULT NULL,
  `REPCNT` int(10) DEFAULT NULL,
  `TYPE` varchar(2) DEFAULT '0',
  `TELCOINFO` varchar(12) DEFAULT NULL,
  `ID` varchar(32) DEFAULT NULL,
  `POST` varchar(22) DEFAULT NULL,
  `IDENTIFICATION_CODE` varchar(32) DEFAULT NULL,
  `ETC1` varchar(68) DEFAULT NULL,
  `ETC2` varchar(34) DEFAULT NULL,
  `ETC3` varchar(34) DEFAULT NULL,
  `ETC4` int(10) DEFAULT NULL,
  `ETC5` varchar(34) DEFAULT NULL,
  `ETC6` varchar(34) DEFAULT NULL,
  `ETC7` varchar(34) DEFAULT NULL,
  `ETC8` varchar(34) DEFAULT NULL,
  `ETC9` varchar(34) DEFAULT NULL,
  `ETC10` varchar(34) DEFAULT NULL,
  PRIMARY KEY (`MSGKEY`),
  KEY `OTP_MMS_MSG_IDX1` (`STATUS`,`REQDATE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- NANO OTP MMS (LMS) 로그용 OTP_MMS_LOG 테이블

CREATE TABLE `OTP_MMS_LOG` (
  `MSGKEY` bigint(20) NOT NULL,
  `SUBJECT` varchar(120) DEFAULT NULL,
  `PHONE` varchar(64) NOT NULL,
  `CALLBACK` varchar(64) NOT NULL,
  `ORG_CALLBACK` varchar(64) DEFAULT '',
  `BILL_ID` varchar(20) DEFAULT '',
  `STATUS` varchar(2) NOT NULL DEFAULT '0',
  `REQDATE` datetime NOT NULL,
  `MSG` varchar(4000) DEFAULT NULL,
  `FILE_CNT` int(10) DEFAULT 0,
  `FILE_CNT_REAL` int(10) DEFAULT 0,
  `FILE_PATH1` varchar(128) DEFAULT NULL,
  `FILE_PATH1_SIZ` int(10) DEFAULT NULL,
  `FILE_PATH2` varchar(128) DEFAULT NULL,
  `FILE_PATH2_SIZ` int(10) DEFAULT NULL,
  `FILE_PATH3` varchar(128) DEFAULT NULL,
  `FILE_PATH3_SIZ` int(10) DEFAULT NULL,
  `FILE_PATH4` varchar(128) DEFAULT NULL,
  `FILE_PATH4_SIZ` int(10) DEFAULT NULL,
  `FILE_PATH5` varchar(128) DEFAULT NULL,
  `FILE_PATH5_SIZ` int(10) DEFAULT NULL,
  `EXPIRETIME` varchar(10) DEFAULT NULL,
  `SENTDATE` datetime DEFAULT NULL,
  `RSLTDATE` datetime DEFAULT NULL,
  `REPORTDATE` datetime DEFAULT NULL,
  `TERMINATEDDATE` datetime DEFAULT NULL,
  `RSLT` varchar(10) DEFAULT NULL,
  `REPCNT` int(10) DEFAULT NULL,
  `TYPE` varchar(2) DEFAULT '0',
  `TELCOINFO` varchar(12) DEFAULT NULL,
  `ID` varchar(32) DEFAULT NULL,
  `POST` varchar(22) DEFAULT NULL,
  `IDENTIFICATION_CODE` varchar(32) DEFAULT NULL,
  `ETC1` varchar(68) DEFAULT NULL,
  `ETC2` varchar(34) DEFAULT NULL,
  `ETC3` varchar(34) DEFAULT NULL,
  `ETC4` int(10) DEFAULT NULL,
  `ETC5` varchar(34) DEFAULT NULL,
  `ETC6` varchar(34) DEFAULT NULL,
  `ETC7` varchar(34) DEFAULT NULL,
  `ETC8` varchar(34) DEFAULT NULL,
  `ETC9` varchar(34) DEFAULT NULL,
  `ETC10` varchar(34) DEFAULT NULL,
  KEY `MMS_LOG_202402_IDX1` (`MSGKEY`),
  KEY `MMS_LOG_202402_IDX2` (`MSGKEY`,`REQDATE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- MMS발송용 이미지용 api_mms_images 테이블

CREATE TABLE `api_mms_images` (
  `user_id` varchar(100) DEFAULT NULL,
  `mms_id` varchar(100) DEFAULT NULL,
  `origin1_path` text DEFAULT NULL,
  `origin2_path` text DEFAULT NULL,
  `origin3_path` text DEFAULT NULL,
  `file1_path` text DEFAULT NULL,
  `file2_path` text DEFAULT NULL,
  `file3_path` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 불필요 문자 제거? 용 SPECIAL_CHARACTER 테이블

CREATE TABLE `SPECIAL_CHARACTER` (
  `orgin_hex_code` varchar(100) DEFAULT NULL,
  `dest_str` varchar(100) DEFAULT NULL,
  `enabled` varchar(1) NOT NULL DEFAULT 'Y',
  UNIQUE KEY `SPECIAL_CHARACTER_orgin_hex_code_IDX` (`orgin_hex_code`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 문자체크 insert문

INSERT INTO SPECIAL_CHARACTER
(orgin_hex_code, dest_str, enabled)
VALUES('C2A0', NULL, 'Y'),('E280A8', NULL, 'Y'),('E280A4', '·', 'Y'),('E29E9F', '→', 'Y'),('E29C94', '√', 'Y'),('E280A3', '·', 'Y'),('EFBBBF', NULL, 'Y');
