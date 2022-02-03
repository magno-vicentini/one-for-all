SELECT 
    song_name AS nome_musica,
    REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(song_name,
                        'Circus',
                        'Pull Request'),
                    'Silly',
                    'Nice'),
                'Inner Fire',
                'Project'),
            'Her Own',
            'Trybe'),
        'Streets',
        'Code Review') AS novo_nome 
FROM
    songs
WHERE
    song_name IN ('Dance With Her Own' , 'Let\'s Be Silly',
        'Magic Circus',
        'Troubles Of My Inner Fire',
        'Without My Streets')
ORDER BY nome_musica, novo_nome;