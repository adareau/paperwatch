--- ================= HEADER ====================
SELECT
    'dynamic' AS component,
    sqlpage.run_sql('header.auth.sql') AS properties,
    sqlpage.run_sql('header.shell.sql') AS properties;

--- ================= ACTIONS ====================

-- viewed paper
update papers set viewed=True where id=$viewed_paper_id;
-- select paper
update papers set viewed=True, selected=True, date_selected=date() where id=$select_paper_id;

-- view all
update papers set viewed=True where $view_all=1 and total_score>0 and viewed=False;
-- select all
update papers set viewed=True, selected=True, date_selected=date() where $select_all=1 and total_score>0 and viewed=False;

--- ================= BODY ====================
set papers_to_review_selected = select count(*) from papers where viewed = False and total_score > 0;

set card_content="%s ```%s```

[mark as viewed](papers.selected.sql?viewed_paper_id=%i)  |  [select](papers.selected.sql?select_paper_id=%i)  | [details](papers.details.sql?id=%i)"

set card_footer="keywords:%i | authors:%i | %s"

-- == TITLE
select 'title' as component, 'papers : freshly selected' as contents;

select 'text' as component,
(select case when $papers_to_review_selected > 0
             then format("**%i** new papers to review today.", $papers_to_review_selected)
                 else "No new paper to review

⏭️ maybe you want to [check all collected papers](papers.new.sql)"
    end) as contents_md;

-- == LIST
select
    'card'                     as component,
    1                          as columns;
select
    title            as title,
    link as link,
    format($card_content, author_display, feed_display_name, id, id, id) as description_md,
    (select case when authors_score > 0 then 'red'
                 when total_score > 1 then 'green'
                 else 'gray'
    end) as color,
    format($card_footer, keywords_score, authors_score, keywords_tags) as footer_md,
    (select case when authors_score > 0 then 'user-hexagon'
                 else format('hexagon-number-%i', total_score)
    end) as icon

from papers
where viewed=False
and total_score > 0
order by
    authors_score desc,
    total_score desc
;

select
    'button' as component
where $papers_to_review_selected>0;
select
    'papers.selected.sql?select_all=1'     as link,
    'azure' as outline,
    'Select ALL'  as title,
    'rosette-discount-check'  as icon
where $papers_to_review_selected>0;
select
    'papers.selected.sql?view_all=1'      as link,
    'danger' as outline,
    'Mark ALL as viewed' as title,
    'eye'  as icon
where $papers_to_review_selected>0;
