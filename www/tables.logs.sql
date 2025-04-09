--- ================= HEADER ====================
SELECT
    'dynamic' AS component,
    sqlpage.run_sql('header.auth.sql') AS properties,
    sqlpage.run_sql('header.shell.sql') AS properties;

--- ================= BODY ====================

select 'title' as component, 'log : global' as contents;

select
    'table' as component,
    True as sort,
    True as search,
    True as small;

select
    *
from log;
