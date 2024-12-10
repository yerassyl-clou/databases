--1--
begin;

insert into orders (customer_id, quantity, book_id, order_id)
values (101, 2, 1, 1);

update books
set quantity = quantity - 2
where book_id = 1;

commit;

select * from orders;
select * from books;



--2--
begin;

do $$
declare available integer;

begin
    select quantity into available
    from books
        where book_id = 3;

    if available < 10 then
        rollback;
        raise notice 'Rollback';
    else
        insert into orders (customer_id, book_id, quantity)
        values (102, 3, 10);

        update books
        set quantity = quantity  - 10
        where book_id = 3;

        commit;
    end if;
end $$;

select * from orders;



--3--
    --first session
begin transaction isolation level read committed;               --1

update books                                                    --2
set price = 55
where book_id = 1;

commit;                                                         --5


    --second session
begin transaction isolation level read committed;               --3

select price from books where book_id = 1;                      --4



--4--
begin;

update customers
set email = 'johndoe2@example.com'
where customer_id = 101;

commit;



select email from customers
where customer_id = 101;

