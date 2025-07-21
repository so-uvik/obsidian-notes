What we are trying to achieve here is good commit messages. We will be using [https://www.conventionalcommits.org/en/v1.0.0/] notations for this.

There is a way to lint commits using CommitLint [https://github.com/conventional-changelog/commitlint] and show an interactive way to do commits using Commitizen [https://github.com/commitizen/cz-cli]

But we're taking all of this a step further. We want that when a user commits to our repository
for the first time, he should be able to:

A) Not stray away from his usual practice very much (git add, commit and push)
B) Would not have to look up documentation/README inorder to learn how to form a commit message which might be specific to our repo.
C) Would not have to see lint errors for commits (Who tf wants that?)

Let's do it!

*Use Commitizen**, but **retain your usual `git commit -m "..."` workflow**, and if the message isn't in the correct **Conventional Commit** format, you want **Commitizen to kick in interactively** and guide the user. This is absolutely doable using `commitlint` + a `prepare-commit-msg` or `commit-msg` hook.

---

## ✅ What You Want:

- ✅ Users can still use `git commit -m "..."`.
    
- 🚫 If the message is **invalid**, warn or block the commit.
    
- ✅ Then **invoke `commitizen`** (`git cz`) automatically for correction.
    
- 💡 Ideally suggest: “Your commit message doesn't follow convention. Want help?”
    

---

## 🧰 Tools You’ll Use:

| Tool         | Role                                             |
| ------------ | ------------------------------------------------ |
| `commitizen` | Interactive commit message generation (`git cz`) |
| `commitlint` | Lints commit messages for format violations      |
| `husky`      | Adds Git hooks (cross-platform + sharable)       |
## 🛠 Step-by-Step Setup

### 1. Install dependencies

npm install -D commitizen @commitlint/{config-conventional,cli} husky
npx husky install

Add to `package.json`:

"scripts": {
  "prepare": "husky install"
}

Then:

npm run prepare

### 2. Setup `commitlint`

Create `commitlint.config.js`:

module.exports = {
  extends: ['@commitlint/config-conventional']
}

3. Setup Husky Git Hook

npx husky add .husky/commit-msg "node scripts/verify-commit.js"

### 4. Create `scripts/verify-commit.js`

This Node script:

- Runs `commitlint`
    
- If the message is invalid, it prompts the user to run `git cz`

const { readFileSync } = require('fs');
const { execSync } = require('child_process');
const { lint } = require('@commitlint/lint');
const load = require('@commitlint/load');
const path = process.argv[2];

(async () => {
  const msg = readFileSync(path, 'utf-8').trim();
  const opts = await load();
  const result = await lint(msg, opts.rules);

  if (!result.valid) {
    console.log('\n❌ Commit message is invalid:');
    console.log(result.errors.map(e => `- ${e.message}`).join('\n'));
    const response = require('readline-sync').question('\nRun Commitizen instead? (Y/n): ');

    if (response.toLowerCase() !== 'n') {
      console.log('\n🛠 Launching Commitizen...\n');
      execSync('npx cz', { stdio: 'inherit' });
      process.exit(1); // Cancel this commit so cz's one takes over
    } else {
      console.error('\nAborting due to invalid commit message.\n');
      process.exit(1);
    }
  }
})();

5. Install `readline-sync` (for interactive Y/n prompt)
npm install -D readline-sync

✅ Final Workflow

User runs:
git commit -m "fixed bug in login"

- `commit-msg` hook:
    
    - Lints message
        
    - Says: ❌ Invalid format
        
    - Asks: Run Commitizen instead? (Y/n)
        
- If **yes**, launches:
- npx cz

User enters proper Conventional Commit interactively.

