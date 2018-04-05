<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset ="UTF-8">
    <title>Save Registration | Video Game Stock</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
</head>
<body>
    <header>
        <h1>Video Game Stock</h1>
        <nav>
            <ul>
                <li><a href="register.php">Register</a></li>
                <li><a href="login.php">Login</a><li>
            </ul>
        </nav>
    </header>
    <main>
        <?php
            //Connect to sql database
            include("connection.php");
            //save register information into variables
            $username = $_POST['username'];
            $pass = $_POST['pass'];
            $verifyPass = $_POST['verifyPass'];
            //Test for errors in registration information
            $error = false;

            if (empty($username)) {
                echo 'Please enter a username<br />';
                $error = true;
            }
            if (empty($pass)) {
                echo 'Please enter a password<br />';
                $error = true;
            }
            if (empty($verifyPass)) {
                echo 'Please confirm your password';
                $error = true;
            }
            else if ($pass != $verifyPass) {
                echo 'Your passwords do not match';
                $error = true;
            }
            //If there are no errors hash password, connect to sql and save information to database
            if ($error == false) {
                $hashedPassword = password_hash($pass, PASSWORD_DEFAULT);
                $query = "INSERT INTO VGregistration (username, pass) VALUES ('$username', '$hashedPassword')";

                mysqli_query($connection, $query);
                mysqli_close($connection);
                ?>
                <h2>Registration Complete</h2>
                <a href="login.php" title="Login">Login</a>
           <?php } ?>
    </main>
</body>
</html>