It can get _really_ cumbersome to write out long custom types whenever you want to use them. For example, maybe we have a function that accepts another function as input. Let's use a totally make-believe example, something that sets a timeout:

```ts
function setLoggerTimeout(
  loggerCallback: (s1: string, s2: string) => string,
  delay: number,
) {
  // do something
}
```

That's a nasty function signature... let's use the [`type` keyword](https://www.typescriptlang.org/docs/handbook/declaration-files/by-example.html#reusable-types-type-aliases) instead to create a type alias:

```ts
type LoggerCallback = (s1: string, s2: string) => string;
```

Now anytime we need to use _this specific kind_ of function (one that accepts two strings and returns a string), we can just use `LoggerCallback`:

```ts
function setLoggerTimeout(loggerCallback: LoggerCallback, delay: number) {
  // do something
}
```