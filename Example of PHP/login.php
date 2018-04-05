<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset ="UTF-8">
    <title>Login | Video Game Stock</title>
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
        <!-- Create a form for user to input their login information -->
        <h2>Login</h2>
        <form action="verify.php" method="post">
                <fieldset>
                    <div>
                        <label for="username">Username</label>
                        <input type="text" name="username" id="username">
                    </div>
                    <div>
                        <label for="pass">Password</label>
                        <input type="password" name="pass" id="pass">
                    </div>
                </fieldset>
            <input type="submit" name="login" value="Login">
            <a class="cancel" href="index.php">Cancel</a>
        </form>
        <?php
        //After sending information to verify.php check to see if there are any errors and if there are, display an error message
        if (!empty($_GET['invalid'])) {
            if ($_GET['invalid'] == 'usernottrue') {
                ?>
                <p>Username is not found</p>
                <?php
            } 
            else if ($_GET['invalid'] == 'true') {
                ?>
                <p>Password is not found</p>
                <?php
            }
        } ?>
    </main>
</body>
</html>