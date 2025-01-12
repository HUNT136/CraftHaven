<?php
// Connect to the database
$host = "localhost";
$dbusername = "your_db_username";
$dbpassword = "your_db_password";
$dbname = "login_info";

$conn = new mysqli($host, $dbusername, $dbpassword, $dbname);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Get the form data
$username = $_POST['username'];
$password = $_POST['password'];

// Query the database for the user
$sql = "SELECT * FROM login WHERE username = '$username' AND password = '$password'";
$result = $conn->query($sql);

// Check if the user exists
if ($result->num_rows > 0) {
    // User exists, redirect to a success page
    header("Location: success.html");
    exit();
} else {
    // User does not exist, redirect to an error page
    header("Location: error.html");
    exit();
}

// Close the database connection
$conn->close();
?>