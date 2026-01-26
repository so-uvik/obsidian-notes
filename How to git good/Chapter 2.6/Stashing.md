## Git Stash

The [`git stash` command](https://git-scm.com/docs/git-stash) records the current state of your working directory _and the index_ (staging area). It's kinda like your computer's copy/paste clipboard. It records those changes in a safe place and reverts the working directory to match the `HEAD` commit (the last commit on your current branch).

To stash your current changes and revert the working directory to match `HEAD`:

```sh
git stash
```

To list your stashes:

```bash
git stash list
```

# Pop

Stash has [a few options](https://git-scm.com/docs/git-stash), but the ones that you will use most are:

```sh
git stash
git stash pop
git stash list
```

The `pop` command will (by default) apply your _most recent_ stash entry to your working directory and remove it from the stash list. It effectively undoes the `git stash` command. It gets you back to where you were.

# What Is the Stash

The `git stash` command stores your changes in a [stack (LIFO) data structure](https://www.youtube.com/watch?v=SD45xbKReT4). That means that when you retrieve your changes from the stash, you'll always get the most recent changes first.

```bash
# 'git stash' pushes a change onto the stash
git stash
```

```bash
# 'git stash pop' pops a change off the stash
# and applies it to the working directory
git stash pop
```

![](https://storage.googleapis.com/qvault-webapp-dynamic-assets/course_assets/FbkjBrY-1280x511.png)


A "stash" is a collection of changes that you've not yet committed. They might just be "raw" working directory changes, or they might be _staged_ changes. Both can be stashed. So, for example, you can:

1. Make some changes to your working directory
2. Stage those changes
3. Make some more changes without staging them
4. Stash all of that

When you do, the "stash entry" will contain both the staged and unstaged changes and both your working directory and index will be reverted to the state of the last commit. It's a very convenient way to "pause" your work and come back to it later.