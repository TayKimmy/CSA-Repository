---
layout: post
title: FRQ Mini-Lab
description: Answering Collegeboard FRQ Questions
courses: {'csa': {'week': 4}}
type: hacks
---

## Textbook Class

You will write a class `Textbook`, which is a subclass of `Book`.

A `Textbook` has an edition number, which is a positive integer used to identify different versions of the book. The `getBookInfo` method, when callsed on a `Textbook`, returns a string that also includes the edition information, as shown in the example.

Information about the book title and price must be maintained in the `Book` class. Information about the edition must be maintained in the `Textbook` class.

The `Textbook` class contains an additional method, `canSubstituteFor`, which returns `true` if a `Textbook` is a valid substitue for another `Textbook` and returns `false` otherwise. The current `Textbook` is a valid substitute for the `Textbook` referenced by the parameter of the `canSubstituteFor` method if the two `Textbook` objects have the same title and if the edition of the current `Textbook` is greater than or equal to the edition of the parameter.


```Java
public class Book {
    /** The title of the book */
    private String title;

    /** The price of the book */
    private double price;

    /** Creates a new Book with given title and price */
    public Book(String bookTitle, double bookPrice) {
        /* implementation not shown */
    }

    /* Returns title of the book */
    public String getTitle() {
        return title;
    }
    
    /* Returns a string containing the title and price of the book */
    public String getBookInfo() {
        return title + "-" + price;
    }
}


public class Textbook extends Book { /* defining new subclass */
    /** edition of the textbook */
    private int edition;

    /** create new Textbook with given title, price, and edition */
    public Textbook(String textbookTitle, double textbookPrice, int textbookEdition) {
        bookTitle = textbookTitle;
        bookPrice = textbookPrice;
        edition = textbookEdition;
    }
    
    public int getEdition() { /* return instance value of the edition */
        return edition;
    }

    /* return string containing the title, price, and edition of the book */
    public String getBookInfo() {
        return title + "-" + price + "-" + edition;
    }

    public boolean canSubstituteFor(Textbook para) {
        if (getTitle() == para.getTitle() && edition >= para.getEdition()) { /* if the edition is greater than or equal to and if titles are equal */
            return true;
        } else {
            return false;
        }
    }
}
```


    constructor Book in class Book cannot be applied to given types;

      required: java.lang.String,double

      found: no arguments

      reason: actual and formal argument lists differ in length

    

    |           bookTitle = textbookTitle;

    cannot find symbol

      symbol:   variable bookTitle

    

    |           bookPrice = textbookPrice;

    cannot find symbol

      symbol:   variable bookPrice

    

    |           return title + "-" + price + "-" + edition;

    title has private access in Book

    

    |           return title + "-" + price + "-" + edition;

    price has private access in Book

    


## Scoring

| Point # | What I did | 0 or 1 |
| - | - | - |
| Point 1 | I declare class header that is not private and extends from class `Book`. | 1 |
| Point 2 | I declare the constructor header that defines `Textbook` | 1 |
| Point 3 | I don't use `super` for the first line | 0 |
| Point 4 | I define the variable edition with private | 1 |
| Point 5 | I define at least one of those headers with public | 1 |
| Point 6 | I define `getEdition` that returns value of edition | 1 |
| Point 7 | The `canSubstituteFor` method determiens correctly | 1 |
| Point 8 | I don't use `super` or define `getBookInfo` | 0 |
| Point 9 | Even though I didn't use `super`, I concatenate correctly and access `title` and `price` directly | 1 |

I got a 7/9 on this FRQ question #2 on class.

## Review

I could've done better on this test if I understood the concept of inheritances better. I didn't know about the `super` keyword.

## Corrected Code


```Java
public class Book {
    /** The title of the book */
    private String title;

    /** The price of the book */
    private double price;

    /** Creates a new Book with given title and price */
    public Book(String bookTitle, double bookPrice) {
        title = bookTitle;
        price = bookPrice;
    }

    /* Returns title of the book */
    public String getTitle() {
        return title;
    }
    
    /* Returns a string containing the title and price of the book */
    public String getBookInfo() {
        return title + "-" + price;
    }
}


public class Textbook extends Book { /* defining new subclass */
    /** edition of the textbook */
    private int edition;

    /** create new Textbook with given title, price, and edition */
    public Textbook(String textbookTitle, double textbookPrice, int textbookEdition) {
        super(textbookTitle, textbookPrice);
        edition = textbookEdition;
    }
    
    public int getEdition() { /* return instance value of the edition */
        return edition;
    }

    public boolean canSubstituteFor(Textbook para) {
        if (getTitle() == para.getTitle() && edition >= para.getEdition()) { /* if the edition is greater than or equal to and if titles are equal */
            return true;
        } else {
            return false;
        }
    }

    public String getBookInfo() {
        return super.getBookInfo() + "-" + edition;
    }
}

public class Main { // defining new class to create object instance
    public static void main(String[] args) {
        Textbook calc = new Textbook("Calculus", 119.25, 6);
        System.out.println(calc.getEdition());
        System.out.println(calc.getBookInfo());
        Textbook physics15 = new Textbook("Physics", 89.50, 9);
        System.out.println(calc.canSubstituteFor(physics15));
        Textbook calc26 = new Textbook("Calculus", 234.75, 12);
        System.out.println(calc26.canSubstituteFor(calc));
    }
}
Main.main(null);

```

    6
    Calculus-119.25-6
    false
    true

