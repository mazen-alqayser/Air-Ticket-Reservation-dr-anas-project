<?php
session_start();
include 'db_connect.php';

if (!isset($_SESSION["user_id"])) {
    header("Location: login.php");
    exit();
}

$passenger_id = $_SESSION["user_id"];
$query = "SELECT flights.* FROM bookings 
          JOIN flights ON bookings.flight_id = flights.flight_id 
          WHERE bookings.passenger_id = ?";
$stmt = $conn->prepare($query);
$stmt->bind_param("i", $passenger_id);
$stmt->execute();
$result = $stmt->get_result();
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Flights</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <div class="dashboard-container">
        <h2>My Booked Flights</h2>
        <table>
            <tr>
                <th>Airline</th>
                <th>Origin</th>
                <th>Destination</th>
                <th>Departure</th>
                <th>Arrival</th>
                <th>Price</th>
            </tr>
            <?php while ($flight = $result->fetch_assoc()): ?>
                <tr>
                    <td><?= $flight["airline_name"] ?></td>
                    <td><?= $flight["origin"] ?></td>
                    <td><?= $flight["destination"] ?></td>
                    <td><?= $flight["departure_time"] ?></td>
                    <td><?= $flight["arrival_time"] ?></td>
                    <td>$<?= $flight["price"] ?></td>
                </tr>
            <?php endwhile; ?>
        </table>
        <a href="passenger_dashboard.php"><button>Back to Dashboard</button></a>
    </div>
</body>
</html>
