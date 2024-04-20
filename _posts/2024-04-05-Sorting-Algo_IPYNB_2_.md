---
toc: True
layout: post
title: Sorting Algorithms Blog
type: tangibles
courses: {'csa': {'week': 29}}
---

## Flower Class and Collectable Interface



```Java
public interface Collectable extends Comparable<Collectable> {
    String toJson();
}
```


```Java
public class Flower implements Collectable {
    private String name;
    private int petals;

    public Flower(String name, int petals) {
        this.name = name;
        this.petals = petals;
    }

    public String getName() {
        return name;
    }

    public int getpetals() {
        return petals;
    }

    @Override
    public int compareTo(Collectable other) {
        Flower otherFlower = (Flower) other;
        return this.name.compareTo(otherFlower.name);
    }

    @Override
    public String toString() {
        return "( " + name + "," + " petals: " + petals + ")";
    }

    @Override
    public String toJson() {
        return "{\"name\": \"" + name + "\", \"petals\": " + petals + "}";
    }
}

```

## Sorting Class
Creating the class that will store all the sorts as methods.


```Java
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;

public class Sorting {

    // Bubble Sort
    public static void bubbleSort(ArrayList<Collectable> list) {
        int n = list.size();
        for (int i = 0; i < n - 1; i++) {
            for (int j = 0; j < n - i - 1; j++) {
                if (list.get(j).compareTo(list.get(j + 1)) > 0) {
                    Collections.swap(list, j, j + 1);
                }
            }
        }
    }

    // Selection Sort
    public static void selectionSort(ArrayList<Collectable> list) {
        int n = list.size();
        for (int i = 0; i < n - 1; i++) {
            int minIndex = i;
            for (int j = i + 1; j < n; j++) {
                if (list.get(j).compareTo(list.get(minIndex)) < 0) {
                    minIndex = j;
                }
            }
            Collections.swap(list, i, minIndex);
        }
    }

    // Insertion Sort
    public static void insertionSort(ArrayList<Collectable> list) {
        int n = list.size();
        for (int i = 1; i < n; i++) {
            Collectable key = list.get(i);
            int j = i - 1;
            while (j >= 0 && list.get(j).compareTo(key) > 0) {
                list.set(j + 1, list.get(j));
                j--;
            }
            list.set(j + 1, key);
        }
    }

    // Quick Sort
    public static void quickSort(ArrayList<Collectable> list, int low, int high) {
        if (low < high) {
            int pi = partition(list, low, high);
            quickSort(list, low, pi - 1);
            quickSort(list, pi + 1, high);
        }
    }

    private static int partition(ArrayList<Collectable> list, int low, int high) {
        Collectable pivot = list.get(high);
        int i = low - 1;
        for (int j = low; j < high; j++) {
            if (list.get(j).compareTo(pivot) < 0) {
                i++;
                Collections.swap(list, i, j);
            }
        }
        Collections.swap(list, i + 1, high);
        return i + 1;
    }

    // Merge Sort
    public static void mergeSort(ArrayList<Collectable> list) {
        mergeSortHelper(list, 0, list.size() - 1);
    }

    private static void mergeSortHelper(ArrayList<Collectable> list, int low, int high) {
        if (low < high) {
            int mid = (low + high) / 2;
            mergeSortHelper(list, low, mid);
            mergeSortHelper(list, mid + 1, high);
            merge(list, low, mid, high);
        }
    }

    private static void merge(ArrayList<Collectable> list, int low, int mid, int high) {
        ArrayList<Collectable> temp = new ArrayList<>(high - low + 1);
        int i = low, j = mid + 1;

        while (i <= mid && j <= high) {
            if (list.get(i).compareTo(list.get(j)) <= 0) {
                temp.add(list.get(i++));
            } else {
                temp.add(list.get(j++));
            }
        }

        while (i <= mid) {
            temp.add(list.get(i++));
        }

        while (j <= high) {
            temp.add(list.get(j++));
        }

        for (i = 0; i < temp.size(); i++) {
            list.set(low + i, temp.get(i));
        }
    }
}
```

## Testing


```Java
import java.util.ArrayList;

public class Test {

    public static void main(String[] args) {
        ArrayList<Collectable> flowers = new ArrayList<>();
        flowers.add(new Flower("Tulip", 6));
        flowers.add(new Flower("Daisy", 8));
        flowers.add(new Flower("Sunflower", 12));
        flowers.add(new Flower("Rose", 5));
        flowers.add(new Flower("Lily", 6));
        flowers.add(new Flower("Orchid", 10));
        flowers.add(new Flower("Carnation", 4));
        flowers.add(new Flower("Daffodil", 6));
        flowers.add(new Flower("Peony", 7));
        flowers.add(new Flower("Hydrangea", 10));

        System.out.println("Flowers before sorting:");
        System.out.println(flowers);

        // Sorting using Bubble Sort
        Sorting.bubbleSort(flowers);
        System.out.println("Flowers after Bubble Sort:");
        System.out.println(flowers);

        // Sorting using Merge Sort
        Sorting.selectionSort(flowers);
        System.out.println("Flowers after Selection Sort:");
        System.out.println(flowers);

        // Sorting using Merge Sort
        Sorting.insertionSort(flowers);
        System.out.println("Flowers after Insertion Sort:");
        System.out.println(flowers);

        // Sorting using Merge Sort
        Sorting.mergeSort(flowers);
        System.out.println("Flowers after Merge Sort:");
        System.out.println(flowers);

        // Sorting using Quick Sort
        Sorting.quickSort(flowers, 0, flowers.size() - 1);
        System.out.println("Flowers after Quick Sort:");
        System.out.println(flowers);
    }
}

Test.main(null);
```

    Flowers before sorting:
    [( Tulip, petals: 6), ( Daisy, petals: 8), ( Sunflower, petals: 12), ( Rose, petals: 5), ( Lily, petals: 6), ( Orchid, petals: 10), ( Carnation, petals: 4), ( Daffodil, petals: 6), ( Peony, petals: 7), ( Hydrangea, petals: 10)]
    Flowers after Bubble Sort:
    [( Carnation, petals: 4), ( Daffodil, petals: 6), ( Daisy, petals: 8), ( Hydrangea, petals: 10), ( Lily, petals: 6), ( Orchid, petals: 10), ( Peony, petals: 7), ( Rose, petals: 5), ( Sunflower, petals: 12), ( Tulip, petals: 6)]
    Flowers after Selection Sort:
    [( Carnation, petals: 4), ( Daffodil, petals: 6), ( Daisy, petals: 8), ( Hydrangea, petals: 10), ( Lily, petals: 6), ( Orchid, petals: 10), ( Peony, petals: 7), ( Rose, petals: 5), ( Sunflower, petals: 12), ( Tulip, petals: 6)]
    Flowers after Insertion Sort:
    [( Carnation, petals: 4), ( Daffodil, petals: 6), ( Daisy, petals: 8), ( Hydrangea, petals: 10), ( Lily, petals: 6), ( Orchid, petals: 10), ( Peony, petals: 7), ( Rose, petals: 5), ( Sunflower, petals: 12), ( Tulip, petals: 6)]
    Flowers after Merge Sort:
    [( Carnation, petals: 4), ( Daffodil, petals: 6), ( Daisy, petals: 8), ( Hydrangea, petals: 10), ( Lily, petals: 6), ( Orchid, petals: 10), ( Peony, petals: 7), ( Rose, petals: 5), ( Sunflower, petals: 12), ( Tulip, petals: 6)]
    Flowers after Quick Sort:
    [( Carnation, petals: 4), ( Daffodil, petals: 6), ( Daisy, petals: 8), ( Hydrangea, petals: 10), ( Lily, petals: 6), ( Orchid, petals: 10), ( Peony, petals: 7), ( Rose, petals: 5), ( Sunflower, petals: 12), ( Tulip, petals: 6)]

