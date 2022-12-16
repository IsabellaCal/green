drop table if exists order_detail;
DROP TABLE IF EXISTS MENU cascade;
drop table if exists category;
drop table if exists "order" cascade;


create table category(
	category_id serial primary key,
	"name" varchar(20),
	imgpath varchar(20),
	href varchar(30),
	description varchar(100)
);

insert into category (name, imgpath, description)
values 
('Antipasti e fritti', 'antipasti.png', 'Per iniziare il pasto stuzzicando l''appetito'),
('Pizze', 'pizze.png', 'Leggere e digeribili: 72 ore di lievitazione e maturazione'),
('Pinse', 'pinse.png', 'Scopri il gusto della tradizione con la vera pinsa romana'),
('Dolci', 'dolci.png', 'I nostri dolci fatti in casa, giornalmente'),
('Bevande', 'bevande.png', 'Bevete che fa bene');

create table menu(
	menu_id serial primary key,
	"name" varchar(25),
	price decimal(4,2),
	imgpath varchar(20),
	descriprion varchar(100),
	category_id integer,
	foreign key (category_id) references category (category_id)
);

insert into menu (name, price, category_id) values ('pizza margherita', 6.50, 2);


create table "order"(
	order_id serial primary key,
	total decimal(5,2)
);

create table order_detail(
	detail_id serial primary key,
	order_id integer,
	menu_id integer,
	quantity integer,
	foreign key (order_id) references "order" (order_id),
	foreign key (menu_id) references menu (menu_id)
);


