TypeScript is great at [type inference](https://www.typescriptlang.org/docs/handbook/type-inference.html). Instead of explicitly declaring the type of every variable, TypeScript can infer it from the value:

```ts
// explicit (unnecessary)
const bootupLog: string = "starting server...";

// inferred (preferred)
const bootupLog = "starting server...";
```

Both are equally type-safe, but the inferred version is less typing and leaves less room for human error. **Let TypeScript infer types for you**!