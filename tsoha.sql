create table Artist (
	id integer primary key,
	name varchar,
	bio varchar
	);
create table Genre (
	genre_name varchar primary key,
	description varchar
	);
create table RecordCompany (
	id integer primary key,
	name varchar
	);
create table CompactDisc (
	id integer primary key,
	artist varchar,
	released integer,
	record_company integer,
	genre varchar,
	picture varchar,
	foreign key(Artist) references Artist,
	foreign key(RecordCompany) references RecordCompany,
	foreign key(Genre) references Genre
	);
