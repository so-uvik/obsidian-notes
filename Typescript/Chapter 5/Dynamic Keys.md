Sometimes, you won't know all of an object's property names in advance. For example, say you're building a customer management system where employees can add custom key/value pairs to customer records:

```
- favoriteColor: "blue"
- favoriteFood: "pizza"
- favoriteAnimal: "cat"
- etc
```

You can't know what the user will add ahead of time, but you still want to model the data in your program.

You can define [dynamic keys using an index signature](https://www.typescriptlang.org/docs/handbook/2/objects.html#index-signatures):

```typescript
type UserMetrics = {
  [key: string]: number;
};
```

This type says "this object can have any number of properties if the keys are strings and the values are numbers."

```ts
const metrics: UserMetrics = {
  wordsPerMinute: 50,
  errors: 2,
  timeOnPage: 120,
};

metrics["refreshRate"] = 60; // OK
metrics["theme"] = "dark"; // Error: Type 'string' is not assignable to type 'number'
```