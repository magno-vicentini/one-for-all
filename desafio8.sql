SELECT ar.artist_name AS artista, album_name AS album FROM artist AS ar
INNER JOIN album AS al ON ar.artist_id = al.artist_id
WHERE ar.artist_name = 'Walter Phoenix';