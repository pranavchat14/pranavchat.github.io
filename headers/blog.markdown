---
layout: page
title: Blog
permalink: /blog/
---

<ul>
{% for post in site.posts %}
  <li>
    <a href="{{ post.url | prepend: site.baseurl }}">{{ post.title }}</a>
    <small>posted on {{ post.date | date: "%B %d, %Y" }}</small>
  </li>
{% endfor %}
</ul>
