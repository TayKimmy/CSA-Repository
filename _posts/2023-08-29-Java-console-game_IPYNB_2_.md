---
layout: post
title: Java Console Game
description: Creating a game in Java
courses: {'csa': {'week': 2}}
type: hacks
---

```Java
import java.util.Scanner;         // Import Scanner class for input
import java.util.Random;          // Import Random class for generating random numbers
import java.io.File;              // Import File class
import java.io.FileNotFoundException; // Import exception for file not found
import java.util.ArrayList;       // Import ArrayList class to store words

public class HangmanGame {    // Define class

    public static void main(String[] args) {  // Define main method
        Scanner scanner = new Scanner(System.in); // Create Scanner object for user input
        Random random = new Random();   // Create Random object for generating random numbers

        // Load dictionary from file
        ArrayList<String> dictionary = loadDictionary("files/dictionary.txt");

        // Select a random secret word from the dictionary
        String secretWord = getRandomWord(dictionary, random);
        
        StringBuilder guessedWord = new StringBuilder();
        for (int i = 0; i < secretWord.length(); i++) {
            guessedWord.append("_");
        }

        int maxAttempts = 6;       
        int attempts = 0;           
        boolean hasGuessedCorrectly = false; // Initialize a flag to track correct guesses

        String[] hangmanArt = {
            "  +---+\n  |   |\n      |\n      |\n      |\n      |\n=========",
            "  +---+\n  |   |\n  O   |\n      |\n      |\n      |\n=========",
            "  +---+\n  |   |\n  O   |\n  |   |\n      |\n      |\n=========",
            "  +---+\n  |   |\n  O   |\n /|   |\n      |\n      |\n=========",
            "  +---+\n  |   |\n  O   |\n /|\\  |\n      |\n      |\n=========",
            "  +---+\n  |   |\n  O   |\n /|\\  |\n /    |\n      |\n=========",
            "  +---+\n  |   |\n  O   |\n /|\\  |\n / \\  |\n      |\n========="
        };

        // Display game instructions
        System.out.println("Welcome to the Hangman!");
        System.out.println("Try to guess the secret word by entering one letter at a time.");
        System.out.println("You have " + maxAttempts + " attempts.");

        // Start the guessing loop
        while (attempts < maxAttempts) {
            System.out.println(hangmanArt[attempts]);
            System.out.print("Enter a letter: ");
            char letter = scanner.next().charAt(0); // Read a letter from the user

            boolean correctGuess = false;

            for (int i = 0; i < secretWord.length(); i++){
                if (secretWord.charAt(i) == letter && guessedWord.charAt(i) == '_') {
                    guessedWord.setCharAt(i, letter);
                    correctGuess = true;
                }
            }
            if (correctGuess) {
                System.out.println("Correct guess! The word now looks like: " + guessedWord);
                if (guessedWord.toString().equals(secretWord)) {
                    System.out.println("Congratulations! You've guessed the word: " + secretWord);
                    hasGuessedCorrectly = true;
                    break;
                }
            } else {
                System.out.println("Incorrect guess.");
                attempts++;
            }
        }

        if (!hasGuessedCorrectly) {
            System.out.println("Game over! The secret word was: " + secretWord);
            System.out.println("You've been hanged!");
            System.out.println(hangmanArt[maxAttempts]);
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
}
HangmanGame.main(null); // Call main method to start the game

```

    Welcome to the Hangman!
    Try to guess the secret word by entering one letter at a time.
    You have 6 attempts.
      +---+
      |   |
          |
          |
          |
          |
    =========
    Enter a letter: Correct guess! The word now looks like: _____e
      +---+
      |   |
          |
          |
          |
          |
    =========
    Enter a letter: Correct guess! The word now looks like: __t__e
      +---+
      |   |
          |
          |
          |
          |
    =========
    Enter a letter: Correct guess! The word now looks like: n_t__e
      +---+
      |   |
          |
          |
          |
          |
    =========
    Enter a letter: Incorrect guess.
      +---+
      |   |
      O   |
          |
          |
          |
    =========
    Enter a letter: Correct guess! The word now looks like: n_ti_e
      +---+
      |   |
      O   |
          |
          |
          |
    =========
    Enter a letter: Incorrect guess.
      +---+
      |   |
      O   |
      |   |
          |
          |
    =========
    Enter a letter: Correct guess! The word now looks like: noti_e
      +---+
      |   |
      O   |
      |   |
          |
          |
    =========
    Enter a letter: Incorrect guess.
      +---+
      |   |
      O   |
     /|   |
          |
          |
    =========
    Enter a letter: Correct guess! The word now looks like: notice
    Congratulations! You've guessed the word: notice

