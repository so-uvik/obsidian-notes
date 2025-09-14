So far we've been using Git in a "porcelain" manner. But to sate our insatiable curiosity, let's take a look at some of the "plumbing".

## It's Just Files All the Way Down

All the data in a Git repository is stored directly in the (hidden) `.git` directory. That includes all the commits, branches, tags, and other objects we'll learn about later.

Git is made up of [objects](https://git-scm.com/book/en/v2/Git-Internals-Git-Objects) that are stored in the `.git/objects` directory. A commit is just a type of object.

>[!tip]
>At this point to understand what's being said here, create an empty directory, initialize git inside it and make a commit.
> 
>After that do `git log --oneline` and take a note of the commit hash, which will be required in this section to completely understand it.

# The Object File

Let's take a look at what's inside this suspicious commit object file.

Do a `find .git` command and there you'll see that there's a folder inside `.git/objects` starting with the first two character of your commit hash. That's your commit!

Now do a `cat .git/objects/{path to the file that matches your commit hash}` and take a look at the contents. It's a mess. The contents have been compressed to raw bytes!