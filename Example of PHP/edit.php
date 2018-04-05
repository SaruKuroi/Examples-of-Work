<?php

include('connection.php');

if(isset($_POST['update'])) {
    $id = $_POST['id'];
    $name = $_POST['name'];
    $price = $_POST['price'];
    $developer = $_POST['developer'];
    $vgCondition = $_POST['vgCondition'];

    $sql = "UPDATE VGstock SET name = '$name', price = '$price', developer = '$developer', vgCondition = '$vgCondition' WHERE orderId = $id";

    header('location:index.php');
}

if(isset($_GET['id'])) {
    $id = $_GET['id'];
    $sql = "SELECT * FROM VGstock WHERE orderId = '$id'";
    $select = mysqli_query($connection, $sql);
    $row = mysqli_fetch_assoc($select);

    $name = $row['name'];
    $price = $row['price'];
    $developer = $row['developer'];
    $vgCondition = $row['vgCondition'];
} ?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset ="UTF-8">
    <title>Edit Stock | Video Game Stock</title>
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
        <h2>Edit stock</h2>
        <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="post">
        <input type="text" name="id" value="<?php echo $id;?>" hidden>
            <fieldset>
                <div>
                    <label for="name">Name</label>
                    <input type="text" name="name" id="name" value="<?php echo $name; ?>">
                </div>
                <div>
                    <label for="price">Price</label>
                    <input type="number" name="price" id="price" value="<?php echo $price; ?>">
                </div>
                <div>
                    <label for="developer">Developer</label>
                    <input type="text" name="developer" id="developer" value="<?php echo $developer; ?>">
                </div>
                <div>
                    <label for="vgCondition">Condition</label>
                    <select id="vgCondition" name="vgCondition" value="<?php echo $vgCondition; ?>">
                        <option value="choose">Choose condition</option>
                        <option value="perfect">Perfect</option>
                        <option value="good">Good</option>
                        <option value="slightlyDamaged">Slightly Damaged</option>
                        <option value="broken">Broken</option>
                    </select>
                </div>
            </fieldset>
            <input type="submit" name="edit" value="Edit">
            <a class="cancel" href="index.php">Cancel</a>
        </form>
    </main>
</body>
</html>