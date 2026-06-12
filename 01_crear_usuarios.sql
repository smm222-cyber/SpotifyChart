
CREATE USER spotify_dm IDENTIFIED BY spotify123;
GRANT CONNECT, RESOURCE, DBA TO spotify_dm;
GRANT UNLIMITED TABLESPACE TO spotify_dm;


CREATE USER spotify_stage IDENTIFIED BY spotify123;
GRANT CONNECT, RESOURCE, DBA TO spotify_stage;
GRANT UNLIMITED TABLESPACE TO spotify_stage;


GRANT SELECT ON spotify_stage.STG_SONGS      TO spotify_dm;
GRANT SELECT ON spotify_stage.STG_ALBUMS     TO spotify_dm;
GRANT SELECT ON spotify_stage.STG_ARTISTS    TO spotify_dm;
GRANT SELECT ON spotify_stage.STG_CHARTS_SONGS   TO spotify_dm;
GRANT SELECT ON spotify_stage.STG_CHARTS_ALBUMS  TO spotify_dm;
GRANT SELECT ON spotify_stage.STG_CHARTS_ARTISTS TO spotify_dm;

COMMIT;
