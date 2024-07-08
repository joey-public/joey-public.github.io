# Custom md2html: Environment Setup 

**Links:** [Previous Post][100]<------>[Next Post][101]

___

## Introduction

In the previous post I created a list of the requirements for the custom markdown to html tool that I am creating.  

In this blog post I will cover how to setup my environment for this project. 

## Setting up a Python Virtual Environment

It is a good idea to create a virtual environment when starting a new python environment. 

This [YouTube video][0] gives a great introduction to using the built in `venv` module in python if you want to learn more. 

I am working on a machine with Ubuntu 20.04 LTS so all of the instructions here assume that you are on a Linux machine with a bash shell. If you have another operating system or shell the general steps are the same, but the exact commands might differ. 

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

Next with this new environment active, update pip and install all the python packages needed for the project. In this case the `markdown` library is the only library needed. 

```
python -m pip install --upgrade pip
python -m pip install markdown
```

Next create a `requirements.txt` file that can be used to re-setup this exact environment. 

```
python -m pip freeze > requirements.txt
```

To install these packages into another python environment like this: 

```
python -m pip install -r requirements.txt 
```

Finally to deactivate the environment just use the following command:

```
deactivate
```

___

### References:

[0: Python Programmer Venv Video][0]
[0]:https://www.youtube.com/watch?v=28eLP22SMTA&t=99s

### Links

[Previous Post][100]
[100]: ./b_md2html_post0_intro.html

[Next Post][101]
[101]: ./b_md2html_post2_writingthecode.html
