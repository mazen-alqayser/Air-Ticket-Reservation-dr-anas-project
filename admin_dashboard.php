<?php
session_start();
include 'db_connect.php';


if (!isset($_SESSION["user_id"]) || $_SESSION["role"] != "admin") {
    header("Location: login.php");
    exit();
}


if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST["add_flight"])) {
    $airline_name = $_POST["airline_name"];
    $origin = $_POST["origin"];
    $destination = $_POST["destination"];
    $departure_time = $_POST["departure_time"];
    $arrival_time = $_POST["arrival_time"];
    $price = $_POST["price"];
    $status = $_POST["status"];

    $query = "INSERT INTO flights (airline_name, origin, destination, departure_time, arrival_time, price, status) 
              VALUES (?, ?, ?, ?, ?, ?, ?)";
    $stmt = $conn->prepare($query);
    $stmt->bind_param("sssssss", $airline_name, $origin, $destination, $departure_time, $arrival_time, $price, $status);
    $stmt->execute();
    $stmt->close();
}


if (isset($_GET["delete"])) {
    $flight_id = $_GET["delete"];
    $query = "DELETE FROM flights WHERE flight_id = ?";
    $stmt = $conn->prepare($query);
    $stmt->bind_param("i", $flight_id);
    $stmt->execute();
    $stmt->close();
}


$flights_query = "SELECT * FROM flights";
$flights_result = $conn->query($flights_query);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <div class="dashboard-container">
        <h2>Admin Dashboard - Manage Flights</h2>

        <!-- Add New Flight -->
        <h3>Add New Flight</h3>
        <form method="POST">
            <input type="text" name="airline_name" placeholder="Airline Name" required>
            <input type="text" name="origin" placeholder="Origin" required>
            <input type="text" name="destination" placeholder="Destination" required>
            <input type="datetime-local" name="departure_time" required>
            <input type="datetime-local" name="arrival_time" required>
            <input type="number" name="price" placeholder="Price" required>
            <select name="status">
                <option value="available">Available</option>
                <option value="booked">Booked</option>
                <option value="cancelled">Cancelled</option>
            </select>
            <button type="submit" name="add_flight">Add Flight</button>
        </form>

        <!-- Flight List -->
        <h3>All Flights</h3>
        <table>
            <tr>
                <th>Airline</th>
                <th>Origin</th>
                <th>Destination</th>
                <th>Departure</th>
                <th>Arrival</th>
                <th>Price</th>
                <th>Status</th>
                <th>Actions</th>
            </tr>
            <?php while ($flight = $flights_result->fetch_assoc()): ?>
                <tr>
                    <td><?= $flight["airline_name"] ?></td>
                    <td><?= $flight["origin"] ?></td>
                    <td><?= $flight["destination"] ?></td>
                    <td><?= $flight["departure_time"] ?></td>
                    <td><?= $flight["arrival_time"] ?></td>
                    <td>$<?= $flight["price"] ?></td>
                    <td><?= $flight["status"] ?></td>
                    <td>
                        <a href="?delete=<?= $flight["flight_id"] ?>" class="delete-btn">Delete</a>
                    </td>
                </tr>
            <?php endwhile; ?>
        </table>

        <a href="login.php"><button>Logout</button></a>
    </div>
</body>
</html>
