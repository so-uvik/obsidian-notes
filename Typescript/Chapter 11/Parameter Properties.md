TypeScript has a neat shorthand feature called [parameter properties](https://www.typescriptlang.org/docs/handbook/2/classes.html#parameter-properties) that allows you to declare and initialize class properties directly in the constructor parameters. This eliminates the need to separately declare properties and then assign them in the constructor body.

## Without Parameter Properties

Normally, you'd write a class like this:

```typescript
class Hero {
  name: string;
  health: number;
  private level: number;

  constructor(name: string, health: number, level: number) {
    this.name = name;
    this.health = health;
    this.level = level;
  }
}
```

## With Parameter Properties

With parameter properties, you can achieve the same result with much less code:

```typescript
class Hero {
  constructor(
    public name: string,
    public health: number,
    private level: number,
  ) {}
}
```

In the example above, the constructor body `{}` is intentionally empty because parameter properties handle declaration and initialization. Other class methods should be defined in the class body, outside the constructor.

By adding an access modifier (`public`, `private`, `protected`, or `readonly`) to a constructor parameter, TypeScript automatically:

1. Declares a property with the same name and type
2. Assigns the parameter value to that property

## Limitation

Parameter properties work with TypeScript's `private` keyword, but **not** with JavaScript's `#` private field syntax. If you need truly private fields using the `#` syntax, you must declare them separately:

```typescript
class Hero {
  #secretPower: string;

  constructor(
    public name: string,
    secretPower: string,
  ) {
    this.#secretPower = secretPower;
  }
}
```