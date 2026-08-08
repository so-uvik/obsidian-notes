Say I innocently create a new empty object:

```typescript
let newUser = {};
```

Then go to add properties to it later:

```typescript
// Property 'name' does not exist on type '{}'
newUser.name = "Lane";
```

**TypeScript doesn't like that**!

It makes sense, we never told TypeScript which properties to allow... but here's what's really crazy: _this_ is actually allowed:

```typescript
let newUser = {};
newUser = "Lane";
```

_Yup_. You can reassign the variable, which initially held an empty object to a _string_. In fact, you can reassign it to anything except `null` or `undefined`, because everything else is technically an object! So, to get back to our first example, what you probably _want_ to do is just predefine the allowed field(s):

```typescript
type User = {
  name: string;
};

let newUser: User = {
  name: "Lane",
};
```