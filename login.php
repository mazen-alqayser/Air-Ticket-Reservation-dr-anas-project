<?php
session_start();
include 'db_connect.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $email = $_POST["email"];
    $password = $_POST["password"];

    
    $query_admin = "SELECT * FROM admins WHERE email=?";
    $stmt_admin = $conn->prepare($query_admin);
    $stmt_admin->bind_param("s", $email);
    $stmt_admin->execute();
    $result_admin = $stmt_admin->get_result();

    if ($result_admin->num_rows == 1) {
        $user = $result_admin->fetch_assoc();
        if (password_verify($password, $user["password"])) {
            $_SESSION["user_id"] = $user["admin_id"]; 
            $_SESSION["role"] = "admin";
            $_SESSION["name"] = $user["username"];
            header("Location: admin_dashboard.php");
            exit();
        }
    }

    
    $query_passenger = "SELECT * FROM passengers WHERE email=?";
    $stmt_passenger = $conn->prepare($query_passenger);
    $stmt_passenger->bind_param("s", $email);
    $stmt_passenger->execute();
    $result_passenger = $stmt_passenger->get_result();

    if ($result_passenger->num_rows == 1) {
        $user = $result_passenger->fetch_assoc();
        if (password_verify($password, $user["password"])) {
            $_SESSION["user_id"] = $user["id"];
            $_SESSION["role"] = "passenger";
            $_SESSION["name"] = $user["first_name"] . " " . $user["last_name"];
            header("Location: passenger_dashboard.php");
            exit();
        }
    }

    
    $error = "Invalid email or password!";
    $stmt_admin->close();
    $stmt_passenger->close();
}
$conn->close();
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <div class="login-container">
        <h2>Login</h2>
        <?php if (isset($error)) echo "<p style='color:red;'>$error</p>"; ?>
        <form action="login.php" method="POST">
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required>

            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>

            <button type="submit">Login</button>
        </form>
        <p>Don't have an account? <a href="passenger_register.php">Create an account</a></p>
    </div>
</body>
</html>
