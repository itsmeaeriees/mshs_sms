<?php
session_start();

// Include DB connection
require_once __DIR__ . '/connect.php';

// Helper to redirect back with an error
function fail($msg) {
    $_SESSION['login_error'] = $msg;
    header('Location: /MSHS_SMS/login.php');
    exit;
}

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    fail('Invalid request method.');
}

$username = isset($_POST['username']) ? trim($_POST['username']) : '';
$password = isset($_POST['password']) ? $_POST['password'] : '';

if ($username === '' || $password === '') {
    fail('Please enter username and password.');
}

// Prepared statement to avoid SQL injection
$stmt = $conn->prepare('SELECT user_id, username, password, role FROM users WHERE username = ? LIMIT 1');
if (!$stmt) {
    fail('Database error.');
}
$stmt->bind_param('s', $username);
$stmt->execute();
$result = $stmt->get_result();

if ($result->num_rows === 0) {
    // no such user
    $stmt->close();
    fail('Invalid username or password.');
}

$user = $result->fetch_assoc();
$stmt->close();

// Note: passwords in the provided database are plain-text. If you migrate to hashed passwords,
// replace this check with password_verify($password, $user['password']).
if ($user['password'] !== $password) {
    fail('Invalid username or password.');
}

// Successful login: set session values
$_SESSION['user_id'] = $user['user_id'];
$_SESSION['username'] = $user['username'];
$_SESSION['role'] = $user['role'];

// Redirect based on role
if ($user['role'] === 'teacher') {
    header('Location: /MSHS_SMS/admin/index.php');
    exit;
} elseif ($user['role'] === 'admin') {
    // If admin should go to admin dashboard too
    header('Location: /MSHS_SMS/admin/index.php');
    exit;
} else {
    // default for students or other roles: send to student area (adjust as needed)
    header('Location: /MSHS_SMS/student/student-dashboard.php');
    exit;
}

?>
