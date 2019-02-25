<?php include 'includes/bdd_connection.php';
session_start();

$query = $pdo->prepare('SELECT id_cat, cat_name, is_active FROM category_comics JOIN comics USING (id_comics) JOIN category USING (id_cat) WHERE id_type = 1 GROUP BY id_cat, cat_name, is_active');
$query->execute();
$selectFilter = $query->fetchAll();



$query = $pdo->prepare('
  SELECT id_cat, id_comics, id_author, id_type, picture, comics_name, author_name, comics_description, comics_alternative, cat_name, is_active, GROUP_CONCAT(cat_name SEPARATOR ", ") AS categorie
  FROM category_comics
  JOIN comics USING (id_comics)
  JOIN category USING (id_cat)
  JOIN author USING (id_author)
  WHERE id_type = 1
  GROUP BY id_comics, id_author, id_type, picture, comics_name, comics_description, comics_alternative, is_active
');
$query->execute();
$mangas = $query->fetchAll();

$query = $pdo->prepare('SELECT COUNT(id_comics) AS count FROM comics WHERE id_type = 1');
$query->execute();
$count = $query->fetch();
include_once 'manga.phtml';
