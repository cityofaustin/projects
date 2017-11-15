---
title: Farewell, Monolith
date: 2017-11-15 05:10:00 Z
---

The current Austintexas.gov exemplifies a monolithic architecture: A single platform — codebase, database, and user interface — contains all the functionality and content for the entire website. In addition to the standard content management system functionality — text editing, user roles and permissions, and workflow tools — it also incorporates site search, forms, calendars, and other functionalities through the implementation of "modules" specifically developed for our CMS. 

When the site was initially built, this plug-and-play model was widely used thanks to popular CMSs such as Wordpress and Drupal that offered numerous extensions. As the site has grown, however, we’ve experienced the downside to this approach: Because the logic, interface, and content model is so intertwined, it has been hard to extend and maintain. When a single functionality — digital forms, for instance — breaks or stops meeting our needs, it is difficult to extract it from the entire platform and replace it with an improved solution. There are numerous points of failure, any one of which can bring down the entire site — a classic "too big to fail" situation.

In the past several years, private-sector companies like Uber and Netflix have demonstrated the benefits of an alternative — a polylithic microservice approach to create a modular and flexible platforms. **Each microservice is a small, autonomous service focused on doing one thing well.** They interact with the rest of the system via APIs, so they can be independently developed and deployed without breaking other components.

Once we decided to pilot a microservice approach, we [chose to tackle digital forms](http://projects.austintexas.io/projects/austin-digital-services-discovery/shared-microservice/why-forms/) — an essential component of our online service delivery. 
