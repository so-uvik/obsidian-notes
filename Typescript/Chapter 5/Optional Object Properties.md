The following is used [_way_ more often](https://www.youtube.com/shorts/ksBNx1vBm_0) than most of us would like, but it is incredibly useful. Optional properties can be added to an object type with the [`?`](https://www.typescriptlang.org/docs/handbook/2/objects.html#optional-properties) operator:

```typescript
type Superhero = {
  name: string;
  strength: number;
  cape?: boolean; // cape is optional
};
```

That means that the type of `.cape` is actually `boolean | undefined`, just like optional function parameters.

Do _not_ go overboard with optional props... require all the fields that _should_ be there! It will make your life easier with far fewer runtime checks that look like this:

```ts
function fight(superhero: Superhero) {
  if (!superhero.cape) {
    // contact edna mode
  }
  // do the happy path thing
}
```