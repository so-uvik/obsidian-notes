With dynamic property keys we've only used the `string` type so far, and most of the time, that's all you need. However, JavaScript also supports number and symbols as property keys. TypeScript actually has a **built-in type called [`PropertyKey`](https://www.typescriptlang.org/docs/handbook/2/mapped-types.html#handbook-content)** that represents all possible property key types:

```typescript
// this is a built-in type
type PropertyKey = string | number | symbol;
```

A [`symbol`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol) is a unique and immutable data type that may be used as an object property name. It's kinda like a `string`, but it's guaranteed to be unique.

So, instead of:

```ts
type InfrastructureTags = {
  [key: string]: any;
};
```

We can allow number and symbol keys (the JS default) like this:

```ts
type InfrastructureTags = {
  [key: PropertyKey]: any;
};

const janesServer: InfrastructureTags = {
  name: "Jane's Server",
  1: 420,
  [Symbol("role")]: "Admin",
};
```

To read or write a symbol-keyed property, use the symbol itself with bracket notation. Dot notation won't work.

```ts
const ROLE = Symbol("role");
const user = { [ROLE]: "Admin" };
user[ROLE]; // "Admin"
// user.ROLE; // undefined
```