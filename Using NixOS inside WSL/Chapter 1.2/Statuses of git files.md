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

# Git Log:

A Git repo is a (potentially very long) list of commits, where each commit represents the _full state of the repository_ at a given point in time.

The [git log](https://git-scm.com/docs/git-log) command shows a history of the commits in a repository. This is what makes Git a version control system. You can see:

- Who made a commit
- When the commit was made
- What was changed

## A Commit Hash

Each commit has a unique identifier called a "commit hash". This is a long string of characters that uniquely identifies the commit. Here's an example of mine:

```
5ba786fcc93e8092831c01e71444b9baa2228a4f
```

For convenience, you can refer to any commit or change within Git by using the first `7` characters of its hash. For mine, that's `5ba786f`.

>[!tip]
>If you add the `--no-pager` options, git log will run without any interactive pager and the `-n` option limits the maximum number of commits shown.
>
>For example:
>```bash
>git --no-pager log -n 10
>```
>
>The above command will show you the most recent 10 commits without an interactive pager which you'll have to scroll.



