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
            background: linear-gradient(to bottom right, #31B7C2, #7BC393);
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
            background: white;
            color: black;
            cursor: pointer;
            transition: transform 0.2s, background-color 0.2s;
        }
        button:hover {
            background: linear-gradient(to bottom right, #2c3e50, #34495e);
            transform: scale(1.1);
        }
        .image-container {
            overflow: auto; /* Clear floats */
        }
        .image-container img {
            float: left;
            margin-right: 230px;
            margin-left: 50px;
        }
        table {
            border: 1px solid black;
            margin: 0 auto;
            width: 70%; /* Adjust the width as needed */
        }
        th, td {
            padding: 10px;
        } 
</style>

<h1><center>Welcome to Tay's CSA Blog</center></h1>

<p1><center>I am a junior at Del Norte High School. I am in period 1 Mort's CSA class.</center></p1>
<br>
<div class="image-container">
 <img src="https://github.com/TayKimmy/CSA_Repo/assets/107821010/70078112-a34e-43f1-95fb-e05d2131eb07" width="230">
 <img src="https://github.com/TayKimmy/CSA_Repo/assets/107821010/7cd5e316-3242-453b-9ff1-852892aa1d96" height="480">
</div>
<br>
<h1 style="margin-left: 40px"><center>Class Schedule</center></h1>
<center><table border="1" style="text-align: center;">
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
</table></center>
<br>
<h1><center>Calculator</center></h1>
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