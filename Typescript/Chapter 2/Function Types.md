Functions themselves are values in JavaScript (and by extension, TypeScript), which means they must also have a type, right? You might think:

> Oh, easy. They're probably some "`function`" type.

Not so fast. Function types are much more specific than that. In TypeScript, a function's type includes information about its parameters and return value.

## Defining Function Types

The syntax for a function type looks like this:

```ts
(param1: type1, param2: type2, ...) => returnType
```

For example, a function that takes two numbers and returns a number:

```ts
(a: number, b: number) => number;
```

and both of these functions are of that type:

```ts
const add = (a, b) => a + b;
const subtract = (a, b) => a - b;
```