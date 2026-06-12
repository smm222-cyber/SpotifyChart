

CREATE TABLE STG_SONGS (
    track_uri       VARCHAR2(255),
    track_name      VARCHAR2(300),
    artist_names    VARCHAR2(1500),
    artist_uris     VARCHAR2(1500),
    label           VARCHAR2(150),
    release_date    VARCHAR2(50),
    all_uris        CLOB
);


CREATE TABLE STG_ALBUMS (
    album_uri       VARCHAR2(255),
    album_name      VARCHAR2(300),
    artist_names    VARCHAR2(500),
    artist_uris     VARCHAR2(500),
    label           VARCHAR2(300),
    release_date    VARCHAR2(50)
);


CREATE TABLE STG_ARTISTS (
    artist_uri      VARCHAR2(255),
    artist_name     VARCHAR2(255)
);


CREATE TABLE STG_CHARTS_SONGS (
    chart_date          VARCHAR2(50),
    country             VARCHAR2(10),
    chart_rank          VARCHAR2(10),
    uri                 VARCHAR2(255),
    artist_names        VARCHAR2(500),
    track_name          VARCHAR2(300),
    label               VARCHAR2(150),
    peak_rank           VARCHAR2(10),
    previous_rank       VARCHAR2(10),
    days_on_chart       VARCHAR2(10),
    streams             VARCHAR2(20),
    consecutive_days    VARCHAR2(10),
    entry_status        VARCHAR2(50),
    peak_date           VARCHAR2(50),
    entry_rank          VARCHAR2(10),
    entry_date          VARCHAR2(50),
    release_date        VARCHAR2(50),
    artist_uris         VARCHAR2(500)
);


CREATE TABLE STG_CHARTS_ALBUMS (
    chart_date          VARCHAR2(50),
    country             VARCHAR2(10),
    chart_rank          VARCHAR2(10),
    uri                 VARCHAR2(255),
    album_name          VARCHAR2(300),
    artist_names        VARCHAR2(500),
    label               VARCHAR2(150),
    peak_rank           VARCHAR2(10),
    previous_rank       VARCHAR2(10),
    weeks_on_chart      VARCHAR2(10),
    consecutive_weeks   VARCHAR2(10),
    entry_status        VARCHAR2(50),
    peak_date           VARCHAR2(50),
    entry_rank          VARCHAR2(10),
    entry_date          VARCHAR2(50),
    release_date        VARCHAR2(50),
    artist_uris         VARCHAR2(500)
);


CREATE TABLE STG_CHARTS_ARTISTS (
    chart_date          VARCHAR2(50),
    country             VARCHAR2(10),
    chart_rank          VARCHAR2(10),
    uri                 VARCHAR2(255),
    artist_name         VARCHAR2(255),
    peak_rank           VARCHAR2(10),
    previous_rank       VARCHAR2(10),
    days_on_chart       VARCHAR2(10),
    consecutive_days    VARCHAR2(10),
    entry_status        VARCHAR2(50),
    peak_date           VARCHAR2(50),
    entry_rank          VARCHAR2(10),
    entry_date          VARCHAR2(50)
);


SELECT table_name FROM user_tables ORDER BY table_name;
