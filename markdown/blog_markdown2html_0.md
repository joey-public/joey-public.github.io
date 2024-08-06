# Custom Markdown to HTML Converter

## Introduction

I want to create a custom tool to convert markdown notes into HTML files that can be viewed in the browser. This will be a simple tool, and the goal is more to learn and practice some python coding. 

If you are looking for a tool that just works then you should really consider using [`pandoc`][0]. You can use this tool to convert your markdown files into `.html`, `.pdf`, `.docx`, or almost any format you can imagine. I have used it before and it is an excellent tool and much much better than anything I could possibly make. 

I plan to make a few posts about this project to get it into a basic working state. Once the tool is workable then I will use it to do all of the markdown to html conversion for posts on my site! As I use the tool if there are features I wish it had, I will try to add them one by one and do my best to also create a blog post for each new feature. 

## Requirements 

To get started lets define the most basic requirements of the tool:

- Run from command line `python md2html <input_md_file_path> <output_html_dir>`
- Take in a plane text markdown file and convert it to a html file that can be rendered in any browser 
- Support for basic Markdown Syntax 
    - for Headers, paragraphs, bullet lists, numbered lists, code blocks, bold, italic
- Support for math 
    - Using `$...$` for inline math and `$$...$$` for a math block
- Support for inline HTML
    - As a fallback for anything we want to be in the html file that is not simple to represent in a markdown file.

## Setting up a Python Virtual Environment

The first step is to create a python enviornment so we are not installing libraries to our main python installation. 

To create an environment named `myenv` in the `~/PythonEnvs/` directory type the following into your terminal on Linux:

```
mkdir ~/PythonEnvs
cd ~/PythonEnvs
python3 -m venv myenv
```

Now to activate the newly created environment:

```
source ~/PythonEnvs/myenv/bin/activate
```

With this new environment active, update pip and install all the python packages needed for the project.

```
python -m pip install --upgrade pip
python -m pip install markdown
```

## Using sys.arv() to Get Command Line Arguments

In the first post of this series I stated that we should be able to call out md2html too like this:

    python md2html <input_md_file_path> <output_html_dir>

Right now we will work on getting the `<input_md_file_path>` argument passed into our program. To pass arguments we can create a main funciton in our python program and pass in the `sys.argv` list. That will look something like this. 

    import sys 
    import markdown
    
    def _parse_args(argv:list)->list:
        print(f'sys.arv()->{argv}')
    
    def main(argv:list)->None:
        _parse_args(argv)
        md_str = r"""# Title
        hello world!
        """
        html = markdown.markdown(md_str)
        print(type(html))
        print(html)
    
    if __name__=='__main__':
        main(sys.argv)

In python if `__name__=='main'` always runs first. Here it simply passes the results of a `sys.argv()` into the `main()` function. The `_parse_args()` function prints the results of the `sys.arv()` call. For now the `main()` function creates a markdown formatted string, then uses the `markdown.markdown()` function to convert it into html. The results of the conversion are printed to verify the functionality of the library.  

Run the script like this:

    python md2html.py ./temp.md

results in the following output:

    sys.argv()->['md2html.py', './temp.md']
    <class 'str'>
    <h1>Title</h1>
    <p>hello world!</p>

Observe that the `sys.argv()` function returns a list of strings. The first element in the list is the python program we are running. Then each element after that is an argument (separated by 1 blank space).

## Parsing the Arguments

The `_parse_args()` function should take in the `sys.argv()` results, check that they are valid, and return them if they are. In this case we want to make sure exactly 1 argument is passed and that it is a valid path to an existing markdown file. Import the `os` library and we can do the argument parsing like this. 

    import os
    
    #return a list containing the parsed args if they are valid, or else an empty list
    def _parse_args(argv:list)->list:
        usage_str = 'usage: python md2html.py <input.md>'
        #first make sure we have exactly 1 input argument
        n_args=len(argv)
        expected_n_args = 2
        if not(n_args==expected_n_args):
            print(f'Error: Arguments Incorrect:\n    {usage_str}')
            return []
        #next check that it is a file that exists and that it ends with the .md extension
        md_file_exisits = os.path.isfile(argv[1])
        md_file_valid = os.path.splitext(argv[1])[1]=='.md'
        if not(md_file_exisits): 
            print(f'Error: {argv[1]} md file does not exist:\n    {usage_str}')
            return []
        if not(md_file_valid):
            print(f'Error: {argv[1]} is not a md file:\n    {usage_str}')
            return []
        #if we made it here then we have a good md file path that we can return 
        md_file_path = argv[1]
        return [md_file_str]

Now if we accidentally run the program without passing in a markdown file, or if we have a type in the markdown file path, the `_parse_args()` function should catch that and tell us. 

## Reading in the Markdown File

Now lets head back to our `main()` function add a check to make sure valid arguments were passed and then actually read the contents of the markdown file. 

    def main(argv:list)->None:
        arg_list = _parse_args(argv)
        if arg_list == []: 
            print('Error while parsing input arguments')
            return 
        md_file_path = arg_list[0]
        with open(md_file_path, 'r', encoding='utf-8') as input_file:
            md_content_str = input_file.read()
        html = markdown.markdown(md_content_str)
        print(md_content_str)

If you run the `md2html.py` script now you should see that the content of the `temp.md` file we created is stored in the `md_content_str`. 

## Final Touch ups
Personally I prefer to separate the file reading into its own function to keep the `main()` function very simple to read. Then our full script up to this point should look something like this:

    import sys
    import os
    import markdown
    
    def _parse_args(argv:list)->list:
        usage_str = 'usage: python md2html.py <input.md>'
        n_args=len(argv)
        expected_n_args = 2
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
        md_file_str = argv[1]
        return [md_file_str]
    
    def _get_md_file_content(path:str)->str:
        with open(path, 'r', encoding='utf-8') as input_file:
            txt_str=input_file.read()
        return txt_str
    
    def main(argv:list)->None:
        arg_list = _parse_args(argv)
        if arg_list == []: 
            print('Error while parsing input arguments')
            return 
        md_file_path = arg_list[0]
        md_content_str = _get_md_file_content(md_file_path)
        print(md_content_str)
        html_content_str = markdown.markdown(md_content_str)
    
    if __name__=='__main__':
        main(sys.argv)

## Updated arg Parsing

In the last section we programmed the `_parse_args()` function to verify we had a valid input markdown file. Now we want to make sure we have a second argumet. We want the second argument to be the directory/folder where we want to store the output html. 

Update the `_parse_args()` funciton to look like this:
    
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
        html_dir_exists = os.path.isdir(argv[2])
        if not(html_dir_exists):
            print(f'Error: {argv[2]} is not an existing directory :\n    {usage_str}')
            return []
        md_file_str = argv[1]
        html_dir_str = argv[2]
        return [md_file_str, html_dir_str]

## Create a Save Funciton

Next create a save function that take in a file path and a content string and saves it to the onto the computer. This functino will look very similar to the `_get_md_file_content()` funciton from the last post. 

    def _save_html_file(path:str, content:str)->None:
        with open(path, 'w', encoding='utf-8', errors='xmlcharrefreplace') as output_file:
            output_file.write(content)

## Update the main Function

Finally we just need to update the `main()` function to get the passed html directory, generate an html file path based on the passed markdown file, generate the html content string, and save it to a file. 

    def main(argv:list)->None:
        arg_list = _parse_args(argv)
        if arg_list == []: 
            print('Error while parsing input arguments')
            return 
        md_file_path = arg_list[0]
        md_content_str = _get_md_file_content(md_file_path)
        html_content_str = markdown.markdown(md_content_str)
        html_dir = arg_list[1]
        html_file_name = os.path.splitext(os.path.basename(md_file_path))[0]
        html_file_path = html_dir + html_file_name + '.html'
        _save_html_file(html_file_path, html_content_str)

## Testing it all Together

Now things get exciting! with the fill code we have so far we should be able to generate our first html file and view it in a web browser!

first lets create a directory to save all of our markdown files, and then run our script:

    mkdir ./html
    python md2html.py ./temp.md ./html

look inside the html folder and you should see the generate `temp.html` file! open this in the web browser and you should see a properly formatted html file. 


## Adding Support for Math

If I am typing math, then I like to type it with latex. In the future I know I will like to be able to write math into my markdown files and have it render nicely in html. 

Mathjax is a javascript library for doing just this. Using `$..$` for inline math like this $a^2+b=4$ and `$$...$$` for math blocks like this:

$$
\int_a^b f(x) dx = F(a) - F(b)
$$

At first I tought I would need to use the mathjax plugin but then after a lot of time messing around I realized that...

**You can support mathjax without relying on any additional markdown extensions**

...The extension that currently exists is makes our markdown compatable with mathjax 2.*, but if your browser supports mathjax3 (it probably does) then you just need to add the proper script tags to the beginning of your html file. You can find the most up to date info in the [offical mathjax documentation][2], but for me the adding mathjax support as simple as definin another constant at the top of `md2html`:

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

    html_content_str = MDX_HTML_HEADER + html_content_str

## Conclusion

That is it! That is all I need! A simple script that can turn my markdown into html. It has exactly the features that I want it to have and no more! Now I plan to use this script to generate content for this site. As I use it if there are any feature I decide to add I may continue this series. 

Here is the final `md2html.py` script:

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
