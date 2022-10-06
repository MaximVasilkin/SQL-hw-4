create table if not exists Genre (
	id serial primary key,
	name varchar(60) unique not null
);

create table if not exists Singer (
	id serial primary key,
	name varchar(60) unique not null
);


create table if not exists GenreSinger (
	genre_id integer references Genre(id),
	singer_id integer references Singer(id),
	constraint pk_GenreSinger primary key (genre_id, singer_id)
);

create table if not exists Album (
	id serial primary key,
	name varchar(60) not null,
	release_date date not null
);

create table if not exists SingerAlbum (
	album_id integer references Album(id),
	singer_id integer references Singer(id),
	constraint pk_SingerAlbum primary key (album_id, singer_id)
);

create table if not exists Track (
	id serial primary key,
	name varchar(60) not null,
	album_id integer references Album(id),
	lenght_seconds integer not null,
	check (lenght_seconds > 0 and lenght_seconds < 1200)
);

create table if not exists Compilation (
	id serial primary key,
	name varchar(60) not null,
	release_date date not null
);

create table if not exists TrackCompilation (
	track_id integer references Track(id),
	compilation_id integer references Compilation(id),
	constraint pk_TrackCompilation primary key (track_id, compilation_id)
);