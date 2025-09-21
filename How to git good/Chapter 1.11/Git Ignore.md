As you've seen, it's _pretty normal_ to use the following workflow from the top level of your repo:

1. `git add .`
2. `git commit -m "some message here"`
3. `git push origin main`

A problem arises when we want to put files in our project's directory, but we _don't_ want to track them with Git. **A [`.gitignore`](https://git-scm.com/docs/gitignore) file solves this.** For example, if you work with Python, you probably want to ignore automatically generated files like `.pyc` and `__pycache__`. If you are building a server, you probably want to ignore `.env` files that might hold private keys. If you (I'm sorry) work with JavaScript, you might want to ignore the `node_modules` directory.

![](https://storage.googleapis.com/qvault-webapp-dynamic-assets/course_assets/Mn7FERh-990x712.png)

Here's example contents of a `.gitignore` file, which exists at the root of a repo:

```
node_modules
.env
```

This will ignore every path containing `node_modules` as a "section" (directory name or file name). It ignores:

- `node_modules/code.js`
- `src/node_modules/code.js`
- `src/node_modules`

It does _not_ ignore:

- `src/node_modules_2/code.js`
- `env/node_modules_3`

This will also ignore the `.env` file preventing you from committing sensitive environment variables (like API keys, DB credentials, etc.) ...cause that would be bad.