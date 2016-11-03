# City of Austin (GitHub) Pages

**Pages** automatically publishes content from multiple GitHub repositories to a single [GitHub Pages site][pages]. (If you just want to see what we’ve published, [head there][pages].)

[pages]: http://pages.austintexas.io

## Motivation

[GitHub Pages] is awesome, but for simple documentation sites written in [Markdown], configuring and theming [Jekyll] can present a cumbersome barrier to entry. Multiply that by every repository from multiple teams in a large organization, and you can end up with lots of inconsistency between styles and templates. Even worse, individual sites don’t link to one another, so there’s no good way to navigate between everything your organization has published to GitHub.

This project is a response to those problems. Everything related to configuring and theming Jekyll is shared in a single repository (this one), so that teams editing individual sites only need to worry about what’s important: their content. They push Markdown, and Pages publishes it. Everything ends up on [one site][pages] with sensible high-level navigation to aid discovery.

[GitHub Pages]: https://pages.github.com
[Markdown]: https://guides.github.com/features/mastering-markdown/
[Jekyll]: https://help.github.com/articles/using-jekyll-as-a-static-site-generator-with-github-pages/

## Adding Content to Pages

If you’re a member of a City of Austin team interested in publishing content to [Pages] and/or GitHub, there’s lots of people who would love to help you make it happen. [Check out the Pages guide to get started](http://pages.austintexas.io/guides/pages/).

Discussions and questions are welcome and encouraged—please [open an issue].

[open an issue]: https://github.com/cityofaustin/pages/issues/new

## Hat Tip

The idea (and name) for Pages came from [@18F]’s [pages.18f.gov], which has been a great resource and inspiration for the work we’re doing in Austin. Pages also uses the [U.S. Web Design Standards][uswds] developed by 18F. :tophat::heart:

[@18F]: https://github.com/18F
[pages.18f.gov]: https://pages.18f.gov
[uswds]: https://standards.usa.gov

## For Developers

The magic behind Pages is… [Git submodules]. When a submodule’s repo is updated, GitHub dispatches a webhook to an AWS Lambda [function]; if the webhook indicates a push to master, the function kicks off a CI build, and CI runs a [deploy script] to push the latest submodule ref to the [gh-pages branch].

<!-- TODO Add a README about Lambda to api/? -->

There’s also some [complicated Liquid][nav] to generate recursive navigation from submodules that contain only Markdown and folders, so we don’t need to configure navigation per-site (see [#1]).

[Git submodules]: https://git-scm.com/book/en/v2/Git-Tools-Submodules
[function]: api/index.js
[deploy script]: api/deploy.sh
[gh-pages branch]: https://github.com/cityofaustin/pages/commits/gh-pages
[nav]: _includes/nav.html
[#1]: https://github.com/cityofaustin/pages/pull/1

### Contributing

Contributors should use the Git Workflow described in the [Developer Guide].

[Developer Guide]: http://pages.austintexas.io/guides/developer-guide/git/

### Usage

Pages runs locally like any other GitHub Pages/Jekyll site:

```
$ git clone https://github.com/cityofaustin/pages.git && cd pages
$ git submodule update --init
$ bundle install
$ jekyll serve
```

* [Jekyll docs](https://jekyllrb.com/docs/home/)
* [GitHub Pages docs](https://help.github.com/pages/)

### Adding Submodules

Use the “Clone with HTTPS” URL of the submodule repo (not the `git@github.com` SSH URL).

The navigation logic presently expects each submodule to be added within a top-level folder (like [projects/](projects) or [guides/](guides)), at the path where it should render. For example, to add the [Developer Guide][dev-guide-repo] at `/guides/developers/`, you would run:

```
git submodule add https://github.com/cityofaustin/developer-guide.git guides/developers
```

Once a Pull Request containing the new submodule has been merged, a Pages maintainer will set up the webhook on the submodule repo (requires a security token not shared here).

It’s typically not necessary to manually push submodule changes to this repo, but if you want to do so in a topic branch, please use `git submodule update --remote` to update all submodules.

[dev-guide-repo]: https://github.com/cityofaustin/developer-guide

### Previewing

If you’re running Pages locally in order to preview submodule content, you may `cd` into the submodule and use it as you would any git repo (including switching branches, adding commits, and so on). Use this command to run Jekyll from within the submodule:

```
../../bin/jekyll serve --source=../../
```

This is recommended only for debugging specific content. To edit content normally, clone the submodule repo directly.
