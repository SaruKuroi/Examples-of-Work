<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset ="UTF-8">
    <title>Home | Video Game Stock</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
</head>
<body>
    <?php
    //Check to see if there is a session, if there is show the game stock information and change login and registration to logout
    session_start();
    if (!empty($_SESSION['userId'])) {
        ?>
        <header>
            <h1>Video Game Stock</h1>
            <nav>
                <ul>
                    <li><a href="logout.php">Logout</a></li>
                </ul>
            </nav>
        </header>
        <main>
            <h2>Current Games in Stock</h2>
            <?php
                include('connection.php');
                $sql = "SELECT * FROM VGstock";
                $select = mysqli_query($connection, $sql);
            ?>
            <table width="100%" border="1" cellspacing="0" cellpadding="2">
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Price</th>
                    <th>Developer</th>
                    <th>Condition</th>
                    <th>Edit</th>
                    <th>Delete</th>
                </tr>
            <?php
            while($row = mysqli_fetch_assoc($select)) {
                ?>
                <tr>
                    <td><?php echo $row['orderId']; ?></td>
                    <td><?php echo $row['name']; ?></td>
                    <td><?php echo $row['price']; ?></td>
                    <td><?php echo $row['developer']; ?></td>
                    <td><?php echo $row['vgCondition']; ?></td>
                    <td><a class="edit" href="edit.php?id=<?php echo $row['orderId']; ?>">Edit</a></td>
                    <td><a class="delete" href="delete.php?id=<?php echo $row['orderId']; ?>">Delete</a></td>
                </tr>
            <?php
            }
            ?>
            </table>
            <a href="add.php">Add to Stock</a>
        </main>
    <?php }
    else {
        ?>
        <header>
            <h1>Video Game Stock</h1>
            <nav>
                <ul>
                    <li><a href="register.php">Register</a></li>
                    <li><a href="login.php">Login</a><li>
                </ul>
            </nav>
        </header>
   <?php } ?>
</body>
<!-- Coded By Andrew Brough -->
</html>

