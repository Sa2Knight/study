function f() {
  return {
    name: "sasaki",
    age: 28,
  };
}

let user: ReturnType<typeof f>;
user = f();

console.log(user);
