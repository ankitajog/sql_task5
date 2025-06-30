-- Join
create database std_db;
use std_db;
create table std_tbl(id int primary key, name varchar(20),class varchar(5));
desc std_tbl;
insert into std_tbl values(1,'Alice','fycs'),(2,'Bob','sycs'),(3,'Smith','tycs');
select * from std_tbl;

create table game_tbl(roll_no int  , game varchar(20),foreign key(roll_no) references std_tbl(id)) ;
desc game_tbl;
insert into game_tbl(roll_no,game) values(1,'Cricket'),(1,'KhoKho'),(2,'Cricket'),(3,'khokho');
select * from game_tbl;

select * from std_tbl inner join game_tbl ;  -- col in foreign table assign to each parent table values
select id,game from std_tbl inner join  game_tbl on std_tbl.id = game_tbl.roll_no ; -- returns all records for each id w.r.t game col values
select * from std_tbl left join game_tbl on std_tbl.id = game_tbl.roll_no ;  -- returns parent table values
select name, game from std_tbl left join game_tbl on std_tbl.id = game_tbl.roll_no ; -- returns left table i.e parent table name w.r.t game coln values
select id , game from std_tbl left outer join game_tbl on std_tbl.id = game_tbl.roll_no ; -- same as left join
select * from std_tbl right join game_tbl on std_tbl.id = game_tbl.roll_no ; -- right hand side table values covered using id.
select name,game from std_tbl right outer join game_tbl on std_tbl.id = game_tbl.roll_no ; -- right hand side table values covered using id.
select * from std_tbl left join game_tbl on std_tbl.id = game_tbl.roll_no union all select * from std_tbl right join game_tbl on std_tbl.id = game_tbl.roll_no ; -- A LEFT JOIN (all records from std_tbl, and matching from game_tbl) A RIGHT JOIN (all records from game_tbl, and matching from std_tbl)
select * from std_tbl left join game_tbl on std_tbl.id = game_tbl.roll_no union select * from std_tbl right join game_tbl on std_tbl.id = game_tbl.roll_no ; -- no duplicate records 
