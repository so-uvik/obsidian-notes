## Undoing Changes

One of the major benefits of using Git is the ability to undo changes. There are _a lot_ of different ways to do this, but first, we'll start by going back in the commit history without discarding changes.

# Git Reset Soft

The [git reset](https://git-scm.com/docs/git-reset) command can be used to undo the last commit(s) or any changes in the index (staged but not committed changes) and the worktree (unstaged and not committed changes).

```bash
git reset --soft COMMITHASH
```

The `--soft` option is useful if you just want to go back to a previous commit, but keep all of your changes. Committed changes will be uncommitted and staged, while uncommitted changes will remain staged or unstaged as before.