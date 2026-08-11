Like object properties, you can make tuple elements optional using the `?` modifier:

```typescript
type HttpResponse = [statusCode: number, data: string, error?: string];

// Both of these work!
const successResponse: HttpResponse = [200, "Success!"];
const errorResponse: HttpResponse = [404, "", "Resource not found"];
```

## Optional Values Are Last

Similar to optional function parameters, all required elements must come before optional elements. This does _not_ work:

```ts
type HttpResponse = [statusCode: number, data?: string, error: string];
```

But this does:

```ts
type HttpResponse = [statusCode: number, data?: string, error?: string];
```
## Optional Types Are Potentially Undefined

All optional elements are automatically unioned with `undefined`.

```typescript
type UserInfo = [name: string, age: number, address?: string];

function handleUserInfo(user: UserInfo) {
  const [name, age, address] = user;
  // name: string
  // age: number
  // address: string | undefined
}
```