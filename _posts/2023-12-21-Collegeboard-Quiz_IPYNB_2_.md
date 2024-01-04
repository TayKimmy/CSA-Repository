---
layout: post
title: Collegeboard 2015 Practice Exam
description: My blog and corrections for the MCQ
courses: {'csa': {'week': 17}}
type: tangibles
---

## My Score

I got a 34/39 which is a 87%.

<img src="https://github.com/TayKimmy/CSA-Repository/assets/107821010/7ae56652-4429-4fb4-b2ba-e2fdbf281234">

---

## Corrections

### What I missed and why I did
| Question # | Why I got it wrong | How I can improve |
| - | - | - |
| 8 | I forgot that the index of matrices and arrays start at 0, not 1. I looked through the code segment thinking like this and I ended up getting the wrong answer. | Make sure to remember that indexes always start at 0, not 1. |
| 9 | I didn't realize that multiplying Math.random by a number would generate a list of numbers between 0 and 1 less than that number. I ended up forgetting that I had to add 2 to the final operation. | I will look through the java.util.Math class because they show up often and make sure to memorize their functions. |
| 13 | I actually understood what the code was doing, but I didn't notice that it was transofmring the previous value with the current value, I thought it was transforming the current value (I forgot that the operation was equal to numbers[k]). | I will look through the code cells more thoroughly and remind myself of each steps of the functions. |
| 18 | I completely forgot that dividing 404 by 10 and then multiplying by 10 is not 404. You first divide 404 by ten, which is actually 40 because it is an int, not a double. | I have to remember integer divisions cannot be decimals and I can't solve cs problems like regular math all the time. |
| 25 | I didn't really understand the code cell but now that I look back on it, I understand the cell better. | I need to work on nested for loops more because I have trouble determining what they are doing and the indices mess me up. |

### What I searched up
1. Binary logic operators - like `||` and `&&`. I wasn't really sure which one represented which binary operations and I was also a bit unsure of what the different operations did.
2. Matrixes - mainly I searched up what `matrix.length` would return, which I found out it returned how many arrays were inside the matrix.
3. Math.random() - I knew it returned a double but I wasn't sure how the bounds were set and I wasn't sure of what multiplying `Math.random()` would do.
4. SubString() - I always seem to have trouble remembering which bound is inclusive and which one is not.
5. Nested for loops - They just confuse me a bit still
6. Class and method declaration also trouble me a bit and I had to search them up.

Here is the code for Question #25 because I had a bit of trouble figuring out why the answer was 10. I didn't know the answer so I just guessed it.


```java
int count = 0;
for (int x = 0; x < 4; x++) {
    for (int y = x; y < 4; y++) {
        count++;
    }    
}
System.out.println(count);
```

    10


## Reflections

### Improvements:
1. Read question and the code carefully
2. Understand what each line and each function does
3. Make sure to study topics I struggled on

### Plans to Study:
1. Review past test questions
2. Do more Java coding
3. Do more research on certain topics - i.e. Boolean, nested for loops, etc.

### What I will improve
I still need to improve on my overall CSA test-taking mindset because I find it hard to focus on questions that are very long and complicated, and my mind wanders. I also need to improve my understandment and knowledge of certain Java topics and methods.
