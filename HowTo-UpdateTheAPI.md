#Getting the latest Min API

The **Min API** is included not as a normal folder/directory but as a Git submodule in the *source* folder of the package.

A Git submodule is essentially a pointer to a specific commit in another repository.  If there have been commits to the other repository since the pointer was last updated then you may wish to update it.  As an example, you may be in the **Min DevKit** and want to pull in updates to the Min API.

```
$ cd <path/to/min-devkit>
$ cd source/min-api
$ git status
```
Here it may tell you that you are on branch `master` but it might also tell you that you are on a specific commit, possibly with a "detached HEAD" (because the head of your tree of changes is based on a specific commit rather than the end of the branch).

To get the latest from the master branch:

```
$ git checkout master
$ git pull
```

Now you have updated to the latest **Min API** version. However, as soon as you run `cmake` or `git submodule update` it will switch your api version back to the specific commit that is pointed to by the **Min DevKit**.  So we need to update that pointer to this new version.

```
$ cd ../..
$ git status
```

You should now see that there is a change to the Min-API.

```
$ git commit source/min-api -m"updating the min-api to get changes related to..."
```

This same proceedure applies to any repository using the Min API, not just the Min DevKit.  Furthermore, the same applies to the Max API inside of the Min API though changes to the Max API are much less common.


