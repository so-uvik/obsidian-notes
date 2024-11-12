
Git does not support password authentication anymore, so you'll have to do one of these things in order to authenticate yourself.

<h3>Method 1 - Storing your username and password in `~/.git-credentials` file. </h3>
Run the command `git config --global credential.helper store` on your local git repository. After executing this command, do a git operation that interacts with the remote repository such as `git push` or `git pull`.

Doing this operation should prompt you for your GitHub username and password. Fill in your GitHub username, and a `personal-access-token`, putting in your GitHub password here will result in a failure, because GitHub doesn't support password authentication anymore.

> [!note]
> If you do not have a personal-access-token you can generate one by going to your github settings > Developer settings (at the bottom) > Personal access tokens > Tokens(classic)
> Click on,  `Generate new token` and select all the permissions you want to give the user of this token (do this step carefully if it's not you using the access token) click on generate token and voila !

Copy the personal-access-token and paste it in your terminal when asked for your github password. And you're done! 

Now you can pull, push, revert without having to put in your credentials each time!


Also, you can use other helpers for the `git config credential.helper`, namely memory cache:

````bash
git config credential.helper 'cache --timeout=<timeout>'
````

which takes an optional `timeout parameter`, determining for how long the credentials will be kept in memory. Using the helper, the credentials will never touch the disk and will be erased after the specified timeout. The `default` value is _900 seconds (15 minutes)_.

You can again use --global to define for the whole system.

```bash
git config --global credential.helper 'cache --timeout=<timeout>'
```

>[!warning]
>If you use this method, your Git account passwords will be saved in _plaintext_ format, in the `global .gitconfig file`, e.g in Linux it will be `/home/[username]/.gitconfig`.

If this is undesirable to you, use an `ssh key` for your accounts instead.

Helpful StackOverflow Discussion: [https://stackoverflow.com/questions/35942754/how-can-i-save-username-and-password-in-git]


<h3>Method 2 - Using SSH keys:</h3>

[https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/about-authentication-to-github#authenticating-with-the-command-line]

[https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/managing-your-personal-access-tokens]

[https://docs.github.com/en/get-started/getting-started-with-git/caching-your-github-credentials-in-git]








