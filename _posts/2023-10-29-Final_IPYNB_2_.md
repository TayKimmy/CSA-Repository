---
layout: post
title: Final Project - Individual
description: My plans and reviews for the Tri 1 Final Project
courses: {'csa': {'week': 11}}
type: plans
---

### Links to contributions and analytics
- [Overall contributions](https://github.com/TayKimmy)
- [Backend Commits](https://github.com/Cosmic-Carnage/cosmic_backend_final/graphs/contributors)
- [Frontend Commits](https://github.com/Cosmic-Carnage/Passion-Project/graphs/contributors)
- [Extra Credit](https://github.com/TayKimmy/CSA_Repo/issues/3)

### Link to Backends
- [Quiz Questions](https://cosmic-backend.stu.nighthawkcodingsociety.com/api/quiz/)
- [Quiz Leaderboard](https://cosmic-backend.stu.nighthawkcodingsociety.com/api/quizleaders/)
- [Game Leaderboard](https://cosmic-backend.stu.nighthawkcodingsociety.com/api/leaderboard/)

### Link to Frontend
- [Passion Project](https://cosmic-carnage.github.io/Passion-Project/)

Show time box - added lessons tab.

## Code - both Java and Javascript OOP

### Backend
- I mainly worked on the Quiz and the Quiz Leaderboard, but I also helped make the Game Leaderboard and Spacebook


```java
public class Quiz {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @Column(unique=true)
    private String question;

    private char correctAnswer;

    private String answerA;
    private String answerB;
    private String answerC;
    private String answerD;

    public static List<String> init2() {
        List<String> questionList = new ArrayList<>();

        questionList.add("What is the largest moon of Jupiter?");
        questionList.add("What is the closest star to our solar system?");
        questionList.add("What planet is the Great Red Spot on?");
        questionList.add("What is the largest known galaxy?");
        questionList.add("Who was the first human to walk on the Moon?");

        questionList.add("Europa, Amalthea, Ganymede, Io, c");
        questionList.add("Polaris, Betelgeuse, Altair, Proxima Centauri, d");
        questionList.add("Earth, Jupiter, Mars, Neptune, b");
        questionList.add("Alcyoneus, IC 1101, Milky Way, Andromeda, a");
        questionList.add("Alan Shepard, John Glenn, Yuri Gagarin, Neil Armstrong, d");

        return questionList;
    }
}
```

This is the Java code in the Quiz.java file that initializes our quiz data. It has an id, question, 4 answer choices, and the correct answer letter. After I created it, I realized that the format was a little bit funky, but I was able to work with it and integrate with frontend. An improvement to make code or database more concise is to maybe use Hashmap, similar to leaderboard.


```java
@GetMapping("/")
    public ResponseEntity<List<String>> getQuiz() {
        List<String> questions = Quiz.init2();
        return new ResponseEntity<>(questions, HttpStatus.OK);
    }
```

Creating the api controller for the `GET` method - which is the only one we need for quiz. I originally tried to have the quiz leaderboard in same file, but there were many errors and code got kind of complicated.


```java
public class QuizLeaderboard {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    // @Column(unique=true)
    private String leaders;

    private int score;

    // starting scores

    public static HashMap<String, Integer> init() {
        HashMap<String, Integer> quizleaders = new HashMap<>();
        return quizleaders;
    }
}
```

Initializing the quiz leaderboard. Since a leaderboard should only have data created by the users, I got rid of all the test data that was originally inside the hashmap. Hashmaps are also simple to read in the database and make it easier to integrate. The quiz leaderboard contains id, leaders (username), and score.


```java
@PostMapping("/post/{leaders}/{score}")
    public ResponseEntity<QuizLeaderboard> postQuizLeaderboard(@PathVariable String leaders, @PathVariable int score) {
        // A person object WITHOUT ID will create a new record with default roles as student
        QuizLeaderboard quizLeaderboard = new QuizLeaderboard(null, leaders, score);
        repository.save(quizLeaderboard);
        return new ResponseEntity<>(quizLeaderboard, HttpStatus.OK);
    }
```

I originally tried to use `@RequestParams`, but there were a lot of errors when I tried to `POST`, so Raymond suggested I use a `@PathVariable`. 


```java
@DeleteMapping("/delete/{id}")
    public ResponseEntity<QuizLeaderboard> deleteLeaderboard(@PathVariable long id) {
        Optional<QuizLeaderboard> optional = repository.findById(id);
        if (optional.isPresent()) {
            QuizLeaderboard leaders = optional.get();
            repository.deleteById(id);
            return new ResponseEntity<>(leaders, HttpStatus.OK);
        }
        return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
    }
```

This is the delete function in the backend, but I haven't actually been able to integrate it in the frontend.


```java
@PostMapping("/post/{leaderboard}/{score}")
    public ResponseEntity<Leaderboard> postLeaderboard(@PathVariable String leaderboard, @PathVariable int score) {
        // A person object WITHOUT ID will create a new record with default roles as student
        Leaderboard leaderboardrepo = new Leaderboard(null, leaderboard, score);
        repository.save(leaderboardrepo);
        return new ResponseEntity<>(leaderboardrepo, HttpStatus.OK);
    }
```

Similar to the quiz leaderboard, the game leaderboard also uses `@PathVariable` for the `POST` method.

## Frontend


```java
createButton.addEventListener("click", () => {
    const username = usernameInput.value;
    const postData = {
        leaders: username,
        score: score,
    };
    fetch(`https://cosmic-backend.stu.nighthawkcodingsociety.com/api/quizleaders/post/${username}/${score}`, {
            method: 'POST',
            mode: 'cors',
            cache: 'default',
            credentials: 'same-origin',
            headers: {
                'Content-Type': 'application/json',
                'Authorization': 'Bearer my-token'
            },
            body: JSON.stringify(postData)
    })
    .then(response => response.json())
    .then(data => {
        //
    })
    .catch(error => {
        console.error("Error: " + error);
    });
});
```

This code shows the `POST` method in the frontend repository. It has a username input and automatically uses the score that is achieved on the quiz to post this data to the backend database. 

## Challenges Faced

The biggest challenge that me and my group faced was the constant 500, 400, and 403 errors when we tried integrating frontend to backend. There was also a constant CORS error that causes these issues. We also had a hard time figuring out the spacebook image upload as well as utilizing JWTs. We ultimately overcame the errors through constant teamwork and collaboration, and the spacebook image was helped through online resources like YouTube videos.


## Possible Improvements for my code

1. Make the quiz questions a HashMap to make code simpler
2. Create a question bank for the quiz, but randomly retrieve a certain number of questions so the questions are always different and in different order
3. Implement delete functions in the frontend for the quiz and game leaderboard
4. Implement some sort of update functions for both leaderboards - maybe just for username
5. Be able to sort the game leaderboard (since quiz uses merge sort) through "https://cdn.datatables.net/1.10.25/js/jquery.dataTables.min.js".

## Collegeboard Quiz Notes + Corrections

<img src="https://github.com/TayKimmy/CSA-Repository/assets/107821010/2f34a7f2-bbf6-4a45-9454-0306b4df3fa8">

I got a 35/40, which is 87.5%.

| Question # | Why I missed it | How can I improve |
| - | - | - |
| 15 | I missed this question because I didn't realize that the else statement will cause the for loop to stop since it reaches a `return` statement. | I can improve by considering every single aspect of code and thinking to myself what their functionalities are. |
| 17 | I forgot that arrays are immutable. I also didn't know that the last element would just copy the previous element since that is no actual code for that last element | Next time, I will remember about arrays being immutable and also consider what impact that will have on the code. |
| 19 | I didn't know that the opposite of greater was less than or equal to. | I will make sure to review logical operators and memorize their functions. |
| 39 | I didn't notice that there were the method was called twice in the return statement, and I only did it once. | I will make sure to read the code carefully. |
| 40 | I didn't realize what the impact of the print statement being after the method call would have. I ended up getting the answer in the wrong order. | I will consider each code carefully when I read the problem. |

Topics I struggled on:
1. Extensive for and if loops - caused a lot of time on my end (a lot of times I had to use my fingers to figure out the answer)
2. Logical operators
3. Certain functions like substring, length - just need reviewing

Improvements:
1. Read question + code carefully
2. Think about functionalities of each code
3. Review struggling topics

Plans to Study:
1. Review past MC's and FRQ's
2. Review struggling topics
3. Practice more Java

## Tri 1 Reflection

Overall, I learned a lot. I had limited knowledge of Java before CSA, but after just one tri, I have learned how to create classes, methods, and constructors; define different data types; use different functions; and much more. I also learned to use Spring for the backend instead of Flask like CSP. 

### Accomplishments
- Working on a Java Spring backend
- Utilizing Javascript in the frontend
- Integrating frontend and backend
- Collaborating with groupmates


### Lessons learned
- I learned the importance of communication
- There was several times when members weren't communicating about their commits
    - Led to constant merge conflicts and a bit of frustration
    - Also led to hour-long calls to resolve unexpected errors
- Also learned importance of time management
    - We forgot to account for errors when working on our project
    - Often led to us sleeping at 2 am because we had to resolve these errors


### Opportunities for Growth
- Always communicate with team members
- Make sure to consider errors and plan accordingly
- Document code and add comments so members can understand what the code is for
