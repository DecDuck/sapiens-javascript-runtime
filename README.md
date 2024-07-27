# Sapiens JavaScript Runtime
Well well well... Here we are.

JavaScript runs everywhere it's not supposed to. Here's the project that lets it run as a mod for the game Sapiens (https://playsapiens.com/).

## How to Use
The project is made of a few bits and bobs:
1. The runtime. This is a *heavily* modified version of the Lua components of CASTL (https://github.com/PaulBernier/castl). It's been modified so it works within the Sapiens Lua environment.
2. The transpiler. This is found here (link tba), and converts your JavaScript mod to something the Lua environment can execute (with a helping hand from the runtime).

## Why?? Are you insane??
Yes. 

## Is this actually viable for anything?
Yeah, totally! It works completely fine with other mods (you can just import with them with `require` statement) and should be able to do anything that Lua can do. 
