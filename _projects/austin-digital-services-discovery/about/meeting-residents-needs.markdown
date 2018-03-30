---
title: Meeting Residents Needs
date: 2017-12-03 22:30:00 Z
position: 2
---

### Structure alpha.austin.gov to reflect residents’ needs

![Ashlee Harris, Laura Trujillo, and Celine Thibault mapping existing services to conceptual information architecture.](/uploads/map_services.jpg)

Today, our information architecture resembles partner team’s Mass.gov website. When we were just starting out rethinking how a new website could better serve residents, we looked to dozens of other cities, states, and international teams who have done this work before. An additional helpful resource is the [Responsive Web Design podcast series](https://responsivewebdesign.com/tag/government/) produced by Karen McGrane and Ethan Marcotte. We also tried something really different that helped us think about what people really needed rather than thinking about what we could provide.

![Mapping existing city services to labels that reflect residents’ well-being.](/uploads/existing_services.jpg)

We reviewed psychological frameworks like Maslov’s Hierarchy of Needs and [Carol Ryff’s Six-factor Model of Psychological Well-being](www.aging.wisc.edu/midus/findings/pdfs/830.pdf) and created service labels like “Learning, working, and growing in Austin” that could contribute to a resident’s sense of purpose. We quickly drafted an initial, high-level information architecture that we began testing with residents using card sorting where residents revealed which labels or navigational buckets worked and which ones didn’t.

Since then, our team has gained more insight into the complexity of Austin services and digital content and so the information architecture and content model have evolved to support a wide range of potential services. We’ll continue to test and iterate on how digital services are organized on alpha.austin.gov based on our observations of Austin residents using the new site. 
One of our senior designers recently recommended grouping content by resident goal in the future. It’s something we’re not ready for now, and will be informed by our continued work with residents, but also feels similar to our initial exploration around navigation related to a person’s well-being and that’s exciting.

#### Looking at the big picture
Our goal is to work with every city departments to team them how to develop and maintain their City of Austin digital services. We haven’t evaluated all services or worked with every team-- yet. We’re one of the first teams working to evaluate City of Austin digital content holistically and we want to make sure that this process is sustainable. Alpha.austin.gov will eventually support a diverse range of services ranging from Pay for parking ticket to Apply for Housing Assistance to Apply for a business permit. As we partner with more departments, evaluate existing services, and identify service gaps–the site architecture, tools we use, and templates will evolve. An important part of that work is setting the expectation that the information architecture, page templates, and content model can and should evolve to accommodate new content and support residents’ needs.

### Resident experience, usability testing, and accessibility
Each resident’s experience on alpha.austin.gov relies on their ability to access, read, see, and hear service content. We’re building up our capacity to write, design, and build accessible services.
#### Big picture ways we focus design and development work on accessibility

##### Coach authors to write people-oriented content: 
The first step to making our website more usable is writing simpler, more accessible content. We're doing that through our [funshops](/city-services-workflow/funshops/)

##### Make text and icons legible:
we check the contrast and size of our typeface to make sure people experiencing lower vision or perceive colors differently can use City of Austin digital services.

##### Provide alternative text for images and more:
If a resident cannot see an image, alternative text can provide that information or feeling in a more flexible format.

##### Give the resident control:
Cities embody hundreds of services making navigation, buttons, and other controls vital to getting residents to and enabling them to use services. Alpha.austin.gov is designed to simplify the choices a residents has to make to discover new services or use services to accomplish a goal.

##### Tools we use in design and development

* [Colorable](http://jxnblk.com/colorable/demos/text/) for checking color contrast of text on background
* If you’d rather do that work in [Sketch](https://www.sketchapp.com/) directly, there’s several tools. I like [Color Contrast Checker](https://github.com/getflourish/Sketch-Color-Contrast-Analyser) well enough though it leaves a lot to be imagined in terms of user experience.

#### Accessibility informs design
In a recent alpha.austin.gov mockup, when a resident hovered over a menu item like “Housing & Utilities”–the submenu dropped down, displaying topics like “Recycling, Trash, and Compost”. Also, the primary indicator that someone hovered over an item was the menu item turning an orange-red. One of our developers brought up two reasons why this design created a challenging user experience:

* First, color is a good visual tool to show change but it is not the only one and can make it difficult for some people to notice the state change. 
* Second, to make sure all content can be accessed using a keyboard and complies with screen readers, we moved away from a hover state that opens a submenu.

We modified the design designed new website navigation. We opted to use underline to show that a resident is hovering over a navigation item. Instead of prompting the submenu to drop down while hovering over a menu item, we gave the resident control to click to open the submenu. This is just one way we’re using accessibility to inform design decisions.

#### Testing over technology

![T is an Austin resident testing alpha.austin.gov services in March.](/uploads/tien_testing.jpg)

There’s lots of technology and tools for evaluating accessibility, but the best way to design accessible digital services is to usability test services with residents who experience low vision, hearing loss, who rely on screen readers and other assistive technologies. This requires preparation, relationship building, mobility, and resources that can be hard to come by in city government. We’re still working on our ability to test with residents with a diverse range of experiences, backgrounds, and lifestyles. Our primary test method is Think Aloud. We sit down with residents, give them a little background on who we are, and try to help them feel as comfortable as possible. We share our prototype and ask them to use it to complete a goal and to “think out loud” while doing it so we can observe obstacles, system failures, or to learn something new about how residents perceive information. In March, we’re testing translated services with residents who read Arabic, Spanish, and Vietnamese. [Read our test plan here](https://docs.google.com/document/d/1m9C4tzDlwsqehDJkcRBLQI3NjCHrbCGYmj5J9QxLhLc/edit).

We’re beginning to structure our sprints around testing to make sure our entire team knows the details of our test plan and how our work maps to that plan. Apart from making sure we’re documenting dependencies across our work, resident usability testing motivates everyone on our team around a shared goal of improving services.

#### Design and Dev

##### Use a component-based frontend
Design of reusable components can start early on. First, when you’re sketching wireframes from a user scenario. Looking at a residents’ experience across a set of website pages, not one page on its own–we can see where a resident might expect to find the same buttons or calls-to-action, form, or contact information.

![Laura Trujillo sketching a resident’s experience discovering public pools on City of Austin’s website](/uploads/laura_storyboarding.jpg)

Moving into Sketch, we use symbols to build reusable components. Using symbols forces us to think through implementing the same reusable component or module across different templates the same way a developer needs to when building a website. We gather to review designs in preparation for development. This is a valuable exercise for design-development collaboration, but it also means we’re developing a website with a streamlined set of components.

![Mateo Clarke participates in a design review](/uploads/design_dev.jpg)

One of the most valuable places for streamlining components is in a design and development review, where both teams are thinking critically on how to avoid unnecessary duplicate content types. In the photo above, one of our designers partnered with two developers to breakdown our most recent design update into a small set of components. 

Now that we’ve begun working with our own set of components, we’re beginning to carve out a place for them to be accessed and kept up to date and shared across teams via a storybook. Once our storybook is up, we’ll have more to share.
