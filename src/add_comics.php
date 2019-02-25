<?php include 'includes/bdd_connection.php';

session_start();
if(!isset($_SESSION['id_user'])) header('Location: login.php');

if (empty($_POST)) {

  //Récupération des catégories

  $categories = 'SELECT `id_cat`, `cat_name` FROM `category`';

  $query = $pdo->prepare($categories);
  $query->execute();
  $allCategories = $query->fetchAll();

  //Récupération du type d'oeuvre
  $comicsType = 'SELECT `id_type`, `comics_type` FROM `comics_type`';

  $query = $pdo->prepare($comicsType);
  $query->execute();
  $allType = $query->fetchAll();


  // Sélection et affichage du template PHTML

  include_once 'admin.phtml';

} else {


  //On regarde si l'auteur existe dans la BDD
  $authorExist = $pdo->prepare('SELECT COUNT(*) FROM author WHERE author_name = ?');
  $authorExist-> execute(array($_POST['author']));

  if ($authorExist->fetchColumn() != 0) { //S'il existe alors

        $query = $pdo->prepare('SELECT id_author FROM author WHERE author_name = ?');

        $query -> execute(array($_POST['author']));
        $nameID = $query->fetch();
        $name = implode(', ', $nameID);


  } else {

    $newAuthor = 'INSERT INTO author (author_name)
    VALUES (?)';

    $query = $pdo->prepare($newAuthor);
    $query->execute(array($_POST['author']));

    $name = $pdo->lastInsertId(); //Je récupère l'ID pour la réquête INSERT INTO de la table comics


  }


  /* UPLOAD IMAGE */

  // Variable d'erreur par soucis de lisibilité
  $error = false;

  // On définis nos constantes
  $remplacements = array(" " => "_", "/" => "_");
  $newName = strtr($_POST['title'], $remplacements);
  $path = 'img/comics/';
  $legalExtensions = array('.png', '.gif', '.jpg', '.jpeg');
  $legalSize = "10000000";

  // On récupères les infos
  $file = $_FILES['picture']['name'];
  $actualName = $_FILES['picture']['tmp_name'];
  $actualSize = $_FILES['picture']['size'];
  $extension = strrchr($_FILES['picture']['name'], '.');



  // On s'assure que le fichier n'est pas vide
  if ($actualName == NULL || $actualSize == 0) {
      $error = true;
  }

  // On vérifie qu'un fichier portant le même nom n'est pas présent sur le serveur
  if (file_exists($path . $newName . $extension)) {
      $error = true;
  }

  // On effectue nos vérifications réglementaires
  if (!$error) {
      if ($actualSize < $legalSize) {
          if (in_array($extension, $legalExtensions)) {
              move_uploaded_file($actualName, $path . $newName . $extension);
          }
      }
  }

  else {

      // On supprime le fichier du serveur
      @unlink($path . $newName . $extension);

      echo "Une erreur s'est produite";

  }

  $dataPicture = $newName . $extension;

  /* FIN D'UPLOAD */


  $newComics = 'INSERT INTO comics (id_author, id_type, picture, comics_name, comics_description, comics_alternative) VALUES (?, ?, ?, ?, ?, ?)';

  $params = array();

  array_push($params, $name, $_POST['type'], $dataPicture, $_POST['title'], $_POST['contents'], $_POST['alternative']);


  $query = $pdo->prepare($newComics);
  $query->execute($params);

  $idComics = $pdo->lastInsertId();



  $categories = $_POST['category'];

  $query=$pdo->prepare('INSERT INTO category_comics VALUES (?, ?)');

  foreach($categories as $value){

    $query->execute(array($idComics, $value));

  }

  header('Location: add_comics.php');
}
