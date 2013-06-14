---
layout: default
title : Nymote Blog
header : Blog

group: nav
navtitle: Blog
navlink: blog
navweight: 3
---
{% include JB/setup %}

{% for post in site.posts limit:5 %}
<div class="page-header">
  <h1><a class="post-title" href="{{ BASE_PATH }}{{ post.url }}">{{ post.title }}</a></h1>{% if post.tagline %}<h2><small>{{post.tagline}}</small></h2>{% endif %}
  <!-- <div class="date">
      <span>{{ post.date | date_to_long_string }}</span>
  </div> -->
</div>

<div class="row-fluid post-full">
  <div class="span12">
    <div class="content">
      {{ post.content }}
      <div class="date">
        <span>{{ post.date | date_to_long_string }}</span>
      </div>
      <a href="{{ BASE_PATH }}{{ post.url }}/#share-comment">Share / Comment</a>
    </div>
    <hr>
  </div>
</div>  
{% endfor %}

<div class="row-fluid post-full">
    <h3><a href="{{ BASE_PATH }}{{ site.JB.archive_path }}">More posts</a></h3>
</div>