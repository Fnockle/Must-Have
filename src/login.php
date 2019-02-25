<?php include 'includes/bdd_connection.php';
include_once 'includes/const.php';

if(count($_POST)>0){

    $query = $pdo ->prepare('SELECT * FROM users WHERE email = ? AND password = SHA1(?)');
    $query->execute([$_POST['email'], SALT.$_POST['password']]);
    $login = $query ->fetch();


    //si identifiants correspondent
    if (is_array($login)) {

      //alors

        session_start();
        $_SESSION['id_user'] = $login['id_user'];
        $_SESSION['pseudo'] = $login['pseudo'];

        header('Location: index.php');



    } else echo 'Mauvais mot de passe';

}

include_once 'login.phtml';
