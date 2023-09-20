---
layout: default
permalink: /calculator
title: JS Calculator
courses: { csa: {week: 1} }
type: tangibles
---
<html>
<style>
    #calculator {
        width: 500px;
        margin: 0 auto;
        padding: 20px;
        border-radius: 10px;
        background: linear-gradient(to bottom right, #292b2c, #121212); 
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
</style>

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