--1--
create function increase_value(a integer) returns integer as
$$
BEGIN
    return a + 10;
END;
$$
    language plpgsql;

select increase_value(5);



--2--
create function compare_numbers(a integer, b integer) returns varchar as
$$
BEGIN
    if a = b then
        return 'Equal';
    elsif a > b then
        return 'Greater';
    else
        return 'Lesser';
    END if;
END;
$$
    language plpgsql;

select compare_numbers(10, 20);
select compare_numbers(increase_value(10), 20);
select compare_numbers(30, 5);



--3--
create or replace procedure number_series(n integer) as
$$
BEGIN
    for i in 1..n loop
        raise notice '%', i;
    end loop;
END;
$$
    language plpgsql;

call number_series(5);



--4--
create or replace procedure find_employee(name varchar) as
$$
BEGIN

    select * from employees e
    where e.name = name;

END;
$$
    language plpgsql;



--5--
create or replace procedure list_products(category_name varchar) as
$$
BEGIN

    select * from products p
    where p.category = category_name;

END;
$$
    language plpgsql;



--6--
create function square(num integer) returns integer as
$$
BEGIN

    return num*num;

END;
$$
    language plpgsql;


create function squares_sum(a integer, b integer) returns integer as
$$
BEGIN

    return square(a) + square(b);

END;
$$
    language plpgsql;



--7--
create or replace procedure complex_calculasion(input_num integer, input_text varchar, out res varchar) as
$$
DECLARE
    num_res integer;
    text_res varchar;
BEGIN
    <<main_black>>
    BEGIN
        <<numeric_block>>
        BEGIN
            num_res := input_num * input_num;
            raise notice 'Square of % is %', input_num, num_res;
        end numeric_block;

        <<string_block>>
        BEGIN
            text_res := reverse(input_text);
            raise notice 'Reverse of % is %', input_text, text_res;
        end string_block;

        res := 'Numeric: ' || num_res || ', text: ' ||text_res;
        raise notice 'Final result: %', res;

    end;
end;

$$
    language plpgsql;


do $$
DECLARE
    res varchar;
BEGIN
    CALL complex_calculasion(5, 'hello', res);
end;
$$
    language plpgsql;