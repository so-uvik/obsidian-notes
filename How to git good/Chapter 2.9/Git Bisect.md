## What is Git Bisect?

This command uses a binary search algorithm to find which commit in your project’s history introduced a bug. You use it by first telling it a "bad" commit that is known to contain the bug, and a "good" commit that is known to be before the bug was introduced. Then `git` `bisect` picks a commit between those two endpoints and asks you whether the selected commit is "good" or "bad". It continues narrowing down the range until it finds the exact commit that introduced the change.

### Basic bisect commands: start, bad, good

As an example, suppose you are trying to find the commit that broke a feature that was known to work in version `v2.6.13-rc2` of your project. You start a bisect session as follows:

$ git bisect start
$ git bisect bad                 # Current version is bad
$ git bisect good v2.6.13-rc2    # v2.6.13-rc2 is known to be good

Once you have specified at least one bad and one good commit, `git` `bisect` selects a commit in the middle of that range of history, checks it out, and outputs something similar to the following:

Bisecting: 675 revisions left to test after this (roughly 10 steps)

You should now compile the checked-out version and test it. If that version works correctly, type

$ git bisect good

If that version is broken, type

$ git bisect bad

Then `git` `bisect` will respond with something like

Bisecting: 337 revisions left to test after this (roughly 9 steps)

Keep repeating the process: compile the tree, test it, and depending on whether it is good or bad run `git` `bisect` `good` or `git` `bisect` `bad` to ask for the next commit that needs testing.

Eventually there will be no more revisions left to inspect, and the command will print out a description of the first bad commit. The reference `refs/bisect/bad` will be left pointing at that commit.

## Automate Git Bisect

```
Bisect run
       If you have a script that can tell if the current source code is good or bad, you can
       bisect by issuing the command:

           $ git bisect run my_script arguments

       Note that the script (my_script in the above example) should exit with code 0 if the
       current source code is good/old, and exit with a code between 1 and 127 (inclusive),
       except 125, if the current source code is bad/new.
```

