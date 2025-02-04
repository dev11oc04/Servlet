<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mishra's Calculator</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #1e1e2f;
            color: #f5f5f5;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .calculator {
            background: #292946;
            padding: 20px;
            border-radius: 15px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.5);
            width: 320px;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .calculator h1 {
            text-align: center;
            margin-bottom: 15px;
            font-size: 26px;
            color: #e0e0e0;
        }

        .calculator input[type="text"] {
            width: 100%;
            padding: 15px;
            margin-bottom: 15px;
            font-size: 20px;
            border: none;
            border-radius: 8px;
            background-color: #3b3b5e;
            color: #f5f5f5;
            text-align: right;
            box-shadow: inset 0 2px 5px rgba(0, 0, 0, 0.5);
            box-sizing: border-box;
        }

        .buttons {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 10px;
            margin-bottom: 20px;
        }

        .buttons button {
            padding: 15px;
            font-size: 18px;
            font-weight: bold;
            background-color: #4a4a6a;
            color: #fff;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            transition: transform 0.2s, background-color 0.3s;
        }

        .buttons button:hover {
            background-color: #616191;
            transform: scale(1.1);
        }

        .buttons .clear {
            background-color: #d9534f;
        }

        .buttons .clear:hover {
            background-color: #b52b27;
        }

        .equal {
            grid-column: span 4;
            background-color: #5cb85c;
        }

        .equal:hover {
            background-color: #449d44;
        }

        .memory-buttons {
            display: flex;
            justify-content: space-between;
            width: 100%;
            margin-bottom: 10px;
        }

        .memory-buttons button {
            padding: 10px;
            font-size: 16px;
            background-color: #f0ad4e;
            color: #fff;
            border: none;
            border-radius: 8px;
        }

        .history {
            width: 100%;
            max-height: 150px;
            overflow-y: auto;
            margin-top: 20px;
            background-color: #3b3b5e;
            padding: 10px;
            border-radius: 8px;
        }

        .history p {
            margin: 5px 0;
            font-size: 16px;
            color: #e0e0e0;
        }

        .buttons button:active {
            transform: scale(0.95);
        }

        .buttons .clear-history {
            background-color: #f0ad4e;
            grid-column: span 4;
            color: #fff;
            font-size: 18px;
            font-weight: bold;
            border-radius: 8px;
            padding: 15px;
        }

        .buttons .clear-history:hover {
            background-color: #f0ad4e;
        }
    </style>
</head>
<body>
    <div class="calculator">
        <h1>Mishra's Calculator</h1>
        <form method="post">
            <input type="text" id="display" name="display" readonly>
            <div class="memory-buttons">
                <button type="button" onclick="memoryRecall()">MR</button>
                <button type="button" onclick="memoryClear()">MC</button>
                <button type="button" onclick="memoryAdd()">M+</button>
                <button type="button" onclick="memorySubtract()">M-</button>
            </div>
            <div class="buttons">
                <button type="button" onclick="appendValue('7')">7</button>
                <button type="button" onclick="appendValue('8')">8</button>
                <button type="button" onclick="appendValue('9')">9</button>
                <button type="button" onclick="appendValue('/')">/</button>
                <button type="button" onclick="appendValue('4')">4</button>
                <button type="button" onclick="appendValue('5')">5</button>
                <button type="button" onclick="appendValue('6')">6</button>
                <button type="button" onclick="appendValue('*')">*</button>
                <button type="button" onclick="appendValue('1')">1</button>
                <button type="button" onclick="appendValue('2')">2</button>
                <button type="button" onclick="appendValue('3')">3</button>
                <button type="button" onclick="appendValue('-')">-</button>
                <button type="button" onclick="appendValue('0')">0</button>
                <button type="button" onclick="appendValue('.')">.</button>
                <button type="button" class="clear" onclick="clearDisplay()">C</button>
                <button type="button" onclick="appendValue('+')">+</button>
                <button type="button" class="equal" onclick="calculate()">=</button>
            </div>
            <button type="button" class="clear-history"  onclick="clearHistory()">Clear History</button>
        </form>
        <div class="history" id="history">
            <p><strong>History:</strong></p>
        </div>
    </div>

    <script>
        let memory = 0;
        let history = [];

        // Append value to the display
        function appendValue(value) {
            document.getElementById('display').value += value;
        }

        // Clear the display
        function clearDisplay() {
            document.getElementById('display').value = '';
        }

        // Perform calculation and clear display after
        // Perform calculation and clear display after
		function calculate() {
		    const display = document.getElementById('display');
		    try {
		        // Check if division by zero is in the expression
		        if (display.value.includes('/0')) {
		            alert('Error: Division by zero is not allowed!');
		            clearDisplay(); // Clear the display
		            return;
		        }
		        let result = eval(display.value); // Evaluate the expression
		        history.push(display.value + ' = ' + result);
		        display.value = result;
		        updateHistory();
		        clearDisplay(); // Clear display after calculation
		    } catch (error) {
		        alert('Invalid expression!');
		    }
		}


        // Handle keyboard input
        document.addEventListener('keydown', (event) => {
            const allowedKeys = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '+', '-', '*', '/', '.', 'Enter', 'Backspace', 'Escape'];
            const display = document.getElementById('display');

            if (allowedKeys.includes(event.key)) {
                if (event.key === 'Enter') {
                    calculate();
                } else if (event.key === 'Backspace') {
                    display.value = display.value.slice(0, -1);
                } else if (event.key === 'Escape') {
                    clearDisplay();
                } else {
                    display.value += event.key;
                }
            }
        });

        // Memory functions
        function memoryRecall() {
            document.getElementById('display').value = memory;
        }

        function memoryClear() {
            memory = 0;
        }

        function memoryAdd() {
            memory += parseFloat(document.getElementById('display').value) || 0;
        }

        function memorySubtract() {
            memory -= parseFloat(document.getElementById('display').value) || 0;
        }

        // Update history
        function updateHistory() {
            const historyDiv = document.getElementById('history');
            historyDiv.innerHTML = '<p><strong>History:</strong></p>';
            history.forEach(item => {
                historyDiv.innerHTML += '<p>' + item + '</p>';
            });
        }

        // Clear the history
        function clearHistory() {
            history = [];
            updateHistory();
        }
    </script>
</body>
</html>
