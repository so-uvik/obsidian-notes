Often our frenemies (read: coworkers) make code changes that we need to begrudgingly accept into our pristine bug-free repos. _/s_

This is where the "distributed" in "distributed version control system" comes from. We can have "remotes", which are just external repos with _mostly_ the same Git history as our local repo.

When it comes to Git (the CLI tool), there really isn't a "central" repo. GitHub is just someone else's repo. Only by convention and convenience have we, as developers, started to use GitHub as a "source of truth" for our code.

# Adding a Remote

In git, another repo is called a "remote." The standard convention is that when you're treating the remote as the "authoritative source of truth" (such as GitHub) you would name it the "origin".

By "authoritative source of truth" we mean that it's the one you and your team treat as the "true" repo. It's the one that contains the most up-to-date version of the accepted code.

# Command Syntax

```bash
git remote add <name> <uri>
```

>[!tip]
>A remote can be a place like github or gitlab, but it also could be any git repository in your local filesystem. Just incase of a local filesystem fill the `<uri>` field with the path to the folder in your local filesystem.

# Fetch

Adding a remote to our Git repo does _not_ mean that we automagically have all the contents of the remote. First, we need to fetch the contents. 

```bash
git fetch
```
