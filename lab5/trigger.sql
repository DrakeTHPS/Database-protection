connect 'D:\firebirdDB\sessions.fdb';
create table audit_journal (
    id integer not null PRIMARY KEY,
    action char(6) not null,
    by_whom varchar(64) not null,
    changed_table varchar(64) not null,
    datetime timestamp
);

set term #;

create trigger cinemas_trigger for cinemas before insert or update or DELETE
AS
declare operation char(6);
BEGIN
if (inserting) THEN
    operation = 'insert';
if (updating) THEN
    operation = 'update';
if (deleting) THEN
    operation = 'delete';

insert into audit_journal (id, action, by_whom, changed_table, datetime) values ((select count(*) from audit_journal)+1, :operation, CURRENT_USER, 'cinemas', CURRENT_TIMESTAMP);
end;
#


create trigger hall_types_trigger for hall_types before insert or update or DELETE
AS
declare operation char(6);
BEGIN
if (inserting) THEN
    operation = 'insert';
if (updating) THEN
    operation = 'update';
if (deleting) THEN
    operation = 'delete';

insert into audit_journal (id, action, by_whom, changed_table, datetime) values ((select count(*) from audit_journal)+1, :operation, CURRENT_USER, 'hall_types', CURRENT_TIMESTAMP);
end;
#

create trigger halls_trigger for halls before insert or update or DELETE
AS
declare operation char(6);
BEGIN
if (inserting) THEN
    operation = 'insert';
if (updating) THEN
    operation = 'update';
if (deleting) THEN
    operation = 'delete';

insert into audit_journal (id, action, by_whom, changed_table, datetime) values ((select count(*) from audit_journal)+1, :operation, CURRENT_USER, 'halls', CURRENT_TIMESTAMP);
end;
#

create trigger seats_trigger for seats before insert or update or DELETE
AS
declare operation char(6);
BEGIN
if (inserting) THEN
    operation = 'insert';
if (updating) THEN
    operation = 'update';
if (deleting) THEN
    operation = 'delete';

insert into audit_journal (id, action, by_whom, changed_table, datetime) values ((select count(*) from audit_journal)+1, :operation, CURRENT_USER, 'seats', CURRENT_TIMESTAMP);
end;
#


create trigger sessions_trigger for sessions before insert or update or DELETE
AS
declare operation char(6);
BEGIN
if (inserting) THEN
    operation = 'insert';
if (updating) THEN
    operation = 'update';
if (deleting) THEN
    operation = 'delete';

insert into audit_journal (id, action, by_whom, changed_table, datetime) values ((select count(*) from audit_journal)+1, :operation, CURRENT_USER, 'sessions', CURRENT_TIMESTAMP);
end;
#

create trigger movies_trigger for movies before insert or update or DELETE
AS
declare operation char(6);
BEGIN
if (inserting) THEN
    operation = 'insert';
if (updating) THEN
    operation = 'update';
if (deleting) THEN
    operation = 'delete';

insert into audit_journal (id, action, by_whom, changed_table, datetime) values ((select count(*) from audit_journal)+1, :operation, CURRENT_USER, 'movies', CURRENT_TIMESTAMP);
end;
#


create trigger tickets_trigger for tickets before insert or update or DELETE
AS
declare operation char(6);
BEGIN
if (inserting) THEN
    operation = 'insert';
if (updating) THEN
    operation = 'update';
if (deleting) THEN
    operation = 'delete';

insert into audit_journal (id, action, by_whom, changed_table, datetime) values ((select count(*) from audit_journal)+1, :operation, CURRENT_USER, 'tickets', CURRENT_TIMESTAMP);
end;
#


create trigger booking_trigger for booking before insert or update or DELETE
AS
declare operation char(6);
BEGIN
if (inserting) THEN
    operation = 'insert';
if (updating) THEN
    operation = 'update';
if (deleting) THEN
    operation = 'delete';

insert into audit_journal (id, action, by_whom, changed_table, datetime) values ((select count(*) from audit_journal)+1, :operation, CURRENT_USER, 'booking', CURRENT_TIMESTAMP);
end;
#

set term ; #