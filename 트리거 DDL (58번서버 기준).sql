-- DHN_RESULT.result_cp_insert_trg

CREATE DEFINER=`root`@`%` TRIGGER `result_cp_insert_trg` AFTER INSERT ON `DHN_RESULT` FOR EACH ROW begin
	if new.result = 'Y' then
insert IGNORE
	into
	DHN_RESULT_PROC
values
	(
new.msgid,
new.userid,
new.ad_flag,
new.button1,
new.button2,
new.button3,
new.button4,
new.button5,
new.code,
new.image_link,
new.image_url,
new.kind,
new.message,
new.message_type,
new.msg,
new.msg_sms,
new.only_sms,
new.p_com,
new.p_invoice,
new.phn,
new.profile,
new.reg_dt,
new.remark1,
new.remark2,
new.remark3,
new.remark4,
new.remark5,
new.res_dt,
new.reserve_dt,
new.result,
new.s_code,
new.sms_kind,
new.sms_lms_tit,
new.sms_sender,
new.sync,
new.tmpl_id,
new.wide,
new.send_group,
new.supplement,
new.price,
new.currency_type,
new.title,
new.header,
new.carousel
) ;
	end if;
	
end;

-- DHN_RESLT.result_up_update_trg

CREATE DEFINER=`root`@`%` TRIGGER `result_cp_update_trg` AFTER UPDATE ON `DHN_RESULT` FOR EACH ROW BEGIN 
		if new.result = 'Y' then
insert IGNORE
	into
	DHN_RESULT_PROC
values
	(
new.msgid,
new.userid,
new.ad_flag,
new.button1,
new.button2,
new.button3,
new.button4,
new.button5,
new.code,
new.image_link,
new.image_url,
new.kind,
new.message,
new.message_type,
new.msg,
new.msg_sms,
new.only_sms,
new.p_com,
new.p_invoice,
new.phn,
new.profile,
new.reg_dt,
new.remark1,
new.remark2,
new.remark3,
new.remark4,
new.remark5,
new.res_dt,
new.reserve_dt,
new.result,
new.s_code,
new.sms_kind,
new.sms_lms_tit,
new.sms_sender,
new.sync,
new.tmpl_id,
new.wide,
new.send_group,
new.supplement,
new.price,
new.currency_type,
new.title,
new.header,
new.carousel,
) ;
	end if;
END;
