<?php include 'includes/bdd_connection.php';

$query = $pdo->prepare('
  SELECT id_cat, id_comics, id_author, id_type, picture, comics_name, author_name, comics_description, comics_alternative, cat_name, is_active, GROUP_CONCAT(cat_name SEPARATOR ", ") AS categorie
  FROM category_comics
  JOIN comics USING (id_comics)
  JOIN category USING (id_cat)
  JOIN author USING (id_author)
  WHERE id_type = 2
  GROUP BY id_comics, id_author, id_type, picture, comics_name, comics_description, comics_alternative, is_active
');
$query->execute();
$bds = $query->fetchAll();

echo json_encode($bds);
