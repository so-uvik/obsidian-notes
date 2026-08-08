When you create a new empty array, TypeScript infers it as `any[]`.

```typescript
let inventory = [];
// inventory: any[]
```

If you then push a type into it, TypeScript will infer the array as that type.

```typescript
inventory.push(42);
// inventory: number[]
```

Where it gets weird is that you're actually still allowed to push other types into the array, it just keeps updating the underlying type:

```ts
inventory.push("robe");
// inventory: (number | string)[]
```

This is so fascinating because if we had explicitly typed the array as `number[]`, we would have gotten an error when trying to push a string into it.

```typescript
let inventory: number[] = [];
inventory.push("robe");
// Error: Argument of type 'string' is not assignable to parameter of type 'number'
```

The "evolving any" is a special type inference feature. It's not very useful if you're trying to _restrict_ what can be pushed into an array within the initial scope, but it _is_ useful outside of that scope. Let me show you what I mean. Let's say I make a function like this:

```typescript
function getConfig() {
  let config = [];
  // config: any[]
  config.push("api-key");
  // config: string[]
  config.push(8080);
  // config: (string | number)[]
  return config;
}
```

Within `getConfig`, the array feels like `any`... I can just keep adding stuff. However, when I _use_ `getConfig`:

```typescript
let config = getConfig();
// config: (string | number)[]

config.push(false);
// Error: Argument of type 'boolean' is not assignable to parameter of type 'string | number'
```

_Now_ I get an error! The evolving any _stops_ evolving when it's passed around.