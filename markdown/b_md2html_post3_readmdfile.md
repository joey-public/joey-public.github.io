# Custom md2html: Reading Input from Markdown File

**Links:** [Previous Post][100]<----->[Next Post][101]

___

## Introduction

In the last post we ended with this in our `md2html.py` script. Notice the `markdown.markdown()` function is basically doing all the work for us. We just need to pass it a string representation of the markdown file we want to convert, and then save the html string it returns into a new html file. 

    import markdown
        
    md_str = '# Title \nhello world!'
    html = markdown.markdown(md_str)
    print(type(html))
    print(html)

In this post we will focus on updating our script to accept an input file as an argument from the command line. 

##  Creating a md file to read

First create a markdown file to test with. You can save it wherever you want. I am saving it in the same directory as the python script. 

    touch temp.md

Then open the file and copy this markdown that we can use to test that some of the basic things we want are working. 


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

In python if `__name__=='main'` is always run first. We use this ans pass the results of a `sys.argv()` call into our `main()` function. Then we create a function where we will later fill out to parse the input arguments, but for now we just have it print out the results of the `sys.arv()` call so we can see what that looks like. 

Running the script like this:

    python md2html.py ./temp.md

results in the following output:

    sys.argv()->['md2html.py', './temp.md']
    <class 'str'>
    <h1>Title</h1>
    <p>hello world!</p>

The `sys.argv()` function returns a list of strings. The first element in the list is the python program we are running. Then each element after that is an argument (separated by 1 blank space).

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

## Conclusion
In this section we added the ability to read in from a markdown file. Next time we will have our html converted string into its own file so that it can be viewed in any web browser. 

___

### Refrences

[0: sys Python Documentation][0]
[0]: https://docs.python.org/3/library/sys.html

[1: I/O with Python][1]
[1]: https://docs.python.org/3/tutorial/inputoutput.html

### Links

[Previous Post][100]
[100]: ./b_md2html_post2_writingthecode.html

[Next Post][101]
[101]: ./b_md2html_post4_generateoutfile.html
