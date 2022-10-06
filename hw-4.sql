select genre.name, count(singer.name)
from genresinger
join genre on genre_id = genre.id 
join singer on singer_id = singer.id
group by genre.name;

select count(track.name) from track join album on track.album_id = album.id
group by album.release_date
having album.release_date between '2019-01-01' and '2020-12-31';

select avg(track.lenght_seconds), album.name
from track join album on track.album_id = album.id
group by album.name;

select distinct s.name
from singeralbum sa
join singer s on sa.singer_id = s.id 
join album a on sa.album_id = a.id
where a.release_date not between '2020-01-01' and '2020-12-31';

select c.name
from singeralbum sa
join singer s on sa.singer_id = s.id 
join album a on sa.album_id = a.id
join track t on t.album_id = a.id 
join trackcompilation tc on tc.track_id = t.id
join compilation c on c.id = tc.compilation_id
where s.name = 'Louis Armstrong'
order by c.name;

select a.name
from singeralbum s join album a on s.album_id = a.id
where s.singer_id = (select singer_id from genresinger group by singer_id having count(genre_id) > 1);

select t.name
from track t left join trackcompilation tc on t.id = tc.track_id
where tc.compilation_id is null;

select distinct s.name
from singeralbum sa join singer s on sa.singer_id = s.id
where sa.album_id = (select t.album_id from track t where t.lenght_seconds = (select min(lenght_seconds) from track));

select b.name from 
(select c.album_id from (select t.album_id, count(t.name) from track t group by t.album_id) c
where c.count = (select min(s.count) from (select t.album_id, count(t.name) from track t group by t.album_id) s)) a
left join album b on a.album_id = b.id;

 




