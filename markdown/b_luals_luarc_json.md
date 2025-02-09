# How to make lua_ls work with love2D

Create a `.luarc.json` file in the root of you lua project directory. Paste the following into it:

```
{
  "Lua.workspace.checkThirdParty": "Apply",
  "runtime.version": "LuaJIT",
  "runtime.special": {
    "love.filesystem.load": "loadfile"
  },
  "workspace.library": ["${3rd}/love2d/library"]
}
```
