<?php
session_start();
include 'db_connect.php';

if (!isset($_SESSION["user_id"])) {
    header("Location: login.php");
    exit();
}

$passenger_id = $_SESSION["user_id"];


if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST["flight_id"])) {
    $flight_id = $_POST["flight_id"];
    $query = "INSERT INTO bookings (passenger_id, flight_id, status) VALUES (?, ?, 'confirmed')";
    $stmt = $conn->prepare($query);
    $stmt->bind_param("ii", $passenger_id, $flight_id);
    
    if ($stmt->execute()) {
        $message = "Flight booked successfully!";
    } else {
        $message = "Error booking flight: " . $conn->error;
    }
    $stmt->close();
}


$flights_query = "SELECT * FROM flights WHERE status = 'available'";
$flights_result = $conn->query($flights_query);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Passenger Dashboard</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <div class="dashboard-container">
        <h2>Available Flights</h2>
        <?php if (isset($message)) echo "<p style='color:green;'>$message</p>"; ?>
        <table>
            <tr>
                <th>Airline</th>
                <th>Origin</th>
                <th>Destination</th>
                <th>Departure</th>
                <th>Arrival</th>
                <th>Price</th>
                <th>Action</th>
            </tr>
            <?php while ($flight = $flights_result->fetch_assoc()): ?>
                <tr>
                    <td><?= $flight["airline_name"] ?></td>
                    <td><?= $flight["origin"] ?></td>
                    <td><?= $flight["destination"] ?></td>
                    <td><?= $flight["departure_time"] ?></td>
                    <td><?= $flight["arrival_time"] ?></td>
                    <td>$<?= $flight["price"] ?></td>
                    <td>
                        <form method="POST">
                            <input type="hidden" name="flight_id" value="<?= $flight["flight_id"] ?>">
                            <button type="submit">Book</button>
                        </form>
                    </td>
                </tr>
            <?php endwhile; ?>
        </table>
        <a href="my_flights.php"><button>My Flights</button></a>
        <a href="login.php"><button>Logout</button></a>
    </div>
</body>
</html>
