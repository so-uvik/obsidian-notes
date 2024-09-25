
<h4>Removing a file from the GitHub repository:</h4>

The question to ask yourself is should the file be removed altogether from the repository, so that anybody new who clones the repository should not get it? If YES then execute the below command and then push to GitHub.

>[!warning]
>**WARNING: While this will not remove the physical file from your local machine, it will remove the files from other developers' machines on their next `git pull`.**

[https://stackoverflow.com/questions/1274057/how-do-i-make-git-forget-about-a-file-that-was-tracked-but-is-now-in-gitignore]

```bash
git rm --cached <filename> <anotherFilename> ...
```

But if you only want that the future changes in the files should not be pushed to GitHub anymore, run this command, add the file to .gitignore and then push.

```bash
git update-index --assume-unchanged <file>
```

<h4>Removing commits:</h4>
