connect 'D:\firebirdDB\sessions.fdb';
create role MovieLover;
grant select on sessions to role MovieLover;
grant select on movies to role MovieLover;
grant select on tickets to role MovieLover;
grant select on booking to role MovieLover;
grant select on cinemas to role MovieLover;
grant select on halls to role MovieLover;
grant select on hall_types to role MovieLover;
grant select on seats to role MovieLover;

create user TicketSeller password 'seller';
grant MovieLover to TicketSeller;
grant insert, update, delete on tickets to user TicketSeller;
grant insert, update, delete on booking to user TicketSeller;


create user CinemaManager password 'hardpswd';
grant MovieLover to CinemaManager;
grant insert, update, delete on sessions to user CinemaManager;
grant insert, update, delete on movies to user CinemaManager;