Often our frenemies (read: coworkers) make code changes that we need to begrudgingly accept into our pristine bug-free repos. _/s_

This is where the "distributed" in "distributed version control system" comes from. We can have "remotes", which are just external repos with _mostly_ the same Git history as our local repo.

When it comes to Git (the CLI tool), there really isn't a "central" repo. GitHub is just someone else's repo. Only by convention and convenience have we, as developers, started to use GitHub as a "source of truth" for our code.