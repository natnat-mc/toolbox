# toolbox
A nice toolbox for developers, written in Lua

## Installing the toolbox
To install the toolbox, a `./install [destination]` script is available.  
The default installation directory is `$HOME/bin`
This script will automatically create the destination directory and add it to the path in `~/.profile` (after prompting the user).  
Then, the script will copy all the utilities into the destination directory, prompting the user if a conflict exists.

## Your tools

### `=`
A small calculator on the command line.  
Concatenates all it arguments and executes the resulting code.  
Can also read its arguments from stdin if called like `= -`  
Examples:
- ```= 2+2```
- ```= "sqrt(2)+1"```
- ```= `stat bin/= | grep Size | cut -d ' ' -f 4` *8``
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
The result is pseudorandom, and its seed is the system time, in seconds: **do not use this where tandomness is actually expected**. 
Can also be used to select a random line from stdin. 
Examples:
- ```roll 6``` (rolls a dice)
- ```roll 100``` (returns a number between 1 and 100)
- ```cat /etc/passwd | roll choice``` (returns a random entry from `/etc/passwd`)

