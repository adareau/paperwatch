INSERT OR IGNORE
INTO feeds(
    url,
    display_name,
    category,
    save_all,
    priority
) VALUES
    ('http://feeds.aps.org/rss/allsuggestions.xml',
    'APS:editor-suggestion',
    'APS',
    False,
    10
    ),
    ('http://feeds.aps.org/rss/topics/ultracoldgases.xml',
    'APS:ultra-cold gases',
    'APS',
    True,
    9
    ),
    ('http://feeds.aps.org/rss/recent/rmp.xml',
    'APS:RMP',
    'APS',
    False,
    0
    ),
    ('http://feeds.aps.org/rss/recent/pra.xml',
    'APS:PRA',
    'APS',
    False,
    0
    ),
    ('http://feeds.aps.org/rss/recent/prl.xml',
    'APS:PRL',
    'APS',
    False,
    0
    ),
    ('http://feeds.aps.org/rss/recent/prx.xml',
    'APS:PRX',
    'APS',
    False,
    0
    )
;

UPDATE feeds
set
   field_doi="prism_doi",
   field_date="updated_parsed"
where category="APS";
