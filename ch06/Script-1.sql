use sqldb;
create table membertbl (select userID, name, addr from usertbl limit3); -- 3건만 가져옴
alter table membertbl 
add constraint pk_membertbl PRIMARY key(userID);
select * from membertbl;