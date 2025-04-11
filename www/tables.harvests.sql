--- ================= HEADER ====================
SELECT
    'dynamic' AS component,
    sqlpage.run_sql('header.auth.sql') AS properties,
    sqlpage.run_sql('header.shell.sql') AS properties;

--- ================= BODY ====================
select 'title' as component, 'log : harvests' as contents;

select
    'list'                 as component,
    TRUE                   as wrap,
    TRUE                   as compact

select
    timestamp as title,
    format("collected : %i | saved : %i | errors : %i"
    ,papers_collected
    ,papers_collected
    ,papers_errors
    ) as description_md,
    "stats.harvest.sql?id=" || id as link,
    (select case when success is True
          then 'green'
          else 'red' end) as color

from harvest
order by id desc
limit 50
;
