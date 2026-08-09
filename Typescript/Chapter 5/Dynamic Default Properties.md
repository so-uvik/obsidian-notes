So there's this (seemingly) weird but useful thing that you'll see in the wild:

```typescript
type FormData = {
  [field: string]: string;
  email: string;
  password: string;
};
```

If what you're concerned about is which types are _allowed_ in the object, you might wonder why `email` and `password` are even there. After all, you can specify _any_ string key/value pairs in this type, right?

**You use this syntax to _require_ certain properties**, in this case, `email` and `password`. The type above says:

> The object must have an `email` and `password` property, and it can have any number of additional string properties.

Here's another example:

```typescript
type FormData = {
  [field: string]: string | number | boolean;
  email: string;
  password: string;
  age: number;
};
```

This type says:

> The object must have an `email` (string), `password` (string), and `age` (number) property, but it can have any number of additional string, number, or boolean properties.

>[!Tip]
>Take a look at this piece of code here:
>```typescript
>type FormData = {
  [field: string]: string | number | boolean;
  email: string;
  password: string;
  age: number;
};
>```
>If you remove any of `number` or `boolean` from the dynamic key, typescript will throw an error, because in TypeScript, **index signatures (dynamic keys) must encompass all explicit properties defined in the object type**.
They are not treated as separate or isolated definitions; instead, an index signature acts as a blanket rule enforcing what types _any_ property on that object can possibly have.

So a Dynamic key should have all of the types of other keys in that Type.