create user movielover with password 'movielover';
grant select on sessions to movielover;
grant select on movies to movielover;
grant select on tickets to movielover;
grant select on booking to movielover;
grant select on cinemas to movielover;
grant select on halls to movielover;
grant select on hall_types to movielover;
grant select on seats to movielover;

create user ticketseller password 'seller12345';
grant movielover to ticketseller;
grant insert, update, delete on tickets to ticketseller;
grant insert, update, delete on booking to ticketseller;


create user cinemamanager password 'hardpswd';
grant movielover to cinemamanager;
grant insert, update, delete on sessions to cinemamanager;
grant insert, update, delete on movies to cinemamanager;