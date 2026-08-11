Sometimes tuples are also useful when you want to return multiple values from a function (which is impossible in JS/TS), but you don't want to create a new object type just to do so. A tuple, along with destructuring, is a handy way to return "positional" data.

```typescript
function getName(fullName: string): [string, string] {
  const parts = fullName.split(" ");
  return [parts[0], parts[1]];
}

const [firstName, lastName] = getName("Frodo Baggins");
```

## Nested Destructuring

There's nothing stopping you from destructuring nested tuples and objects all at once. Use this example to answer the question:

```typescript
type UserWithAddress = [string, { city: string; country: string }];

const userData: UserWithAddress = [
  "Aragorn",
  { city: "Minas Tirith", country: "Gondor" },
];

const [userName, { city, country }] = userData;
console.log(city);
// ?
```