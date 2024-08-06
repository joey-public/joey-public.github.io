# Custom md2html: Creating an Output html File

**Links:** [Previous Post][100]<----->[Next Post][101]

___

## Introduction
In this post I will talk about how to save a string into a file with python. This way ourmd to html converter can actually save its output.  

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


## Conclusion
In this post we finished a minimal viable product for a simple markdwonn to html converter script. In the next section we will add few more features to improve the tool. 

The whole script so far is pasted below:

    import sys
    import os
    import markdown
    
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
    
    def _get_md_file_content(path:str)->str:
        with open(path, 'r', encoding='utf-8') as input_file:
            txt_str=input_file.read()
        return txt_str
    
    def _save_html_file(path:str, content:str)->None:
        with open(path, 'w', encoding='utf-8', errors='xmlcharrefreplace') as output_file:
            output_file.write(content)
    
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
    
    if __name__=='__main__':
        main(sys.argv)

___

### Refrences

### Links

[Previous Post][100]
[100]: ./b_md2html_post3_readmdfile.html

[Next Post][101]
[101]: ./b_md2html_post5_mathsupport.html
