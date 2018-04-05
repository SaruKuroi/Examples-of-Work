<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset ="UTF-8">
    <title>Registration | Video Game Stock</title>
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
        <h2>Registration</h2>
        <!--Create a form to save login information to save-registration.php -->
        <form action="save-registration.php" method="post">
            <fieldset>
                <div>
                    <label for="username">Username</label>
                    <input type="text" name="username" id="username" required="required" placeholder="Choose a username" />
                </div>
                <div>
                    <label for="pass">Password</label>
                    <input type="password" name="pass" id="pass" required="required" placeholder="Choose a password" />
                </div>
                <div>
                    <label for="verifyPass">Verify Password</label>
                    <input type="password" name="verifyPass" id="verifyPass" required="required" placeholder="Re-enter your password" />
                </div>  
            </fieldset>
            <input type="submit" name="register" value="Register">
            <a class="cancel" href="index.php">Cancel</a>
        </form>
    </main>
</body>
</html>