-- SMS 문자

INSERT
	INTO
	kakao.DHN_RESULT
(msgid,
	userid,
	code,
	message_type,
	msg,
	msg_sms,
	p_com,
	phn,
	reg_dt,
	res_dt,
	reserve_dt,
	`result`,
	sms_kind,
	sms_sender,
	sync)
VALUES
('50001',
'dhn208',
'9999',
'PH',
'단문메시지 (SMS) 테스트 입니다.',
'단문메시지 (SMS) 테스트 입니다.',
'D',
'01055537431',
'2024-07-11 11:00:00',
'2024-07-11 11:00:00',
'0000000000000',
'P',
'S',
'15227985',
'N');

-- LMS 문자

INSERT
	INTO
	kakao.DHN_RESULT
(msgid,
	userid,
	code,
	message_type,
	msg,
	msg_sms,
	p_com,
	phn,
	reg_dt,
	res_dt,
	reserve_dt,
	`result`,
	sms_kind,
	sms_lms_tit,
	sms_sender,
	sync)
VALUES
('60001',
'dhn208',
'9999',
'PH',
'장문문자 (LMS) 테스트입니다.
[동화의이해와창작] 안녕하세요. 오늘asd부터 동화의 이해 3차시 강의가 열려서 안내 드립니다. 
3강은 "우리 옛이야기의 이해 (2) - 우리 옛이야기의 일반 성격(민담중심)"이라는 주제로 서정오 교수님께서 강의를 해주십니다. 
아울러 과제물에 어떤 자료를 보고 작성해야 하는지 문의를 주셔서 살펴보니 과제안내 자료에 213쪽번호가 빠져 있어서 혼란스러우셨던 것 같습니다. 
쪽번호를 표시한 자료로 다시 올려드리니 참고해 주시기 바랍니다(과제 참고용 채록은 3쪽부터 제시)',
'장문문자 (LMS) 테스트입니다.
[동화의이해와창작] 안녕하세요. 오늘asd부터 동화의 이해 3차시 강의가 열려서 안내 드립니다. 
3강은 "우리 옛이야기의 이해 (2) - 우리 옛이야기의 일반 성격(민담중심)"이라는 주제로 서정오 교수님께서 강의를 해주십니다. 
아울러 과제물에 어떤 자료를 보고 작성해야 하는지 문의를 주셔서 살펴보니 과제안내 자료에 213쪽번호가 빠져 있어서 혼란스러우셨던 것 같습니다. 
쪽번호를 표시한 자료로 다시 올려드리니 참고해 주시기 바랍니다(과제 참고용 채록은 3쪽부터 제시)',
'D',
'01055537431',
'2024-07-11 11:00:00',
'2024-07-11 11:00:00',
'0000000000000',
'P',
'L',
'[장문문자테스트]',
'15227985',
'N');

-- MMS 문자

INSERT
	INTO
	kakao.DHN_RESULT
(msgid,
	userid,
	code,
	message_type,
	msg,
	msg_sms,
	p_com,
	p_invoice ,
	phn,
	reg_dt,
	res_dt,
	reserve_dt,
	`result`,
	sms_kind,
	sms_lms_tit,
	sms_sender,
	sync)
VALUES
('70001',
'dhn208',
'9999',
'PH',
'이미지문자 (MMS) 테스트입니다.
[동화의이해와창작] 안녕하세요. 오늘asd부터 동화의 이해 3차시 강의가 열려서 안내 드립니다. 
3강은 "우리 옛이야기의 이해 (2) - 우리 옛이야기의 일반 성격(민담중심)"이라는 주제로 서정오 교수님께서 강의를 해주십니다. 
아울러 과제물에 어떤 자료를 보고 작성해야 하는지 문의를 주셔서 살펴보니 과제안내 자료에 213쪽번호가 빠져 있어서 혼란스러우셨던 것 같습니다. 
쪽번호를 표시한 자료로 다시 올려드리니 참고해 주시기 바랍니다(과제 참고용 채록은 3쪽부터 제시)',
'이미지문자 (MMS) 테스트입니다.
[동화의이해와창작] 안녕하세요. 오늘asd부터 동화의 이해 3차시 강의가 열려서 안내 드립니다. 
3강은 "우리 옛이야기의 이해 (2) - 우리 옛이야기의 일반 성격(민담중심)"이라는 주제로 서정오 교수님께서 강의를 해주십니다. 
아울러 과제물에 어떤 자료를 보고 작성해야 하는지 문의를 주셔서 살펴보니 과제안내 자료에 213쪽번호가 빠져 있어서 혼란스러우셨던 것 같습니다. 
쪽번호를 표시한 자료로 다시 올려드리니 참고해 주시기 바랍니다(과제 참고용 채록은 3쪽부터 제시)',
'D',
'111111111111111111',
'01055537431',
'2024-07-11 11:00:00',
'2024-07-11 11:00:00',
'0000000000000',
'P',
'M',
'[이미지문자테스트]',
'15227985',
'N');



-- 알림톡 테이블

INSERT
	INTO
	kakao.DHN_REQUEST_AT
(id,
	msgid,
	userid,
	button1,
	button2,
	button3,
	button4,
	button5,
	message_type,
	msg,
	msg_sms,
	phn,
	profile,
	p_com,
	reg_dt,
	reserve_dt,
	sms_kind,
	sms_lms_tit,
	sms_sender,
	tmpl_id)
VALUES(10001,
'20240712-at-1',
'dhn208',
'{"type":"WL","name":"♥ 확 인 하 기 ♥","url_pc":"http://www.naver.com","url_mobile":"http://www.daum.net"}',
NULL,
NULL,
NULL,
NULL,
'AI',
'
안녕하세요. 대형네트웍스입니다.

회원이용(가입)을 해주셔서 감사합니다.

고객님의 편의를 위해 다양한 소식을 카카오톡 채널을 통해 알려드리겠습니다.


문의번호 : 대형네트웍스',
'
안녕하세요. 대형네트웍스입니다.

회원이용(가입)을 해주셔서 감사합니다.

고객님의 편의를 위해 다양한 소식을 카카오톡 채널을 통해 알려드리겠습니다.


문의번호 : 대형네트웍스
url : http://www.naver.com
',
'821055537431',
'e928cfe1258ede6069fde1b680aa24a25e38e148',
-- '0681d073d38f4124a5a34b2eab602f8a1e0509e9',
'D',
'2024-07-11 11:00:00',
'0000000000000',
'L',
'[알림톡 실패 2차문자]',
'15227985',
'240703_2'
);

-- 친구톡 테이블 (기본)

INSERT
	INTO
	kakao.DHN_REQUEST
(id,
	msgid,
	userid,
	button1,
	button2,
	button3,
	button4,
	button5,
	image_link,
	image_url,
	message_type,
	msg,
	msg_sms,
	phn,
	profile,
	p_com,
	reg_dt,
	reserve_dt)
VALUES(20001,
'20240712-ft-1',
'dhn208',
NULL,
NULL,
NULL,
NULL,
NULL,
NULL,
NULL,
'FT',
'텍스트 친구톡 테스트입니다.
현재 날짜는 2024년 7월 11일
테스트 데이터 삽입 시간은 11시 입니다.',
'텍스트 친구톡 테스트입니다.
현재 날짜는 2024년 7월 11일
테스트 데이터 삽입 시간은 11시 입니다.
실패 2차 문자 발송 입니다.',
'821055537431',
'e928cfe1258ede6069fde1b680aa24a25e38e148',
'D',
'2024-07-11 11:00:00',
'0000000000000'
);

-- 친구톡 테이블 (이미지)

INSERT
	INTO
	kakao.DHN_REQUEST
(id,
	msgid,
	userid,
	button1,
	button2,
	button3,
	button4,
	button5,
	image_link,
	image_url,
	message_type,
	msg,
	msg_sms,
	phn,
	profile,
	p_com,
	reg_dt,
	reserve_dt)
VALUES(30001,
'20240712-ftimg-1',
'dhn208',
'{"type":"WL","name":"★ 보러가기 ★","url_pc":"http://www.naver.com","url_mobile":"http://www.daum.net"}',
NULL,
NULL,
NULL,
NULL,
NULL,
'https://mud-kage.kakao.com/dn/ddABNj/btsIuafykXx/r9vkanTkOJDIsAmq87Ry01/img_l.jpg',
'FT',
'이미지 친구톡 테스트입니다.
현재 날짜는 2024년 7월 11일
테스트 데이터 삽입 시간은 11시 입니다.',
'이미지 친구톡 테스트입니다.
현재 날짜는 2024년 7월 11일
테스트 데이터 삽입 시간은 11시 입니다.
실패 후 2차문자 발송입니다.',
'821055537431',
'e928cfe1258ede6069fde1b680aa24a25e38e148',
'D',
'2024-07-11 11:00:00',
'0000000000000');

-- 친구톡 테이블 (와이드 이미지)

INSERT
	INTO
	kakao.DHN_REQUEST
(id,
	msgid,
	userid,
	button1,
	button2,
	button3,
	button4,
	button5,
	image_link,
	image_url,
	message_type,
	msg,
	msg_sms,
	phn,
	profile,
	p_com,
	reg_dt,
	reserve_dt,
	wide)
VALUES(40001,
'20240712-ftwide-1',
'dhn208',
'{"type":"WL","name":"★ 보러가기 ★","url_pc":"http://www.naver.com","url_mobile":"http://www.daum.net"}',
NULL,
NULL,
NULL,
NULL,
NULL,
'https://mud-kage.kakao.com/dn/gdnsK/btsIwoQBhyG/xDkkKRWInJmXqClk5kSKDk/img_l.jpg',
'FT',
'와이드 이미지 친구톡 테스트입니다.
현재 날짜는 2024년 7월 11일
테스트 데이터 삽입 시간은 11시 입니다.',
'와이드 이미지 친구톡 테스트입니다.
현재 날짜는 2024년 7월 11일
테스트 데이터 삽입 시간은 11시 입니다.
실패 후 2차문자 발송 입니다.',
'821055537431',
'e928cfe1258ede6069fde1b680aa24a25e38e148',
'D',
'2024-07-11 11:00:00',
'0000000000000',
'Y');