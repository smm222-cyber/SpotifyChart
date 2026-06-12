

CREATE TABLE DIM_LABEL (
    label_id    NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    label_name  VARCHAR2(300)   NOT NULL UNIQUE
);

CREATE TABLE DIM_COUNTRY (
    country_id   NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    country_code VARCHAR2(10)   NOT NULL UNIQUE
);

CREATE TABLE DIM_DATE (
    date_id      NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    full_date    DATE           NOT NULL UNIQUE,
    day          NUMBER(2)      NOT NULL,
    month        NUMBER(2)      NOT NULL,
    year         NUMBER(4)      NOT NULL
);



CREATE TABLE DIM_ARTIST (
    artist_id   NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    artist_uri  VARCHAR2(150)   NOT NULL UNIQUE,
    artist_name VARCHAR2(500)   NOT NULL
);

CREATE TABLE DIM_SONG (
    song_id      NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    track_uri    VARCHAR2(255)  NOT NULL,
    track_name   VARCHAR2(300)  NOT NULL,
    release_date DATE,
    all_uris     CLOB,
    label_id     NUMBER         REFERENCES DIM_LABEL(label_id),
    artist_id    NUMBER         REFERENCES DIM_ARTIST(artist_id)
);

CREATE TABLE DIM_ALBUM (
    album_id     NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    album_uri    VARCHAR2(255)  NOT NULL,
    album_name   VARCHAR2(300)  NOT NULL,
    release_date DATE,
    label_id     NUMBER         REFERENCES DIM_LABEL(label_id),
    artist_id    NUMBER         REFERENCES DIM_ARTIST(artist_id)
);



CREATE TABLE FACT_SONG_CHART (
    date_id             NUMBER      NOT NULL    REFERENCES DIM_DATE(date_id),
    country_id          NUMBER      NOT NULL    REFERENCES DIM_COUNTRY(country_id),
    song_id             NUMBER      NOT NULL    REFERENCES DIM_SONG(song_id),
    chart_rank          NUMBER(6),
    peak_rank           NUMBER(6),
    previous_rank       NUMBER(6),
    days_on_chart       NUMBER(6),
    streams             NUMBER(19),
    consecutive_days    NUMBER(6),
    entry_status        VARCHAR2(50),
    entry_rank          NUMBER(6),
    PRIMARY KEY (date_id, country_id, song_id)
);

CREATE TABLE FACT_ALBUM_CHART (
    date_id             NUMBER      NOT NULL    REFERENCES DIM_DATE(date_id),
    country_id          NUMBER      NOT NULL    REFERENCES DIM_COUNTRY(country_id),
    album_id            NUMBER      NOT NULL    REFERENCES DIM_ALBUM(album_id),
    chart_rank          NUMBER(6),
    peak_rank           NUMBER(6),
    previous_rank       NUMBER(6),
    weeks_on_chart      NUMBER(6),
    consecutive_weeks   NUMBER(6),
    entry_status        VARCHAR2(50),
    entry_rank          NUMBER(6),
    PRIMARY KEY (date_id, country_id, album_id)
);

CREATE TABLE FACT_ARTIST_CHART (
    date_id             NUMBER      NOT NULL    REFERENCES DIM_DATE(date_id),
    country_id          NUMBER      NOT NULL    REFERENCES DIM_COUNTRY(country_id),
    artist_id           NUMBER      NOT NULL    REFERENCES DIM_ARTIST(artist_id),
    chart_rank          NUMBER(6),
    peak_rank           NUMBER(6),
    previous_rank       NUMBER(6),
    days_on_chart       NUMBER(6),
    consecutive_days    NUMBER(6),
    entry_status        VARCHAR2(50),
    entry_rank          NUMBER(6),
    PRIMARY KEY (date_id, country_id, artist_id)
);

CREATE INDEX idx_fact_song_date       ON FACT_SONG_CHART   (date_id);
CREATE INDEX idx_fact_song_country    ON FACT_SONG_CHART   (country_id);
CREATE INDEX idx_fact_song_song       ON FACT_SONG_CHART   (song_id);

CREATE INDEX idx_fact_album_date      ON FACT_ALBUM_CHART  (date_id);
CREATE INDEX idx_fact_album_country   ON FACT_ALBUM_CHART  (country_id);
CREATE INDEX idx_fact_album_album     ON FACT_ALBUM_CHART  (album_id);

CREATE INDEX idx_fact_artist_date     ON FACT_ARTIST_CHART (date_id);
CREATE INDEX idx_fact_artist_country  ON FACT_ARTIST_CHART (country_id);
CREATE INDEX idx_fact_artist_artist   ON FACT_ARTIST_CHART (artist_id);

COMMIT;


SELECT table_name FROM user_tables ORDER BY table_name;
