<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Login Page</title>
  <!-- Bootstrap CSS -->
  <link href="assets/bootstrap-5.3.8-dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets/bootstrap-icons-1.13.1/bootstrap-icons.css" rel="stylesheet">
  <link rel="stylesheet" href="assets/css/login.css">
</head>
<body>

  <?php session_start(); ?>
  <div class="login-card text-center">
    <!-- Responsive Logo -->
    <img src="assets/img/Logo.png" alt="Logo" class="logo img-fluid mb-3">

    <form action="validate_users.php" method="POST">
      <div class="mb-3 text-start">
        <label for="username" class="form-label">Username</label>
        <input type="text" name="username" class="form-control" id="username" placeholder="Enter your username" required>
      </div>
      <div class="mb-3 text-start">
        <label for="password" class="form-label">Password</label>
        <div class="input-group">
          <input type="password" name="password" class="form-control" id="password" placeholder="Enter your password" required>
          <button class="btn btn-outline-secondary" type="button" id="togglePassword" aria-label="Show password">
            <i class="bi bi-eye-slash" id="togglePasswordIcon"></i>
          </button>
        </div>
      </div>
      <div class="d-flex justify-content-between align-items-center mb-3">
        <div class="form-check">
          <input class="form-check-input" type="checkbox" id="remember">
          <label class="form-check-label" for="remember">Remember me</label>
        </div>
       <!-- <a href="#" class="text-decoration-none small">Forgot password?</a> -->
      </div>
      <button type="submit" class="btn btn-primary w-100">Login</button>
    </form>
    <?php if (!empty($_SESSION['login_error'])): ?>
      <div class="alert alert-danger mt-3 mx-auto" style="max-width:380px;">
        <?php echo htmlentities($_SESSION['login_error']); unset($_SESSION['login_error']); ?>
      </div>
    <?php endif; ?>
  </div>

  <script src="assets/bootstrap-5.3.8-dist/js/bootstrap.bundle.min.js"></script>
  <script>
    // Toggle password visibility
    (function(){
      const pwd = document.getElementById('password');
      const toggle = document.getElementById('togglePassword');
      const icon = document.getElementById('togglePasswordIcon');
      if (!pwd || !toggle || !icon) return;
      toggle.addEventListener('click', function(){
        const type = pwd.getAttribute('type') === 'password' ? 'text' : 'password';
        pwd.setAttribute('type', type);
        // swap icon
        if (type === 'text') {
          icon.classList.remove('bi-eye-slash');
          icon.classList.add('bi-eye');
        } else {
          icon.classList.remove('bi-eye');
          icon.classList.add('bi-eye-slash');
        } 
      });
    })();
  </script>
</body>
</html>
