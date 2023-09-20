---
layout: default
title: Tay's Blog
---
<html>
<style>
    #calculator {
        width: 500px;
        margin: 0 auto;
        padding: 20px;
        border-radius: 10px;
        background: linear-gradient(to bottom right, #292b2c, #121212); /* Matching dark theme gradient */
        box-shadow: 0 0 20px rgba(0, 0, 0, 0.2);
        text-align: center;
    }
    #display {
        font-size: 32px;
        margin-bottom: 15px;
        color: white;
    }
    button {
        width: 80px;
        height: 80px;
        font-size: 24px;
        margin: 5px;
        border: none;
        border-radius: 5px;
        background: #484f93;
        color: white;
        transition: transform 0.2s, background-color 0.2s;
    }
    button:hover {
        background: linear-gradient(to bottom right, #2c3e50, #34495e); 
        transform: scale(1.1);
    }
        .image-container1 {
            overflow: auto;
            justify-content: center;
            align-items: center;
        }
        .image-container1 img {
            float: left;
            margin-right: 50px;
            margin-left: 400px;
        }
        .image-container2 {
            overflow: auto;
        }
        .image-container2 img{
            float: left;
            margin-top: 50px;
            margin-left: 430px;
        }
        table {
            border: 1px solid black;
            margin: 0 auto;
            width: 70%;
        }
        th, td {
            padding: 10px;
        }
        .content_img{
            position: relative;
            float: left;
        }
        .content_img div{
            position: absolute;
            bottom: 0;
            right: 0;
            background: black;
            color: white;
            font-family: sans-serif;
            opacity: 0;
            visibility: hidden;
            -webkit-transition: visibility 0s, opacity 0.5s linear; 
            transition: visibility 0s, opacity 0.5s linear;
            width: 100%;
            padding: 10px;
            box-sizing: border-box;
            text-align: center;
        }
        .content_img:hover div{
            width: 200px;
            height: 100px;
            padding: 2px;
            visibility: visible;
            opacity: 0.7; 
        }
        .content_img1{
            position: relative;
            float: left;
        }
        .content_img1 div{
            position: absolute;
            bottom: 0;
            right: 0;
            background: white;
            color: black;
            font-family: sans-serif;
            opacity: 0;
            visibility: hidden;
            -webkit-transition: visibility 0s, opacity 0.5s linear; 
            transition: visibility 0s, opacity 0.5s linear;
            width: 100%;
            padding: 10px;
            box-sizing: border-box;
            text-align: center;
        }
        .content_img1:hover div{
            width: 250px;
            padding: 2px;
            visibility: visible;
            opacity: 0.9; 
        }
</style>
<body>
<h1>Welcome to Tay's CSA Blog</h1>

<p1>I am a junior at Del Norte High School. I am in period 1 Mort's CSA class.</p1>
<br>
<div class="image-container1">
    <div class="content_img">
        <img src="images/freeform.PNG" width="250">
        <div>About Me! Love playing sports (running) and hanging out with family and friends.</div>
    </div>
    <div class="content_img">
        <img src="images/tools.PNG" width="250">
        <div>I Love My Tools! Super helpful - Google, VSCode, Java, Python, Jupyter, WSL, Ubuntu</div>
    </div>
</div>
<div class="image-container2">
    <div class="content_img1">
        <img src="images/cool.jpg" height="480">
        <div>IDK, cool image</div>
    </div>
</div>
<br>
<h1 style="margin-left: 40px">Class Schedule</h1>
</body>
<table border="1" style="text-align: center;">
    <tr>
        <th>Period</th>
        <th>Class</th>
        <th>Teacher</th>
    </tr>
    <tr>
        <td>1</td>
        <td>AP CSA</td>
        <td>Mr. Mortenson</td>
    </tr>
    <tr>
        <td>2</td>
        <td>AP Physics</td>
        <td>Mr. Liao</td>
    </tr>
    <tr>
        <td>3</td>
        <td>AP English Language</td>
        <td>Mrs. Darcey Hall</td>
    </tr>
    <tr>
        <td>4</td>
        <td>AP Calculus BC</td>
        <td>Mr. Bernabeo</td>
    </tr>
    <tr>
        <td>5</td>
        <td>Offroll</td>
        <td></td>
    </tr>
</table>
<br>
<h1>Calculator</h1>
<div id="calculator">
    <div id="display">0</div>
    <button onclick="appendToDisplay('7')">7</button>
    <button onclick="appendToDisplay('8')">8</button>
    <button onclick="appendToDisplay('9')">9</button>
    <button onclick="appendToDisplay('+')">+</button><br>
    <button onclick="appendToDisplay('4')">4</button>
    <button onclick="appendToDisplay('5')">5</button>
    <button onclick="appendToDisplay('6')">6</button>
    <button onclick="appendToDisplay('-')">-</button><br>
    <button onclick="appendToDisplay('1')">1</button>
    <button onclick="appendToDisplay('2')">2</button>
    <button onclick="appendToDisplay('3')">3</button>
    <button onclick="appendToDisplay('*')">*</button><br>
    <button onclick="appendToDisplay('0')">0</button>
    <button onclick="calculate()">=</button>
    <button onclick="clearDisplay()">C</button>
    <button onclick="appendToDisplay('/')">/</button>
</div>

<script>
    let displayValue = '0';

    function updateDisplay() {
        document.getElementById('display').textContent = displayValue;
    }

    function appendToDisplay(value) {
        if (displayValue === '0') {
            displayValue = value;
        } else {
            displayValue += value;
        }
        updateDisplay();
    }

    function calculate() {
        try {
            displayValue = eval(displayValue).toString();
        } catch (error) {
            displayValue = 'Error';
        }
        updateDisplay();
    }

    function clearDisplay() {
        displayValue = '0';
        updateDisplay();
    }
</script>
</html>