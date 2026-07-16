These are some of the most commonly used **Automation Design Patterns** in Selenium and Test Automation Frameworks. Understanding these patterns helps you write code that is **maintainable, scalable, reusable, and easy to debug**.

---

# 1. Builder Pattern

## What is the Builder Pattern?

The **Builder Pattern** is a **creational design pattern** used to construct complex objects **step by step** instead of using large constructors with many parameters.

Rather than passing multiple parameters to a constructor, a builder creates the object gradually, allowing optional fields to be added only when required.

### Why do we use it?

Imagine creating a user with many fields.

Without Builder:

```java
User user = new User(
    "Hari",
    "Haran",
    "hari@gmail.com",
    "9876543210",
    "Bangalore",
    "India",
    true,
    "Admin",
    "English"
);
```

Problems:

* Difficult to remember parameter order
* Hard to read
* Easy to make mistakes
* Optional parameters become confusing

Builder solves this problem.

---

## Real-world analogy

Ordering a pizza.

You don't receive the pizza immediately.

Instead you build it:

* Choose size
* Choose crust
* Add cheese
* Add vegetables
* Add toppings

Finally,

```
Build Pizza
```

Similarly,

Builder gradually constructs an object.

---

## Example

### Step 1: User class

```java
public class User {

    private String firstName;
    private String lastName;
    private String email;
    private String mobile;

    private User(UserBuilder builder) {
        this.firstName = builder.firstName;
        this.lastName = builder.lastName;
        this.email = builder.email;
        this.mobile = builder.mobile;
    }

    public static class UserBuilder {

        private String firstName;
        private String lastName;
        private String email;
        private String mobile;

        public UserBuilder firstName(String firstName){
            this.firstName = firstName;
            return this;
        }

        public UserBuilder lastName(String lastName){
            this.lastName = lastName;
            return this;
        }

        public UserBuilder email(String email){
            this.email = email;
            return this;
        }

        public UserBuilder mobile(String mobile){
            this.mobile = mobile;
            return this;
        }

        public User build(){
            return new User(this);
        }
    }
}
```

Usage

```java
User user = new User.UserBuilder()
                    .firstName("Hari")
                    .lastName("Haran")
                    .email("hari@gmail.com")
                    .mobile("9876543210")
                    .build();
```

Very readable.

---

## Builder Pattern in Selenium

Suppose a registration page has many optional fields.

Instead of

```java
register(
    firstName,
    lastName,
    email,
    mobile,
    city,
    state,
    gender,
    occupation
);
```

Builder allows

```java
RegistrationData data =
new RegistrationData.Builder()
    .firstName("Hari")
    .lastName("Haran")
    .email("hari@gmail.com")
    .mobile("9876543210")
    .build();

registrationPage.register(data);
```

---

## Advantages

* Easy to read
* Prevents constructor confusion
* Supports optional fields
* Easy to maintain
* Immutable object creation

---

## Disadvantages

* More classes
* Slightly more code

---

# 2. Page Factory Pattern

## What is Page Factory?

Page Factory is Selenium's implementation of the **Page Object Model (POM)**.

Instead of locating elements every time,

it initializes all WebElements automatically.

---

Traditional POM

```java
driver.findElement(By.id("username")).sendKeys("Hari");
```

Every method searches the element.

Page Factory initializes them only once.

---

## How it works

Uses annotations

```java
@FindBy
```

along with

```java
PageFactory.initElements()
```

---

## Example

```java
public class LoginPage {

    WebDriver driver;

    public LoginPage(WebDriver driver){
        this.driver = driver;
        PageFactory.initElements(driver, this);
    }

    @FindBy(id="username")
    WebElement txtUsername;

    @FindBy(id="password")
    WebElement txtPassword;

    @FindBy(id="login")
    WebElement btnLogin;

    public void login(String user,String pass){

        txtUsername.sendKeys(user);
        txtPassword.sendKeys(pass);
        btnLogin.click();
    }

}
```

Usage

```java
LoginPage login = new LoginPage(driver);

login.login("Hari","Password123");
```

---

## What happens internally?

Instead of

```java
driver.findElement(...)
```

Selenium creates proxies.

Only when

```java
txtUsername.sendKeys()
```

is executed,

the element is actually searched.

This is called **Lazy Initialization**.

---

## Advantages

* Cleaner code
* Less repetition
* Easy maintenance
* Readable
* Supports Lazy Loading

---

## Disadvantages

* Dynamic elements may become stale
* Requires annotations
* Modern Selenium projects often prefer standard Page Object Model with explicit `By` locators because it provides better control and clearer synchronization.

---

## Page Object Model vs Page Factory

| Feature               | Page Object Model | Page Factory                         |
| --------------------- | ----------------- | ------------------------------------ |
| Element storage       | By Locators       | @FindBy                              |
| Initialization        | Manual            | Automatic                            |
| Lazy Loading          | No                | Yes                                  |
| Readability           | Good              | Better                               |
| Modern recommendation | Preferred         | Less commonly used in new frameworks |

---

# 3. Singleton Pattern

## What is Singleton?

Singleton ensures

> Only ONE object of a class exists throughout the application.

---

Imagine

If every page creates

```java
new ChromeDriver()
```

You'll open multiple browsers.

Instead,

Create one driver.

Everyone uses it.

---

Real-world analogy

A printer server in an office.

Everyone sends print jobs to

ONE printer.

Not every employee buys a new printer.

---

## Selenium Example

```java
public class DriverManager {

    private static WebDriver driver;

    private DriverManager(){}

    public static WebDriver getDriver(){

        if(driver == null){

            driver = new ChromeDriver();
        }

        return driver;
    }
}
```

Usage

```java
WebDriver driver = DriverManager.getDriver();
```

Second call

```java
WebDriver driver2 = DriverManager.getDriver();
```

Both refer to the same browser.

---

## Why use Singleton?

Without Singleton

```
Test1
  new ChromeDriver()

Test2
  new ChromeDriver()

Test3
  new ChromeDriver()
```

Many browsers open.

With Singleton

```
DriverManager

↓

ChromeDriver

↓

All pages use same driver
```

---

## Advantages

* One browser instance
* Saves memory
* Easy driver management
* Centralized configuration

---

## Disadvantages

* Not suitable for parallel execution if using a single shared instance across threads.
* Requires additional handling such as `ThreadLocal<WebDriver>` for parallel test execution.

---

# 4. Strategy Pattern

## What is Strategy Pattern?

Strategy Pattern allows changing an algorithm **without changing the client code**.

Instead of using

```
if
else
else
```

different strategies are created.

The correct one is selected at runtime.

---

Real-world analogy

Google Maps.

Destination is same.

Strategy changes.

* Car
* Bike
* Walk
* Bus

Same destination.

Different algorithms.

---

## Example

Payment

Instead of

```java
if(type.equals("UPI")){

}
else if(type.equals("CARD")){

}
else{

}
```

Create strategies.

---

Interface

```java
public interface PaymentStrategy {

    void pay();
}
```

UPI

```java
public class UpiPayment implements PaymentStrategy{

    public void pay(){

        System.out.println("UPI Payment");
    }
}
```

Card

```java
public class CardPayment implements PaymentStrategy{

    public void pay(){

        System.out.println("Card Payment");
    }
}
```

Context

```java
public class PaymentContext{

    PaymentStrategy payment;

    public PaymentContext(PaymentStrategy payment){

        this.payment = payment;
    }

    public void execute(){

        payment.pay();
    }
}
```

Usage

```java
PaymentContext context =
new PaymentContext(new UpiPayment());

context.execute();
```

Later

```java
PaymentContext context =
new PaymentContext(new CardPayment());

context.execute();
```

No code changes.

Only strategy changes.

---

## Selenium Example

Suppose Login

Different users

```
Admin

Citizen

Inspector

Approver

Operator
```

Instead of

```java
if(role.equals("Admin")){

}

else if(role.equals("Citizen")){

}
```

Create

```
AdminLoginStrategy

CitizenLoginStrategy

InspectorLoginStrategy

ApproverLoginStrategy
```

Runtime decides which login to execute.

---

## Advantages

* Removes large `if-else` blocks.
* Easy to add new behaviors without modifying existing code.
* Improves readability and maintainability.
* Follows the **Open/Closed Principle** (open for extension, closed for modification).

---

## Disadvantages

* Introduces more classes and interfaces.
* May feel excessive for very small projects.

---

1. Builder Pattern
Type: Creational Design Pattern
Purpose: Builds complex objects step by step, especially when there are many optional parameters.
Selenium Automation Example: Creating test data objects such as RegistrationData, UserData, or EmployeeData before passing them to page methods.
Key Benefit: Makes object creation more readable, flexible, and less error-prone.

2. Page Factory Pattern
Type: Structural Design Pattern (Selenium support pattern)
Purpose: Initializes web elements using annotations like @FindBy, reducing the need to locate elements manually.
Selenium Automation Example: Creating page classes such as LoginPage, RegistrationPage, or DashboardPage where elements are initialized using PageFactory.initElements().
Key Benefit: Produces cleaner page classes, supports lazy initialization of elements, and improves code readability.

3. Singleton Pattern
Type: Creational Design Pattern
Purpose: Ensures that only one instance of a class exists throughout the application's lifecycle.
Selenium Automation Example: Managing a single WebDriver instance so all page classes use the same browser session during test execution.
Key Benefit: Centralizes browser management, reduces resource usage, and prevents multiple unnecessary browser instances.

4. Strategy Pattern
Type: Behavioral Design Pattern
Purpose: Encapsulates different algorithms or behaviors into separate classes and allows them to be selected at runtime.
Selenium Automation Example: Implementing different login strategies (Admin, Citizen, Inspector), payment methods (UPI, Card, Net Banking), or approval workflows without using lengthy if-else statements.
Key Benefit: Makes the framework extensible, improves maintainability, and eliminates complex conditional logic.


## When to use each pattern in an automation framework

* **Builder Pattern**: Use when creating complex test data or request objects with many optional fields.
* **Page Factory**: Use (or standard POM with `By` locators) to organize page elements and actions into reusable page classes.
* **Singleton Pattern**: Use to manage shared resources such as `WebDriver`, configuration managers, or logging utilities. For parallel execution, combine with `ThreadLocal`.
* **Strategy Pattern**: Use when the application has multiple interchangeable workflows, such as role-based logins, payment options, approval paths, browser-specific behaviors, or environment-specific implementations.

Together, these patterns help create an automation framework that is modular, reusable, maintainable, and scalable as the application and test suite grow.
