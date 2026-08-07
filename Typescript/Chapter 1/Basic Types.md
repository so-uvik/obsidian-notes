TypeScript adds type annotations to JavaScript variables using a `:` followed by the type. The most common primitive types are:

```ts
const bootupMessage: string = "starting server...";
const port: number = 3000;
const isOnline: boolean = true;
const noValue: null = null;
const notDefined: undefined = undefined;
```

If a value doesn't match its type, TypeScript throws a compilation error:

```ts
const bootupMessage: string = 123;
// Error: Type 'number' is not assignable to type 'string'.
```
