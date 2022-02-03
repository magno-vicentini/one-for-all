SELECT 
    r.reproduction_history AS nome,
    COUNT(r.reproduction_history) AS reproducoes
FROM
    reproductions AS r
        INNER JOIN
    user AS u ON u.user_id = r.user_id
WHERE
    u.plan_id IN (1 , 3)
GROUP BY r.reproduction_history
ORDER BY nome;