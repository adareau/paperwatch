--- ================= HEADER ====================
SELECT
    'dynamic' AS component,
    sqlpage.run_sql('header.auth.sql') AS properties,
    sqlpage.run_sql('header.shell.sql') AS properties;

--- ================= ACTION ====================
-- select / unselect
update papers set selected=True where id=$select_id;
update papers set selected=False where id=$unselect_id;

-- set feed as viewed
update papers set viewed=True where feed_id=$feed_id and $view_all=1;
--- ================= DATA ====================

set first_unread_feed = select DISTINCT feed_display_name
                        from papers
                        where viewed=False and analyzed=True and total_score=0
                        order by feed_display_name collate NOCASE
                        limit 1;

-- select first unread feed if no feed is selected
set selected_feed = ifnull($selected_feed, $first_unread_feed)

set paper_number = select count(*)
                   from papers
                   where viewed=False
                   and analyzed=True
                   and total_score=0
                   and feed_display_name=$selected_feed;

set feed_id = select id from feeds where display_name=$selected_feed

--- ================= BODY ====================

-- TITLE
select 'title' as component,
        format("[%s]", $selected_feed) as contents
where $paper_number>0;

select 'title' as component,
        "No new paper to check" as contents
where $paper_number=0;

select 'title' as component,
        2 as level,
        format("%i new papers to check", $paper_number) as contents
where $paper_number>0;

select 'text' as component,
        "⏭️ maybe you want to [check your selection ?](papers.user_selected.sql)" as contents_md
where $paper_number=0;


-- FEED SELECTION FORM

select 'form' as component,
        'papers.new.sql' as action,
        'get' as method,
        True as auto_submit
where $paper_number>0;

select
    'selected_feed' as name,
    'Feed' as label,
    'select' as type,
    $selected_feed as value,
    (select json_group_array(json_object('label', feed_display_name, 'value', feed_display_name))
    from (
        select DISTINCT feed_display_name
        from papers
        where viewed=False and analyzed=True and total_score=0
        order by feed_display_name collate NOCASE
      )) as options
where $paper_number>0;


-- PAPER DISPLAY
set paper_content= "%s[<b><font color='#182433'> %s </font></b>](%s)<br/>
%s <br/>
[%s](papers.new.sql?%s=%i&selected_feed=%s) | [details](papers.details.sql?id=%i)
";

select 'text' as component;

select
    format(
            $paper_content,
            (select case when selected then '✓'
                 else ' '
            end),
            title,
            link,
            author_display,
            (select case when selected then 'unselect'
                 else 'select'
            end),
            (select case when selected then 'unselect_id'
                 else 'select_id'
            end),
            id,
            sqlpage.url_encode($selected_feed),
            id
    ) as unsafe_contents_md
from papers
where viewed=False
and analyzed=True
and total_score=0
and feed_display_name=$selected_feed;

-- READ ALL

select
    'button' as component
where $paper_number>0;

select
    'papers.new.sql?view_all=1&feed_id=' || $feed_id  as link,
    'danger' as outline,
    'Mark ALL as viewed' as title,
    'eye'  as icon
where $paper_number>0;
