create or replace function privileges(action char(1), privs varchar(5), table_name varchar(64), whom_name varchar(64))
returns varchar(512) 
as $query$
declare priv_cnt int = 0;
query varchar(512) = '';
BEGIN
    IF (lower(action) = 'g') THEN
        query = query || 'grant ';
    elsif (lower(action) = 'r') THEN
        query = query || 'revoke ';
    else return 'Failure';
    end if;

    if(lower(privs) like '%i%') THEN
            query = query || 'insert';
            priv_cnt = priv_cnt+1;
    end if;

    if(lower(privs) like '%s%') THEN
        if (priv_cnt > 0) then
            query = query || ', ';
        end if;
        query = query || 'select';
        priv_cnt = priv_cnt+1;
    end if;

    if(lower(privs) like '%u%') THEN
        if (priv_cnt>0) then
            query = query || ', ';
        end if;
        query = query || 'update';
        priv_cnt = priv_cnt + 1;
    end if;

    if(lower(privs) like '%d%') THEN
        if (priv_cnt>0) then
            query = query || ', ';
        end if;
        query = query || 'delete';
        priv_cnt = priv_cnt+1;
    end if;

    if(lower(privs) like '%a%') THEN
        if (priv_cnt>0) then
            query = query || ', ';
        end if;
        query = query || 'all';
        priv_cnt = priv_cnt+1;
    end if;

    if (priv_cnt = 0) then
        query = '';
        return 'Failure';
    end if;

    query = query || ' on ' || table_name;

    if (lower(action) = 'g') THEN
        query = query || ' to ';
    else query = query || ' from ';
    end if;

    query = query || whom_name || ';';

    EXECUTE query;
    return 'query successfully executed';
END;
$query$ LANGUAGE 'plpgsql';