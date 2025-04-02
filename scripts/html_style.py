# -*- coding: utf-8 -*-
"""
File    : paperwatch
Author  : A. Dareau

Comments: defines HTML styles for paperwatch
"""

# %% Shared patterns

summary = "<li> <a class='feed' target='_blank' href='%s'>[%s] </a> : selected %i of %i </li> \n"

# %% Main result page

main_header = """<html>
                <head>
                <style>
                    a:link    {color:blue; background-color:transparent; text-decoration:none}
                    a:visited {color:#660000; background-color:transparent; text-decoration:none}
                    a.title:link    {color:#000000; background-color:transparent; text-decoration:none}
                    a.title:visited {color:##3B0B17; background-color:transparent; text-decoration:none}
                    a.url:link    {color:#424242; background-color:transparent; text-decoration:none}
                    a.url:visited {color:#660000; background-color:transparent; text-decoration:none}
                    a.feed:link    {color:#000000; background-color:transparent; text-decoration:none}
                    a.feed:visited    {color:#000000; background-color:transparent; text-decoration:none}

                </style>
                </head>
                <body>
                <h1> PaperWatch results for %s </h1>
             """
main_footer = "</body></html>"

main_feedname = """<h2><a class="title" target="_blank" href="%s">%s</a></h2>

                """
main_feedfooter = "</ul>"
# %% Category result page

cat_header = """<html>
                <head>
                <style>
                    a:link    {color:blue; background-color:transparent; text-decoration:none}
                    a:visited {color:#660000; background-color:transparent; text-decoration:none}
                    a.title:link    {color:#000000; background-color:transparent; text-decoration:none}
                    a.title:visited {color:##3B0B17; background-color:transparent; text-decoration:none}
                    a.url:link    {color:#424242; background-color:transparent; text-decoration:none}
                    a.url:visited {color:#660000; background-color:transparent; text-decoration:none}
                    a.feed:link    {color:#000000; background-color:transparent; text-decoration:none}
                    a.feed:visited    {color:#000000; background-color:transparent; text-decoration:none}
                </style>
                </head>
                <body>
                <h1> Papers from %s, dated %s </h1>
             """
cat_footer = "</body></html>"

cat_feedname = """<h2>%s</h2>
                  <ul>
                """
cat_feedfooter = "</ul>"
selected_entry = """ <li>
                </font><font size="+1">
                   <a class="title" target="_blank" href="%s">
                            %s
                   </a>
                </font><br/>
			   <font color="blue">%s</font><br/>
			 <ul>
              <font size="-1">
              <li><i> Date  :</i> <b> %s </b></li>
              <li><i> Score  :</i> <b> %i </b></li>
			<li><i> Keywords  :</i> <b> %s </b></li>
              </font>
			</ul>
		  </li>
		  <br/>
           """

small_entry = """ <li> <a class="title" target="_blank" href="%s">%s</a><br/>
			         <font size="-1">%s</font><br/>
                       </li><br/>
                  """
