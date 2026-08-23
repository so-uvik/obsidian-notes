The [`Required<T>`](https://www.typescriptlang.org/docs/handbook/utility-types.html#requiredtype) utility type does the opposite of `Partial<T>` - it forces all properties of a type to be required, even those that were originally optional.

## Using `Required<T>`

Here's a practical example of using `Required<T>`:

```typescript
interface BlogPost {
  title: string;
  content: string;
  tags?: string[];
  publishDate?: Date;
  author?: {
    id: string;
    name?: string;
  };
}

// All properties are now required
type MyRequiredBlogPost = Required<BlogPost>;

// MyRequiredBlogPost is equivalent to:
// {
//   title: string;
//   content: string;
//   tags: string[];
//   publishDate: Date;
//   author: {
//     id: string;
//     name?: string;
//   };
// }
```

As before, the `Required<T>` utility type is _not_ recursive, it only affects the top-level properties.