JavaScript is very lenient when it comes to function signatures, and TypeScript gives us a way to take advantage of that flexibility while still maintaining type safety: [function overloads](https://www.typescriptlang.org/docs/handbook/2/functions.html#function-overloads).

First, we define a function that can be called in multiple ways:

```typescript
function formatEmployeeMessage(
  employee: Employee,
  isNew?: boolean,
  onBoardedDate?: Date,
): string {
  if (!isNew) {
    return `Employee: ${employee.name}, Dept: ${employee.dept}`;
  }
  return `Employee: ${employee.name}, New: Yes, Onboarded: ${onBoardedDate}`;
}

type Employee = {
  name: string;
  dept: string;
};
```

Used as-is, this function can be called in 3 different ways:

- `formatEmployeeMessage(employee)`
- `formatEmployeeMessage(employee, boolean)`
- `formatEmployeeMessage(employee, boolean, Date)`

But we can constrain the function to only allow certain combinations of parameters by using function overloads.

```typescript
// note: function overloads need to be declared above the implementation
function formatEmployeeMessage(employee: Employee): string;
function formatEmployeeMessage(
  employee: Employee,
  isNew: true,
  onBoardedDate: Date,
): string;
```

Now, it's impossible to call `formatEmployeeMessage(employee, boolean)` without _also_ passing in a date. Basically we're saying, "If the employee is new, you must _also_ pass in a date". This works:

```ts
const employee: Employee = { name: "Joe Exotic", dept: "Zoo" };
const msg = formatEmployeeMessage(employee);
console.log(msg);
// Employee: Joe Exotic, Dept: Zoo
```

We can also do this:

```ts
const employee: Employee = { name: "Carole Baskin", dept: "Big Cat Rescue" };
const msg = formatEmployeeMessage(employee, true, new Date());
console.log(msg);
// Employee: Carole Baskin, New: Yes, Onboarded: 2023-10-01T00:00:00.000Z
```

But this will throw an error:

```ts
const employee: Employee = { name: "Dillon Passage", dept: "Zoo" };
// Error: No overload expects 2 arguments, but overloads do exist that expect either 1 or 3 arguments.
const msg = formatEmployeeMessage(employee, true);
```