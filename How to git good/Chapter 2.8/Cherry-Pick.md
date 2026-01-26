
There comes a time in every developer's life when you want to yoink a commit from a branch, but you don't want to merge or rebase because you don't want _all_ the commits.

The [`git cherry-pick` command](https://git-scm.com/docs/git-cherry-pick) solves this.

```sh
git cherry-pick <commit-hash>
```

# How to Cherry Pick

1. First, you need a clean working tree (no uncommitted changes).
2. Identify the commit you want to cherry-pick, typically by `git log`ing the branch it's on.
3. Run:

```sh
git cherry-pick <commit-hash>
```