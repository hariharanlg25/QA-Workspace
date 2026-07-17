# Java OOPS (Object-Oriented Programming System) - Complete Notes

---

# Java OOPS (Object-Oriented Programming System)

## What is OOPS?

**Object-Oriented Programming System (OOPS)** is a programming paradigm that organizes software design around **objects** rather than functions or logic.

An **object** is a real-world entity that has:

* **State (Data)** → Variables
* **Behavior (Functionality)** → Methods

Java is called an **Object-Oriented Programming Language** because almost everything in Java is represented using objects.

### Real-Time Example

Imagine a **Car**

* State

  * Color = Red
  * Brand = BMW
  * Speed = 120 km/hr

* Behavior

  * Start()
  * Stop()
  * Accelerate()

In Java

```java
class Car {

    String color;
    String brand;
    int speed;

    void start() {
        System.out.println("Car Started");
    }

    void stop() {
        System.out.println("Car Stopped");
    }
}
```

Creating an object

```java
public class Main {

    public static void main(String[] args) {

        Car car1 = new Car();

        car1.color = "Red";
        car1.brand = "BMW";

        car1.start();
    }
}
```

Output

```
Car Started
```

---

# Why OOPS?

Without OOPS

* Code becomes lengthy
* Difficult to maintain
* Difficult to reuse
* Difficult to modify

With OOPS

* Better code organization
* Easy maintenance
* Reusable code
* Secure implementation
* Easy debugging

---

# Main Concepts of OOPS

There are **4 Pillars of OOPS**

1. Encapsulation
2. Inheritance
3. Polymorphism
4. Abstraction

Additionally,

* Class
* Object
* Constructor

are the foundation of OOPS.

---

# OOPS Structure

```
OOPS

│
├── Class
├── Object
├── Constructor
├── Encapsulation
├── Inheritance
├── Polymorphism
└── Abstraction
```

---

# 1. Class

## Definition

A **Class** is a blueprint or template used to create objects.

It defines

* Variables
* Methods

### Example

```java
class Student {

    String name;
    int age;

    void study() {
        System.out.println("Student is studying");
    }

}
```

Student is only a blueprint.

No memory is allocated until an object is created.

---

## Advantages

* Reusable
* Organized code
* Easy maintenance
* Supports OOPS concepts

## Disadvantages

* Slightly more memory usage
* More code for small applications

---

# 2. Object

## Definition

An object is an instance of a class.

Memory is allocated only after object creation.

### Example

```java
Student s1 = new Student();

s1.name = "Hari";
s1.age = 25;

s1.study();
```

Output

```
Student is studying
```

---

## Real-Time Example

Class

```
Car
```

Objects

```
BMW
Audi
Tesla
Honda
```

---

## Advantages

* Represents real-world entities
* Independent memory allocation
* Easy interaction

## Disadvantages

* More objects consume more memory

---

# 3. Constructor

## Definition

A Constructor is a special method used to initialize an object.

Characteristics

* Same name as class
* No return type
* Automatically called

---

### Default Constructor

```java
class Student {

    Student() {

        System.out.println("Constructor Called");

    }

}
```

Output

```
Constructor Called
```

---

### Parameterized Constructor

```java
class Student {

    String name;

    Student(String name){

        this.name = name;

    }

}
```

Main

```java
Student s = new Student("Hari");

System.out.println(s.name);
```

Output

```
Hari
```

---

## Advantages

* Automatic initialization
* Cleaner code
* Object always starts with valid values

## Disadvantages

* Multiple constructors can increase complexity

---

# 4. Encapsulation

## Definition

Encapsulation means wrapping data and methods into a single unit.

Data is protected using

```
private
```

Access is provided using

```
Getter
Setter
```

---

### Example

```java
class Employee {

    private int salary;

    public void setSalary(int salary){

        this.salary = salary;

    }

    public int getSalary(){

        return salary;

    }

}
```

Main

```java
Employee emp = new Employee();

emp.setSalary(50000);

System.out.println(emp.getSalary());
```

Output

```
50000
```

---

## Advantages

* Data hiding
* Security
* Better control
* Easy maintenance

## Disadvantages

* Slightly more code (getters/setters)
* Small performance overhead

---

## Real-Time Example

ATM Machine

You cannot directly access bank balance.

You use

```
Withdraw()
Deposit()
Check Balance()
```

---

# 5. Inheritance

## Definition

Inheritance allows one class to acquire the properties and methods of another class.

Keyword

```
extends
```

---

### Example

```java
class Animal {

    void eat(){

        System.out.println("Animal is eating");

    }

}

class Dog extends Animal {

    void bark(){

        System.out.println("Dog is barking");

    }

}
```

Main

```java
Dog d = new Dog();

d.eat();

d.bark();
```

Output

```
Animal is eating
Dog is barking
```

---

## Types of Inheritance in Java

### 1. Single Inheritance

```
Animal
   |
 Dog
```

---

### 2. Multilevel Inheritance

```
Animal
   |
 Dog
   |
 Puppy
```

---

### 3. Hierarchical Inheritance

```
      Animal
      /    \
    Dog    Cat
```

---

### Multiple Inheritance

Java **does not support** multiple inheritance with classes to avoid ambiguity (Diamond Problem). It can be achieved using interfaces.

```
Class A
     \
      \
      Class C
      /
     /
Class B
```

---

## Advantages

* Code reuse
* Easy extension
* Reduced duplication
* Better maintainability

## Disadvantages

* Tight coupling
* Deep inheritance trees are difficult to maintain
* Misuse can reduce readability

---

## Real-Time Example

```
Vehicle

↓

Car

↓

Electric Car
```

---

# 6. Polymorphism

## Definition

Polymorphism means **one name, many forms**.

The same method behaves differently depending on the situation.

There are two types:

1. Compile-Time Polymorphism (Method Overloading)
2. Run-Time Polymorphism (Method Overriding)

---

# Method Overloading

Same method

Different parameters

Example

```java
class Calculator{

    int add(int a,int b){

        return a+b;

    }

    int add(int a,int b,int c){

        return a+b+c;

    }

}
```

Output

```
20

30
```

---

# Method Overriding

Parent class method is overridden by child class.

```java
class Animal{

    void sound(){

        System.out.println("Animal Sound");

    }

}

class Dog extends Animal{

    @Override
    void sound(){

        System.out.println("Dog Barks");

    }

}
```

Main

```java
Dog d = new Dog();

d.sound();
```

Output

```
Dog Barks
```

---

## Advantages

* Flexibility
* Reusability
* Dynamic method execution
* Cleaner code

## Disadvantages

* Slight performance overhead (runtime polymorphism)
* Can make debugging more complex

---

## Real-Time Example

```
Payment

UPI

Card

Cash
```

Each payment type implements its own payment process.

---

# 7. Abstraction

## Definition

Abstraction means showing only the essential details while hiding implementation details.

Achieved using

* Abstract Class
* Interface

---

# Abstract Class Example

```java
abstract class Animal{

    abstract void sound();

}
```

```java
class Dog extends Animal{

    void sound(){

        System.out.println("Dog Barks");

    }

}
```

Output

```
Dog Barks
```

---

# Interface Example

```java
interface Vehicle{

    void start();

}
```

```java
class Car implements Vehicle{

    public void start(){

        System.out.println("Car Started");

    }

}
```

---

## Advantages

* Hides complexity
* Improves security
* Easy maintenance
* Flexible design

## Disadvantages

* More design effort
* Beginners may find it harder to understand

---

## Real-Time Example

Driving a car

You only use

```
Steering
Brake
Accelerator
```

You do not need to know how the engine internally works.

---

# Difference Between Encapsulation and Abstraction

| Encapsulation            | Abstraction                   |
| ------------------------ | ----------------------------- |
| Hides data               | Hides implementation          |
| Uses private variables   | Uses abstract class/interface |
| Focuses on data security | Focuses on simplicity         |
| Getter/Setter methods    | Abstract methods              |

---

# Difference Between Overloading and Overriding

| Overloading          | Overriding             |
| -------------------- | ---------------------- |
| Same method name     | Same method name       |
| Different parameters | Same parameters        |
| Compile Time         | Runtime                |
| Same class           | Parent & Child classes |

---

# Difference Between Class and Object

| Class          | Object           |
| -------------- | ---------------- |
| Blueprint      | Instance         |
| No memory      | Memory allocated |
| Logical entity | Physical entity  |

---

# Difference Between Abstract Class and Interface

| Abstract Class                         | Interface                                                                                    |
| -------------------------------------- | -------------------------------------------------------------------------------------------- |
| Can have abstract and concrete methods | Traditionally only abstract methods (modern Java also allows `default` and `static` methods) |
| Supports constructors                  | No constructors                                                                              |
| Single inheritance                     | Multiple interfaces can be implemented                                                       |
| Uses `extends`                         | Uses `implements`                                                                            |

---

# Advantages of OOPS

* Code Reusability
* Data Security
* Modularity
* Scalability
* Easy Maintenance
* Easy Debugging
* Real-world Modeling
* Improved Productivity
* Flexible Design
* Reduced Code Duplication

---

# Disadvantages of OOPS

* Higher memory usage due to objects
* Slight performance overhead from abstraction and polymorphism
* Steeper learning curve for beginners
* Not ideal for very small/simple programs
* Designing classes and relationships can take more time

---

# Real-Life Examples of OOPS

| OOPS Concept  | Real-Life Example                                           |
| ------------- | ----------------------------------------------------------- |
| Class         | Car blueprint                                               |
| Object        | BMW, Audi, Tesla                                            |
| Encapsulation | ATM machine protecting account data                         |
| Inheritance   | Animal → Dog                                                |
| Polymorphism  | Payment using UPI, Card, or Cash                            |
| Abstraction   | Driving a car without knowing engine internals              |
| Constructor   | Birth of a person with initial attributes (name, age, etc.) |

---

# Interview Questions

1. What is OOPS?
2. Why is Java called an Object-Oriented language?
3. What is the difference between a class and an object?
4. What is a constructor? What types of constructors are there?
5. Explain encapsulation with a real-time example.
6. What are the types of inheritance in Java?
7. Why does Java not support multiple inheritance with classes?
8. Explain compile-time and runtime polymorphism.
9. What is method overloading?
10. What is method overriding?
11. What is abstraction? How is it achieved in Java?
12. What is the difference between an abstract class and an interface?
13. What is the difference between encapsulation and abstraction?
14. What are the advantages and disadvantages of OOPS?
15. Give a real-time example for each OOPS concept.

These notes cover the core Java OOP concepts from beginner to interview level, with definitions, advantages, disadvantages, code examples, real-world analogies, and comparison tables.
