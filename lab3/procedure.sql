connect 'D:\firebirdDB\sessions.fdb';
set term #;
create procedure privileges(action char(1) not null, privs varchar(5) not null, table_name varchar(64) not null, whom char(1) not null, whom_name varchar(64) not null)
returns (query varchar (512)) as
declare priv_cnt int default 0;
BEGIN
query = '';
IF (lower(action) = 'g') THEN
    query = query || 'grant ';
else
if (lower(action) = 'r') THEN
    query = query || 'revoke ';
else suspend;

if(lower(privs) like '%i%') THEN
    BEGIN
        query = query || 'insert';
        priv_cnt = priv_cnt+1;
    END

if(lower(privs) like '%s%') THEN
    begin
    if (priv_cnt > 0) then
        query = query || ', ';

    BEGIN
        query = query || 'select';
        priv_cnt = priv_cnt+1;
    END
    end

if(lower(privs) like '%u%') THEN
    begin
    if (priv_cnt>0) then
        query = query || ', ';
        
    BEGIN
        query = query || 'update';
        priv_cnt = priv_cnt + 1;
    END
    end

if(lower(privs) like '%d%') THEN
    begin
    if (priv_cnt>0) then
        query = query || ', ';
        
    BEGIN
        query = query || 'delete';
        priv_cnt = priv_cnt+1;
    END
    end

if(lower(privs) like '%a%') THEN
    begin
    if (priv_cnt>0) then
        query = query || ', ';
        
    BEGIN
        query = query || 'all';
        priv_cnt = priv_cnt+1;
    END
    end

if (priv_cnt = 0) then
    BEGIN
        query = '';
        suspend;
    end

query = query || ' on ' || table_name;

if (lower(action) = 'g') THEN
    query = query || ' to ';
else query = query || ' from ';

if (lower(whom) = 'r') then
    query = query || 'role ';
else if (lower(whom) = 'u') THEN
    query = query || 'user ';
else
    BEGIN
        query = '';
        suspend;
    end

query = query || whom_name || ';';

EXECUTE STATEMENT query;
suspend;
END;
#
set term ;#