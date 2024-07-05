# Custom md2html: Code Blocks and Latex Style Math Support 

**Links:** [Previous Post][100]

___

## Introduction

In the last section we finished a working script that converts a markdown input file into an output html file. 

In this section we will add an extension to the `markdown.markdown()` funciton, and we will also add a header to our `html_content_str` so that the javascript based mathjax engine is enabled. 

## Adding an extension

By default the `markdown` python library we are using only support the most basic markdown specification. This is actually pretty much all I need, but I will be adding one extra feature. The [fenced code blocks][0] extension can be added to our `md2html` script by editing the `markdown.markdown()` function call to include a second argument for extensions. For our purpose I like to define a constant for the extensions at the top of the python script right under the import statements:

```Python
import os 
import sys
import markdown

EXTENSIONS = ['fenced_code']
```

And then I simply edit the `markdown.markdown()` call like this:

```
html_content_str = markdown.markdown(md_content_str, extensions=EXTENSIONS)
```

This is the only extension I need for now. In fact all of the posts about this markdown generator were written in markdown, and converted to html with just this simple script. I am actually mainly writing all these to test out my markdown to html website workflow. 

The python markdown libray has robust support for custom extensions and a good list of already available extensions. In fact there are even some very solid [official extensions][1] supported.

## Adding Support for Math

If I am typing math, then I like to type it with latex. In the future I know I will like to be able to write math into my markdown files and have it render nicely in html. 

Mathjax is a javascript library for doing just this. Using `$..$` for inline math like this $a^2+b=4$ and `$$...$$` for math blocks like this:

$$
\int_a^b f(x) dx = F(a) - F(b)
$$

At first I tought I would need to use the mathjax plugin but then after a lot of time messing around I realized that...

**You can support mathjax without relying on any additional markdown extensions**

...The extension that currently exists is makes our markdown compatable with mathjax 2.*, but if your browser supports mathjax3 (it probably does) then you just need to add the proper script tags to the beginning of your html file. You can find the most up to date info in the [offical mathjax documentation][2], but for me the adding mathjax support as simple as definin another constant at the top of `md2html`:

```Python
MDX_HTML_HEADER = """
<header>
    <script id="MathJax-script" async
      src="https://cdn.jsdelivr.net/npm/mathjax@3.0.0/es5/tex-mml-chtml.js">
    </script>
    <script>
    MathJax = {
      tex: {
          inlineMath: [['$', '$'], ['\(', '\)']]
           }
    };
    </script>
</header>
"""
```

and then just addin this header to the fromt of my `html_content_str` before saving it to a file like this:

```Python
html_content_str = MDX_HTML_HEADER + html_content_str
```

## Conclusion

That is it! That is all I need! A simple script that can turn my markdown into html. It has exactly the features that I want it to have and no more! Now I plan to use this script to generate content for this site. As I use it if there are any feature I decide to add I may continue this series. 

Here is the final `md2html.py` script:

```Python
import sys
import os
import markdown

EXTENSIONS=['fenced_code']
MDX_HTML_HEADER = """
<header>
    <script id="MathJax-script" async
      src="https://cdn.jsdelivr.net/npm/mathjax@3.0.0/es5/tex-mml-chtml.js">
    </script>
    <script>
    MathJax = {
      tex: {
          inlineMath: [['$', '$'], ['\(', '\)']]
           }
    };
    </script>
</header>
"""

def _parse_args(argv:list)->list:
    usage_str = 'usage: python md2html.py <input.md>'
    n_args=len(argv)
    expected_n_args = 3
    if not(n_args==expected_n_args):
        print(f'Error: Arguments Incorrect:\n    {usage_str}')
        return []
    md_file_exisits = os.path.isfile(argv[1])
    md_file_valid = os.path.splitext(argv[1])[1]=='.md'
    if not(md_file_exisits): 
        print(f'Error: {argv[1]} md file does not exist:\n    {usage_str}')
        return []
    if not(md_file_valid):
        print(f'Error: {argv[1]} is not a md file:\n    {usage_str}')
        return []
    # make sure the html dir is valid and exists already
    html_dir_exists = os.path.isdir(argv[2])
    if not(html_dir_exists):
        print(f'Error: {argv[2]} is not an existing directory :\n    {usage_str}')
        return []
    #If we make it here we know both arguments are good
    md_file_str = argv[1]
    html_dir_str = argv[2]
    return [md_file_str, html_dir_str]

def _get_md_file_content(path:str)->str:
    with open(path, 'r', encoding='utf-8') as input_file:
        txt_str=input_file.read()
    return txt_str

def _save_html_file(path:str, content:str)->None:
    with open(path, 'w', encoding='utf-8', errors='xmlcharrefreplace') as output_file:
        output_file.write(content)

def md2html(md_file_path:str, html_dir:str)->None:
    md_content_str = _get_md_file_content(md_file_path)
    html_content_str = markdown.markdown(md_content_str, extension=EXTENSIONS)
    html_content_str = MDX_HTML_HEADER + html_content_str
    html_file_name = os.path.splitext(os.path.basename(md_file_path))[0]
    html_file_path = html_dir + html_file_name + '.html'
    _save_html_file(html_file_path, html_content_str)
    
def main(argv:list)->None:
    arg_list = _parse_args(argv)
    if arg_list == []: 
        print('Error while parsing input arguments')
        return 
    md_file_path = arg_list[0]
    html_dir = arg_list[1]
    md2html(md_file_path, html_dir)

if __name__=='__main__':
    main(sys.argv)
```

___

### Refrences

### Links

[Previous Post][100]
[100]: ./b_md2html_post4_generateoutfile.html
