use imdb;
select * from genre;
select * from person;
select * from ta23e;
select * from title;

-- Kus on kõige rohkem näitlejaid
select t.primarytitle, count(ta.nconst) as actor_count from title t join ta23e ta 
on t.tconst=ta.tconst where ta.category="actor" or ta.category="actress" group by t.tconst, t.primarytitle
order by actor_count desc;

-- Kõige rohkem filme teinud näitleja 
select p.primaryname, count(distinct ta.tconst) as movie_count from person p join ta23e ta
on p.nconst=ta.nconst join title t on ta.tconst=t.tconst where
(ta.category="actress" or ta.category="actor") and t.titletype="movie"
group by p.nconst, p.primaryname order by movie_count desc;

-- Sama režissööriga filmid
select p.primaryname, group_concat(t.primarytitle separator ", ") as movies, 
count(t.tconst) as movie_count from title t
join ta23e ta on ta.tconst = t.tconst join person p on p.nconst=ta.nconst 
where ta.category="director" and t.titletype="movie" group by p.primaryname order by movie_count desc;

-- Filmid, mis on kõige parema ratinguga, millel on üle 10 000 arvustuse koos režissööriga
select t.primarytitle, t.averagerating, p.primaryname as director from title t
join ta23e ta on t.tconst=ta.tconst join person p on p.nconst=ta.nconst 
where ta.category="director" and t.numvotes > 10000 order by averagerating desc;

-- Filmid, millel on kõige madalam hinnang
select t.primarytitle, t.averagerating, p.primaryname as director from title t join ta23e ta on t.tconst=ta.tconst join person p on p.nconst=ta.nconst
where ta.category="director" and t.numvotes > 10000 order by averagerating asc;