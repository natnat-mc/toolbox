# toolbox
A nice toolbox for developers, written in Lua

## `=`
A small calculator on the command line.  
Concatenates all it arguments and executes the resulting code.  
Examples:
- ```= 2+2```
- ```= sqrt(2)+1```
- ```= `stat bin/= | grep Size | cut -d ' ' -f 4` *8```

## `makefilegen`
A small Makefile generator.  
It autodetects C and C++ sources and headers in a single folder, and generates a Makefile accordingly.  
Examples:
- ```makefilegen . main gcc``` (default)
- ```makefilegen ../src ../bin/main g++``` (create a Makefile in `../src` that outputs in `../bin/main` (relative to the Makefile) with `g++`)

## `ccx`
When you don't want a Makefile.
Compiles all the C/C++ source files in a directory.  
Examples:
- ```ccx . main g++``` (default)
- ```ccx var/src/prompt bin/prompt gcc``` (compile everything from `var/src/prompt` into `bin/prompt` with `gcc`)
