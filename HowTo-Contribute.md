## Contributing to the Min API and DevKit

The Min API and DevKit (Min) is accepting contributions that improve or refine any of the types, functions, content, or documentation in this library. 

Changes should be submitted as Github Pull Request.


## Housekeeping
Your pull request should: 

* Include a description of what your change intends to do
* It is desirable, but not necessary, for all the tests to pass at each commit. Please see [ReadMe.md](./ReadMe.md) for instructions to build and run the test suite. 
* Have clear and unambiguous commit messages 
* Include appropriate tests 
    * Tests should include reasonable permutations of the target fix/change
    * Include baseline changes with your change
    * All changed code should strive to have 100% code coverage


## Workflow

The Min codebase is structured in such a way that it is easy to use but contributing changes to it may leave the realm of the familiar if you don't typically work with Git submodules.

This documentation will use the command line.  It should be possible to perform these tasks with a GUI application as well.


### Getting the latest API

A Git submodule is essentially a pointer to a specific commit in another repository.  If there have been commits to the other repository since the pointer was last updated then you may wish to update it.  As an example, you may be in the Min DevKit and want to pull in updates to the Min API.

```
$ cd <path/to/min-devkit>
$ cd source/min-api
$ git status
```
Here is may tell you that you are on branch `master` but it might also tell you that you are on a specific commit, possibly with a "detached HEAD" (because the head of your tree of changes is based on a specific commit rather than the end of the branch).

To get the latest from the master branch:

```
$ git checkout master
$ git pull
```

Now you have updated **Min-API** to the latest.  But as soon as you run `cmake` or `git submodule update` it will switch your api version back to the specific commit that is pointed to by the **Min-DevKit**.  So we need to update that pointer.  

```
$ cd ../..
$ git status
```

You should now see that there is a change to the Min-API.

```
$ git commit source/min-api -m"updating the min-api to get changes related to..."
```

This same proceedure applies to any repository using the Min-API, not just the Min-DevKit.  Furthermore, the same applies to the Max-API inside of the Min-API though changes to the Max-API are much less common.



### Committing Changes in the Max API

Commiting changes in the top-level Min-DevKit is straigtforward.  If your changes are in the Min-API submodule then a little extra care will need to be taken to avoid getting tripped-up.

#### General Git Trip-Ups

If you have local changes to files inside of `source/min-api` then you will be able to build and test them as you expect.  One those changes are committed, however, the CMake scripts that automatically set the submodule to the specified commit will kick-in and your submodule will set to an older commit.  The instructions above on "Getting the latest API" may be helpful to get you back to where you want to be.

Also, be aware that your submodule (`source/min-api`) may often be set to a commit and not to the HEAD of a branch such as master.  If you don't double check (with `git branch` or `git status`) that you are on a branch it is easy to start making commits to a detached-head.

If you do make commits to a detached-head, make note of the commits (e.g. use `git log`) and then you can cherry-pick them to the branch where you want them.

Finally, it is **very important** that you push commits to the **Min-API** (the submodule) prior to pushing them to **Min-DevKit** (the host/container).  If you push your commits to Github in the opposite order then you essentially push a dangling reference to a non-existant commit when you push the Min-DevKit.

