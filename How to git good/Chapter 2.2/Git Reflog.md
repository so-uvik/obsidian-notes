The [`git reflog` command](https://git-scm.com/docs/git-reflog) (pronounced ref-log, not re-flog) is kinda like `git log` but stands for "reference log" and specifically logs the changes to a "reference" that have happened over time.

Reflog uses a different format to show the history of a branch or HEAD: one that's more concerned with the number of steps back in time. For example:

| reflog   | meaning                    |
| -------- | -------------------------- |
| HEAD@{0} | where HEAD is now          |
| HEAD@{1} | where HEAD was 1 move ago  |
| HEAD@{2} | where HEAD was 2 moves ago |
| HEAD@{3} | where HEAD was 3 moves ago |
| ...      | ...                        |
## Exercise

Run `git reflog` in a empty git project to see how reflog look like at the moment. It will show just one line as that's where your `HEAD` has ever been.

Make a feature branch from `main` and add a commit to it. Then switch to the `main` branch again.

Run `git reflog` a second time and see the changes in the output. You'll see `three` records added which signify that you made a new feature branch from `main`, making a commit and then switching back to `main`.

## Scenario

Imagine a scenario where you accidentally deleted the committed change on feature branch. In this case `git reflog` will be a useful tool for recovering lost commits or get contents on accidentally deleted branches. 

Switch back to the feature branch and then delete the previously made commit with  `git reset --hard HEAD~1`. Now the commit is lost (but not forever!)

Run `git reflog` now and you'll see that the `commit hash` (also called `commitish` in git speak) is still present.

>[!Tip]
>The `git reflog` output will show the commit message of your deleted commit, so you can identify the commit hash of it.

## Recovery

Now that we have the `commitish` of the lost commit we can merge in that commit in our branch to recover it.

The `git merge` command takes a `commitish` as an argument. If we do `git merge <commitish>` where `commitish` is the commit hash of the lost commit. This will take the lost commit and commit it to the feature branch. You can see the commit with the `git log --oneline` command.

