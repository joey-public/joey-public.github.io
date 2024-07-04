# Custom md2html: A Simple markdown to html Tool

**Links:** [Next Post][101]

___

## Introduction

I want to create a custom tool to convert markdown notes into HTML files that can be viewed in the browser. This will be a simple tool, and the goal is more to learn and practice some python coding. 

If you are looking for a tool that just works then you should really consider using [`pandoc`][0]. You can use this tool to convert your markdown files into `.html`, `.pdf`, `.docx`, or almost any format you can imagine. I have used it before and it is an excellent tool and much much better than anything I could possibly make. 

Still I like to work on little projects and I think it would be fun to implement my own custom tool for this task that does just exactly what I want it to do and nothing more. 

I plan to make a few blog posts about this project to get it into a basic working state. Once the tool is workable then I will use it to do all of the markdown to html conversion for posts on my site! As I use the tool if there are features I wish it had, I will try to add them one by one and do my best to also create a blog post for each new feature. 

## Requirements 

To get started lets define the most basic requirements of the tool:

- Run from command line `python md2html <input_md_file_path> <output_html_dir>`
- Take in a plane text markdown file and convert it to a html file that can be rendered in any browser 
- Support for basic Markdown Syntax 
    - for Headers, paragraphs, bullet lists, numbered lists, code blocks, bold, italic
- Support for math 
    - Using `$...$` for inline math and `$$...$$` for a math block
- Support for inline HTML
    - As a fallback for anything we want to be in the html file that is not simple to represent in a markdown file (eg tables)

## Conclusion

In this post we introduced the project ideas for a markdown to html converter tool, and defined the basic requirements we want the tool to have.

In the next post I will cover setting up a python environment.
___


### References

[Pandoc Website][0]
[0]: https://pandoc.org/

[Python Markdown docs][1]
[1]: https://python-markdown.github.io/

[Markdown Refrence Guide][2]
[2]: https://daringfireball.net/projects/markdown/

### Links

[Next Post][101]
[100]: ./b_md2html_post1_pythonsetup.html
