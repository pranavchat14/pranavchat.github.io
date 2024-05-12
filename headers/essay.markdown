---
layout: page
title: Essays
permalink: /essays/
---

Welcome to my essay page! Here you will find a list of all essays:

<ul>
{% for essay in site.essays %}
  <li>
    <a href="{{ essay.url | prepend: site.baseurl }}">{{ essay.title }}</a>
    <small>posted on {{ post.date | date: "%B %d, %Y" }}</small>
  </li>
{% endfor %}
</ul>
