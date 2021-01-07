class Book {
  constructor(public code: number, public name: string) {}
}

class Ticket {
  constructor(public code: string, public name: string) {}
}

type Code<T> = T extends { code: infer U } ? U : never;
type Item<T> = { code: Code<T> };

function filter<U>(list: Item<U>[], code: Code<U>): Item<U>[] {
  return list.filter((item) => item.code == code);
}

const orderedBooks = [
  new Book(1, "A"),
  new Book(2, "マガジン2019"),
  new Book(2, "マガジン2020"),
];

const orderedTickets = [
  new Ticket("0001", "もくもく会A"),
  new Ticket("0002", "もくもく会B"),
  new Ticket("0003", "もくもく会C"),
];

console.log(filter<Book>(orderedBooks, 2));
console.log(filter<Ticket>(orderedTickets, "0001"));
