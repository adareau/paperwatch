INSERT OR IGNORE
INTO feeds(
    url,
    display_name,
    category,
    field_date
) VALUES
    ('http://export.arxiv.org/rss/cond-mat',
    'arxiv:cond-mat',
    'arXiv',
    'published_parsed'),

    ('http://export.arxiv.org/rss/physics',
    'arxiv:physics',
    'arXiv',
    'published_parsed'),

    ('http://export.arxiv.org/rss/cond-mat.quant-gas',
    'arxiv:cond-mat.quant-gas',
    'arXiv',
    'published_parsed'),

    ('http://export.arxiv.org/rss/physics.atom-ph',
    'arxiv:physics.atom-ph',
    'arXiv',
    'published_parsed'),

    ('http://export.arxiv.org/rss/physics.optics',
    'arxiv:physics.optics',
    'arXiv',
    'published_parsed')
;
