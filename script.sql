1. Estádios com maior média de gols em finais
SELECT 
    Stadium,
    ROUND(AVG([home_team_goals] + [away_team_goals]), 2) AS media_gols
FROM WorldCupMatches
WHERE Stage = 'Final'
GROUP BY Stadium
ORDER BY media_gols DESC
LIMIT 5;

2. Países-sede com Copas mais ofensivas
SELECT 
    wc.Country,
    ROUND(AVG(m.[home_team_goals] + m.[away_team_goals]), 2) AS media_gols
FROM WorldCups wc
INNER JOIN WorldCupMatches m
    ON wc.Year = m.Year
GROUP BY wc.Country
ORDER BY media_gols DESC
LIMIT 10;

3. Árbitros que apitaram jogos mais violentos
(Usando gols como proxy de intensidade)
SELECT 
    Referee,
    AVG([home_team_goals] + [away_team_goals]) AS media_gols
FROM WorldCupMatches
GROUP BY Referee
HAVING COUNT(*) >= 5
ORDER BY media_gols DESC
LIMIT 10;

4. Seleções com melhor ataque da história
SELECT 
    selecao,
    SUM(gols) AS total_gols
FROM (
    SELECT 
        [home_team_name] AS selecao,
        [home_team_goals] AS gols
    FROM WorldCupMatches
    
    UNION ALL
    
    SELECT 
        [away_team_name],
        [away_team_goals]
    FROM WorldCupMatches
) t
GROUP BY selecao
ORDER BY total_gols DESC
LIMIT 10;

5. Jogos com maior público da história
SELECT 
    Year,
    Stadium,
    City,
    [home_team_name],
    [away_team_name],
    Attendance
FROM WorldCupMatches
ORDER BY Attendance DESC
LIMIT 10;

6. Técnicos com maior número de partidas
SELECT 
    [coach_name],
    COUNT(DISTINCT MatchID) AS partidas
FROM WorldCupPlayers
GROUP BY [coach_name]
ORDER BY partidas DESC
LIMIT 10;

7. Seleções que mais chegaram às finais
SELECT 
    selecao,
    COUNT(*) AS finais
FROM (
    SELECT [home_team_name] AS selecao
    FROM WorldCupMatches
    WHERE Stage = 'Final'
    
    UNION ALL
    
    SELECT [away_team_name]
    FROM WorldCupMatches
    WHERE Stage = 'Final'
) t
GROUP BY selecao
ORDER BY finais DESC;

8. Estádios que receberam mais partidas
SELECT 
    Stadium,
    City,
    COUNT(*) AS total_partidas
FROM WorldCupMatches
GROUP BY Stadium, City
ORDER BY total_partidas DESC
LIMIT 10;

9. Jogos com maior diferença de gols
SELECT 
    Year,
    [home_team_name],
    [away_team_name],
    ABS([home_team_goals] - [away_team_goals]) AS diferenca
FROM WorldCupMatches
ORDER BY diferenca DESC
LIMIT 10;

10. Países campeões com maior eficiência ofensiva
SELECT 
    wc.Winner,
    ROUND(
        AVG(m.[home_team_goals] + m.[away_team_goals]), 
        2
    ) AS media_gols_copa
FROM WorldCups wc
INNER JOIN WorldCupMatches m
    ON wc.Year = m.Year
GROUP BY wc.Winner
ORDER BY media_gols_copa DESC;

11. Jogadores que participaram de mais partidas
SELECT 
    [player_name],
    COUNT(DISTINCT MatchID) AS partidas
FROM WorldCupPlayers
GROUP BY [player_name]
ORDER BY partidas DESC
LIMIT 10;

12. Copas com maior média de público
SELECT 
    Year,
    ROUND(AVG(Attendance), 0) AS media_publico
FROM WorldCupMatches
GROUP BY Year
ORDER BY media_publico DESC
LIMIT 10;

13. Seleções com mais jogos sem sofrer gols
SELECT 
    selecao,
    COUNT(*) AS clean_sheets
FROM (
    
    SELECT 
        [home_team_name] AS selecao
    FROM WorldCupMatches
    WHERE [away_team_goals] = 0
    
    UNION ALL
    
    SELECT 
        [away_team_name]
    FROM WorldCupMatches
    WHERE [home_team_goals] = 0

) t
GROUP BY selecao
ORDER BY clean_sheets DESC
LIMIT 10;

14. Cidades que receberam mais gols em Copas
SELECT 
    City,
    SUM([home_team_goals] + [away_team_goals]) AS total_gols
FROM WorldCupMatches
GROUP BY City
ORDER BY total_gols DESC
LIMIT 10;

15. Seleções com melhor desempenho em mata-mata
SELECT 
    vencedor,
    COUNT(*) AS vitorias
FROM (
    
    SELECT 
        CASE
            WHEN [home_team_goals] > [away_team_goals]
            THEN [home_team_name]
            
            WHEN [away_team_goals] > [home_team_goals]
            THEN [away_team_name]
        END AS vencedor
        
    FROM WorldCupMatches
    WHERE Stage NOT LIKE '%Group%'
    
) t
WHERE vencedor IS NOT NULL
GROUP BY vencedor
ORDER BY vitorias DESC
LIMIT 10;

16. Técnicos sem eventos registrados
SELECT 
    p.[coach_name],
    COUNT(p.Event) AS eventos
FROM WorldCupPlayers p
LEFT JOIN WorldCupMatches m
    ON p.MatchID = m.MatchID
GROUP BY p.[coach_name]
ORDER BY eventos ASC;