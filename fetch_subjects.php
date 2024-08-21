<?php
session_start();
include('connection/dbconfig.php');

$semester = $_GET['semester'];

$sql = "SELECT sub_code, sub_name FROM subjects WHERE semester = '$semester'";
$result = $conn->query($sql);

$subjects = array();

if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $subjects[] = $row;
    }
}

echo json_encode($subjects);

$conn->close();
?>