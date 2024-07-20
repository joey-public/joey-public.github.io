# SDL Notes

## Steps to display something on the screen with SDL

In order to display an image on your screen with SDL you must follow the following general steps:

1. Initialize SDL 
1. Create a valid SDL window
1. Create a valid SDL Renderer(optional as you can blit surfaces directly , but you usally want this)
1. Load an image into a `SDL_Surface`
1. Convert into a `SDL_Surface` into an optimized `SDL_Surface` or into a `SDL_Texture`
    - see the Surfaces vs Textures section for more info
    - THis is also technically optional as you can blit a raw surface to your window, but I don't think there are many practial reasons to do that
1. Free the old raw SDL_Surface is no longer needed
1. Clear the Screen
1. Render the texture
1. Destroy the Texuture, Renderer, and Window
1. Quit SDL

## Global variables

In a lot of tutorials the author makes the a global `SDL_Window` and `SDL_Renderer`. This saves some time for a quick small program, but I think it would make it pretty difficult to debug larger programs. For that reason I will try to rewrite example ode to not use any global variables. 

## The Window 

The `SDL_Window` is basically a container for everything you want to display on the screen. 

## Screen 
## Surfaces vs Textures 

SDL defines both `SDL_Surface` and `SDL_Texture` for rendering images to your screen. 

For a good description of thier difference see this [stack overflow post][1].

- `SDL_Texture`: Is allows for **hardware**(GPU) rendering of an image. Basically stores your image in VRAM and uses whater GPU to render the images very quickly. 
- `SDL_Surface`: Is uses **software**(CPU) rendering of an image. Stores the image data in normal RAM. 

Normally its best to use the `SDL_Texture` for the increased rendering spees, but if you need direct memory acess to the image you are displaying you may want to consider `SDL_Surface` .

## Game Loop

pikuma has an excellent tutorial on youtube explaining makeing a game loop in C using the SDL library. He explains what he is doing and why, instead of just showing code with little explination. 

He actually covers everything from installing SDL all the way to implementing a simple game loop. The first 30 minutes are a bit slow, but that is almost all just talking about how to setup SDL on a windows computer. If you are on linux it is a very quik setup. 




## Renderer


### References 

[LazyFoo Tutorials][0]
[0]: https://lazyfoo.net/tutorials/SDL/index.php
 
[Stack Overflow SDL_Texture vs SDL_Surface][1]
[1]:  https://stackoverflow.com/questions/21392755/difference-between-surface-and-%20texture-sdl-general

[Stack Overflow SDL_Window, SDL_Renderer, SDL_Surface, and SDL_Texture][2]
[2]:https://stackoverflow.com/questions/21007329/what-is-an-sdl-renderer/21007477#21007477  

[YouTube pikuma Game Loop with SDL Tutorial][3]
[3]: 
