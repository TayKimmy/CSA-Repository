---
comments: True
layout: post
title: Java Console Game
description: Creating a game in Java
courses: {'csa': {'week': 2}}
type: hacks
---

```Java
import java.util.Scanner;

public class WordGuessingGame {

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        String secretWord = "programming";
        String guessedWord = "";
        int maxAttempts = 20;
        int attempts = 0;
        boolean hasGuessedCorrectly = false;

        System.out.println("Welcome to the Word Guessing Game!");
        System.out.println("Try to guess the secret word by entering one letter at a time.");
        System.out.println("You have " + maxAttempts + " attempts.");

        while (attempts < maxAttempts) {
            System.out.print("Enter a letter: ");
            char letter = scanner.next().charAt(0);
            guessedWord += letter;

            if (secretWord.contains(String.valueOf(letter))) {
                System.out.println("Correct! The word now looks like this: " + displayWord(secretWord, guessedWord));
                if (secretWord.equals(displayWord(secretWord, guessedWord))) {
                    System.out.println("Congratulations! You've guessed the word!");
                    hasGuessedCorrectly = true;
                    break;
                }
            } else {
                System.out.println("Incorrect! You have " + (maxAttempts - attempts - 1) + " attempts left.");
            }

            attempts++;
        }

        if (!hasGuessedCorrectly) {
            System.out.println("Game over! The secret word was: " + secretWord);
        }

        scanner.close();
    }

    public static String displayWord(String secretWord, String guessedWord) {
        StringBuilder display = new StringBuilder();
        for (char letter : secretWord.toCharArray()) {
            if (guessedWord.contains(String.valueOf(letter))) {
                display.append(letter);
            } else {
                display.append("_");
            }
        }
        return display.toString();
    }
}
WordGuessingGame.main(null)
```

    Welcome to the Word Guessing Game!
    Try to guess the secret word by entering one letter at a time.
    You have 5 attempts.
    Enter a letter: Correct! The word now looks like this: _____a_____
    Enter a letter: Incorrect! You have 3 attempts left.
    Enter a letter: Incorrect! You have 2 attempts left.
    Enter a letter: Incorrect! You have 1 attempts left.
    Enter a letter: Correct! The word now looks like this: __o__a_____
    Game over! The secret word was: programming

