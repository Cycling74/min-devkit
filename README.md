# Brain Music Max

### *Note*
*This repository is a fork of Cycling '74's Min-Devkit repository. That can be found at https://github.com/Cycling74/min-devkit.*

# Purpose
This repository contains custom Max/MSP externals created using the C++ Min-Devkit. 

# Building
The below sections instruct on how to build the library so that the created objects can be used.

## Prerequisites
To build the Max Externals on your system, you need: 
* Some form of compiler support on your system.
    * On the Mac this means Xcode 15 (you can get from the App Store for free).
    * On Windows this means Visual Studio 2022 (you can download a free version from Microsoft). Also be sure to install Desktop Development for C++ during the process. There is a checkbox you'll be able to check during the installation process.
    * On Linux, this is typically already taken care of out of the box. If you have trouble compiling, look into Clang and/or GCC and G++ by the GNU Project.
* CMake (version 3.19 or higher). See https://cmake.org/download/. Make sure cmake is added to the path.
* Git. See https://git-scm.com/downloads. Make sure git is added to the path.

## SSH Keys
It is highly recommended to clone the repository using `ssh` instead of `https`. Cloning via `ssh` is much more secure. If you are unaware of the process for generating and utilizing ssh keys, follow the instructions below.
1. Open a terminal of your choice.
2. `ssh-keygen -t rsa`
3. Take note of where it says the keys will be saved. Use the default save location. Hit enter.
4. Optionally, set a password. 
5. Once the keys are generated, navigate to the folder where the keys are stored in a file browser.
6. You should see two files: `id_rsa` and `id_rsa.pub`. These are your public and private keys. Open the `.pub` file in any text editor.
7. Copy the contents up to but not including your username located at the end of the file.
8. Go to your github page, click your profile picture, click settings, click SSH and GPG keys, and click `New SSH key`.
9. Paste what you copied in the `Key` box, give it any title, and click `Add SSH key`.

## Cloning
* This repository must be cloned in the `Max 8/Packages` directory. Navigate there on the command line.
* `git clone git@github.com:brain-music-lab/brain-music-max.git --recursive`

## Generating Project Files
* `cd brain-music-max`
* `mkdir build`
* `cd build`
* `cmake ..`

*Note that this step can also be accomplished using the dedicated CMake GUI installed with the CMake CLI from before.*

## Building from Project Files
You have multiple options here. They are listed below
* Run the following command from within "`/Max 8/Packages/brain-music-max/build`" in a terminal: cmake --build . --config Release`
* (Mac Only) Open XCode and build each project.
* (Windows Only) Open Visual Studio and build each project.

## Use!
The Max externals should now be built. You can open max and start using them!

# For Developers
## Documentation
Cycling '74 provides documentation on the Min-Devkit at: http://cycling74.github.io/min-devkit/.

## Creating a new Max External
To begin creating a new Max External:
* Copy the folder `brain-music-max/sources/template/brain.music.template`
* Paste the folder into `brain-music-max/sources/projects`
* Change the name of the folder to something new. Keep the `brain.music` part. 
    * For example, `brain.music.new-name`.
    * If you are creating an MSP object, the name should be `brain.music.new-name_tilde`
* Change the name of the two `.cpp` files in the folder to match. 
    * For example, `brain.music.new-name.cpp` and `brain.music.new-name_test.cpp`
    * If you are creating an MSP object, the name should be `brain.music.new-name_tilde.cpp` and `brain.music.new-name_tilde_test.cpp`
* The CMake file does not need to be altered in any way.
* Regenerate the CMake Project files in the `brain-music-lab/build` folder.
* Open your text editor/IDE of choice, and create your object using the template as a guide.

## Building and Testing within Max
Max has to be closed when you build an object. Close Max if it is open, and build your object. Open Max and create your object. Try it out!

## Unit testing
The Min-Devkit uses the catch framework which can be found at https://github.com/catchorg/Catch2/blob/devel/docs/tutorial.md. 
Every new object needs a unit test, and any object without a unit test should NEVER be merged into the main branch. 

## Pull Requests
*Github will default to the Cycling 74 repo as the repo to merge into. Be sure we're merging into branches on our repo!!*

All PRs need to:
* Have at least 1 reviewer
* Give an overview of what the PR accomplishes (bullet points are fine)
* Give instructions for how to review
* Include any other details important to reviews.

Reviewers need to:
* Be thorough with code reviews. Don't just glance and approve.
* Run the unit tests and be sure they pass.
* Test new functionality inside of Max.

