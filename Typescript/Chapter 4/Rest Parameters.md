[Rest parameters](https://www.typescriptlang.org/docs/handbook/2/functions.html#rest-parameters) allow an indefinite number of final arguments, and brings them into the function body as an array. They're denoted by three dots (`...`) before the parameter name.

```typescript
function gatherParty(partyName: string, ...adventurers: string[]): string {
  return `${partyName} consists of: ${adventurers.join(", ")}`;
}

const msg = gatherParty("The Fellowship", "Frodo", "Sam", "Gandalf");
console.log(msg);
// "The Fellowship consists of: Frodo, Sam, Gandalf"
```

>[!warning]
>Don't confuse rest parameters with the similar but different [spread syntax](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Spread_syntax).

### Then what's the difference between this and type[]?

Well, when you give the type of a parameter as `exampleFunction(a : string[])` the way you call the function is like this `exampleFunction(["something"])` but if you write it the `...rest parameter` way like this `exampleFunction(...a: string[])` you can invoke the function like this `exampleFunction("something")` or even not pass it at all like this `exampleFunction()` and it will still work!