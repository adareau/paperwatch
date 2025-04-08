INSERT OR IGNORE
INTO feeds(
    url,
    display_name,
    category,
    save_all,
    field_date
) VALUES
    ('http://export.arxiv.org/rss/cond-mat',
    'arxiv:cond-mat',
    'arXiv',
    False,
    'published_parsed'),

    ('http://export.arxiv.org/rss/physics',
    'arxiv:physics',
    'arXiv',
    False,
    'published_parsed'),

    ('http://export.arxiv.org/rss/cond-mat.quant-gas',
    'arxiv:cond-mat.quant-gas',
    'arXiv',
    True,
    'published_parsed'),

    ('http://export.arxiv.org/rss/physics.atom-ph',
    'arxiv:physics.atom-ph',
    'arXiv',
    True,
    'published_parsed'),

    ('http://export.arxiv.org/rss/physics.optics',
    'arxiv:physics.optics',
    'arXiv',
    True,
    'published_parsed')
;
