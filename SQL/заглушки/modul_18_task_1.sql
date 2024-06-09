--tsql

create or alter function dbo.fn_metod_out 
(
  @account_id int,
  @session_id int
)
returns @table table
(
  status int
)
  as
  begin

      insert into @table

      select 1 as status;
	  return;
  end;

select * from dbo.fn_metod_out (1,2)

  --pgsql
  
create function main.fn_metod_out 
(
  account_id int,
  session_id int
)
returns table
(
  status int
)
  language plpgsql
  as $body$
  begin

     return query
     select 1 as status;
 end;
 
 $body$;
 