Luckily TypeScript is smart enough to handle the funky `this` keyword for us, because as JavaScript developers, we know that the only question more difficult than "what is the meaning of life?" is "what is the value of `this`?".

```typescript
class Counter {
  private count: number = 0;

  increment(): void {
    // 'this' is implicitly typed as Counter
    this.count++;
  }

  getCount(): number {
    // 'this' is implicitly typed as Counter
    return this.count;
  }
}
```

## Explicit `this` Parameters

TypeScript is pretty smart (especially newer versions) and usually infers the type of `this` correctly. However, if you want to explicitly control the type of `this`, you can use the [special `this` parameter](https://www.typescriptlang.org/docs/handbook/2/functions.html#declaring-this-in-a-function):

```typescript
class Counter {
  private count: number = 0;

  increment(this: Counter, n: number): void {
    // 'this' is explicitly typed as Counter
    // the `this` parameter is not available at runtime
    // it is only used for type checking
    this.count += n;
  }

  getCount(this: Counter): number {
    // 'this' is explicitly typed as Counter
    return this.count;
  }
}

const counter = new Counter();
counter.increment(5);
console.log(counter.getCount());
// 5
```