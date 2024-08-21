<?php
session_start();
include('connection/dbconfig.php');

// Create DB Connection
$conn = mysqli_connect($host, $username, $password, $database);

// Check connection
if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}

// Check if form is submitted
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    
    // Validate and sanitize input
    $subjects = array_map('trim', $_POST['SubjectName']);
    $semesters = array_map('intval', $_POST['Sem']);
    $subjectCodes = array_map('trim', $_POST['SubjectCode']);
    $totalIAMarks = array_map('intval', $_POST['totalIAMarks']);
    $numInternals = array_map('intval', $_POST['numberOfInternals']);
    $maxMarksInternals = array_map('intval', $_POST['maxMarksOfInternal']);
    $theoryIAMarks = array_map('intval', $_POST['theoryIA']);
    $miniProjectMarks = array_map('intval', $_POST['miniProject']);
    $avgs = array_map('intval', $_POST['avg']); // Make sure the 'avg' array is correctly referenced
    
    // Prepare and bind SQL statement to check if subject code exists
    $checkStmt = $conn->prepare("SELECT COUNT(*) AS count FROM Subjects WHERE sub_code = ?");
    $checkStmt->bind_param("s", $sub_code_check);
    
    // Prepare and bind SQL statement to insert new subject
    $insertStmt = $conn->prepare("INSERT INTO Subjects (semester, sub_code, sub_name, total_marks, num_internals, max_marks_each_internal, theory_ia_marks, mini_project_marks, avg) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)");
    $insertStmt->bind_param("isssiiiii", $semester, $sub_code, $sub_name, $total_marks, $num_internals, $max_marks_each_internal, $theory_ia_marks, $mini_project_marks, $avg);
    
    // Insert each subject into the database
    foreach ($subjects as $key => $subject) {
        $semester = $semesters[$key];
        $sub_code = $subjectCodes[$key];
        $sub_name = $subject;
        $total_marks = $totalIAMarks[$key];
        $num_internals = $numInternals[$key];
        $max_marks_each_internal = $maxMarksInternals[$key];
        $theory_ia_marks = $theoryIAMarks[$key];
        $mini_project_marks = $miniProjectMarks[$key];
        $avg = $avgs[$key]; // Correctly reference the avg array
        
        // Check if subject code already exists
        $sub_code_check = $sub_code;
        $checkStmt->execute();
        $checkStmt->store_result();
        $checkStmt->bind_result($count);
        $checkStmt->fetch();
        
        if ($count > 0) {
            echo "Subject with Subject Code $sub_code already exists. Skipping insertion.<br>";
            continue; // Skip insertion if subject code exists
        }
        
        // Insert new subject into the database
        if (!$insertStmt->execute()) {
            echo "Error inserting subject: " . $insertStmt->error;
            break; // Exit the loop on first failure
        }
    }
    
    // Close statements and connection
    $checkStmt->close();
    $insertStmt->close();
    $conn->close();
    
    // Redirect or display success message
    header("Location: view_inserted_data.php");
    exit();
} else {
    echo "Form submission method not allowed.";
}
?>
