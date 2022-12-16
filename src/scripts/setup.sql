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
	description varchar(100),
	category_id integer,
	foreign key (category_id) references category (category_id)
);

insert into menu (name, price, imgpath, description, category_id) values 
	('margherita', 6, 'margherita.jpg', 'Pomodoro San Marzano DOP, fior di Latte, basilico.', 2),
	('nduja e bufala', 10.50, 'margherita.jpg', 'Nduja, fior di latte, mozzarella di bufala in uscita, basilico.', 2),
	('carpaccio di mare', 13, 'margherita.jpg', 'Pomodoro, rucola, carpaccio di Tonno, carpaccio di Salmone, carpaccio di Spada.', 2),
	('diavola', 9, 'diavola.jpg', 'Fior di latte, salame piccante', 3),
	('vegetariana', 9.50, 'pinsaVerdure.jpg', 'Fior di latte, pomodorini, peperoni, funghi', 3),
	('tiramisù', 6, 'tiramisu.jpg', 'Savoiardi, crema al mascarpone, spolverizzato con cacao amaro e cannella in polvere', 4);


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


