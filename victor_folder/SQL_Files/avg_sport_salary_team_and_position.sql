CREATE VIEW avg_sport_salary_by_team_and_position
AS
--View takes data from 2010 to 2019 and combines the professional sports together.
select a.sport, a.year, a.team, a.position, a.avg_salary
from
(
	select 'MLB' AS Sport, year, team, position, AVG(avg_salary) AS avg_salary
	from mlb_player_salary
	WHERE year in (2010, 2011, 2012, 2013, 2014, 2015, 2016, 2017, 2018, 2019)
	GROUP BY year, position, team
	UNION
	select 'NFL' AS Sport, year, team, position, AVG(avg_salary) AS avg_salary
	from nfl_player_salary
	WHERE year in (2010, 2011, 2012, 2013, 2014, 2015, 2016, 2017, 2018, 2019)
	GROUP BY year, position, team
	UNION
	select 'NBA' AS Sport, year, team, position, AVG(avg_salary) AS avg_salary
	from nba_player_salary
	WHERE year in (2010, 2011, 2012, 2013, 2014, 2015, 2016, 2017, 2018, 2019)
	GROUP BY year, position, team
	UNION
	select 'MLS' AS Sport, year, team, position, AVG(avg_salary) AS avg_salary
	from mls_player_salary
	WHERE year in (2010, 2011, 2012, 2013, 2014, 2015, 2016, 2017, 2018, 2019)
	GROUP BY year, position, team
) a
ORDER BY sport, team, position, year