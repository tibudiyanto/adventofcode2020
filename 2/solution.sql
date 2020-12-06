.import input input

-- first half
with t (nmin, nmax, el, pass) as (
    select 
    cast (substr(value, 0, instr(value, '-')) as INT) nmin, 
    cast (substr(value, instr(value, '-') + 1, instr(value, ' ') - instr(value, '-') -1)  as INT) nmax,
    substr(value, instr(value, ':') - 1, 1) el,
    substr(value, instr(value, ':') + 2, length(value)) pass
    from input
)

select count(*) from t where length(t.pass) - length(replace(t.pass, t.el, ''))  between nmin and nmax;

-- second half
with t (first_pos, second_pos, el, pass) as (
    select 
    cast (substr(value, 0, instr(value, '-')) as INT) first_pos, 
    cast (substr(value, instr(value, '-') + 1, instr(value, ' ') - instr(value, '-') -1)  as INT) second_pos,
    substr(value, instr(value, ':') - 1, 1) el,
    substr(value, instr(value, ':') + 2, length(value)) pass
    from input
)

select count(*) from t where cast(substr(pass, first_pos, 1) = el as boolean) <> cast (substr(pass, second_pos, 1) = el as boolean);





