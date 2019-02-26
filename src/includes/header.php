<!DOCTYPE html>
<html lang="fr">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-
scale=1.0">
    <link rel="stylesheet" href="css/normalize.css">
    <link rel="stylesheet" href="css/fontawesome-all.min.css">
    <link rel="stylesheet" href="css/style.css">
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <title><?php echo $title ; ?></title>
  </head>
  <body>
    <header>
      <h1><a href="index.php">Les Must-Have</a></h1>
      <h2> du forum <a href="http://www.jeuxvideo.com/forums/0-27-0-1-0-1-0-bd-mangas-comics.htm">BD - Manga - Comics</a> de <a href="http://www.jeuxvideo.com/">jeuxvideo.com</a></h2>

      <?php
        if (isset($_SESSION['id_user'])){
       ?>

        <nav>
          <ul>
            <li><a href="bd.php">BD</a></li>
            <li><a href="manga.php">Mangas</a></li>
            <li><a href="comics.php">Comics</a></li>
            <li><a href="add_comics.php">Administration</a></li>
            <li>
              <a href="logout.php">Déconnexion</a>
            </li>
          </ul>
          <p>Bonjour <?= htmlspecialchars($_SESSION['pseudo'])?></p>
        </nav>

      <?php
        } else {
       ?>

        <nav>
          <ul>
            <li><a href="bd.php">BD</a></li>
            <li><a href="manga.php">Mangas</a></li>
            <li><a href="comics.php">Comics</a></li>
            <li><a href="login.php">Connexion</a></li>
            <li><a href="add_user.phtml">Inscription</a></li>
          </ul>
        </nav>

      <?php
        }
      ?>
    </header>
