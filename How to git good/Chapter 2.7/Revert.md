# Revert

Where [`git reset`](https://git-scm.com/docs/git-reset) is a sledgehammer, [`git revert`](https://git-scm.com/docs/git-revert) is a scalpel.

A revert is effectively an _anti_ commit. It does not _remove_ the commit (like `reset`), but instead creates a new commit that does the exact opposite of the commit being reverted. It undoes the change but keeps a full history of the change and its undoing.

## Using Revert

To revert a commit, you need to know the commit hash of the commit you want to revert. You can find this hash using `git log`.

```sh
git log
```

Once you have the hash, you can revert the commit using `git revert`.

```sh
git revert <commit-hash>
```

# Diff

The [`git diff` command](https://git-scm.com/docs/git-diff) shows you the differences between... stuff. Differences between commits, the working tree, etc.

I frequently use it to look at the changes between the current state of my code and the last commit. For example:

```bash
# show the changes between the working tree and the last commit
git diff
```

```bash
# show the differences between the previous commit and the current state, including the last commit and uncommitted changes
# So, git diff HEAD~1 will show working directory vs HEAD~1
# git diff HEAD~2 will show working directory vs HEAD~2 and so on.

git diff HEAD~1
```

```bash
# show the change between two commits
git diff COMMIT_HASH_1 COMMIT_HASH_2
```

# Revert vs. Reset

- `git reset --soft`: Undo _commits_ but keep changes staged
- `git reset --hard`: Undo _commits_ and discard changes
- `git revert`: Create a _new commit_ that undoes a previous commit

## When to Reset

If you're working on your own branch, and you're just undoing something you've already committed, say you're cleaning everything up so you can open a pull request, then `git reset` is probably what you want.

## When to Revert

However, if you want to undo a change that's already on a shared branch (especially if it's an older change), then `git revert` is the safer option. It won't rewrite any history, and therefore won't step on your coworkers' toes.