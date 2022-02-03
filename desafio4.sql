SELECT 
    u.user_name AS usuario,
    IF(MAX(r.reproduction_date) >= '2021-00-00 00:00:00',
        'Usuário ativo',
        'Usuário inativo') AS condicao_usuario
FROM
    user AS u
        INNER JOIN
    reproductions AS r ON u.user_id = r.user_id
GROUP BY r.user_id
ORDER BY u.user_name;