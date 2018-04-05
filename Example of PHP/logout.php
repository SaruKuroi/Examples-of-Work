<?php
//start logout session, unsetting variables, and ending the session
session_start();
session_unset();
session_destroy();
header('location:index.php');
?>