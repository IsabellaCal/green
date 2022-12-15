drop table if exists detail;
DROP TABLE IF EXISTS MENU;
drop table if exists category;
drop table if exists "order";

create table category(
	category_id serial primary key,
	"name" varchar(20)
);

insert into category (name) values ('Antipasto e fritto');
insert into category (name) values ('Pizza');
insert into category (name) values ('Pinsa');
insert into category (name) values ('Dolce');
insert into category (name) values ('Bevanda');

create table menu(
	menu_id serial primary key,
	"name" varchar(25),
	price decimal,
	category_id integer,
	foreign key (category_id) references category (category_id)
);

insert into menu (name, price, category_id) values ('pizza margherita', 6.50, 2);

create table "order"(
	order_id serial primary key,
	total decimal
);

create table detail(
	detail_id serial primary key,
	order_id integer,
	menu_id integer,
	quantity decimal,
	foreign key (order_id) references "order" (order_id),
	foreign key (menu_id) references menu (menu_id)
);


