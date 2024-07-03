# Using Python Create a Custom Markdown to HTML tool

I want to create a custom tool to convert markdown notes into HTML files that can be viewed in the browser. This will be a simple tool, and the goal is more to learn and practice some python coding. 

If you are looking for a tool that just works then you should really consider using `pandoc`. You can use this tool to convert your markdown files into `.html`, `.pdf`, `.docx`, or almost any format you can imagine. I have used it before and it is an excellent tool and much much better than anything I could possibly make. 

Still I like to work on little projects and I think it would be fun to implement my own custom tool for this task that does just exactly what I want it to do and nothing more. 

I plan to make a few blog posts about this project to get it into a basic working state. Once the tool is workable then I will use it to do all of the markdown to html conversion for posts on my site! As I use the tool if there are features I wish it had, I will try to add them one by one and do my best to also create a blog post for each new feature. 

So to get started lets list out some of the basic requirements for our tool:

- Support for basic Markdown Syntax
- Support for inline HTML
- Support for math 

In the next post I will cover [Setting up a python enviornment](./b_md2html_post1_pythonsetup.md)
___
### References

[Pandoc Website][0]
[0]: https://pandoc.org/

[Python Markdown docs][1]
[1]: https://python-markdown.github.io/

[Markdown Refrence Guide][2]
[2]: https://daringfireball.net/projects/markdown/
