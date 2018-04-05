<?php
include("connection.php");
// Delete the selected data from database based on the order number that was put into web address
$id = $_GET['id'];
$sql = "DELETE FROM VGstock WHERE orderId = $id";
$result = mysqli_query($connection, $sql);

header("location:index.php");
?>