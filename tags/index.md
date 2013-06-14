---
layout: page
title: Tags
header: Posts By Tag
---
{% include JB/setup %}

<ul class="tag_box inline">
  {% assign tags_list = site.tags %}  
  {% include amc/tags_list %}
</ul>
<hr>

{% for tag in site.tags %} 
  <h2 id="{{ tag[0] }}">{{ tag[0] }}</h2>
  <ul>
    {% assign pages_list = tag[1] %}  
    {% include JB/pages_list %}
  </ul>
{% endfor %}
