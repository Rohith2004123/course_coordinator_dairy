<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Subject Registration</title>
    <link rel="stylesheet" href="style/styles.css">
    <style>
         .add-subject {
        display: flex;
        flex-direction: column;
        align-items: center;
        margin-top: 20px;
    }

    .add-subject button,
    .add-subject .button {
        margin: 5px;
        padding: 10px 20px;
        font-size: 16px;
        border: none;
        cursor: pointer;
        border-radius: 5px;
        transition: background-color 0.3s ease;
    }

    .add-subject button[type="button"] {
        background-color: #4CAF50; /* Green */
        color: white;
    }

    .add-subject button[type="button"]:hover {
        background-color: #45a049;
    }

    .add-subject button[type="submit"] {
        background-color: #008CBA; /* Blue */
        color: white;
    }

    .add-subject button[type="submit"]:hover {
        background-color: #007bb5;
    }

    .add-subject .button {
        background-color: #f44336; /* Red */
        color: white;
        text-decoration: none;
        text-align: center;
        display: inline-block;
    }

    .add-subject .button:hover {
        background-color: #da190b;
    }

    .add-subject button[onclick*="window.location.href"] {
        background-color: #ff9800; /* Orange */
        color: white;
    }

    .add-subject button[onclick*="window.location.href"]:hover {
        background-color: #e68a00;
    }
        @media (max-width: 600px) {
            .input-group input {
                flex: 1 1 100%;
            }

            button {
                padding: 8px 16px;
            }
        }
        .input-group {
            display: flex;
            flex-wrap: wrap;
            margin-bottom: 20px;
        }

        .input-group label {
            flex: 1 1 100%;
            margin-bottom: 5px;
            font-weight: bold;
        }

        .input-group input {
            flex: 1 1 calc(50% - 10px);
            padding: 10px;
            margin: 5px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        .subject {
            margin-top: 20px;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 8px;
            background-color: #fafafa;
        }

        .add-subject {
            margin-top: 20px;
            text-align: center;
        }
    </style>
</head>
<body>
<header class="header">
    <nav class="nav">
        <div class="logo-container">
            <img src="image/logo.png" alt="Logo" class="logo-image">
        </div>
        <div class="logo">Course Coordinator's Diary</div>
        <ul class="nav-links">
            <li><a href="home.php">Home</a></li>
        </ul>
    </nav>
</header>

<div class="container">
    <h1>Subject Registration</h1>
    <form id="iaForm" action="submit_subjects.php" method="post">
        <div id="subjectsContainer">
            <div class="subject">
                <h1>Subject 1</h1>
                <div class="input-group">
                    <label for="Sem1">Semester:</label>
                    <input type="number" id="Sem1" name="Sem[]" placeholder="Enter semester no" required>
                </div>
                <div class="input-group">
                    <label for="SubjectCode1">Subject Code:</label>
                    <input type="text" id="SubjectCode1" name="SubjectCode[]" placeholder="Enter subject code" required>
                </div>
                <div class="input-group">
                    <label for="SubjectName1">Subject Name:</label>
                    <input type="text" id="SubjectName1" name="SubjectName[]" placeholder="Enter subject name" required>
                </div>
                <div class="input-group">
                    <label for="totalIAMarks1">Total IA Marks:</label>
                    <input type="number" id="totalIAMarks1" name="totalIAMarks[]" placeholder="Enter total IA marks" required>
                </div><br><br>
                <h1>IA Marks Split</h1>
                <div class="input-group">
                    <label for="numberOfInternals1">Number of Internals:</label>
                    <input type="number" id="numberOfInternals1" name="numberOfInternals[]" placeholder="Enter number of internals" required>
                </div>
                <div class="input-group">
                    <label for="maxMarksOfInternal1">Max Marks of Each Internal:</label>
                    <input type="number" id="maxMarksOfInternal1" name="maxMarksOfInternal[]" placeholder="Enter max marks of each internal" required>
                </div>
                <div class="input-group">
                    <label for="theoryIA1">Theory IA Marks:</label>
                    <input type="number" id="theoryIA1" name="theoryIA[]" placeholder="Enter theory IA marks" required>
                </div>
                <div class="input-group">
                    <label for="miniProject1">Mini Project Marks (Optional):</label>
                    <input type="number" id="miniProject1" name="miniProject[]" placeholder="Enter mini project marks">
                </div>
                <div class="input-group">
                    <label for="avg1">Average Marks:</label>
                    <input type="number" id="avg1" name="avg[]" placeholder="Enter avg marks" required>
                </div>
            </div>
        </div>
        <div class="add-subject">
            <button type="button" onclick="addSubject()" aria-label="Add another subject">Add Another Subject</button>
            <button type="submit">Submit</button>
            <a href="view_inserted_data.php" class="button">View Inserted Data</a>
            <button onclick="window.location.href='home.php'">Go Back</button>
        </div>
    </form>
</div>

<footer>
    <img src="image/logo.png" alt="Logo" class="footer-logo">
    <p>&copy; 2024 Yitise2021.com. All rights reserved.</p>
</footer>

<script>
    function addSubject() {
        const container = document.getElementById('subjectsContainer');
        const subjectCount = container.getElementsByClassName('subject').length + 1;
        const newSubject = document.createElement('div');
        newSubject.className = 'subject';
        newSubject.innerHTML = `
            <h1>Subject ${subjectCount}</h1>
            <div class="input-group">
                <label for="Sem${subjectCount}">Semester:</label>
                <input type="number" id="Sem${subjectCount}" name="Sem[]" placeholder="Enter semester no" required>
            </div>
            <div class="input-group">
                <label for="SubjectCode${subjectCount}">Subject Code:</label>
                <input type="text" id="SubjectCode${subjectCount}" name="SubjectCode[]" placeholder="Enter subject code" required>
            </div>
            <div class="input-group">
                <label for="SubjectName${subjectCount}">Subject Name:</label>
                <input type="text" id="SubjectName${subjectCount}" name="SubjectName[]" placeholder="Enter subject name" required>
            </div>
            <div class="input-group">
                <label for="totalIAMarks${subjectCount}">Total IA Marks:</label>
                <input type="number" id="totalIAMarks${subjectCount}" name="totalIAMarks[]" placeholder="Enter total IA marks" required>
            </div><br><br>
            <h1>IA Marks Split</h1>
            <div class="input-group">
                <label for="numberOfInternals${subjectCount}">Number of Internals:</label>
                <input type="number" id="numberOfInternals${subjectCount}" name="numberOfInternals[]" placeholder="Enter number of internals" required>
            </div>
            <div class="input-group">
                <label for="maxMarksOfInternal${subjectCount}">Max Marks of Each Internal:</label>
                <input type="number" id="maxMarksOfInternal${subjectCount}" name="maxMarksOfInternal[]" placeholder="Enter max marks of each internal" required>
            </div>
            <div class="input-group">
                <label for="theoryIA${subjectCount}">Theory IA Marks:</label>
                <input type="number" id="theoryIA${subjectCount}" name="theoryIA[]" placeholder="Enter theory IA marks" required>
            </div>
            <div class="input-group">
                <label for="miniProject${subjectCount}">Mini Project Marks (Optional):</label>
                <input type="number" id="miniProject${subjectCount}" name="miniProject[]" placeholder="Enter mini project marks">
            </div>
            <div class="input-group">
                <label for="avg${subjectCount}">Average Marks:</label>
                <input type="number" id="avg${subjectCount}" name="avg[]" placeholder="Enter avg marks" required>
            </div>
        `;
        container.appendChild(newSubject);
    }
</script>

</body>
</html>
