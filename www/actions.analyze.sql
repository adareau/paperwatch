--- ================= HEADER ====================
select
    'dynamic' as component,
    sqlpage.run_sql('header.auth.sql') as properties;

--- ================= ACTIONS ====================

set _ = sqlpage.exec('./__venv__/bin/python3', './scripts/paper_analyzer');

select
    'redirect' as component,
    '/' as link;
