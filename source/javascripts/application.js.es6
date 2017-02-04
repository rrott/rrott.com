// application.js.es6

let [first, , last] = [1, 2, 3];

class Person {
  constructor(name) {
    this.name = name;
  }

  get fullName() {
    return `Mr. ${this.name}`;
  }
}