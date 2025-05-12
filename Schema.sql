CREATE TABLE artist (
    artist_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE genre (
    genre_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE album (
    album_id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    release_year INT
);

CREATE TABLE track (
    track_id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    album_id INT REFERENCES album(album_id),
    duration INTERVAL
);

CREATE TABLE collection (
    collection_id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    release_year INT
);

CREATE TABLE artist_genre (
    artist_id INT REFERENCES artist(artist_id),
    genre_id INT REFERENCES genre(genre_id),
    PRIMARY KEY (artist_id, genre_id)
);

CREATE TABLE artist_album (
    artist_id INT REFERENCES artist(artist_id),
    album_id INT REFERENCES album(album_id),
    PRIMARY KEY (artist_id, album_id)
);

CREATE TABLE collection_track (
    collection_id INT REFERENCES collection(collection_id),
    track_id INT REFERENCES track(track_id),
    PRIMARY KEY (collection_id, track_id)
);
