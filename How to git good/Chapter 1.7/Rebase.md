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

# When to Rebase

[git rebase](https://git-scm.com/docs/git-rebase) and [git merge](https://git-scm.com/docs/git-merge) are different tools.

An advantage of merge is that it preserves the true history of the project. It shows when branches were merged and where. One disadvantage is that it can create a lot of merge commits, which can make the history harder to read and understand.

A linear history is generally easier to read, understand, and work with. Some teams enforce the usage of one or the other on their `main` branch, but generally speaking, you'll be able to do whatever you want with your own branches.

# Warning

You should _never_ rebase a public branch (like `main`) onto anything else. Other developers have it checked out, and if you change its history, you'll cause a lot of problems for them.

However, with your own branch, you can rebase onto other branches (including a public branch like `main`) as much as you want.