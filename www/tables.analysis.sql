--- ================= HEADER ====================
SELECT
    'dynamic' AS component,
    sqlpage.run_sql('auth.sql') AS properties,
    sqlpage.read_file_as_text('shell.json') AS properties;

--- ================= BODY ====================
select 'title' as component, 'log : analysis' as contents;

select
    'table' as component,
    True as sort,
    True as search,
    True as small;

select
    *
from analysis;
