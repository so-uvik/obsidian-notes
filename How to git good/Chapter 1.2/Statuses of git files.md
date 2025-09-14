A files can be one of several states in a Git repository. Here are a few important ones:

- `untracked` : Not being tracked by Git.
- `staged`: Marked for inclusion in the next commit.
- `committed`: Saved to the repository's history.

The `git status` command shows you the current state of your repository. It will tell you which files are untracked, staged or committed.

Inorder to add a file to the staging area, you do `git add <filename>` or if you wanna add all untracked files to the staging area then you can do `git add .`

>[!tip] Fact
>The `git add .` can be goofy sometimes. Let's say you create a file foo.txt and then a directory foo/ and then cd into it. If you execute the command `git add .` now you'll see that foo.txt is still untracked, meaning `git add .` only adds files within its current directory and beyond, not any directory that's before it. To solve this you can do `git add -A`

## Commits:
A commit is a snapshot of the repository at any given point in time. It's a way to save the state of the repository, and it's how Git keeps track of changes to the project. A commit comes with a message that describes the changes made in that commit. 

Interesting thing about commits is that they store, entire history per commit and not the diff.
Which means every single change you made ever is in a single commit.

```
git commit -m "your message here"
```

>[!tip]
If you screw up a commit message, you can change it with the `--amend` flag. For example: `git commit --amend -m "A: add contents.md"`





