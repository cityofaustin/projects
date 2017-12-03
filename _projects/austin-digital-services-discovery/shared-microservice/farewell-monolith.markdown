---
title: Farewell, Monolith
date: 2017-11-15 05:10:00 Z
position: 0
---

## Too big to fail

The current Austintexas.gov exemplifies a monolithic architecture: A single platform — codebase, database, and user interface — contains all the functionality and content for the entire website. In addition to the standard content management system (CMS) functionality — text editing, user roles and permissions, and workflow tools — it also incorporates site search, forms, calendars, and other functionalities through the implementation of "modules" specifically developed for our CMS. 

When the site was initially built, this plug-and-play model was widely used thanks to popular CMSs such as Wordpress and Drupal that offered numerous extensions. As the site has grown, however, we’ve experienced the downside to this approach: Because the logic, interface, and content model is so intertwined, it has been hard to extend and maintain. When a single functionality — digital forms, for instance — breaks or stops meeting our needs, it is difficult to extract it from the entire platform and replace it with an improved solution. There are numerous points of failure, any one of which can bring down the entire site — a classic "too big to fail" situation.

## Microservices for the win

In the past several years, private-sector companies like Uber and Netflix have demonstrated the benefits of an alternative — a polylithic microservice approach to create a modular and flexible platforms. **Each microservice is a small, autonomous service focused on doing one thing well.** They interact with the rest of the system via APIs, so they can be independently developed and deployed without breaking other components.

![Diagram of coupling explained in next paragraph](/uploads/mono-vs-poly-min.png)
*In a monolithic architecture, the editor interface, user interface, data access layer, business logic layer, and database are all components of a single platform. A polylithic architecture has the editor interface, data access, and CMS business logic connected to the CMS database, and leverages APIs to connect that component to the public interface and integrate additional microservice functionalities.* 

The benefits of microservice architectures, adapted below from the excellent O’Reilly book *[Building Microservices](http://shop.oreilly.com/product/0636920033158.do)*, include:

* **Technical heterogeneity** - Allowing a team to use the right tool for each job and adopt modern technologies more quickly. 

* **Resilience** - Ensuring that if one component fails, the rest of the system continues to function. 

* **Scaling** - Enabling services to scale individually to meet real time demands and control costs.

* **Safety and speed** - Instead of a risky and time-consuming full-system release, microservices can be developed, tested, and deployed individually.

* **Organizational alignment** - Empowering small teams to work on codebases that tie directly to their business functions.

* **Composability** - Creating opportunities to remix and reuse functionality to serve different needs.

With these models in mind, we’ve chosen to pursue a microservice architecture to deliver the City’s digital services: We are choosing a CMS based on the content creation and content management needs we identified in our [content workflow research](http://projects.austintexas.io/projects/austin-digital-services-discovery/city-services-workflow/discovery/). It will be decoupled from the public-facing user interface, so that we can use a framework especially suited to delivering a robust and intuitive user experience to residents. Finally, functionality such as event registration and mapping tools will be handled by microservices. This way, we’ll build a polylithic platform that can evolve according to user needs and leverage innovative technologies as they become available. 

[We've chosen to tackle digital forms](http://projects.austintexas.io/projects/austin-digital-services-discovery/shared-microservice/why-forms/), an essential component of our online service delivery, to pilot our microservice approach.
