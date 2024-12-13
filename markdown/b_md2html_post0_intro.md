# Custom md2html: A Simple Markdown to html Tool

**Links:** [Next Post][101]

___

## Introduction

I want to create a custom tool to convert markdown notes into HTML files that can be viewed in the browser. The goal is more to learn and practice some python coding. 

If you are looking for a tool that just works then you should consider using [`pandoc`][0]. You can use this tool to convert your markdown files into `.html`, `.pdf`, `.docx`, or almost any format you can imagine. It is an excellent tool. 

## Requirements 

To get started lets outline some most basic requirements of the tool:

- Run from command line `python md2html <input_md_file_path> <output_html_dir>`
- Take in a plane text markdown file and convert it to a html file that can be rendered in any browser 
- Support for basic Markdown Syntax 
    - for Headers, paragraphs, bullet lists, numbered lists, code blocks, bold, italic
- Support for math 
    - Using `$...$` for inline math and `$$...$$` for a math block
- Support for inline HTML
    - As a fallback for anything we want to be in the html file that is not simple to represent in a markdown file.

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
[101]: ./b_md2html_post1_pythonsetup.html
