---
toc: True
layout: post
title: Workshop 1 Hacks
type: hacks
courses: {'csa': {'week': 29}}
---

# Workshop 1 Hacks

## Question 2: Iteration over 2D arrays (Unit 4)

Situation: You are developing a game where you need to track player scores on a 2D grid representing levels and attempts.

(a) Explain the concept of iteration over a 2D array in Java. Provide an example scenario where iterating over a 2D array is useful in a programming task.

Iterating over a 2D array in Java means iterating over each element in the array, typically through nested for loops to iterate through both the rows and columns. This allows the user to access and use each element in the array. An example of a 2D Array is a gradebook, where the rows can represent students and the columns can represent the student's scores.

(b) Code:

You need to implement a method `calculateTotalScore` that takes a 2D array scores of integers representing player scores and returns the sum of all the elements in the array. Write the method signature and the method implementation. Include comments to explain your code.


```java
public class Game {
    public static int calculateTotalScore(int[][] scores) {
        int totalScore = 0; // initializing the variable to store the scores

        for (int i = 0; i < scores.length; i++) { // iterating through rows
            for (int j = 0; j < scores[i].length; j++) { // iterating through columns
                totalScore += scores[i][j]; // adding values to the score variable
            }
        }
        return totalScore; // return the total score
    }
    public static void main(String[] args) { // implementation
        int[][] playerScores = {
            {10, 20, 30},
            {15, 25, 35},
            {5, 10, 15}
        };

        int totalScore = calculateTotalScore(playerScores);
        System.out.println("Total score: " + totalScore);
    }
}
Game.main(null);
```

    Total score: 165


## Question 3: Array (Unit 6)
Situation: You are developing a student management system where you need to store and analyze the grades of students in a class.

(a) Define an array in Java. Explain its significance and usefulness in programming.

An array is a data structure that allows people to store multiple values of the same type in a single variable. Elements are stored sequentially and provide a convenient way to manage data, such as numbers, characters, and objects. They can be easily accessed, manipulated, or iterated, making them useful for tasks involving data storage and processing.

(b) Code:

You need to implement a method calculateAverageGrade that takes an array grades of integers representing student grades and returns the average of all the elements in the array. Write the method signature and the method implementation. Include comments to explain your code.


```java
public class Grade {
    public static double calculateAverageGrade(int[] grades) {
        int sum = 0; // initalizing variables for the sum and the count
        int count = grades.length;
        
        for (int i = 0; i < grades.length; i++) { // iterating over the array
            sum += grades[i]; // adding the numbers to the sum
        }
        double average = (double) sum / count; // finding the average by diving total/count

        return average; // return average grade
    }

    public static void main(String[] args) { // implementation
        int[] studentGrades = {85, 90, 75, 92, 88};
        
        double averageGrade = calculateAverageGrade(studentGrades);
        
        System.out.println("Average Grade: " + averageGrade);
    }
}
Grade.main(null);
```

    Average Grade: 86.0

