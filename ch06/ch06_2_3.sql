/* 6과 2-3 */

use sqlDB;
DELETE from testtbl4 where fname = 'Aamer';

DELETE from testtbl4 where fname = 'Mary' limit 5;

-- 대용량 테이블 생성 
use sqldb;
CREATE table bigtbl1(select * from employees.employees);
create TABLE bigtbl2(select * from employees.employees);
create TABLE bigtbl3(select * from employees.employees);

-- 테이블 삭제 
delete from bigtbl1;
drop table bigtbl2;
truncate table bigtbl3;




