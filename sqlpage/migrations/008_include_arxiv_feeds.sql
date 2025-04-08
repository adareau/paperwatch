INSERT OR IGNORE
INTO feeds(
    url,
    display_name,
    category,
    save_all,
    priority,
    field_date
) VALUES
    ('http://export.arxiv.org/rss/cond-mat',
    'arxiv:cond-mat',
    'arXiv',
    False,
    2,
    'published_parsed'),

    ('http://export.arxiv.org/rss/physics',
    'arxiv:physics',
    'arXiv',
    False,
    0,
    'published_parsed'),

    ('http://export.arxiv.org/rss/cond-mat.quant-gas',
    'arxiv:cond-mat.quant-gas',
    'arXiv',
    True,
    10,
    'published_parsed'),

    ('http://export.arxiv.org/rss/physics.atom-ph',
    'arxiv:physics.atom-ph',
    'arXiv',
    True,
    5,
    'published_parsed'),

    ('http://export.arxiv.org/rss/physics.optics',
    'arxiv:physics.optics',
    'arXiv',
    True,
    2,
    'published_parsed')
;
