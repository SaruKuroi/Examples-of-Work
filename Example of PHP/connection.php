<?php
$username = 'gcc200196318';
$password = 'kc9dCu4OS5';
$host = 'localhost';
$database = 'gcc200196318';

$connection = mysqli_connect($host,$username,$password,$database);

if (mysqli_connect_errno()) {
    die();
}