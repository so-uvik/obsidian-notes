TypeScript allows tuples to have a variable number of elements of a specific type using **rest elements**. This is nice when you want a tuple to have a fixed-length beginning but a flexible-length ending:

```typescript
// A tuple with a rest element
type NameAndScores = [string, ...number[]];

// All of these are valid
const nameAndScores: NameAndScores = ["Alphonse", 69, 420, 300];
const nameAndScores: NameAndScores = ["Winry", 42];
const nameAndScores: NameAndScores = ["Edward"];
```

This idea of flexibly sized tuples honestly barely feel like tuples to me... it feels like arrays with some type constraints... but I digress.

One great use case for rest elements would be to model a command line argument pattern:

```typescript
type Command = [name: string, ...args: string[]];

const gitCommit: Command = ["git", "commit", "-m", "Add new feature"];
const npmInstall: Command = ["npm", "install", "typescript"];

// Function that handles commands
function executeCommand([cmd, ...args]: Command) {
  console.log(`Executing ${cmd} with arguments: ${args.join(", ")}`);
}
```

It says "I _need_ a command string, but everything after that is optional". Pretty neat. Remember, the whole point of a great type system is to more accurately (and narrowly) model the valid states of your program.