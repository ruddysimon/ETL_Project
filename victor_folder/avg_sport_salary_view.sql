CREATE VIEW avg_sport_salary
AS
select a.sport, a.year, a.avg_salary
from
(
	select 'MLB' AS Sport, year, AVG(avg_salary) AS avg_salary 
	from mlb_player_salary
	WHERE year in (2010, 2011, 2012, 2013, 2014, 2015, 2016, 2017, 2018, 2019)
	GROUP BY year
	UNION
	select 'NFL' AS Sport, year, AVG(avg_salary) AS avg_salary 
	from nfl_player_salary
	WHERE year in (2010, 2011, 2012, 2013, 2014, 2015, 2016, 2017, 2018, 2019)
	GROUP BY year
	UNION
	select 'NBA' AS Sport, year, AVG(avg_salary) AS avg_salary 
	from nba_player_salary
	WHERE year in (2010, 2011, 2012, 2013, 2014, 2015, 2016, 2017, 2018, 2019)
	GROUP BY year
	UNION
	select 'MLS' AS Sport, year, AVG(avg_salary) AS avg_salary 
	from mls_player_salary
	WHERE year in (2010, 2011, 2012, 2013, 2014, 2015, 2016, 2017, 2018, 2019)
	GROUP BY year
) a
ORDER BY sport, year

select * from avg_sport_salary
