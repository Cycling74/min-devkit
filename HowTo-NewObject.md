# How to Add a New Object to This Package

To create a new **Min** external follow these steps...


## 1. Find an object you'd like to use as a starting-point.
Here are some suggestions:

* `source/projects/min.beat.random` -- a simple Max object
* `source/projects/min.dcblocker_tilde` -- a simple audio object (msp)
* `source/projects/min.jit.stencil` -- a simple matrix operator object (jitter)
* `source/projects/min.dict.join` -- an object using dictionaries
* `source/projects/min.buffer.index_tilde` -- an object using buffers

## 2. Duplicate the folder and Rename files

The folder will typically contain 3 files:

* The source file for the object (e.g. `hello-world.cpp`)
* The source file for a unit test (e.g. `hello-world_test.cpp`)
* A project file (e.g. `CMakeLists.txt`)

If you follow the standard convention of the Min-DevKit you will not typically need to open or modify the `CMakeLists.txt` at all.

The unit test source file is optional (though strongly recommended!) and if it is missing the object will still build.

The source file for the object is where you will do the editing work to create your new object.

The steps to follow are these:

1. Duplicate the folder of the object you chose as a starting point.
2. Rename the folder to the name you desire for your object.
3. Rename the source file for the object to match the name of the folder.
4. If creating a unit test for your object, rename the source file for the unit test to match the name of the folder but with "_test" added to the end.
5. Open the source of the unit test and change the `#include` statement that pulls in the source of the object to be tested to the name of your object.


## 3. Use CMake to regenerate project files

As described in the [ReadMe](https://github.com/Cycling74/min-devkit), run **CMake** to update your Xcode and or Visual Studio projects.

Build your project before modifying the source code to make sure everything is sane.


## 4. Edit your code!

Now you can edit your code to make your external object do amazing things.


## 5. Document

To be an upstanding citizen of the Max ecosystem your object should have both a **help patcher** added to the `help` folder. A reference page will be generated and added to the `docs` folder automatically when you instantiate your object the first time.

## 6. Unit Testing

Unit testing for Min uses [Catch](https://github.com/philsquared/Catch/blob/master/docs/tutorial.md).

Once your unit test has been written (or at least started), you can run it the Xcode or Visual Studio debugger.

Alternatively you can run them on the command line using Cmake, for example:

* `cd ..`
* `cd tests`
* mac example: `./min.dcblocker_tilde_test -s`
* win example: `min.dcblocker_tilde_test.exe -s`
