<?php
// logout.php
session_start();

// Clear session data
$_SESSION = [];
if (ini_get("session.use_cookies")) {
    $params = session_get_cookie_params();
    setcookie(session_name(), '', time() - 42000,
        $params["path"], $params["domain"],
        $params["secure"], $params["httponly"]
    );
}
session_destroy();

// Detect if the request is AJAX/fetch (expects JSON)
$isAjax = false;
if (isset($_SERVER['HTTP_X_REQUESTED_WITH']) &&
    strtolower($_SERVER['HTTP_X_REQUESTED_WITH']) === 'xmlhttprequest') {
    $isAjax = true;
} elseif (isset($_SERVER['HTTP_ACCEPT']) && stripos($_SERVER['HTTP_ACCEPT'], 'application/json') !== false) {
    $isAjax = true;
}

// If the client explicitly requested a redirect ( ?redirect=1 ) OR this is a normal browser navigation,
// redirect to the login page. For fetch/XHR requests, return JSON.
if (isset($_GET['redirect']) || !$isAjax) {
    header('Location: /MSHS_SMS/login.php');
    exit;
}

// Default: return JSON for programmatic clients
header('Content-Type: application/json');
echo json_encode(['success' => true]);
exit;
?>
