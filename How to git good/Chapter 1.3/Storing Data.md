Git stores an entire _snapshot_ of files on a _per-commit_ level. This was a surprise to me! I always assumed each commit only stored the _changes_ made in that commit.

## Optimization

While it's true that Git stores entire snapshots, it _does_ have some performance optimizations so that your `.git` directory doesn't get too unbearably large.

- Git [compresses and packs](https://git-scm.com/book/en/v2/Git-Internals-Packfiles) files to store them more efficiently.
- Git deduplicates files that are the same across different commits. If a file doesn't change between commits, Git will only store it once.

## Optimization

While it's true that Git stores entire snapshots, it _does_ have some performance optimizations so that your `.git` directory doesn't get too unbearably large.

- Git [compresses and packs](https://git-scm.com/book/en/v2/Git-Internals-Packfiles) files to store them more efficiently.
- Git deduplicates files that are the same across different commits. If a file doesn't change between commits, Git will only store it once.
  
Look at the picture below to understand point two:

![[Pasted image 20250914140407.png]]

You can see that in commit two, since content.md did not change across commits, git did not store the whole file itself, but rather stored a `reference` of it in the previous commit as a optimization technique. 

If you want to have a look at it yourself in the cmdline, make a new commit with a new file, and commit it (without changing the first file that was committed)

Now, run `git log -1` to get the last commit hash and copy it. And then run `git cat-file -p <your-copied-commit-hash>`.

The Output should be something like this:

```bash
tree 37712fab0aa902b37e2197ebb71e4e1ba4f45f3d
parent 180c11994d0cb56c7d456745d9939e3043316476
author so-uvik <souviksahamay27@gmail.com> 1757838039 +0530
committer so-uvik <souviksahamay27@gmail.com> 1757838039 +0530

B: add titles
```

Take the commit hash of the `tree` and take a note of the hash of the first file you committed.
In my case that file is `contents.md` whose hash is `ef7e93fc61a91deecaa551c4707e4c3049af42c9`

```bash
git cat-file -p 37712fab0aa902b37e2197ebb71e4e1ba4f45f3d
100644 blob ef7e93fc61a91deecaa551c4707e4c3049af42c9    contents.md
100644 blob 66693b8d72daef9170108c6ab4b3abd7f3950dd2    titles.md
```

Now take the commit hash of the first commit that you made and plug it to `git cat-file -p <hash>` and from there take the commit hash of the `tree` and cat-file it again. Notice the hashes of the first committed file in both cases. They are identical.

```bash
 ➜ webflyx at   on  master 𝘹 git cat-file -p 180c119 
tree 5b21d4f16a4b07a6cde5a3242187f6a5a68b060f
author so-uvik <souviksahamay27@gmail.com> 1757830160 +0530
committer so-uvik <souviksahamay27@gmail.com> 1757830160 +0530

A: add contents.md

 ➜ webflyx at   on  master 𝘹 git cat-file -p 5b21d4f16a4b07a6cde5a3242187f6a5a68b060f
100644 blob ef7e93fc61a91deecaa551c4707e4c3049af42c9    contents.md
``` 

Where `180c119` is the commit hash of my first commit.

You can notice that the commit hash for `contents.md` is the same `ef7e93fc61a91deecaa551c4707e4c3049af42c9`