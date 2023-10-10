---
layout: post
title: U3 Boolean and If statements Hacks
courses: {'csa': {'week': 7}}
type: hacks
---

## Boolean Questions

- What is a boolean?
A boolean is a conditional that represents true or false. 1 is true and 0 is false.
- What values can a boolean represent? How many?
A boolean can only hold 2 values, true or false (1 or 0).
- What is an example of when we'd use a boolean?
When we want to know if something is true or false.

### Comments below


```Java
public class ComparisonExample implements Comparable<ComparisonExample> {
    private int comp;
    private int comp2;

    public ComparisonExample(int _comp, int _comp2) { //constructor for creating instances
        this.comp = _comp;
        this.comp2 = _comp2;
    }

    @Override
    public int compareTo(ComparisonExample s) { // comparing the comp of this instance with another instance
        return Integer.compare(this.comp, s.comp); // negative if this.comp is smaller, 0 if equal, and positive if this.comp is greater
    }

    public static int compare(ComparisonExample a, ComparisonExample b) // static method to compare 2 objects
    {
        if(Integer.compare(a.comp, b.comp)==0){ // if equal, compare comp2 attribute
            return Integer.compare(a.comp2, b.comp2);
        }
        else { // if attributes are not equal, compare comp1 attributes
            return Integer.compare(a.comp, b.comp);
        }
    }
}
```

### Challenge Problem
Issue is that strings cannot be compared with `==`, `.equals` must be used.


```Java
public class Challenge {

    private static boolean isName = false;
    private static String name = new String("John");


    public static void main(String [] args){

        Scanner sc = new Scanner(System.in);

        System.out.println("Guess my name!");

        String guess = sc.nextLine();
        System.out.println("Your guess: " + guess);

    
        if(guess.equals(name)){  // can't use double equal sign because they're strings, must use .equal()
            isName = true;
        } else {
            System.out.println("Wrong! L Cope");
        }

        System.out.println(isName);

    }
}

Challenge.main(null);
```

    Guess my name!
    Your guess: John
    true


## Boolean Hacks

### Compare Class


```Java
public class Employee implements Comparable<Employee> {
    private String name;
    private int age;
    private int salary;

    public Employee(String name, int age, int salary) {
        this.name = name;
        this.age = age;
        this.salary = salary;
    }

    @Override
    public int compareTo(Employee sample) {
        return Integer.compare(this.age, sample.age);
    }

    public int compareSalary(Employee sample) {
        return Integer.compare(this.salary, sample.salary);
    }

    public static int compareName(Employee a, Employee b) {
        return a.name.compareTo(b.name);
    }

    public static void main(String[] args) {
        Employee employee1 = new Employee("Timothy", 26, 143000);
        Employee employee2 = new Employee("Rosa", 32, 150000);

        int ageCompare = employee1.compareTo(employee2);

        if(ageCompare < 0) {
            System.out.println(employee1.name + " is younger than " + employee2.name);
        } else if (ageCompare > 0) {
            System.out.println(employee1.name + " is older than " + employee2.name);
        } else {
            System.out.println(employee1.name + " is the same age as " + employee2.name);
        }

        int salaryCompare = employee1.compareSalary(employee2);

        if (salaryCompare < 0) {
            System.out.println(employee1.name + " gets paid less than " + employee2.name);
        } else if (salaryCompare > 0) {
            System.out.println(employee2.name + " gets paid more than " + employee1.name);
        } else {
            System.out.println(employee1.name + " gets paid the same as " + employee2.name);
        }

        int nameCompare = compareName(employee1, employee2);

        if (nameCompare < 0) {
            System.out.println(employee1.name + " comes before " + employee2.name + " alphabetically.");
        } else if (nameCompare > 0) {
            System.out.println(employee2.name + " comes before " + employee1.name + " alphabetically.");
        } else {
            System.out.println(employee1.name + " and " + employee2.name + " have the same name.");
        }
    }
}
Employee.main(null);
```

    Timothy is younger than Rosa
    Timothy gets paid less than Rosa
    Rosa comes before Timothy alphabetically.


### Leap Year


```Java
import java.util.Scanner;

public class LeapYear {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);

        System.out.println("Enter a year:");
        int year = input.nextInt();

        boolean isLeapYear = false;

        if ((year % 4 == 0 && year % 100 != 0) || (year % 400 == 0)) {
            isLeapYear = true;
            System.out.println(year + " is a leap year.");
        } else {
            System.out.println(year + " is not a leap year.");
        }
        System.out.println("Leap Year: " + isLeapYear);
    }
}
LeapYear.main(null);
```

    Enter a year:
    2024 is a leap year.
    Leap Year: true


## Boolean Logic Questions

NOT(true) = false
1(0) = 0
(1)(0)' = 1
true&&false = false
1 + 0 = 1
!(true) = false
true ^ false = true
!(false ^ false) = true

## Boolean Hacks

1. !(true)&&(false) = ? what in boolean values?

False

2. not ((((true and not (false)) ^ false) ^ true) && false) (remember PEMDASNAO!)

True

3. 420 && 66 (Hint, convert to binary, then perform the operation)

000000000 = 0

    1. If you got this one, try 89 OR 42

    0001000 = 8


```Java
public class Boolean {
    public static void main(String[] args) {
        boolean a = true;
        boolean b = false;
        System.out.println(!(a)&&(b));
        System.out.println(!((((a && !(b)) ^ b) ^ a) && b));
    }
}
Boolean.main(null);

public class Binary {
    public static void main(String[] args) {
        int num1 = 420;
        int num2 = 66;
        int num3 = 89;
        int num4 = 42;
        System.out.println(Integer.parseInt(Integer.toBinaryString(num1)));
        System.out.println("00" + Integer.parseInt(Integer.toBinaryString(num2)));
        System.out.println(Integer.parseInt(Integer.toBinaryString(num3)));
        System.out.println("0" + Integer.parseInt(Integer.toBinaryString(num4)));
    }
}
Binary.main(null);
```

    false
    true
    110100100
    001000010
    1011001
    0101010

