## Undoing Changes

One of the major benefits of using Git is the ability to undo changes. There are _a lot_ of different ways to do this, but first, we'll start by going back in the commit history without discarding changes.

# Git Reset Soft

The [git reset](https://git-scm.com/docs/git-reset) command can be used to undo the last commit(s) or any changes in the index (staged but not committed changes) and the worktree (unstaged and not committed changes).

```bash
git reset --soft COMMITHASH
```

The `--soft` option is useful if you just want to go back to a previous commit, but keep all of your changes. Committed changes will be uncommitted and staged, while uncommitted changes will remain staged or unstaged as before.

# Git Reset Hard

In the last lesson, we undid a commit but kept the changes. We don't want to keep the changes to `titles.md`. Here's how to reset those changes:

```bash
git reset --hard COMMITHASH
```

This is useful if you just want to go back to a previous commit and discard all the changes.

>[!tip]
>`git reset --hard` will discard all `unstaged` changes to the working tree, but not `untracked` changes. `Untracked` changes mean new files that are not yet staged.

# Danger

I want to stress how **dangerous** this command can be. If you were to simply delete a _committed_ file, it would be trivially easy to recover because it is tracked in Git. However, if you used `git reset --hard` to undo committing that file, it would be deleted for good.

Always be careful when using `git reset --hard`. It's a powerful tool, but it's also a dangerous one.

## Reset to a Specific Commit

If you want to reset back to a specific commit, you can use the [git reset --hard](https://git-scm.com/docs/git-reset) command and provide a commit hash. For example:

```bash
git reset --hard a1b2c3d
```

This will reset your working directory and index to the state of that commit, and all the changes made after that commit are lost forever.

Be _super careful_ with this. In part 2 of this course, we'll cover more advanced (read: safer) ways to undo changes.
