--- ================= REDIRECT IF PAPER DOES NOT EXIST ====================
set id = select id from papers where id=$id;
select
    'redirect' as component,
    '/' as link
where $id is null;
--- ================= HEADER ====================
SELECT
    'dynamic' AS component,
    sqlpage.run_sql('header.auth.sql') AS properties,
    sqlpage.run_sql('header.shell.sql') AS properties;

--- ================= ACTION ====================
--- select / unselect
update papers set selected=True where id=$id and $select=1;
update papers set selected=False where id=$id and $unselect=1;
--- view / unview
update papers set viewed=True where id=$id and $view=1;
update papers set viewed=False where id=$id and $unview=1;
--- ================= BODY ====================

--- MAIN INFOS
select
    'title' as component,
    title as contents
from papers where id=$id;

select
    'text' as component,
     author_display as contents_md
from papers where id=$id;

select
    'text' as component,
    link as contents_md
from papers where id=$id;

select
    'alert'     as component,
    'Summary' as title,
    summary as description,
    'black' as color
    from papers where id=$id and summary <> "";

--- BUTTONS
select
    'button' as component
    from papers where id=$id;
select
    TRUE      as narrow,
    (select case when selected then 'yellow'
                 else 'white'
    end) as color,
    (select case when selected then format("papers.details.sql?id=%i&unselect=1", $id)
                 else format("papers.details.sql?id=%i&select=1", $id)
    end) as link,
    'star' as icon,
    (select case when selected then 'Selected (unselect)'
                 else 'Not selected (select)'
    end) as tooltip
from papers where id=$id;
select
    TRUE      as narrow,
    (select case when viewed then 'green'
                 else 'white'
    end) as color,
    (select case when viewed then format("papers.details.sql?id=%i&unview=1", $id)
                 else format("papers.details.sql?id=%i&view=1", $id)
    end) as link,
    (select case when viewed then 'eye'
                 else 'eye-closed'
    end) as icon,
    (select case when selected then 'Viewed (unview)'
                 else 'Not viewed (view)'
    end) as tooltip
from papers where id=$id;

--- PAPER DETAILS
select
    'datagrid' as component
    from papers where id=$id;
select
    'published' as title,
    date_published    as description
    from papers where id=$id;
select
    'doi' as title,
    doi    as description
    from papers where id=$id;
select
    'feed' as title,
    feed_display_name    as description,
    feed_url as link
    from papers where id=$id;

--- SCORE
select
    'datagrid' as component
    from papers where id=$id;
select
    'analyzed' as title,
    analyzed    as description
    from papers where id=$id;
select
    'score' as title,
    total_score    as description
    from papers where id=$id;
select
    'keywords' as title,
    keywords_tags    as description
    from papers where id=$id;
select
    'followed authors' as title,
    followed_authors    as description
    from papers where id=$id;


--- DB ENTRY DETAILS
select
    'title'   as component,
    'Database entry info' as contents,
    3         as level;
select
    'datagrid' as component
    from papers where id=$id;
select
    'id' as title,
    $id    as description;
select
    'added on' as title,
    date_added    as description
    from papers where id=$id;
select
    'harvest id' as title,
    harvest_id    as description
    from papers where id=$id;
select
    'analysis id' as title,
    analysis_id    as description
    from papers where id=$id;
