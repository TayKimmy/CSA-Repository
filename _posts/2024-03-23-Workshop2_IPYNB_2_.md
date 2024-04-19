---
toc: True
layout: post
title: Workshop 2 Hacks
type: hacks
courses: {'csa': {'week': 29}}
---

# Workshop 2 Hacks

## Question 2 - Writing Classes
(a) Describe the different features needed to create a class and what their purpose is.

Some features needed to create a class are:
- Constructor - Initialize objects of the class
- Methods - Define the actions that can be performed on the objects
- Attributes - Represent the data associated with the class

(b) Code:

Create a Java class BankAccount to represent a simple bank account. This class should have the following attributes:

accountHolder (String): The name of the account holder. balance (double): The current balance in the account. Implement the following mutator (setter) methods for the BankAccount class:
setAccountHolder(String name): Sets the name of the account holder.
deposit(double amount): Deposits a given amount into the account.
withdraw(double amount): Withdraws a given amount from the account, but only if the withdrawal amount is less than or equal to the current balance. Ensure that the balance is never negative.


```java
public class BankAccount {
    private String accountHolder;
    private double balance;

    public BankAccount(String accountHolder, double balance) {
        this.accountHolder = accountHolder;
        this.balance = balance;
    }

    public void setAccountHolder(String name) {
        accountHolder = name;
    }

    public void deposit(double amount) {
        balance += amount;
    }

    public void withdraw(double amount) {
        if (amount <= balance) {
            balance -= amount;
        } else {
            System.out.println("Not enough money");
        }
    }

    public double getBalance() {
        return balance;
    }

    public static void main(String[] args) {
        BankAccount account = new BankAccount("John Doe", 5000.0);
        System.out.println("Initial Balance: $" + account.getBalance());
        account.deposit(500.0);
        System.out.println("Balance after deposit: $" + account.getBalance());
        account.withdraw(200.0);
        System.out.println("Balance after withdrawal: $" + account.getBalance());
        account.withdraw(10000.0);
    }
}
BankAccount.main(null);
```

    Initial Balance: $5000.0
    Balance after deposit: $5500.0
    Balance after withdrawal: $5300.0
    Not enough money


## Question 4 - Wrapper Classes:

(a) Provide a brief summary of what a wrapper class is and provide a small code block showing a basic example of a wrapper class.

A wrapper class is a class whose objects contain primitive data. They "wrap" primitive values in an object, allowed them to be passed as arguments, added to collections, etc. They allow us to represent primitive data types as objects.


```java
public class Wrapper {
    public static void main(String[] args) {
        Integer num = new Integer(10); // wrapping int primitive into Integer object
        System.out.println(num);
    }
}
Wrapper.main(null);
```

(b) Create a Java wrapper class called Temperature to represent temperatures in Celsius. Your Temperature class should have the following features:

Fields:

A private double field to store the temperature value in Celsius.

Constructor:

A constructor that takes a double value representing the temperature in Celsius and initializes the field.

Methods:

getTemperature(): A method that returns the temperature value in Celsius. setTemperature(double value): A method that sets a new temperature value in Celsius. toFahrenheit(): A method that converts the temperature from Celsius to Fahrenheit and returns the result as a double value.


```java
public class Temperature {
    private double temperatureValue;

    public Temperature(double temperatureValue) {
        this.temperatureValue = temperatureValue;
    }

    public double getTemperature() {
        return temperatureValue;
    }

    public void setTemperature(double value) {
        temperatureValue = value;
    }

    public double toFahrenheit() {
        return (temperatureValue * 9 / 5 + 32);
    }

    public static void main(String[] args) {
        Temperature temp = new Temperature (37.4);
        System.out.println("Temperature in Celsius: " + temp.getTemperature());
        System.out.println("Temperature in Fahrenheit: " + temp.toFahrenheit());
        temp.setTemperature(30.0);
        System.out.println("Updated Temperature in Celsius: " + temp.getTemperature());
    }
}
Temperature.main(null);
```

    Temperature in Celsius: 37.4
    Temperature in Fahrenheit: 99.32
    Updated Temperature in Celsius: 30.0


## Question 5 - Inheritence

Situation: You are developing a program to manage a zoo, where various types of animals are kept in different enclosures. To streamline your code, you decide to use inheritance to model the relationships between different types of animals and their behaviors.

(a) Explain the concept of inheritance in Java. Provide an example scenario where inheritance is useful.

Inheritance is a part of OOP that allows a subclass to inherit properties of the superclass using the `extends` or `implements` keyword. The subclass can access all non-private attriburtes and methods of the superclass. This provides greater code efficiency, less redundancy, and code reuse. An example where inheritance is useful can be an employee database. The superclass can contain the generic variables such as name, age, and salary. The subclass will contain more specific information connected to that specific employee. Each type of employee may even have their own specific attritube unique to their role.

(b) Code:

You need to implement a Java class hierarchy to represent different types of animals in the zoo. Create a superclass Animal with basic attributes and methods common to all animals, and at least three subclasses representing specific types of animals with additional attributes and methods. Include comments to explain your code, specifically how inheritance is used.


```java
public class Animal { // superclass
    // common attributes
    protected String name;
    protected int age;

    public Animal(String name, int age) {
        this.name = name;
        this.age = age;
    }

    public void eat() { // common method
        System.out.println(name + " is eating");
    }

    public void displayInfo() {
        System.out.println("Name: " + name);
        System.out.println("Age: " + age + " years");
    }
}

public class Lion extends Animal { // Subclass for lion
    // Additional attribute
    private int numberOfLionesses;

    // Constructor
    public Lion(String name, int age, int numberOfLionesses) {
        super(name, age); // Call to superclass constructor
        this.numberOfLionesses = numberOfLionesses;
    }

    // Additional method
    public void roar() {
        System.out.println(name + " is roaring.");
    }
}

public class Elephant extends Animal { // Subclass for elephant
    // Additional attribute
    private String trunkLength;

    // Constructor
    public Elephant(String name, int age, String trunkLength) {
        super(name, age); // Call to superclass constructor
        this.trunkLength = trunkLength;
    }

    // Additional method
    public void sprayWater() {
        System.out.println(name + " is spraying water with its trunk.");
    }
}

public class Penguin extends Animal { // subclass for penguin
    // Additional attribute
    private boolean isSwimming;

    // Constructor
    public Penguin(String name, int age, boolean isSwimming) {
        super(name, age); // Call to superclass constructor
        this.isSwimming = isSwimming;
    }

    // Additional method
    public void swim() {
        System.out.println(name + " is swimming.");
    }
}

public class Main {
    public static void main(String[] args) {
        Lion lion = new Lion("Lion", 5, 3);
        Elephant elephant = new Elephant("Elephant", 10, "Long");
        Penguin penguin = new Penguin("Penguin", 3, true);

        System.out.println("Information about Lion:");
        lion.displayInfo();
        lion.roar();
        System.out.println();

        System.out.println("Information about Elephant:");
        elephant.displayInfo();
        elephant.sprayWater();
        System.out.println();

        System.out.println("Information about Penguin:");
        penguin.displayInfo();
        penguin.swim();
    }
}
Main.main(null);
```

    Information about Lion:
    Name: Lion
    Age: 5 years
    Lion is roaring.
    
    Information about Elephant:
    Name: Elephant
    Age: 10 years
    Elephant is spraying water with its trunk.
    
    Information about Penguin:
    Name: Penguin
    Age: 3 years
    Penguin is swimming.

