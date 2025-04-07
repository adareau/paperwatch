--- ================= HEADER ====================
SELECT
    'dynamic' AS component,
    sqlpage.run_sql('auth.sql') AS properties,
    sqlpage.read_file_as_text('shell.json') AS properties;

--- ================= ACTIONS ====================

-- viewed paper
update papers set viewed=True where id=$viewed_paper_id;
-- unview paper
update papers set viewed=False where id=$unview_paper_id;
-- select paper
update papers set viewed=True, selected=True where id=$select_paper_id;
-- unselect paper
update papers set viewed=False, selected=False where id=$unselect_paper_id;


--- ================= BODY ====================

-- ==== CHECK PAPER STATUS
set papers_to_analyze = select count(*) from papers where analyzed = False;
set papers_to_review_selected = select count(*) from papers where viewed = False and total_score > 0;
set papers_to_review_all = select count(*) from papers where viewed = False;

-- ==== DISPLAY MESSAGE BOXES

-- new papers

set display_new_message_alert = ($papers_to_review_selected > 0
                                  and $viewed_paper_id is null
                                  and $select_paper_id is null);
select
    'alert'                    as component,
    format('%i newly selected papers to review.', $papers_to_review_selected) as title,
    'analyze'                  as icon,
    'teal'                     as color,
    TRUE                       as dismissible
where $display_new_message_alert;
select
    'papers.selected.sql'       as link,
    'View full list' as title
where $display_new_message_alert;

-- viewed paper

select
    'alert'                    as component,
    'Paper marked as viewed' as title,
    'eye'                  as icon,
    'blue'                     as color,
    TRUE                       as dismissible
from papers where id=$viewed_paper_id;
select
    'index.sql?unview_paper_id=' || id       as link,
    'Dismiss' as title
from papers where id=$viewed_paper_id;

-- selected paper

select
    'alert'                    as component,
    'Paper selected' as title,
    'rosette-discount-check'                  as icon,
    'purple'                     as color,
    TRUE                       as dismissible
from papers where id=$select_paper_id;
select
    'index.sql?unselect_paper_id=' || id       as link,
    'Dismiss' as title
from papers where id=$select_paper_id;

-- ==== LAST SELECTED PAPERS

select
    'list'                 as component,
    format('Freshly selected papers (%i)', $papers_to_review_selected) as title,
    TRUE                   as wrap,
    TRUE                   as compact
where $papers_to_review_all > 0;
select
    title            as title,
    'index.sql?select_paper_id=' || id as edit_link,
    'index.sql?viewed_paper_id=' || id as view_link,
    link as link,
    author_display as description_md,
    --'red'                       as color,
    format('hexagon-number-%i', total_score)   as icon

from papers
where viewed=False
and total_score > 0
order by total_score desc
limit 10;


-- ==== Display stats

select
    'card' as component,
    3      as columns;
select
    (select case when $papers_to_review_selected > 0
          then format('**%i selected papers to review**', $papers_to_review_selected)
          else 'no selected paper to review' end) as description_md,
    ($papers_to_review_selected > 0) as active,
    'green' as color,
    'tag-starred'       as icon;
select
    (select case when $papers_to_review_all > 0
          then format('%i new papers to review', $papers_to_review_all)
          else 'no paper to review' end) as description_md,
    ($papers_to_review_all > 0) as active,
    'blue' as color,
    'file-spark'       as icon;
select
    (select case when $papers_to_analyze > 0
          then format('%i papers waiting for analysis', $papers_to_review_all)
          else 'all collected papers are analysed' end) as description_md,
    ($papers_to_analyze > 0) as active,
    (select case when $papers_to_analyze > 0
          then 'orange'
          else 'green' end) as color,
    (select case when $papers_to_analyze > 0
          then 'alert-square-rounded'
          else 'checkbox' end) as icon;

-- ==== LAST HARVEST

set last_harvest_id = select max(id) from harvest;
set last_harvest_success = select success from harvest where id=$last_harvest_id;

select
    'datagrid' as component,
    'Last Harvest' as title;

-- date
select
    'Date' as title,
    timestamp as description
from harvest where id=$last_harvest_id;

-- status
select
    'Status' as title,
    (select case when $last_harvest_id is True
          then 'success'
          else 'error' end) as description,
    (select case when $last_harvest_id is True
          then 'green'
          else 'red' end) as color;

-- collected papers
select
    'parsed' as title,
    papers_collected as description
from harvest where id=$last_harvest_id;

-- new papers
select
    'new' as title,
    papers_collected_new as description
from harvest where id=$last_harvest_id;

-- link
select
    'see stats'          as description,
    'stats.harvest.sql?id=' || $last_harvest_id as link,
    'blue'                  as color,
    'device-desktop-analytics'     as icon;

select
    'alert'              as component,
    'Error'              as title,
    format("Errors parsing %i papers during last harvest.", papers_errors) as description,
    'alert-circle'       as icon,
    'red'                as color
from harvest where id=$last_harvest_id and papers_errors >0;

-- ==== LAST ANALYSIS

set last_analysis_id = select max(id) from analysis;
set last_analysis_success = select success from analysis where id=$last_analysis_id;

select
    'datagrid' as component,
    'Last Analysis' as title;

-- date
select
    'Date' as title,
    timestamp as description
from analysis where id=$last_analysis_id;

-- status
select
    'Status' as title,
    (select case when $last_analysis_id is True
          then 'success'
          else 'error' end) as description,
    (select case when $last_analysis_id is True
          then 'green'
          else 'red' end) as color;

-- collected papers
select
    'analyzed' as title,
    papers_analyzed as description
from analysis where id=$last_analysis_id;

-- new papers
select
    'selected' as title,
    papers_selected as description
from analysis where id=$last_analysis_id;

-- link
select
    'see stats'          as description,
    'stats.analysis.sql?id=' || $last_analysis_id as link,
    'blue'                  as color,
    'device-desktop-analytics'     as icon;
