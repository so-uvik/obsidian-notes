# Void

The TS-specific [`void`](https://www.typescriptlang.org/docs/handbook/2/functions.html#void) type represents the return value of functions that _don't_ return a value.

```ts
function logMessage(message: string): void {
  console.log(message);
  // nothing is returned here!
}
```

In JavaScript, a function without a `return` statement returns `undefined` by default... but that's kinda vague. TypeScript uses the `void` keyword to indicate that truly _nothing_ is returned.

In other words, `void` more explicitly communicates the _intent_ that a function returns _nothing_.