--alter session set "_oracle_script"=true;
--create user shop identified by java;
--grant connect, resource, unlimited tablespace to shop;
--conn shop/java;

drop table member;
purge recyclebin;

create table member(
    id varchar2(200) primary key,
    name varchar2(200),
    email varchar2(200),
    phone varchar2(200),
    pwd varchar2(200)
);

insert into member values('kdy0802', '±èµÎ¿­', 'qwe@naver.com', '010-1234-1234', '1234');
insert into member values('qwe123', 'È«±æµ¿', 'asd@naver.com', '010-1234-1235', '1234');

commit;

select constraint_name, constraint_type from user_constraints where table_name='member';
select * from member order by id desc;