A rebase conflict is essentially the same thing as a merge conflict but instead it occurs during `rebasing`

The process of solving a conflict remains the same during a rebase conflict, but there are a few key differences that needs to be kept in mind while handling them.

## Twisted HEAD's

When solving a `rebase conflict`, the `HEAD` pointer points to changes of the branch you're rebasing on top of, and not the branch you're on. That's because `rebase` checks out the source branch (the branch you're rebasing on top of) and then plays the target branch's commit (the one you initiated rebase from) `one-by-one` on top of the source branch.

>[!Caution]
>If you're planning to use `git's` conflict resolution keywords such as `our's` and `their's` to solve a conflict you need to remember that `ours` now points to the branch you're rebasing off of, and not the branch you're currently on.


>[!Interesting]
>If you're in the middle of a conflict resolution, and you do a `git branch` you'll see that it says `(no branch, rebasing <branch_name>)`. That's because you're now in a special state called the `detached HEAD`

## Git you sneaky bast#rd

While solving a rebase conflict an interesting scenario might occur that makes git drop a commit. 
Read the reasoning behind it in the page: [https://www.boot.dev/lessons/9cdda067-c3bf-4f1a-9560-89a6516b1cf4] 

Primeagen explains this in his Git Full Course video at 3:10:27

Solve the exercise to understand fully what's happening. It's perfectly explained. Trust me : )