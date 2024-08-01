-- dhn_result_back_proc 프로시저

CREATE DEFINER=`root`@`%` PROCEDURE `dhn_result_back_proc`(p_interval int)
BEGIN
    declare v_userid varchar(20);
    DECLARE v_ul_done INT DEFAULT FALSE;

    declare user_list cursor for
            select distinct user_id from DHN_CLIENT_LIST dcl where dcl.use_flag  = 'Y';

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_ul_done = TRUE;

	set @v_table_name = CONCAT( 'create table if not exists ', 'DHN_RESULT_' , DATE_FORMAT(now(), '%Y%m'), ' like DHN_RESULT')  ;
	
	prepare stmt from @v_table_name;
	execute stmt;
	deallocate prepare stmt;

    open user_list;
	ul_loop: 
	LOOP
        fetch user_list into v_userid;
        if v_ul_done then 
                close user_list;
                leave ul_loop;
        end if;

		set @insert_query = CONCAT( 'insert ignore into DHN_RESULT_BK_TEMP select * from DHN_RESULT_PROC where reg_dt <= DATE_FORMAT( date_sub( now(), INTERVAL  ',p_interval,' day), ''%Y-%m-%d %T'') and userid =''', v_userid, '''' )  ;
		
		prepare stmt from @insert_query;
		execute stmt;
		deallocate prepare stmt;
	
		INS_BLOCK:
		begin
			declare v_ins_done int Default false;
			declare v_reg_dt varchar(20);
			declare v_tbl_dt varchar(20);
		
			declare c_ins_list_dt cursor for
  				select distinct concat(LAST_DAY(SUBSTR(reg_dt, 1,10)), ' 23:59:59') as reg_dt, concat (SUBSTR(reg_dt, 1,4),SUBSTR(reg_dt, 6,2)) as tbl_dt from DHN_RESULT_BK_TEMP where sync = 'Y' order by 1;

  			DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_ins_done = TRUE;
  		
  			open c_ins_list_dt;
  			ins_loop:
  			loop
  				fetch c_ins_list_dt into v_reg_dt
  				                        ,v_tbl_dt;
  				if v_ins_done then
  					close c_ins_list_dt;
  				    leave ins_loop;
  				end if;
			
  			    set @ins_query = CONCAT('insert ignore into ', 'DHN_RESULT_', v_tbl_dt, ' select * from DHN_RESULT_BK_TEMP where userid = ''', v_userid , ''' and reg_dt <= ''', v_reg_dt, ''' and sync = ''Y''');
				prepare stmt from @ins_query;
				execute stmt;
				deallocate prepare stmt;	
			
				set @ud_query = CONCAT('update DHN_RESULT_BK_TEMP set sync=''C'' where userid = ''', v_userid , ''' and reg_dt <= ''', v_reg_dt, ''' and sync = ''Y''');
				prepare stmt from @ud_query;
				execute stmt;
				deallocate prepare stmt;	
			
  			end loop ins_loop;
  			
		end INS_BLOCK;
	
        PROC_BLOCK:
		begin
			DECLARE v_res_done INT DEFAULT FALSE;
			declare v_userid varchar(20);
			declare v_msgid  varchar(20);
			declare v_reg_dt varchar(20);

			declare c_result_list cursor for
				select userid, msgid , concat (SUBSTR(reg_dt, 1,4),SUBSTR(reg_dt, 6,2)) as reg_dt from DHN_RESULT_BK_TEMP where sync = 'Y';
			
			DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_res_done = TRUE;
			
			open c_result_list;
			rl_loop: 
			Loop
				fetch c_result_list into v_userid 
		  								,v_msgid 
										,v_reg_dt;
					if v_res_done then 
						close c_result_list;
						leave rl_loop;
					end if;
			
				delete from DHN_RESULT_PROC where userid = v_userid and msgid = v_msgid;
	
				delete from DHN_RESULT where userid = v_userid and msgid = v_msgid;
	
			END LOOP rl_loop;
		
			truncate table DHN_RESULT_BK_TEMP;
		end PROC_BLOCK;
	END LOOP ul_loop;
END;

-- 불필요문자제거? remove_ws 프로시저

CREATE DEFINER=`root`@`%` FUNCTION `remove_ws`(P_MSG LONGTEXT CHARACTER set utf8) RETURNS longtext CHARSET utf8
BEGIN
	declare v_msg LONGTEXT  CHARACTER set utf8;
	declare v_ohc varchar(20);
	declare v_ds  varchar(10) CHARACTER set utf8;
	DECLARE v_done INT DEFAULT FALSE;

	declare sc cursor for
	  select orgin_hex_code
	        ,dest_str
	    from kakao.SPECIAL_CHARACTER sc 
	   where enabled  = 'Y';

  	DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_done = TRUE;

	set v_msg = p_msg;  


	open sc;
	sc_loop: LOOP
		fetch sc
		  into v_ohc
		      ,v_ds;
		     
		set v_msg = replace(v_msg, unhex(v_ohc),ifnull(v_ds,''));
		if v_done then 
			leave sc_loop;
		end if;
	END LOOP;
	
	close sc;

    return v_msg;
END;

-- DHN_RESULT 테이블 백업용 result_backup 프로시저

CREATE DEFINER=`root`@`%` PROCEDURE `result_backup`()
BEGIN
	declare v_userid varchar(20);
	DECLARE v_ul_done INT DEFAULT FALSE;

	declare user_list cursor for
		select distinct user_id from DHN_CLIENT_LIST dcl where dcl.use_flag  = 'Y';
	
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_ul_done = TRUE;

	open user_list;
	ul_loop: LOOP
		fetch user_list into v_userid;
		if v_ul_done then 
			close user_list;
			leave ul_loop;
		end if;
		
		RES_BLOCK:
		begin
			DECLARE v_res_done INT DEFAULT FALSE;
			DECLARE v_ruserid varchar(20);
			DECLARE v_depart varchar(20);
			DECLARE v_send_date varchar(20);
			DECLARE v_send_cnt int;
			DECLARE v_ats_cnt int;
			DECLARE v_ate_cnt int;
			DECLARE v_fts_cnt int;
			DECLARE v_fte_cnt int;
			DECLARE v_ftis_cnt int;
			DECLARE v_ftie_cnt int;
			DECLARE v_ftws_cnt int;
			DECLARE v_ftwe_cnt int;
			DECLARE v_smss_cnt int;
			DECLARE v_smse_cnt int;
			DECLARE v_mmss_cnt int;
			DECLARE v_mmse_cnt int;
		
			declare res cursor(p_user varchar(20)) for
				select userid
				      ,ifnull(dr.p_invoice, '_') as depart
				      ,count(1) as send_cnt
				      ,substr(dr.reg_dt, 1, 10) as send_date
				      ,sum(case
				             when dr.code = '0000' and dr.message_type in ('at', 'ai') then
				              1
				             else
				              0
				           end) as ats_cnt
				      ,sum(case
				             when dr.code <> '0000' and dr.message_type in ('at', 'ai') then
				              1
				             else
				              0
				           end) as ate_cnt
				      ,sum(case
				             when dr.code = '0000' and dr.message_type = 'ft' and
				                  dr.image_url is null then
				              1
				             else
				              0
				           end) as fts_cnt
				      ,sum(case
				             when dr.code <> '0000' and dr.message_type = 'ft' and
				                  dr.image_url is null then
				              1
				             else
				              0
				           end) as fte_cnt
				      ,sum(case
				             when dr.code = '0000' and dr.message_type = 'ft' and
				                  dr.image_url is not null and dr.wide = 'N' then
				              1
				             else
				              0
				           end) as ftis_cnt
				      ,sum(case
				             when dr.code <> '0000' and dr.message_type = 'ft' and
				                  dr.image_url is not null and dr.wide = 'N' then
				              1
				             else
				              0
				           end) as ftie_cnt
				      ,sum(case
				             when dr.code = '0000' and dr.message_type = 'ft' and dr.wide = 'Y' then
				              1
				             else
				              0
				           end) as ftws_cnt
				      ,sum(case
				             when dr.code <> '0000' and dr.message_type = 'ft' and dr.wide = 'Y' then
				              1
				             else
				              0
				           end) as ftwe_cnt
				      ,sum(case
				             when dr.code = '0000' and dr.message_type = 'ph' and dr.sms_kind = 'S' then
				              1
				             else
				              0
				           end) as smss_cnt
				      ,sum(case
				             when dr.code <> '0000' and dr.message_type = 'ph' and dr.sms_kind = 'S' then
				              1
				             else
				              0
				           end) as smse_cnt
				      ,sum(case
				             when dr.code = '0000' and dr.message_type = 'ph' and dr.sms_kind = 'L' then
				              1
				             else
				              0
				           end) as mmss_cnt
				      ,sum(case
				             when dr.code <> '0000' and dr.message_type = 'ph' and dr.sms_kind = 'L' then
				              1
				             else
				              0
				           end) as mmse_cnt
				  from DHN_RESULT dr
				 where dr.reg_dt < DATE_FORMAT(now(), '%Y-%m-%d') 
				   and userid = p_user
				   and dr.sync  = 'Y'
				 group by userid
				         ,p_invoice
				         ,substr(dr.reg_dt, 1, 10);
		
			DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_res_done = TRUE;
			 			
			open res(v_userid );
			res_loop: 
			Loop
				fetch res into v_ruserid 
							  ,v_depart 
							  ,v_send_cnt
							  ,v_send_date 
							  ,v_ats_cnt
							  ,v_ate_cnt
							  ,v_fts_cnt
							  ,v_fte_cnt
							  ,v_ftis_cnt
							  ,v_ftie_cnt
							  ,v_ftws_cnt
							  ,v_ftwe_cnt
							  ,v_smss_cnt
							  ,v_smse_cnt
							  ,v_mmss_cnt
							  ,v_mmse_cnt;
				if v_res_done then 
					close res;
					leave res_loop;
				end if;
	
				delete from kakao.DHN_RESULT_SUM where send_date = v_send_date and userid = v_ruserid and depart = v_depart;
			
				INSERT INTO kakao.DHN_RESULT_SUM
				(send_date, userid, depart, send_cnt, ats_cnt, ate_cnt, fts_cnt, fte_cnt, ftis_cnt, ftie_cnt, ftws_cnt, ftwe_cnt, smss_cnt, smse_cnt, mmss_cnt, mmse_cnt)
				VALUES(v_send_date, v_ruserid, v_depart,  v_send_cnt, v_ats_cnt, v_ate_cnt, v_fts_cnt, v_fte_cnt, v_ftis_cnt, v_ftie_cnt, v_ftws_cnt, v_ftwe_cnt, v_smss_cnt, v_smse_cnt, v_mmss_cnt, v_mmse_cnt);		
			END LOOP res_loop;
		END RES_BLOCK;
	END LOOP ul_loop;
	

END;
