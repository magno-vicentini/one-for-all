SELECT 
    ar.artist_name AS artista, al.album_name AS album, COUNT(f.artist_id) AS seguidores
FROM
    artist AS ar
        INNER JOIN
    album AS al ON al.artist_id = ar.artist_id
		INNER JOIN
	following_artist as f ON f.artist_id = al.artist_id
GROUP BY al.album_name, f.artist_id
ORDER BY seguidores DESC, artista, album;