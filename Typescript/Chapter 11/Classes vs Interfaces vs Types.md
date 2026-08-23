You might be wondering when you should use a full-blown class to create reusable object types over interfaces and type aliases. There are 3 ways to model the same thing!

```ts
class Hero {
  name: string;
  health: number;
}

interface Hero {
  name: string;
  health: number;
}

type Hero = {
  name: string;
  health: number;
};
```

If you're an object-oriented programmer, you might be more comfortable with classes and the extra features they provide. Classes can basically do everything that interfaces can do, and more. Some of the most notable things you _can't_ do with interfaces and type aliases are:

- Have private, protected, static, and abstract members
- Have dedicated constructors
- Have method implementations predefined on all instances

And on the other hand:

- Type aliases and interfaces have no runtime overhead
- Type aliases and interfaces have fewer features, and as a result, are simpler to work with when you don't need the extra features
- Type aliases and interfaces are more flexible, especially when working with plain objects because they're not tied to the class implementation (signature only)
- Interfaces can be extended and merged in ways that types and classes can't

Personally, I'm a simple man. I tend to use type aliases when I can, and only reach for the additional features of classes when I feel I need them, which is rare in web development, at least in my opinion.