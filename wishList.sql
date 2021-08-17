--alter session set "_oracle_script"=true;
--create user shop identified by java;
--grant connect, resource, unlimited tablespace to shop;
--conn shop/java;

drop table wishList;
purge recyclebin;

create table wishList(
    id varchar2(2000) references member(id),
    mname varchar2(2000)
);

select constraint_name, constraint_type from user_constraints where table_name='wishList';
select * from wishList order by id desc;