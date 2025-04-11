--- ================= HEADER ====================
SELECT
    'dynamic' AS component,
    sqlpage.run_sql('header.auth.sql') AS properties,
    sqlpage.run_sql('header.shell.sql') AS properties;

--- ================= BODY ====================

select 'title' as component, 'All papers' as contents;

select
    'button' as component;
select
    'papers.all.sql'     as link,
    'primary' as color,
    'reset' as title;

set limit = ifnull($limit, 50)

--- ---------------- SELECTION FORM ----------------
select
    'form'            as component,
    true as auto_submit,
    'get' as method,
    'papers.all.sql' as action;
select
    'select' as type,
    'selected' as name,
    4 as width,
     $selected as value,
    '[{"label": "all", "value": ""}, {"label": "yes", "value": "1"}, {"label": "no", "value": "0"}]' as options;
select
    'select' as type,
    'authors_score' as name,
    'only followed auth' as label,
    4 as width,
     $authors_score as value,
    '[{"label": "no", "value": ""}, {"label": "yes", "value": "1"}]' as options;
select
    'total_score_min' as name,
    'min score' as label,
    4 as width,
     $total_score_min as placeholder;
select
    'select' as type,
    'order_by' as name,
    'order by' as label,
    4 as width,
     $order_by as value,
    '[{"label": "title", "value": "title"},
     {"label": "date of publication", "value": "date_published"},
     {"label": "date of selection", "value": "date_selected"},
     {"label": "total score", "value": "total_score"},
     {"label": "authors score", "value": "authors_score"}]' as options;
select
    'select' as type,
    'asc' as name,
    'order' as label,
    4 as width,
     $asc as value,
    '[{"label": "ascending", "value": "1"},
     {"label": "descending", "value": "0"}]' as options;
select
    'select' as type,
    'limit' as name,
    'limit' as label,
    4 as width,
     $limit as value,
    '[{"label": "10", "value": "10"},
     {"label": "20", "value": "20"},
     {"label": "50", "value": "50"},
     {"label": "100", "value": "100"},
     {"label": "500", "value": "500"}]' as options;

select
    'authors_search' as name,
    'search in authors' as label,
    6 as width,
     $authors_search as value;

select
    'title_search' as name,
    'search in title' as label,
    6 as width,
     $title_search as value;

--- ---------------- PAPER LIST ----------------
select
    'list'                 as component,
    TRUE                   as wrap,
    True                   as compact;

set description_fmt = "%s ```%s```

_[%s]_ score : %i  | authors : %i
"
select
    -- title            as title,
    -- 'index.sql?select_paper_id=' || id as edit_link,
    'papers.details.sql?id=' || id as view_link,
    link as link,
    title as title,
    format($description_fmt
            ,author_display
            ,feed_display_name
            ,substring(date_published,0,11)
            ,total_score
            ,authors_score
            ) as description_md,
    (select case when authors_score > 0 then 'red'
                 when total_score > 1 then 'green'
                 else 'gray'
    end) as color

from papers
where
    selected = if($selected is null or $selected = "", selected, $selected)
and authors_score >= if($authors_score is null or $authors_score = "", 0, $authors_score)
and total_score >= if($total_score_min is null or $total_score_min = "", 0, $total_score_min)
and lower(author) like if($authors_search is null or $authors_search = "", "%", "%" || lower($authors_search) || "%")
and lower(title) like if($title_search is null or $title_search = "", "%", "%" || lower($title_search) || "%")
order by
    case when $order_by = 'title' and $asc=1 then title end asc,
    case when $order_by = 'title' and $asc=0 then title end desc,
    case when $order_by = 'date_published' and $asc=1 then date_published end asc,
    case when $order_by = 'date_published' and $asc=0 then date_published end desc,
    case when $order_by = 'date_selected' and $asc=1 then date_selected end asc,
    case when $order_by = 'date_selected' and $asc=0 then date_selected end desc,
    case when $order_by = 'total_score' and $asc=1 then total_score end asc,
    case when $order_by = 'total_score' and $asc=0 then total_score end desc,
    case when $order_by = 'authors_score' and $asc=1 then authors_score end asc,
    case when $order_by = 'authors_score' and $asc=0 then authors_score end desc,
    case when $order_by is null then title end
limit $limit;
