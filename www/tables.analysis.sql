--- ================= HEADER ====================
SELECT
    'dynamic' AS component,
    sqlpage.run_sql('header.auth.sql') AS properties,
    sqlpage.run_sql('header.shell.sql') AS properties;

--- ================= BODY ====================
select 'title' as component, 'log : analysis' as contents;

select
    'list'                 as component,
    TRUE                   as wrap,
    TRUE                   as compact

select
    timestamp as title,
    format("analyzed : %i | selected : %i"
    ,papers_analyzed
    ,papers_selected
    ) as description_md,
    "stats.analysis.sql?id=" || id as link,
    (select case when success is True
          then 'green'
          else 'red' end) as color

from analysis
order by id desc
limit 50
;
