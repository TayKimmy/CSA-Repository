---
toc: True
comments: True
layout: post
title: Scope and Access of a Class
description: Lesson for scope and access of a class
type: tangibles
courses: {'csa': {'week': 28}}
---

## Math Class

## Intro
The Math class in Java is part of the java.lang package, which is automatically imported, hence you don't need to manually import it. The Math class provides a collection of methods and constants for performing mathematical operations.

## Key points about the Math class:
- Static Methods: The methods of the Math class are static, meaning you can call them directly using the class name without needing to create an instance of the Math class. For example, Math.sqrt(25) will return 5.0.
Commonly Used Methods:
- Math.abs(double a): Returns the absolute value of a.
- Math.sqrt(double a): Returns the square root of a.
- Math.pow(double a, double b): Returns a raised to the power of b.
- Math.max(double a, double b): Returns the greater of a and b.
- Math.min(double a, double b): Returns the lesser of a and b.
- Math.round(double a): Rounds a to the nearest integer.
- Math.random(): Returns a double value greater than or equal to 0.0 and less than 1.0.

## Evaluation of Expressions Using the Math Class
Let's dive into evaluating expressions and demonstrating program statements using Math class methods. We will explore how to use these methods in Java code through examples.

### Example 1: Calculating the Hypotenuse of a Right Triangle


```Java
public class Triangle {
    public static void main(String[] args){
        double a = 3;
        double b = 4;
        double c = Math.sqrt(Math.pow(a, 2) + Math.pow(b, 2));
        System.out.println("Hypotenuse: " + c);
    }
}
Triangle.main(null)
```

    Hypotenuse: 5.0


### Example 2: Finding the Larger of Two Numbers


```Java
public class Larger{
    public static void main(String[] args){
        double num1 = 7.25;
        double num2 = 7.20;
        double larger = Math.max(num1, num2);
        System.out.println("The larger number is: " + larger);
    }
}
Larger.main(null)
```

    The larger number is: 7.25


## Using Math.random() and Setting Up a Range
Math.random() is a versatile method used to generate random numbers. However, it returns a double value that is greater than or equal to 0.0 and less than 1.0. Often, you'll need a random integer within a specific range, say from min to max (inclusive). To achieve this, you can scale and shift the result of Math.random().

### Example: Generating a Random Integer Between 1 and 10


```Java
public class Generate{
    public static void main(String[] args){
        int min = 1;
        int max = 10;
        int randomNum = (int)(Math.random() * ((max - min) + 1)) + min;
        System.out.println("Random Number: " + randomNum);
    }
}
Generate.main(null)
```

    Random Number: 2


## ArrayLists

- An **ArrayList** is a utility from the ``java.util`` package

- To declare a variable, use the format `ArrayList<DataType> variableName = new ArrayList<DataType>(initial number of elements);`

- Unlike arrays, ArrayLists are mutable (can be resized after initialization)

- Functions as a more versatile array

    - Does technically take more space than an array but for the purposes of CSA it shouldn't matter
<br>
<br>

Difference between Array and Arraylist:


| Array | Arraylist |
| - | - |
| Fixed length | Resizable length |
| Fundamental Java Feature | Part of a Framework |
| An object with no methods | A Class with many methods |
| Not very flexible | Flexible |
| Can store primitives | Cannot store primitives - stores objects instead |

## Arraylist Methods
- add()
    - Adding a value to the ArrayList
    - Can be used to create an element at a specific index in the ArrayList - when this happens, everything at the positions of index and higher are moved to the right by 1 
- get()
    - Get the value of an index in the ArrayList
- set()
    - Change the value at an index in the ArrayList
- remove()
    - Delete the value at in index in the ArrayList
- clear()
    - Remove all values in an ArrayList
- size()
    - Get the length of the ArrayList


```Java
import java.util.ArrayList;

public class Test {
    public static void main(String[] args) {
        ArrayList<Integer> test = new ArrayList<>();
        System.out.println(test.size());
        test.add(1); //index 0
        test.add(2); // index 1
        test.add(3); // index 2
        test.add(4); // index 3
        test.add(5); // index 4
        test.add(6); // index 5
        test.add(7); // index 6

        System.out.println(test);

        int i = test.set(1, 200); // prints what used to be at index 1
        int x = test.remove(4); // prints what was removed

        System.out.println(i);
        System.out.println(x);
        System.out.println(test);
    }
}
Test.main(null);
```

    0
    [1, 2, 3, 4, 5, 6, 7]
    2
    5
    [1, 200, 3, 4, 6, 7]


## Traversing ArrayLists

- Deleting elements in the ArrayList while iterating over the ArrayList needs to be carefully done because the index changes as you delete elements
- Using an enhanced for loop can result in the ConcurrentModificationException error
    - Do not delete elements in an ArrayList while using an enhanced for loop


```Java
public static void main(String[] args)
{
    ArrayList<Integer> arr = new ArrayList<>();        
    arr.add(1);
    arr.add(7);
    arr.add(9);
    arr.add(13);

    for (int i = 0; i < arr.size(); i++) //for loop, would work the same as with an array
    {
        System.out.print(arr.get(i) + " ");
    }
    System.out.println();

    for (Integer i : arr) //enhanced for loop without removing, same as an array
    {
        System.out.print(i + " ");
    }

}
main(null);
```

    1 7 9 13 
    1 7 9 13 

## Built-In Sorting


```Java
import java.util.ArrayList;
import java.util.Collections;

public class SelectionSort {
    public static void main(String[] args) {
        ArrayList<Integer> arrayList = new ArrayList<>();
        arrayList.add(64);
        arrayList.add(25);
        arrayList.add(12);
        arrayList.add(22);
        arrayList.add(11);

        Collections.sort(arrayList);

        System.out.println("Sorted ArrayList: " + arrayList);

        ArrayList<Character> arrayListX = new ArrayList<>();
        arrayListX.add('T');
        arrayListX.add('G');
        arrayListX.add('E');
        arrayListX.add('B');
        arrayListX.add('M');

        Collections.sort(arrayListX);
        System.out.println ("Second Sorted ArrayList: " +arrayListX);
    }
}
SelectionSort.main(null);
```

    Sorted ArrayList: [11, 12, 22, 25, 64]
    Second Sorted ArrayList: [B, E, G, M, T]


## Anatomy, Scope, and Access of a Class

## Scope

- Local variables: variables declared in body of constructors and methods, only use within constructor or method, can’t be declared public or private
- If local variable named same as instance variable, within that method the local variable will be referred to instead of the instance variable
- Formal parameters and variables declared in a method or constructor can only be used within that method or constructor

## Access 

- Private: Variables or methods marked as private are accessible only within the class in which they are declared. This provides the highest level of encapsulation and restricts access from outside the class.
- Package/Default: If no access modifier is specified, the default access level is package-private, also known as default access. This allows access within the same package but restricts access from classes outside the package.
- Public: Public members are accessible from any other class. They provide the least restrictive access and are commonly used for methods and variables that need to be accessed from other classes.

### Example


```Java
public class Bowler{
    private int totalPins;
    private int games;
   
    public Bowler(int pins){
        totalPins = pins; // this keyword
        games = 3;
    }

    public void update (int game1, int game2, int game3) {
        // local variable here is newPins
        int newPins = game1 + game2 + game3;
        totalPins += newPins;
        games += 3;
    }
}
```


## Hacks
In this assignment, you will work with a collection of randomly generated data represented by an ArrayList of ArrayLists of integers. You will design a class, named `DataList`, from scratch and implement methods within this class to manipulate the data according to specified criteria.

#### Requirements

1.  **Class Declaration**: Create a `DataList` class that encapsulates a collection of data.
    
    *   The data collection should be an `ArrayList` of `ArrayList` of integers (`ArrayList<ArrayList<Integer>>`).
    *   Include any necessary instance variables and a constructor to initialize the data structure.
2.  **`repopulate` Method**:
    
    *   Write a method named `repopulate` in the `DataList` class. This method should fill each element of the collection with randomly generated values according to the following criteria:
        *   Each value must be between 1 and `MAX` (inclusive), where `MAX` is a predefined constant in your class with a value that is not shown.
        *   Each value must be divisible by 10.
        *   Each value must not be divisible by 100.
    *   Ensure that all valid values have an equal chance of being generated.
    *   Precondition: The collection is not null and has at least one element.

#### Instructions

*   **Design**: Consider how you will structure your `DataList` class, including the choice of instance variables and the design of your constructor to properly initialize the data collection.
*   **Implementation**: Implement the `repopulate` method to meet the specified criteria. Think about how you can efficiently generate values that meet the requirements and how you'll iterate through the ArrayList of ArrayLists to assign these values.
*   **Testing**: After implementing the `repopulate` method, consider writing a simple main method or unit tests to verify that your method works as expected. Generate a small collection and print the results to ensure values are correctly assigned according to the criteria.
