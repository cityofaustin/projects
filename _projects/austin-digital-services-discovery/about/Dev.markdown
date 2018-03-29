---
title: Dev
date: 2017-12-03 22:30:00 Z
position: 3
---

### Focus on Resident-facing Content

We’d previously been trying to iterate on both the author and resident interface at the same time. For now, we’re concentrating on making a great experience for residents. On the frontend, that means implementing our designers’ amazing designs (see the next section for more info on this). On the backend, we’re only concerned about creating an API that supports resident-facing needs.

![We’re focusing on the residents' needs and not the city of austin employee right now.](/uploads/focus_on_resident_ne_swni0.jpg)

We’re focusing on the right half of this image and not the left half.

### Implement Design v2

We have a whole new look for alpha.austin.gov! We spent a lot of time tinkering around with HTML and CSS to make the design team’s mockups come to life. An important part of this work was deciding on a common language to use between design and development. When the design team says “the TileGroup design has changed” we want to make sure everyone’s talking about the same TileGroup. This gives us a lot of continuity when doing design reviews and overall makes the design to dev handoff easier.

### Translating Content into 3 Languages

There are 2 types of content that need to be translated:

1. **Static content** such as a warning that austin.gov is an alpha site or the word airport when linking to our airport website
2. **Dynamic content** such as the text on a service page added by an author

Each of these has a different set of requirements and thus we have different solutions.

#### Static content
This data doesn’t change often and has a lot of overlap across pages. For instance, the phrase “Welcome to Austin, Texas” can be used in many different pages and we’re not likely to change the wording of it.

For these cases, we decided to use [React Intl]: (https://github.com/yahoo/react-intl) to generate translated content. We chose this because it has a lot of tools for creating translation files and has an intuitive API.

#### Dynamic content

This data is expected to change often and probably won’t be used across pages. For instance, if an author writes out the steps to pick up recycled paint, the content could change anytime the department changes their intake process. It’s also likely to only be used on 1 page.
For these cases, we decided to use [Django Modeltranslation]: (https://github.com/deschler/django-modeltranslation) to load and store generated content. We also evaluated [Wagtail Modeltranslation]: (https://github.com/infoportugal/wagtail-modeltranslation) but it doesn’t have support for translating text fields within streamfields and overall didn’t provide much advantage over using the Django version. We didn’t spend a lot of time evaluating other solutions because Django Modeltranslation is well used in the Django world and provided enough functionality for us to begin user testing.
