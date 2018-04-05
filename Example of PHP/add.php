<?php
if (isset($_POST['submit'])) {
    include('connection.php');
    $name = $_POST['name'];
    $price = $_POST['price'];
    $developer = $_POST['developer'];
    $vgCondition = $_POST['vgCondition'];

    $query = "INSERT INTO VGstock (name, price, developer, vgCondition) VALUES ('$name', '$price', '$developer', '$vgCondition')";

    mysqli_query($connection, $query);

    header('location: index.php');
}?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset ="UTF-8">
    <title>Add Stock | Video Game Stock</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
</head>
<body>
    <header>
        <h1>Video Game Stock</h1>
        <nav>
            <ul>
                <li><a href="logout.php">Logout</a></li>
            </ul>
        </nav>
    </header>
    <main>
        <h2>Add to stock</h2>
        <!--Create a form to save login information to save-registration.php -->
        <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="post">
            <fieldset>
                <div>
                    <label for="name">Name</label>
                    <input type="text" name="name" id="name" required="required" placeholder="Name of Game">
                </div>
                <div>
                    <label for="price">Price</label>
                    <input type="number" name="price" id="price" required="required" placeholder="Price of Game">
                </div>
                <div>
                    <label for="developer">Developer</label>
                    <input type="text" name="developer" id="developer" required="required" placeholder="Name of Developer">
                </div>
                <div>
                    <label for="vgCondition">Condition</label>
                    <select id="vgCondition" name="vgCondition">
                        <option value="choose">Choose condition</option>
                        <option value="perfect">Perfect</option>
                        <option value="good">Good</option>
                        <option value="slightlyDamaged">Slightly Damaged</option>
                        <option value="broken">Broken</option>
                    </select>
                </div>
            </fieldset>
            <input type="submit" name="submit" value="Add">
            <a class="cancel" href="index.php">Cancel</a>
        </form>
    </main>
</body>
</html>