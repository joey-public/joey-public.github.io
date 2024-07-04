# Custom md2html: Environment Setup 

**Links:** [Previous Post][100]<------>[Next Post][101]

___

## Introduction

In the last post I setup a gti repository and python environment for the project. 

In this post I will start the code for the md2html application. 

## Create our script

First clone the git repository from github, then move into that directory. For me that's: 

```bash
cd ~
git clone git@github.com:joey-public/MyScripts.git  
cd MyScripts
```

Now create the python file you want to edit:

```bash
touch md2html.py
```

Open this file in any text editor you want. I like to use vim:

```bash
nvim md2html.py
```

## Hello Markdown! 

First lets just make sure that we have the `markdown` library and that it is working. Inside the `md2tml.py` file copy the following code.

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

We can see that `markdown` import is working and that the `markdown.markdown()` function call is successfully converting our input markdown style string into valid html code. 

We can also see that the `markdown()` function returns a string to us containing html code. It is up to the user to decide what to do with that string. 

Lets try one more quick trick in this post. Try sending the output of m`md2html` program into a new html file we will call `out.html`. Then open the html file in your browser of choice. I will use Firefox and call it from the terminal, but you should also be able to click the `out.html` file inside of any file browser. 

```bash
python md2html.py > out.html
firefox out.html &
```

You should be able to see your file rendering in the browser! Note the `<class 'str'>` inside of `out.html` is not needed and you can delete that line, but it does not really matter much since this is just a demonstration. 

## Conclusion

In this Post I created our script and generated our first html file! In the next post I will update the `md2html` script to read in a markdown file as an input argument.

___

### References

### Links

[Previous Post][100]
[100]:./b_md2html_post1_pythonsetup.html

[Next Post][101]
[101]:./b_md2html_post3_readmdfile.html

