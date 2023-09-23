---
layout: post
title: FRQ Test
courses: {'csa': {'week': 5}}
type: tangibles
---

## Initialize a Numberical Keypad


```Java
public static void initializedKeypad() {
    int[] keypad = {1, 2, 3, 4, 5, 6, 7, 8, 9, 0};

    for (int i = 0; i < keypad.length; i++) {
        System.out.print(keypad[i] + " ");
        if ((i+1) % 3 == 0) {
            System.out.println();
        }
    }
}
```

## Reverse an Array


```Java
public static void reverseArray() {
    int[] lst = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10};

    for (int x = lst.length; x > 0; x--){
        System.out.print(x + " ");
    }

    for (int i = 1; i <= lst.length; i++ ) {
        System.out.print(i + " ");
    }
}
```

## Initialize Random Integers in ArrayList using Math.Random


```Java

```

## Main


```Java
public static void main(String[] args) {
    System.out.println("Keypad:");
    initializedKeypad();

    System.out.println("\nReversed Array:");
    reverseArray();

    System.out.println("\nRandom List:");
    ArrayList<Integer> randomList = initializedRandomList(5,2,8);
    System.out.println(randomList);
}
main(null);
```

    Keypad:
    1 2 3 
    4 5 6 
    7 8 9 
    0 
    Reversed Array:
    10 9 8 7 6 5 4 3 2 1 1 2 3 4 5 6 7 8 9 10 
