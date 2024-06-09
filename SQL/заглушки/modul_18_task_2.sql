--tsql

create or alter procedure dbo.sp_metod_out 

  @account_id int,
  @session_id int,
  @product_name varchar(255)

  as
  begin

      select q.user_id, 
	         q.product_type,
			 q.user_type
	 from 
     (
	   values (1, 'user_id', 2),
	          (2, 'product_type', 3),
			  (3, 'user_type', 4)
     ) 
	 as q (user_id, product_type, user_type)

	  select newid () as session_id, 
	         0 as status	        
  end;

exec dbo.sp_metod_out 1,2,'a'

  --pgsql
  
create or replace function main.sp_metod_out 
(
  account_id int,
  session_id int,
  product_name varchar(255)
)
returns table
( value json,
  value_1 json)
language plpgsql
as $body$
declare 
out_value json;
out_value_1 json;
begin

     select json_agg(t)
   from
   (
     select q.user_id, 
           q.product_type,
       q.user_type
    from
    (
       values (1, 'user_id', 2),
              (2, 'product_type', 3),
              (3, 'user_type', 4)
        ) as q (user_id, product_type, user_type)
   ) as t 
   into out_value;

   select json_agg(t)
   from
   (
   select gen_random_uuid() as session_id, 
           0 as status
   ) as t 
   into out_value_1;
  return query select out_value,  out_value_1;
 end;
 $body$;