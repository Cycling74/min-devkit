# How to Create a New Package

To create a new Max package that includes objects written using the [Min API](https://github.com/Cycling74/min-api) you will run a script that provides the requisite scaffolding by copying components from this package and setting up a link to the Min API using Git.


## 1. Run the package creation script

On the command line run the script passing the path where you wish your new package to be located as an argument.  For example, to run the script from the directory where this documentation is located and create package one level up called "foo":

* `script/create_package.rb ../foo`


## 2. Test the new package by building it

* `cd ../foo/build`
* run **CMake** as appropriate for your platform (see the [ReadMe](https://github.com/Cycling74/min-devkit) for details)
* **build** as documented in the [ReadMe](https://github.com/Cycling74/min-devkit)
* run **unit tests** in the [ReadMe](https://github.com/Cycling74/min-devkit)
* try the default `foo` object in Max to make sure it works using the help patcher


## 3. Begin creating your own objects

This process is documented in the [How to Add a New Object to This Package](https://github.com/Cycling74/min-devkit/blob/master/HowTo-NewObject.md) documentation.
