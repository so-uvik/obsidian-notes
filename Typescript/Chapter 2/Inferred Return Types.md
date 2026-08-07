So you know how we discussed that:

```ts
const myPowerLevel = 9000;
```

Is better TypeScript than:

```ts
const myPowerLevel: number = 9000;
```

What follows is a bit of personal opinion, but I think the same is _generally_ true for function _return_ (not parameter) types.

Instead of this:

```ts
function divide(a: number, b: number): number {
  return a / b;
}
```

We can write this:

```ts
function divide(a: number, b: number) {
  return a / b;
}
```

And TypeScript infers the output type as `number`.