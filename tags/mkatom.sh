#!/bin/bash
#
# "$@" are all the arguments
#

for TAG in "$@"
do
    LTAG="$(echo ${TAG} | tr '[:upper:]' '[:lower:]')"

echo "---
layout: nil
title : Atom Feed
---
<?xml version=\"1.0\" encoding=\"utf-8\"?>
<feed xmlns=\"http://www.w3.org/2005/Atom\">
  <title>{{ site.title }} - '$TAG'</title>
  <link href=\"{{ site.production_url }}/tags/$LTAG-atom.xml\" rel=\"self\"/>
  <link href=\"{{ site.production_url }}\"/>
  <subtitle>{{ site.tagline }}</subtitle>
  <updated>{{ site.time | date_to_xmlschema }}</updated>
  <id>{{ site.production_url }}/tags/#$LTAG</id>
  <author>
    <name>{{ site.author.name }}</name>
    <email>{{ site.author.email }}</email>
  </author>
  {% for post in site.tags.$LTAG %}
    {% include amc/atom_entry.xml %}
  {% endfor %}
</feed>" > $LTAG-atom.xml
done

# Notes:
# The TAG from the argument is saved in lower-case (LTAG)
# and the rest of the script simply writes a file using
# the liquid templates. Jekyll will then fill in the 
# content to complete the atom feed
