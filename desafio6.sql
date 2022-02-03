SELECT MIN(p.plan_value) AS faturamento_minimo, 
		MAX(p.plan_value) AS faturamento_maximo,
        ROUND(AVG(
        CASE WHEN u.plan_id = 1 THEN 0
            WHEN u.plan_id = 2 THEN 5.99
            WHEN u.plan_id = 3 THEN 6.99
		ELSE 7.99
        END
        ), 2) AS faturamento_medio,
        ROUND(SUM(
        CASE WHEN u.plan_id = 1 THEN 0
            WHEN u.plan_id = 2 THEN 5.99
            WHEN u.plan_id = 3 THEN 6.99
		ELSE 7.99
        END
        ), 2) AS faturamento_total
	FROM plan AS p
INNER JOIN user AS u ON u.plan_id = p.plan_id;