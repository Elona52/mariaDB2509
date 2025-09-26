/* 6과 2-2 */

use sqldb;
SELECT * FROM testtbl4;


update testtbl4
set lname ='없음'
where fname = 'Kyoichi';

select * from buytbl2;
update buytbl2 set price = price * 1.5;