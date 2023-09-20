---
layout: post
title: FRQ Mini-Lab
description: Answering Collegeboard FRQ Questions
courses: {'csa': {'week': 5}}
type: hacks
---

## Steptracker Class

This question involves the implementation of a fitness tracking system that is represented by the `StepTracker` class. A `StepTracker` object is created with a parameter that defines the minimum number of steps that must be taken for a day to be considered active. The `StepTracker` class provides a constructor and the following methods.
- `addDailySteps`, which accumulates information about steps, in readings taken once per day
- `activeDays`, which returns the number of active days
- `averageSteps`, which returns the average number of steps per day, calculated by dividing the total number of steps by the number of days tracked

Sample code execution sequence and results:

| Statement + Expression | Value returned | Comment |
| - | - | - |
| StepTracker tr = new StepTracker(10000); |  | 10000 steps is considered active |
| tr.activeDays(); | 0 | Nothing recorded yet |
| tr.addDailySteps(9000); |  | Too little steps to be considered active |
| tr.activeDays(); | 0 | No day had at least 10000 steps |
| tr.addDailySteps(12000); |  | Represents active day |
| tr.activeDays() | 1 | 1 day had at least 10000 steps |
| tr.averageSteps(); | 10500 | Average number of steps (21000/2) |


```Java
public class StepTracker {
    private int steps; // defining the amount of steps to be considered active

    private int x; // defining amount of steps actually walked

    private int daysActive = 0; // defining amount of active days

    private int totalDays = 0; // defining amount of days

    private int totalSteps = 0; // to help calculate average steps

    public StepTracker(int stepsNeeded) { // create object with the parameter
        steps = stepsNeeded;
    }
    
    public void addDailySteps(int stepsWalked) { // creating addDailySteps method
        x = stepsWalked;
        totalDays ++;
        totalSteps = totalSteps + x;
    }

    public int activeDays() {
        if (x >= steps) { // if steps walked is greater than steps needed
            daysActive ++; // add 1 active day
        }
        return daysActive;
    }

    public double averageSteps() { // creating averageSteps method
        return (double) totalSteps/totalDays; // return the total steps divided by total days
    }
}

public class Main { // create class for outputs
    public static void main(String[] args) {
        StepTracker random = new StepTracker(5000); //define steptracker with 5000 min steps
        random.addDailySteps(3000);
        random.addDailySteps(10000);
        random.addDailySteps(6000);
        System.out.println(random.activeDays());
        System.out.println(random.averageSteps());
    }
}
Main.main(null);
```

    1
    6333.333333333333


## Scoring

| Point | What I did |
| - | - |
| 1 | I used private instance variables, not public. |
| 1 | I declear header for StepTracker using public |
| 1 | I use parameters and values to initialize variables |
| 1 | I decleare header for addDailySteps |
| 1 | I identify active days and increment count |
| 1 | I update other instance variables appropriately |
| 1 | I declare and implement activeDays |
| 1 | I declare header for averageSteps |
| 1 | I return calculated double average steps. |

I got a 9/9 on this 2019 FRQ question #2.

## Review

Although I got all the points, there are a few ways I can improve my code.
1. Don't set the variables equal to 0 in the beginning, but instead, within the addDailySteps function
2. Perform if loop inside addDailySteps function
3. Mainly just clean up code and make it perform more effectively
4. Make sure to add that if total days is 0, to return 0 for average steps otherwise error will pop up.
