<?php
// Database Configuration for Barpeta Polytechnic Feedback System

define('DB_HOST', 'localhost');
define('DB_USER', 'root');
define('DB_PASSWORD', '');
define('DB_NAME', 'barpeta_feedback_db');

// Create connection
$conn = new mysqli(DB_HOST, DB_USER, DB_PASSWORD, DB_NAME);

// Check connection
if ($conn->connect_error) {
    die('Connection failed: ' . $conn->connect_error);
}

// Set charset to UTF-8
$conn->set_charset('utf8');

// Error reporting
error_reporting(E_ALL);
ini_set('display_errors', 1);

?>