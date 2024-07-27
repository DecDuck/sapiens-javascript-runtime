# Sapiens JavaScript Runtime

Well well well... Here we are.

JavaScript runs everywhere it's not supposed to. Here's the project that lets it run as a mod for the game Sapiens (https://playsapiens.com/).

## How does it work?

The project is made of a few bits and bobs:

1. The runtime. This is a _heavily_ modified version of the Lua components of CASTL (https://github.com/PaulBernier/castl). It's been modified so it works within the Sapiens Lua environment.
2. The transpiler. This is found here (https://github.com/DecDuck/sapiens-javascript-transpiler), and converts your JavaScript mod to something the Lua environment can execute (with a helping hand from the runtime).

## Why?? Are you insane??

Yes.

## Is this actually viable for anything?

Yeah, totally! It works completely fine with other mods (you can just import with them with `require` statement) and should be able to do anything that Lua can do.

## Getting started

1. Create a new directory for your mod
2. Run the following command for your preferred package manager:

- `npm`: `echo @sapiens:registry=https://lab.deepcore.dev/api/v4/projects/41/packages/npm/ >> .npmrc`
- `yarn`: `echo \"@sapiens:registry\" \"https://lab.deepcore.dev/api/v4/projects/41/packages/npm/\" >> .yarnrc`

3. Install the package with:

- `npm`: `npm i @sapiens/spjs`
- `yarn`: `yarn add @sapiens/spjs`

4. Create a `spjs.json`:

```json
{
  "src": "./src",
  "build": "./build",
  "overlay": "./overlay",
  "modinfo": {
    "name": "My New JavaScript Mod",
    "description": "A fancy description for my mod. You can use\nto create linebreaks btw.",
    "version": "1.0.0-js",
    "website": "https://my-js-mod.dev",
    "developer": "Me"
  }
}
```

- `src` is the location of your JavaScript, relative to the `scripts` dir (you don't have to include it).
- `build` is where the tool will generate your mod
- `overlay` is the directory to copy on top of your mod at the end of compilation (useful for assets)
- `modinfo` contains the information for the generated modinfo

5. Run `spjs` to generate your mod:
 - `npm`: `npm run spjs`
 - `yarn`: `yarn spjs`

6. Done!

If you're using Typescript, at the top of all of your scripts, use `import "@sapiens/spjs"` to import the necessary types. Then, `export default myModule;` so Sapiens can access your code. 

If you're using JavaScript, assign your module to `exports.default` to export it so Sapiens can access your code. 

The runtime comes with built-in typings for Hammerstone, but does not contain the code itself. If you use these typings, **you must install Hammerstone**. 
