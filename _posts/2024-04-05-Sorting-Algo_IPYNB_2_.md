---
toc: True
layout: post
title: Sorting Algorithms Blog
type: tangibles
courses: {'csa': {'week': 29}}
---

## Flower Class
Creating the comparable object and the flower class.


```java
public class Flower implements Comparable<Flower> {
    private String name;
    private int petals;

    public Flower(String name, int petals) {
        this.name = name;
        this.petals = petals;
    }

    public String getName() {
        return name;
    }

    public int getPetals() {
        return petals;
    }

    public void setPetals(int petals) {
        this.petals = petals;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public int compareTo(Flower other) {
        return this.name.compareTo(other.name);
    }

    @Override
    public String toString() {
        return name + " (" + petals + " petals)";
    }
}

public class generateFlowers {
    
}

```

## Bubble Sort Implementation


```java
import java.util.ArrayList;

public class BubbleSort {
    public static void bubbleSort(ArrayList<Comparable> list) {
        int n = list.size();
        for (int i = 0; i < n - 1; i++) {
            for (int j = 0; j < n - i - 1; j++) {
                if (list.get(j).compareTo(list.get(j + 1)) > 0) {
                    // swap elements
                    Comparable temp = list.get(j);
                    list.set(j, list.get(j + 1));
                    list.set(j + 1, temp);
                }
            }
        }
    }

    public static void main(String[] args) {
        ArrayList<Comparable> numbers = generateNumbers(); 
        System.out.println("List before sorting: " + numbers);

        bubbleSort(numbers);

        System.out.println("List after sorting: " + numbers);
    }

    public static ArrayList<Comparable> generateNumbers() {
        ArrayList<Comparable> numbers = new ArrayList<>();
        for (int i = 0; i < 10; i++) { 
            numbers.add((int) (Math.random() * 101)); 
        }
        return numbers;
    }
}

BubbleSort.main(null);
```

    List before sorting: [41, 10, 10, 0, 80, 15, 79, 21, 54, 13]
    List after sorting: [0, 10, 10, 13, 15, 21, 41, 54, 79, 80]


## Selection Sort Implementation


```java
import java.util.ArrayList;

public class SelectionSort {
    public static void selectionSort(ArrayList<Comparable> list) {
        int n = list.size();
        for (int i = 0; i < n - 1; i++) {
            int minIndex = i;
            for (int j = i + 1; j < n; j++) {
                if (list.get(j).compareTo(list.get(minIndex)) < 0) {
                    minIndex = j;
                }
            }
            Comparable temp = list.get(minIndex);
            list.set(minIndex, list.get(i));
            list.set(i, temp);
        }
    }

    public static void main(String[] args) {
        ArrayList<Comparable> numbers = generateNumbers(); 
        System.out.println("List before sorting: " + numbers);
        
        selectionSort(numbers);
        
        System.out.println("List after sorting: " + numbers);
    }

    public static ArrayList<Comparable> generateNumbers() {
        ArrayList<Comparable> numbers = new ArrayList<>();
        for (int i = 0; i < 10; i++) { 
            numbers.add((int) (Math.random() * 101)); 
        }
        return numbers;
    }
}

SelectionSort.main(null);
```

    List before sorting: [21, 28, 79, 11, 55, 34, 29, 10, 15, 4]
    List after sorting: [4, 10, 11, 15, 21, 28, 29, 34, 55, 79]


## Insertion Sort Implementation


```java
import java.util.ArrayList;

public class InsertionSort {
    public static void insertionSort(ArrayList<Comparable> list) {
        int n = list.size();
        for (int i = 1; i < n; ++i) {
            Comparable key = list.get(i);
            int j = i - 1;
            while (j >= 0 && list.get(j).compareTo(key) > 0) {
                list.set(j + 1, list.get(j));
                j--;
            }
            list.set(j + 1, key); 
        }
    }

    public static void main(String[] args) {
        ArrayList<Comparable> numbers = generateNumbers(); 
        System.out.println("List before sorting: " + numbers);
        
        insertionSort(numbers);
        
        System.out.println("List after sorting: " + numbers);
    }

    public static ArrayList<Comparable> generateNumbers() {
        ArrayList<Comparable> numbers = new ArrayList<>();
        for (int i = 0; i < 10; i++) { 
            numbers.add((int) (Math.random() * 101)); 
        }
        return numbers;
    }
}

InsertionSort.main(null);
```

    List before sorting: [75, 74, 15, 53, 69, 51, 77, 13, 31, 9]
    List after sorting: [9, 13, 15, 31, 51, 53, 69, 74, 75, 77]


## Quick Sort Implementation


```java
import java.util.ArrayList;
import java.util.Arrays;

public class QuickSort {
    public static void quickSort(ArrayList<Comparable> list, int low, int high) {        
        if (low < high) {
            int pi = partition(list, low, high);
            quickSort(list, low, pi - 1);
            quickSort(list, pi + 1, high);
        }
    }

    private static int partition(ArrayList<Comparable> list, int low, int high) {
        Comparable pivot = list.get(high);
        int i = low - 1;
        for (int j = low; j < high; j++) {
            if (list.get(j).compareTo(pivot) <= 0) {
                i++;
                Comparable temp = list.get(i);
                list.set(i, list.get(j));
                list.set(j, temp);
            }
        }
        Comparable temp = list.get(i + 1);
        list.set(i + 1, list.get(high));
        list.set(high, temp);
        return i + 1;
    }

    public static void main(String[] args) {
        ArrayList<Comparable> numbers = generateNumbers(10);
        System.out.println("List before sorting: " + numbers);
        
        quickSort(numbers, 0, numbers.size() - 1);
        
        System.out.println("List after sorting: " + numbers);
    }

    public static ArrayList<Comparable> generateNumbers(int size) {
        ArrayList<Comparable> numbers = new ArrayList<>();
        for (int i = 0; i < size; i++) {
            numbers.add((int) (Math.random() * 101)); 
        }
        return numbers;
    }
}

QuickSort.main(null);
```

    List before sorting: [42, 41, 43, 98, 60, 27, 73, 76, 77, 93]
    List after sorting: [27, 41, 42, 43, 60, 73, 76, 77, 93, 98]


## Merge Sort Implementation


```java
import java.util.ArrayList;
import java.util.Arrays;

public class MergeSort {
    public static void mergeSort(ArrayList<Comparable> list) {
        if (list.size() > 1) {
            int mid = list.size() / 2;
            ArrayList<Comparable> left = new ArrayList<>(list.subList(0, mid));
            ArrayList<Comparable> right = new ArrayList<>(list.subList(mid, list.size()));

            mergeSort(left);
            mergeSort(right);

            merge(list, left, right); 
        }
    }

    private static void merge(ArrayList<Comparable> list, ArrayList<Comparable> left, ArrayList<Comparable> right) {
        int i = 0, j = 0, k = 0;
        while (i < left.size() && j < right.size()) {
            if (left.get(i).compareTo(right.get(j)) <= 0) {
                list.set(k++, left.get(i++));
            } else {
                list.set(k++, right.get(j++));
            }
        }
        while (i < left.size()) {
            list.set(k++, left.get(i++));
        }
        while (j < right.size()) {
            list.set(k++, right.get(j++));
        }
    }

    public static void main(String[] args) {
        ArrayList<Comparable> numbers = generateNumbers(); 
        System.out.println("List before sorting: " + numbers);
        
        mergeSort(numbers); 
        
        System.out.println("List after sorting: " + numbers);
    }

    public static ArrayList<Comparable> generateNumbers() {
        ArrayList<Comparable> numbers = new ArrayList<>();
        for (int i = 0; i < 10; i++) {
            numbers.add((int) (Math.random() * 101)); 
        }
        return numbers;
    }
}

MergeSort.main(null);
```

    List before sorting: [17, 68, 10, 21, 99, 0, 77, 88, 5, 66]
    List after sorting: [0, 5, 10, 17, 21, 66, 68, 77, 88, 99]

