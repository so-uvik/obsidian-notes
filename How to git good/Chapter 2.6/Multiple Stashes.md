You can stash changes with a message. I rarely use a stash message personally because I rarely have more than one stash entry. I imagine if you keep a crazy deep stash then messages are useful, but I find that I usually stash, and then just a few minutes or hours later, I pop it back out. That said, here's the syntax to provide a message:

```bash
git stash -m "jdsl v0 almost working"
```

## Apply Without Removing from Stash

This will apply the most recent stash changes, just like `pop`, but it will keep the stash in the stash list.

```sh
git stash apply
```
## Remove a Stash Without Applying

This will remove the most recent stash from the stash list without applying it to your working directory.

```sh
git stash drop
```
## Reference a Specific Stash

Most stash commands allow you to reference a specific stash by its index.

```sh
# Apply the third (0, 1, 2) most recent stash
git stash apply stash@{2}

# Remove the third most recent stash
git stash drop stash@{2}
```