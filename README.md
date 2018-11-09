# toolbox
A nice toolbox for developers, written in Lua

## Installing the toolbox
To install the toolbox, a `./install [destination]` script is available.  
The default installation directory is `$HOME/bin`
This script will automatically create the destination directory and add it to the path in `~/.profile` (after prompting the user). 

This script will try to use Lua 5.3, and can:
- find it if it is in the path
- install it alongside the scripts
- install it with a custom name
- embed a polyfill inside the scripts

## Your tools

### `=`
A small calculator on the command line.  
Concatenates all its arguments and executes the resulting code.  
Can also read its arguments from stdin if called like `= -`  
Examples:
- ```= 2+2```
- ```= "sqrt(2)+1"```
- ```= `stat bin/= | grep Size | cut -d ' ' -f 4` *8```
- ```echo 2+2 | = -```

### `makefilegen`
A small Makefile generator.  
It autodetects C and C++ sources and headers in a single folder, and generates a Makefile accordingly.  
Examples:
- ```makefilegen . main gcc``` (default)
- ```makefilegen ../src ../bin/main g++``` (create a Makefile in `../src` that outputs in `../bin/main` (relative to the Makefile) with `g++`)

### `ccx`
When you don't want a Makefile.
Compiles all the C/C++ source files in a directory.  
Examples:
- ```ccx . main g++``` (default)
- ```ccx var/src/prompt bin/prompt gcc``` (compile everything from `var/src/prompt` into `bin/prompt` with `gcc`)

### `todo`
Because we're all very organized here. 
Handles a small todo stack. 
Examples:
- ```todo ls``` (list all todos)
- ```todo n``` (counts the amount of todos)
- ```todo peek``` (reads the last todo)
- ```todo pop``` (reads and removes the last todo)
- ```todo push|add <message>``` (adds a new todo onto the stack)
- ```todo shift``` (reads and removes the first todo)
- ```todo unshift``` (adds a new todo under the stack)

### `rep`
Repeats a string.  
Examples:
- ```rep 100 A``` (writes `A` 100 times)
- ```rep 0 A``` (writes `A` 0 times; in other words, does nothing)
- ```echo Test | rep 5``` (writes `Test` followed by a newline 5 times)
- ```rep 1``` (writes stdin one time, essentially piping stdin to stdout)

### `roll`
Rolls a dice. 
The result is pseudorandom, and its seed is the system time, in seconds: **do not use this where randomness is actually expected or required**. 
Can also be used to select a random line from stdin. 
Examples:
- ```roll 6``` (rolls a dice)
- ```roll 100``` (returns a number between 1 and 100)
- ```cat /etc/passwd | roll choice``` (returns a random entry from `/etc/passwd`)

### `media`
Controls `mpris`-compatible media players from the command line.  
Can be scripted in bash as well as in Lua.  
Examples:
- ```media``` (dumps all the info it has)
- ```media list``` (lists all the media players available)
- ```media playpause clementine``` (toggles play/pause on clementine)
- ```media status clementine``` (dumps all it can find on clementine)
- ```media help``` (you'll clearly need this one)
- ```media exec pauseall.lua``` (executes `pauseall.lua` *not in the repo*)
