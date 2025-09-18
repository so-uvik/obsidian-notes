# Rebase

"[Rebase](https://git-scm.com/docs/git-rebase) vs [Merge](https://git-scm.com/docs/git-merge)" is one of the most hotly debated topics in the Git world. A lot of the discussions you'll see online come down to the fact that many developers (yes, even professionals) don't understand the purpose of rebase and use it incorrectly, causing a bunch of Git havoc, and then blame the rebase command.

_It's not Git's fault, it's a skill issue._

## Visualizing Rebase

Say we have this commit history:

```
A - B - C    main
   \
    D - E    feature_branch
```

We're working on `feature_branch`, and want to bring in the changes our team added to `main` so we're not working with a stale branch. We could merge `main` into `feature_branch`, but that would create an additional merge commit. Rebase avoids a merge commit by replaying the commits from `feature_branch` on top of `main`. After a rebase, the history will look like this:

```
A - B - C         main
         \
          D - E   feature_branch
```

