# Title 

**Links:** [Previous Post][100]<------>[Next Post][101]

## Introduction

In this series of blog posts I want to document my progression as I design and update my own personal website. In this post I will brainstorm the features I want in my website. 

I want to keep things as simple as possible, including avoiding using any form of website generators. I like making things from scratch as much as is reasonable, this way I can learn more, get first some practice programming new things, and build exactly the tools I want and need. 

If nothing else I will just walk away with an appreciation for why I should use a site generator like [Jekyll][0] or [hugo][1]. 

## Requirements

- I can Host the site on GitHub pages
- Blog Style Pages should be written in Markdown then converted to html 
    - Be able to generate the website with a single command line call
- Styling can be manually with css style sheets. 
- Any more complicated pages can be manually written with html/css. 
- Minimal to no JavaScript so I can learn basic HTML and CSS to start

## Hosting the site 

I host this site using [Github Pages][0]. This is an easy and free way to host the website directly from its github repository and is a great fit for my goals. 

## Folder Structure 

The file structure of my site will look like this:

    my_site
    ----index.html
    ----markdown/
    ----html/
    ----images/
    ----templates/

## Naming Conventions 

I should come up with a strict naming convention for files so that its easy to organize everything. For starters:

- `index.html` is the main entry point for the site
- All markdown files go in the markdown directory and follow a naming convention like this: `<type_id>_<series_name>_<post#>_<note>.md` 
    - `type_id` is a code for the type of page, for example `b` for a blog post
    - `series name` is the name of the topic this series of pages is about
    - `post#` defines the post number on the topic
    - `note` is an optional description of the file
- All html files go in the html directory and have the same name as the markdown file that they were generated from, but with an html file extension

I should make another post sometime to flesh out the file naming conventions as far as what `type_ids` I want to include for now here is a super short idea list

- `b`$\rightarrow$ a blog 
- `t`$\rightarrow$ a tutorial 
- `g`$\rightarrow$ a playable game
- `s`$\rightarrow$ a story
- `n`$\rightarrow$ a note 

## Build System 

As I mentioned I want to make my own build system for this website. My plan is to use a custom `siteGen.py` script to generate my website. 

The most critical function of this script is: 

- Read all the markdown files in the sites markdown directory and then convert them to html documents. 

Some other cool features I can think of off the top of my head are

- Enforcing the file naming convention 
- Checking all the md files for spelling and grammar mistakes 
- Helping fix broken links on the website

So the basic steps in my build process will be:

1. run `siteGen.py`
1. use `git` to add and commit changes
1. use `git` to push my new code to my repo making like on the site

If I use a [`Makefile`][3] for this process I should be able to set couple rules for building and not pushing if I just want to look at the webpages locally before making them live. 

## Conclusion

___

### Refrences

[0: Jekyll Main Webpage][0]
[0]: https://jekyllrb.com/

[1: Hugo Main Webpage][1]
[1]: https://gohugo.io/ 

[2: Github Pages Site][2]
[2]: https://pages.github.com/

[3: Makfile Tutorial][3]
[3]: https://endler.dev/2017/makefiles/

### Links 

[Previous Post][100]
[100]: 

[Next Post][101]
[101]: 
