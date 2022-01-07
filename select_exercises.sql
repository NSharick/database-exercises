USE albums_db;

#Albums has 31 rows
#The primary key for albums is "id" and the type is "int".

SELECT DISTINCT artist FROM albums;

# There are 23 unique artist names.

SELECT name, release_date FROM `albums` ORDER BY release_date;

#The oldest release date for an album is Sgt Peppers Lonely Hearts Club Band which was released in 1967 and the most recent was 21 which was released in 2011.

SELECT artist, name FROM albums WHERE artist = 'Pink Floyd';
SELECT name, release_date FROM albums WHERE name = 'Sgt. Pepper\'s Lonely Hearts Club Band';
SELECT name, genre FROM albums WHERE name = 'Nevermind'; 
SELECT name, release_date FROM albums WHERE release_date >= '1990';
SELECT name, sales FROM albums WHERE sales < 20;
SELECT name, genre FROM albums WHERE genre = 'Rock'; 

#The above search only included rows where the genre data was only the word "Rock", most likely because my query used "=".
