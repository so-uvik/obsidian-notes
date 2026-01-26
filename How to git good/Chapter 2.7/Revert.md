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