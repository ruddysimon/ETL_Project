-- View: public.avg_sport_salary

-- DROP VIEW public.avg_sport_salary;

CREATE OR REPLACE VIEW public.avg_sport_salary AS
 SELECT a.sport,
    a.year,
    a.avg_salary
   FROM ( SELECT 'MLB'::text AS sport,
            mlb_player_salary.year,
            avg(mlb_player_salary.avg_salary) AS avg_salary
           FROM mlb_player_salary
          WHERE mlb_player_salary.year = ANY (ARRAY[2010, 2011, 2012, 2013, 2014, 2015, 2016, 2017, 2018, 2019])
          GROUP BY mlb_player_salary.year
        UNION
         SELECT 'NFL'::text AS sport,
            nfl_player_salary.year,
            avg(nfl_player_salary.avg_salary) AS avg_salary
           FROM nfl_player_salary
          WHERE nfl_player_salary.year = ANY (ARRAY[2010, 2011, 2012, 2013, 2014, 2015, 2016, 2017, 2018, 2019])
          GROUP BY nfl_player_salary.year
        UNION
         SELECT 'NBA'::text AS sport,
            nba_player_salary.year,
            avg(nba_player_salary.avg_salary) AS avg_salary
           FROM nba_player_salary
          WHERE nba_player_salary.year = ANY (ARRAY[2010, 2011, 2012, 2013, 2014, 2015, 2016, 2017, 2018, 2019])
          GROUP BY nba_player_salary.year
        UNION
         SELECT 'MLS'::text AS sport,
            mls_player_salary.year,
            avg(mls_player_salary.avg_salary) AS avg_salary
           FROM mls_player_salary
          WHERE mls_player_salary.year = ANY (ARRAY[2010, 2011, 2012, 2013, 2014, 2015, 2016, 2017, 2018, 2019])
          GROUP BY mls_player_salary.year) a
  ORDER BY a.sport, a.year;

ALTER TABLE public.avg_sport_salary
    OWNER TO postgres;

