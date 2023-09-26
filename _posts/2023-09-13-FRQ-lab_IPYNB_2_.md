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



```Java

```

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

## Review/Improvements

Although I got all the points, there are a few ways I can improve my code.
1. Don't set the variables equal to 0 in the beginning, but instead, within the addDailySteps function
2. Perform if loop inside addDailySteps function
3. Mainly just clean up code and make it perform more effectively
4. Make sure to add that if total days is 0, to return 0 for average steps otherwise error will pop up.

### New Method
`goalAchievementPercentage` method:
- Takes in user input - method takes in this input as a parameter
- Returns the total steps walked divided by the goal multiplied by a hundred (to make it a percent not a decimal)


```Java
import java.util.Scanner;

public class StepTracker {
    private int steps; // defining the amount of steps to be considered active

    private int totalSteps; // defining amount of steps actually walked

    private int daysActive; // defining amount of active days

    private int totalDays; // defining amount of days

    public StepTracker(int stepsNeeded) { // create object with the parameter
        steps = stepsNeeded;
        daysActive = 0;
        totalDays = 0; // initalizing all variables inside StepTracker instead of outside
        totalSteps = 0;
    }
    
    public void addDailySteps(int stepsWalked) { // creating addDailySteps method
        totalDays ++;
        totalSteps += stepsWalked;
        if (totalSteps >= steps) { // if steps walked is greater than steps needed
            daysActive ++; // add 1 active day
        }
    }

    public int activeDays() {
        return daysActive;
    }

    public double averageSteps() { // creating averageSteps method
        if (totalDays == 0) { // adding if loop so that if totalDays is 0, it just returns 0 instead of error
            return 0.0;
        } else {
        return (double) totalSteps/totalDays; // return the total steps divided by total days
        }
    }

    public double goalAchievementPercentage(int goal) { // adding something exra - percentage of steps reached
        if (steps == 0) {
            return 0.0;
        }
        return (double) totalSteps / goal * 100; // return how much of the steps needed the person has walked
    }
}

public class Main { // create class for outputs
    public static void main(String[] args) {
        StepTracker first = new StepTracker(5000); //define steptracker with 5000 min steps
        first.addDailySteps(3000);
        first.addDailySteps(10000);
        first.addDailySteps(6000);
        
        System.out.println("Active Days: " + first.activeDays());
        System.out.println("Average Steps: " + first.averageSteps());

        Scanner input = new Scanner(System.in);
        System.out.print("Enter your goal:");
        int goal = input.nextInt();
        System.out.println("\nGoal Achievement Percentage: " + first.goalAchievementPercentage(goal) + "%");
    }
}
Main.main(null);
```

    Active Days: 2
    Average Steps: 6333.333333333333
    Enter your goal:
    Goal Achievement Percentage: 95.0%

