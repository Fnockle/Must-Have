<?php include 'includes/bdd_connection.php';
include_once 'includes/const.php';

$_POST['password'] = SALT.$_POST['password'];
$a = array_values($_POST);

$query = $pdo->prepare('INSERT INTO users (pseudo, email, password) VALUES (?, ?, SHA1(?))');
$newCustomer = $query->execute($a);


header('Location: index.php');
