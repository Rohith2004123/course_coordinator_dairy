<?php
session_start();
include('connection/dbconfig.php');

// Define semesters and assessments
$semesters = [
    1 => 'first_semester',
    2 => 'second_semester',
    3 => 'third_semester',
    4 => 'fourth_semester',
    5 => 'fifth_semester',
    6 => 'sixth_semester',
    7 => 'seventh_semester',
    8 => 'eighth_semester'
];

// Define COs
$cos = [
    'CO1' => 'CO1',
    'CO2' => 'CO2',
    'CO3' => 'CO3',
    'CO4' => 'CO4',
    'CO5' => 'CO5',
    'CO6' => 'CO6',
];

// Initialize variables
$students = [];
$selectedSemester = '';
$selectedSubject = '';
$selectedCos = [];
$error = '';

// Fetch subjects based on the selected semester
if (isset($_POST['semester'])) {
    $selectedSemester = filter_var($_POST['semester'], FILTER_SANITIZE_NUMBER_INT);
    $stmt = $conn->prepare("SELECT sub_code, sub_name FROM subjects WHERE semester = ?");
    $stmt->bind_param("i", $selectedSemester);
    $stmt->execute();
    $subjectsResult = $stmt->get_result();
    $subjects = $subjectsResult->fetch_all(MYSQLI_ASSOC);
    $stmt->close();
}

// Process form submission
if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['semester'], $_POST['subject'], $_POST['cos'])) {
    $selectedSemester = filter_var($_POST['semester'], FILTER_SANITIZE_NUMBER_INT);
    $selectedSubject = filter_var($_POST['subject'], FILTER_SANITIZE_STRING);
    $selectedCos = $_POST['cos'];

    // Ensure selected COs are within the defined list
    $selectedCos = array_intersect($selectedCos, array_keys($cos));

    // Fetch subject details
    $stmt = $conn->prepare("SELECT sub_name FROM subjects WHERE sub_code = ? AND semester = ?");
    $stmt->bind_param("si", $selectedSubject, $selectedSemester);
    $stmt->execute();
    $subjectResult = $stmt->get_result();
    $subjectDetails = $subjectResult->fetch_assoc();
    $stmt->close();

    if ($subjectDetails) {
        $sub_name = $subjectDetails['sub_name'];
        $sub_code = $selectedSubject;
        $semester = $selectedSemester;

        $tableName = "sem{$semester}_{$sub_name}_{$sub_code}_assessment_marks";
        $tableName = str_replace(' ', '_', strtolower($tableName)); // Normalize the table name

        // Fetch table column names
        $query = "SHOW COLUMNS FROM $tableName";
        $stmt = $conn->prepare($query);
        if ($stmt) {
            $stmt->execute();
            $result = $stmt->get_result();
            $tableColumns = $result->fetch_all(MYSQLI_ASSOC);
            $stmt->close();

            // Extract column names
            $columnNames = array_column($tableColumns, 'Field');

            // Check if selected COs are present in the table
            $missingCos = array_diff($selectedCos, $columnNames);
            if (empty($missingCos)) {
                // Prepare the column names for the query
                $selectedCosDbNames = array_intersect_key($cos, array_flip($selectedCos));
                $selectedCosStr = implode(", ", $selectedCosDbNames);

                // Execute the query to fetch student data
                $query = "SELECT usn, name, $selectedCosStr FROM $tableName";
                $stmt = $conn->prepare($query);
                if ($stmt) {
                    $stmt->execute();
                    $result = $stmt->get_result();
                    $students = $result->fetch_all(MYSQLI_ASSOC);
                    $stmt->close();
                } else {
                    $error = "Query preparation failed.";
                }
            } else {
                $error = "No data found.";
            }
        } else {
            $error = "Failed to fetch data.";
        }
    }
}

// Function to calculate total, percentage, and level
function calculateResults($student, $selectedCosDbNames) {
    $total = 0;
    $maxMarks = count($selectedCosDbNames) * 10; // Assuming each CO is out of 10 marks

    foreach ($selectedCosDbNames as $dbName) {
        $total += $student[$dbName];
    }

    $percentage = ($total / $maxMarks) * 100;

    // Determine level based on percentage
    if ($percentage >= 80) {
        $level = '5';
    } elseif ($percentage >= 70) {
        $level = '4';
    } elseif ($percentage >= 60) {
        $level = '3';
    } elseif ($percentage >= 50) {
        $level = '2';
    } elseif ($percentage >= 40) {
        $level = '1';
    } else {
        $level = '0';
    }

    return [$total, $percentage, $level];
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Attainment Calculation</title>
    <link rel="stylesheet" href="style/styles.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .my-4 {
            margin-top: 30px;
            margin-bottom: 30px;
        }

        .mb-3 {
            margin-bottom: 20px;
        }

        .alert {
            margin-top: 20px;
        }
        table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 20px;
    border: 2px solid #000; /* Added border for the entire table */
}

table, th, td {
    border: 2px solid #000; /* Added border for table cells */
    padding: 8px;
    text-align: center;
}

th {
    background-color: #f2f2f2;
    border-bottom: 2px solid #000; /* Added border for table header cells */
}

td {
    background-color: #fff;
}

tr:nth-child(even) {
    background-color: #f9f9f9;
}

tr:hover {
    background-color: #f1f1f1;
}

/* Responsive Table Styles */
@media (max-width: 768px) {
    table {
        font-size: 14px;
    }
}



        .btn-primary {
            background-color: #007bff;
            color: #fff;
            border: none;
            padding: 10px 20px;
            cursor: pointer;
        }

        /* Responsive Table Styles */
        @media (max-width: 768px) {
            table {
                font-size: 14px;
            }
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
    <h2 class="my-4">Attainment Calculation</h2>
    <form method="POST" action="">
        <div class="mb-3">
            <label for="semester" class="form-label">Semester:</label>
            <select id="semester" name="semester" class="form-select" required onchange="this.form.submit()">
                <option value="">Select Semester</option>
                <?php foreach ($semesters as $key => $value): ?>
                    <option value="<?= $key ?>" <?= (isset($selectedSemester) && $selectedSemester == $key) ? 'selected' : '' ?>>Semester <?= $key ?></option>
                <?php endforeach; ?>
            </select>
        </div>
        <?php if (isset($subjects)): ?>
            <div class="mb-3">
                <label for="subject" class="form-label">Subject:</label>
                <select id="subject" name="subject" class="form-select" required>
                    <option value="">Select Subject</option>
                    <?php foreach ($subjects as $subject): ?>
                        <option value="<?= $subject['sub_code'] ?>" <?= ($selectedSubject == $subject['sub_code']) ? 'selected' : '' ?>>
                            <?= $subject['sub_code'] . ' - ' . $subject['sub_name'] ?>
                        </option>
                    <?php endforeach; ?>
                </select>
            </div>
        <?php endif; ?>

        <div class="mb-3">
            <label for="cos" class="form-label">COs:</label>
            <select id="cos" name="cos[]" class="form-select"  required>
                <?php foreach ($cos as $displayName => $dbName): ?>
                    <option value="<?= $displayName ?>"><?= $displayName ?></option>
                <?php endforeach; ?>
            </select>
        </div>
        <button type="submit" class="btn btn-primary">Calculate</button>
        <button type="button" class="btn btn-primary" onclick="window.location.href='home.php'">BACK</button>
    </form>

    <?php if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['semester'], $_POST['subject'], $_POST['cos'])): ?>
        <?php if (!empty($error)): ?>
            <div class="alert alert-danger mt-4"><?= $error ?></div>
        <?php elseif (empty($students)): ?>
            <div class="alert alert-info mt-4">No data found for the selected COs.</div>
        <?php else: ?>
            <h3 class="my-4">Student Data</h3>
            <div class="table-responsive">
                <table class="table table-bordered">
                    <thead>
                    <tr>
                        <th>USN</th>
                        <th>Name</th>
                        <?php foreach ($selectedCos as $displayName): ?>
                            <th><?= $displayName ?></th>
                        <?php endforeach; ?>
                        <th>Total</th>
                        <th>Percentage</th>
                        <th>Level</th>
                    </tr>
                    </thead>
                    <tbody>
                    <?php foreach ($students as $student): ?>
                        <?php list($total, $percentage, $level) = calculateResults($student, $selectedCosDbNames); ?>
                        <tr>
                            <td><?= $student['usn'] ?></td>
                            <td><?= $student['name'] ?></td>
                            <?php foreach ($selectedCosDbNames as $dbName): ?>
                                <td><?= $student[$dbName] ?></td>
                            <?php endforeach; ?>
                            <td><?= $total ?></td>
                            <td><?= number_format($percentage, 2) ?>%</td>
                            <td><?= $level ?></td>
                        </tr>
                    <?php endforeach; ?>
                    </tbody>
                </table>
            </div>
        <?php endif; ?>
    <?php endif; ?>
</div>
<footer>
    <img src="image/logo.png" alt="Logo" class="footer-logo">
    <p>&copy; 2024 Yitise2021.com. All rights reserved.</p>
</footer>
</body>
</html>
