# Min-DevKit
[![Build Status](https://travis-ci.org/Cycling74/min-devkit.svg?branch=master)](https://travis-ci.org/Cycling74/min-devkit)
[![Build status](https://ci.appveyor.com/api/projects/status/0koqc3l3qyfu0l8b/branch/master?svg=true)](https://ci.appveyor.com/project/c74/min-devkit/branch/master)

Create packages and code objects for Max using C++




## v0.5

* Updates to support new versions of IDEs: **Xcode 11** and **Visual Studio 2019**
* Introduced support for UI objects to work with **Multitouch interfaces** on Windows
  (see the new  `min.multitouch` object for an example)
* Introduced **new patcher API**
  (see the new `min.patcher.control` and `min.remote` objects for examples)
* **MC examples**:
  * new `min.mc.info~` example object
  * name change to `min.mc.phasor~` (which maps to `min.phasor~`)
* Added support for **preset**, **pattr**, and **snapshots**. Simply name an attribute "value" and it's state will be available to those state management systems.
* New cwarn class for posting warnings, similar to cout and cerr.
* 
* Fix for intermittent crashes when operating in overdrive with non-threadsafe messages and attributes
* Fix for Max crashing if you throw / call error() in a constructor
* Fixes for setting attributes from the inspector where changes previously did not stick
* Fix for crashing in Jitter objects including the `min.jit.clamp` example on Windows
* Fix to the limiter class in min-lib for bug where the gain would be reduced further than desired
* Improvements to templates and scaffolding for new packages and projects


