<?php
session_start();
foreach ($_SESSION as $k => $v) unset($_SESSION[$k]);
header('location: index.php');
