use mydb;
insert into country (code, name) values ("EST", "Estonia");
insert into country (code, name) values ("FIN", "Finland");

insert into formation (description) values ("Attacking position");
insert into formation (description) values ("Defending position");

insert into coach(firstname, lastname, countryid) values ("Siim Marten", "Schmidt", "EST");
insert into coach(firstname, lastname, countryid) values ("Lembit", "Raikonen", "FIN");

insert into club (location, name, stadium) values ("Tallinn", "Eesti koondis", "A. Le. Coq Arena");
insert into club (location, name, stadium) values ("Helsinki", "Finnish team", "Helsinki arena");

insert into player (firstname, lastname, salary, countryid, clubid) 
values ("Villem", "Hardi", 5000, 1, 1);
insert into player (firstname, lastname, salary, countryid, clubid)
values ("Siim", "Kuningas", 999, 1, 1);
insert into player (firstname, lastname, salary, countryid, clubid)
values ("Siim", "Kallas", 99999, 1, 1);

insert into player (firstname, lastname, salary, countryid, clubid)
values ("Aino", "Korhonen", 5120, 2, 2);
insert into player (firstname, lastname, salary, countryid, clubid)
values ("Juhani", "Lahtinen", 6718, 2, 2);
insert into player (firstname, lastname, salary, countryid, clubid)
values ("Sari", "Niemi", 4215, 2, 2);

insert into game (homeclub, foreignclub, homescore, foreignscore, homeformation, foreignformation)
values (1, 2, 5, 0, 1, 2);

insert into gameplayer (gameid, playerid) values (1, 1);

