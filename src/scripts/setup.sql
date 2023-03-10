drop table if exists order_detail;
DROP TABLE IF EXISTS MENU cascade;
drop table if exists category;
drop table if exists ordine cascade;
drop table if exists utente cascade;
drop table if exists "user";
drop table if exists "order";

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
	imgpath varchar(25),
	description varchar(100),
	category_id integer,
	foreign key (category_id) references category (category_id)
);

insert into menu (name, price, imgpath, description, category_id) values 
	('anelli cipolla fritti', 5, 'anelliCipollaFritti.jpg', 'Anelli cipolla fritti.', 1),
	('margherita', 6, 'margherita.jpg', 'Pomodoro San Marzano DOP, fior di Latte, basilico.', 2),
	('nduja e bufala', 10.50, 'margherita.jpg', 'Nduja, fior di latte, mozzarella di bufala in uscita, basilico.', 2),
	('carpaccio di mare', 13, 'margherita.jpg', 'Pomodoro, rucola, carpaccio di Tonno, carpaccio di Salmone, carpaccio di Spada.', 2),
	('diavola', 9, 'diavola.jpg', 'Fior di latte, salame piccante.', 3),
	('vegetariana', 9.50, 'pinsaVerdure.jpg', 'Fior di latte, pomodorini, peperoni, funghi.', 3),
	('tiramisù', 6, 'tiramisu.jpg', 'Savoiardi, crema al mascarpone, spolverizzato con cacao amaro e cannella in polvere.', 4),
	('torta di fragole', 6, 'tortaFragole.jpg', 'Base di biscotti, crema pasticcera, fragole.', 4),
	('birra bionda alla spina', 3.50, 'birraBionda.jpg', 'Pils, biondo dorato, gusto ricco e distintivo (0.20 cl).', 5),
	('birra rossa alla spina', 3.50, 'birraRossa.jpg', 'Weizern, gusto rinfrescante e fruttato (0.20 cl).', 5);

create table utente(
	utente_id serial primary key,
	username varchar(20) unique,
	passkey varchar(15)
);

insert into utente (username, passkey) values ('Giulia@polito', 'password');

create table ordine(
	ordine_id serial primary key,
	total decimal(5,2),
	utente_id integer,
	foreign key (utente_id) references utente (utente_id)
);

create table order_detail(
	detail_id serial primary key,
	ordine_id integer,
	menu_id integer,
	quantity integer,
	foreign key (ordine_id) references ordine (ordine_id),
	foreign key (menu_id) references menu (menu_id)
);
