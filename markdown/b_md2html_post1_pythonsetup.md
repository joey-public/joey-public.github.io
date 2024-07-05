# Custom md2html: Environment Setup 

**Links:** [Previous Post][100]<------>[Next Post][101]

___

## Introdution

In the previous post I created a list of the requirements for the custom markdown to html tool that I am creating.  

In this blog post I will cover how to setup my environment for this project. 

## Create a git Repository on GitHub

The first thing I do whenever I start a new code project is to create a git repository on GitHub for it. Then I clone the empty repository to my computer. 

## Setting up a Python Virtual Environment

If you have never used a python virtual environment, then you should really check it out.

This [YouTube video][0] gives a great introduction to using the built in `venv` module in python if you want to learn more. 

I am working on a machine with Ubuntu 20.04 LTS so all of the instructions here assume that you are on a Linux machine with a bash shell. If you have another operating system or shell the general steps are the same, but the exact commands might differ. 

Anyways to create an environment named `myenv` int the `~/PythonEnvs/` directory type the following into your terminal on Linux:

```
mkdir ~/PythonEnvs
cd ~/PythonEnvs
python3 -m venv myenv
```

Now to activate the newly created environment:

```
source ~/PythonEnvs/myenv/bin/activate
```

Next with this new environment active we can update pip and install all the python packages we will need for this project. We should only need the `markdown` library. 

```
python -m pip install --upgrade pip
python -m pip install markdown
```

For good measure we can create a `requirements.txt` file that can be used to setup this exact environment on any other computer you might be on. 

```
python -m pip freeze > requirements.txt
```

Now we can install these packages into another python environment like this: 

```
python -m pip install -r requirements.txt 
```

Finally if you want to deactivate the environment just use the following command:

```
deactivate
```

## Conclusion
In this post we got our git respository and python enviornment set. In the ['../html/']
___

### References:

[0: Python Programmer Venv Video][0]
[0]:https://www.youtube.com/watch?v=28eLP22SMTA&t=99s

### Links

[Previous Post][100]
[100]: ./b_md2html_post0_intro.html

[Next Post][101]
[101]: ./b_md2html_post2_writingthecode.html
