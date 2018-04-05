<?php
//connect to sql database and set variables for user inputs
include("connection.php");
$username = $_POST['username'];
$pass = $_POST['pass'];
// Look up user
$query = "SELECT * FROM VGregistration WHERE username = '$username'";
$select = mysqli_query($connection, $query);
$user = mysqli_fetch_assoc($select);
// if the username is not valid, tell the user 
if (empty($user)) {
    header('location:login.php?invalid=usernottrue');
}
// compares password from login screen is the same after being converted to hash to the hashed password in the database
// I can't for the life of me figure out why it passes this else if statement, it doesn't match for some reason
//The username is fine but why the password?
else if (password_verify($pass, $user['pass'])) {
    session_start();
    $_SESSION['userId'] = $user['userId'];
    header('location:index.php');
}
// if there are any other problems, like with password, tell the user
else {
    header('location:login.php?invalid=true');
}
//close the connection
mysqli_close($connection);
?>