# Custom md2html: Starting to Code 

**Links:** [Previous Post][100]<------>[Next Post][101]

___

## Introduction

The last post explained how to create python environment for the project. 

In this post I will start the code for the md2html application. 

## Create the Script

First create the python file you want to edit:

```bash
touch md2html.py
```

Open this file in any text editor you want.

```bash
vim md2html.py
```

## Hello Markdown! 

First make sure that the `markdown` library is installed and that it is working. Inside the `md2tml.py` file copy the following code.

```Python
import markdown

md_str = r"""# Title
hello world!
"""

html = markdown.markdown(md_str)
print(type(html))
print(html)
```

The result from running your script should be:

```bash
<class 'str'>
<h1>Title</h1>
<p>hello world!</p>
```

The `markdown.markdown()` function converts an input string into an output string. The input string should be in markdown format, and then the output will be valid html code. 

Sending the output of m`md2html` program into a new html file `out.html` with the following command. 
```bash
python md2html.py > out.html
firefox out.html &
```

Opening out.html in any browser should show Hello World printed in a heading 1 style.  

## Conclusion

In the next post I will update the `md2html` script to read in a markdown file as an input argument.

___

### References

### Links

[Previous Post][100]
[100]:./b_md2html_post1_pythonsetup.html

[Next Post][101]
[101]:./b_md2html_post3_readmdfile.html

