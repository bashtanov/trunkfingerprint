create extension trunkfingerprint;

create table results(run int, fingerprint text);

insert into results values (
       1,
       trunkfingerprint.get_db_fingerprint(
              0,
              null,
              null,
              '{}',
              '{"(public,results)"}',
              '{}'
       )
);

create table bar(baz serial);

insert into results values (
       2,
       trunkfingerprint.get_db_fingerprint(
              0,
              null,
              null,
              '{}',
              '{"(public,results)"}',
              '{}'
       )
);

drop table bar;

insert into results values (
       3,
       trunkfingerprint.get_db_fingerprint(
              0,
              null,
              null,
              '{}',
              '{"(public,results)"}',
              '{}'
       )
);

select array_agg(run)
from results
group by fingerprint
order by 1;
