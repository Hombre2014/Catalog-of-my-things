CREATE DATABASE catalog_of_my_things;

CREATE TABLE author (
	id INT GENERATED ALWAYS AS IDENTITY,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	PRIMARY KEY(id)
);

CREATE TABLE genres (
	id  INT GENERATED ALWAYS AS IDENTITY,
	name VARCHAR(100),
	PRIMARY KEY(id)
);

CREATE TABLE labels (
	id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	title VARCHAR(100),
	color VARCHAR(10)
);

CREATE TABLE item (
	id  INT GENERATED ALWAYS AS IDENTITY,
  publish_date DATE,
	genre_id INT,
	author_id INT,
	label_id INT,
	archived BOOLEAN,
	PRIMARY KEY(id),
	FOREIGN KEY (genre_id) REFERENCES genres (id),
	FOREIGN KEY (author_id) REFERENCES author (id),
	FOREIGN KEY (label_id) REFERENCES labels (id)
);

create table book(
	id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	publisher VARCHAR(100),
	cover_state VARCHAR(10),
	FOREIGN KEY (id) REFERENCES item (id)
);

CREATE TABLE music_albums (
	id  INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	name VARCHAR(100),
	on_spotify BOOLEAN,
	FOREIGN KEY(id) REFERENCES item(id)
);

CREATE TABLE games (
	id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	multiplayer BOOLEAN,
	last_played_at DATE,
  FOREIGN KEY (id) REFERENCES item (id)
);
