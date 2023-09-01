---
layout: post
title: Java Console Game
description: Creating a game in Java
courses: {'csa': {'week': 2}}
type: hacks
---

```java
import java.util.Scanner;         // Import Scanner class for input
import java.util.Random;          // Import Random class for generating random numbers
import java.io.File;              // Import File class
import java.io.FileNotFoundException; // Import exception for file not found
import java.util.ArrayList;       // Import ArrayList class to store words

public class WordGuessingGame {    // Define class

    public static void main(String[] args) {  // Define main method
        Scanner scanner = new Scanner(System.in); // Create Scanner object for user input
        Random random = new Random();   // Create Random object for generating random numbers

        // Load dictionary from file
        ArrayList<String> dictionary = loadDictionary("files/dictionary.txt");

        // Select a random secret word from the dictionary
        String secretWord = getRandomWord(dictionary, random);

        String guessedWord = "";    // Initialize a variable to store guessed letters
        int maxAttempts = 10;       
        int attempts = 0;           
        boolean hasGuessedCorrectly = false; // Initialize a flag to track correct guesses

        // Display game instructions
        System.out.println("Welcome to the Word Guessing Game!");
        System.out.println("Try to guess the secret word by entering one letter at a time.");
        System.out.println("You have " + maxAttempts + " attempts.");

        // Start the guessing loop
        while (attempts < maxAttempts) {
            System.out.print("Enter a letter: ");
            char letter = scanner.next().charAt(0); // Read a letter from the user
            guessedWord += letter;  // Add the guessed letter to the list of guesses

            if (secretWord.contains(String.valueOf(letter))) {
                // Display progress and check for correct guess
                System.out.println("Correct! The word now looks like this: " + displayWord(secretWord, guessedWord));
                if (secretWord.equals(displayWord(secretWord, guessedWord))) {
                    System.out.println("Congratulations! You've guessed the word!");
                    hasGuessedCorrectly = true; // Update the correct guess flag
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

    // Load dictionary from a file
    public static ArrayList<String> loadDictionary(String filename) {
        ArrayList<String> dictionary = new ArrayList<>();
        try {
            Scanner fileScanner = new Scanner(new File(filename)); // Read from the file
            while (fileScanner.hasNextLine()) {
                dictionary.add(fileScanner.nextLine()); // Add words to the dictionary
            }
            fileScanner.close();
        } catch (FileNotFoundException e) {
            System.out.println("Dictionary file not found.");
        }
        return dictionary;
    }

    // Select a random word from the dictionary
    public static String getRandomWord(ArrayList<String> dictionary, Random random) {
        int randomIndex = random.nextInt(dictionary.size()); // Generate a random index
        return dictionary.get(randomIndex); // Return the selected word
    }

    // Display state of the guessed word
    public static String displayWord(String secretWord, String guessedWord) {
        StringBuilder display = new StringBuilder();
        for (char letter : secretWord.toCharArray()) {
            if (guessedWord.contains(String.valueOf(letter))) {
                display.append(letter); // Add correctly guessed letters
            } else {
                display.append("_");     // Replace unguessed letters with underscores
            }
        }
        return display.toString(); // Return updated word state
    }
}
WordGuessingGame.main(null); // Call main method to start the game

```

    Welcome to the Word Guessing Game!
    Try to guess the secret word by entering one letter at a time.
    You have 10 attempts.
    Enter a letter: Correct! The word now looks like this: ___e
    Enter a letter: Incorrect! You have 8 attempts left.
    Enter a letter: Correct! The word now looks like this: _i_e
    Enter a letter: Correct! The word now looks like this: mi_e
    Enter a letter: Incorrect! You have 5 attempts left.
    Enter a letter: Incorrect! You have 4 attempts left.
    Enter a letter: Incorrect! You have 3 attempts left.
    Enter a letter: Incorrect! You have 2 attempts left.
    Enter a letter: Incorrect! You have 1 attempts left.
    Enter a letter: Incorrect! You have 0 attempts left.
    Game over! The secret word was: mile

