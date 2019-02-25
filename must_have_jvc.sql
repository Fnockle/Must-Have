-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le :  lun. 25 fév. 2019 à 13:17
-- Version du serveur :  5.6.34-log
-- Version de PHP :  7.1.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `must_have_jvc`
--

-- --------------------------------------------------------

--
-- Structure de la table `author`
--

CREATE TABLE `author` (
  `id_author` int(10) UNSIGNED NOT NULL,
  `author_name` char(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `author`
--

INSERT INTO `author` (`id_author`, `author_name`) VALUES
(1, 'Naoki Urasawa'),
(2, 'Yukinobu Hoshino'),
(3, 'Katsuhiro Otomo'),
(4, 'Taiyo Matsumoto'),
(5, 'Kaori Yuki'),
(6, 'Tetsuya Chiba, Asao Takamori'),
(7, 'Greg'),
(8, 'Cosey'),
(9, 'Jens Harder'),
(11, 'Moebius'),
(12, 'René Goscinny, Albert Uderzo'),
(13, 'Philippe Tome, Ralph Meyer'),
(14, 'Grant Morrison'),
(15, 'Joss Whedon, John Cassaday'),
(16, 'Frank Miller, David Mazzuccelli'),
(17, 'Frank Miller, Klaus Janson, Lynn Varley'),
(18, 'Alan Moore, Brian Bolland');

-- --------------------------------------------------------

--
-- Structure de la table `category`
--

CREATE TABLE `category` (
  `id_cat` int(10) UNSIGNED NOT NULL,
  `cat_name` char(20) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `category`
--

INSERT INTO `category` (`id_cat`, `cat_name`, `is_active`) VALUES
(1, 'Aventure', 1),
(2, 'Action', 1),
(3, 'Animalier', 1),
(4, 'Comic-Strip', 1),
(5, 'Anthologie', 1),
(6, 'Cosmique', 1),
(7, 'Drame', 1),
(8, 'Dystopie', 1),
(9, 'Esotérique', 1),
(10, 'Espionnage', 1),
(11, 'Essai théorique', 1),
(12, 'Fantastique', 1),
(13, 'Thriller', 1),
(14, 'Guerre', 1),
(15, 'Historique', 1),
(16, 'Horreur', 1),
(17, 'Humour', 1),
(18, 'Mythologie', 1),
(19, 'Onirique', 1),
(20, 'Polar', 1),
(21, 'Policier', 1),
(22, 'Politique', 1),
(23, 'Post-apocalyptique', 1),
(24, 'Science-Fiction', 1),
(25, 'Société', 1),
(26, 'Super-Héros', 1),
(28, 'Tranche de vie', 1),
(29, 'Baston', 1),
(30, 'Comédie', 1),
(31, 'Dark fantasy', 1),
(32, 'Drame', 1),
(33, 'Chronique sociale', 1),
(34, 'Ecole', 1),
(35, 'Heroic fantasy', 1),
(36, 'Romance', 1),
(37, 'Samouraï', 1),
(38, 'Sport', 1),
(39, 'Survival', 1),
(41, 'Uchronie', 1),
(42, 'Anthropomorphisme', 1),
(43, 'Anticipation', 1),
(44, 'Autobiographie', 1),
(45, 'Aviation', 1),
(46, 'Carnet de voyage', 1),
(47, 'Conte', 1),
(48, 'Educatif', 1),
(49, 'Jeunesse', 1),
(50, 'Péplum', 1),
(51, 'Western', 1);

-- --------------------------------------------------------

--
-- Structure de la table `category_comics`
--

CREATE TABLE `category_comics` (
  `id_comics` int(10) UNSIGNED NOT NULL,
  `id_cat` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `category_comics`
--

INSERT INTO `category_comics` (`id_comics`, `id_cat`) VALUES
(1, 13),
(2, 24),
(3, 23),
(3, 24),
(4, 1),
(4, 7),
(5, 12),
(6, 2),
(6, 38),
(7, 1),
(7, 17),
(8, 28),
(13, 48),
(14, 24),
(15, 1),
(15, 17),
(15, 49),
(16, 13),
(16, 20),
(17, 9),
(17, 26),
(18, 26),
(19, 26),
(20, 26),
(21, 26);

-- --------------------------------------------------------

--
-- Structure de la table `comics`
--

CREATE TABLE `comics` (
  `id_comics` int(10) UNSIGNED NOT NULL,
  `id_author` int(10) UNSIGNED NOT NULL,
  `id_type` int(10) UNSIGNED NOT NULL,
  `picture` varchar(105) NOT NULL,
  `comics_name` varchar(100) NOT NULL,
  `comics_description` text NOT NULL,
  `comics_alternative` varchar(100) NOT NULL DEFAULT 'truc'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `comics`
--

INSERT INTO `comics` (`id_comics`, `id_author`, `id_type`, `picture`, `comics_name`, `comics_description`, `comics_alternative`) VALUES
(1, 1, 1, '20th_Century_Boys.jpg', '20th Century Boys', '1997, Kenji dirige un convini et porte constamment sur le dos le bébé que sa soeur lui a confié avant de disparaître mystérieusement. La mort d\'un ami d\'enfance va réunir la bande de copains qui, lorsqu\'ils avaient dix ans, construisaient le monde avec des yeux d\'enfants. Ami, le gourou d\'une secte, va croiser le chemin de nos amis sans raison apparente... mais pourtant il semble être en étroite relation avec leur passé.', 'Monster, Pluto, Billy Bat, Montage'),
(2, 2, 1, '2001_Night_Stories.jpg', '2001 Night Stories', 'L\'humanité a réussi à surmonter une guerre nucléaire totale et s\'est lancée dans l\'exploration du système solaire. La découverte d\'un morceau de météorite géante dans un cratère aux abords d\'une base lunaire sonne le début d\'une ruée vers de nouvelles ressources naturelles. Tout d\'abord jusque sur les autres planètes du système solaire, puis vers les galaxies les plus éloignées… Un merveilleux voyage dans l\'immensité de l\'univers qui vous fera découvrir les vestiges des plus anciennes civilisations extraterrestres, des systèmes d\'évolution distincts de celui de l\'homme, et qui vous fera faire la rencontre de ceux que l\'on nomme les “semailles d\'étoiles”…', 'Moonlight Miles'),
(3, 3, 1, 'Akira.jpg', 'Akira', '2030. Néo-Tokyo est devenue une gigantesque poubelle hi-tech. Tetsuo, Kanéda et leur bande de jeunes du centre d\'insertion et d\'apprentissage professionnel foncent dans la nuit sur des motos volées, sans autre but que de repousser toujours plus loin les limites du speed. Quand ils croisent un drôle de petit garçon au visage de vieillard, leur premier réflexe est de l\'agresser mais cette créature perdue possède un étrange moyen de défense... Ils viennent de faire connaissance avec le n°26 et de franchir, sans s\'en rendre compte, la première étape d\'un processus irréversible : le réveil d\'Akira...', 'Dômu, Eternal Sabbath, Mother Sarah, Gunnm, Eden, Ghost in the Shell'),
(4, 4, 1, 'Amer_Beton.jpg', 'Amer Beton', 'Noiro et Blanko, deux orphelins, vivent dans les rues de Takara. Malgré leur jeune âge, ils survivent dans ce quartier dominé par la pauvreté, la corruption et la violence. Ensemble, ils tiennent tête à un groupe de yakusa bien déterminé à asseoir leur domination sur la ville. La lutte pour la survie du quartier sera âpre et est loin d\'être gagnée d\'avance…', 'Gogo Monster, Le Samouraï Bambou'),
(5, 5, 1, 'Angel_Sanctuary.jpg', 'Angel Sanctuary', 'Sétsuna et Sara sont frère et soeur, pourtant, ils s\'aiment sincèrement. Mais le monde entier semble s\'opposer à leur romance. Tandis qu\'ils sont en fuite, l\'univers de Sétsuna bascule quand un être surgissant de nulle part tue sa bien-aimée, sa colère explose alors et au milieu d\'un Tokyo en ruine, il découvre qu\'il est la réincarnation d\'un ange banni par le Créateur. Ses pouvoirs vont donc lui permettre d\'aller jusqu\'au Royaume des Morts pour ramener l\'âme de Sara dans le monde des vivants. Pourtant, Sétsuna ignore encore qu\'il est l\'élément central d\'une guerre millénaire entre les anges et les démons et que le dénouement approche avec son réveil !', 'RG Veda, Les oeuvres de Kaori Yuki'),
(6, 6, 1, 'Ashita_no_Joe.jpg', 'Ashita no Joe', 'Joe Yabuki est un enfant de la rue, un orphelin bagarreur qui est régulièrement en conflit avec les autorités. À peine arrive-t-il dans un bidonville que ses frasques éveillent la curiosité et l\'intérêt de Danpei, un ancien boxeur devenu alcoolique. Ce dernier, conscient de l\'incroyable potentiel du jeune homme, rêve d\'en faire le plus grand boxeur de l\'histoire. Malheureusement, l\'intéressé semble plus que jamais attaché à son indépendance et Danpei comprend qu\'il va devoir gagner la confiance de ce jeune chien sauvage…', 'Hajime no Ippo, Racaille Blues'),
(7, 7, 2, 'Achille_Talon.jpg', 'Achille Talon', 'Une célèbre série des éditions Dargaud. Achille Talon est l\'archétype du français moyen, vit entouré de nombreux personnages truculents et s\'exprime dans un langage particulièrement fleuri.', 'Léonard'),
(8, 8, 2, 'A_la_recherche_de_Peter_Pan.jpg', 'A la recherche de Peter Pan', 'Qu’est donc venu chercher Sir Melvin Woodworth au beau milieu des Alpes valaisannes ? L’inspiration pour un nouveau roman que ses éditeurs londoniens lui réclament à corps et à cris ? En partie, car sa quête est double. L’écrivain est également à la poursuite d’un souvenir et à la recherche de l’ombre de son frère Dragan, pianiste échoué au beau milieu des montagnes. Il découvrira qu’il faut parfois relire le passé sous un angle différent pour pouvoir écrire l’avenir…', 'Joyeux Noël May'),
(13, 9, 2, 'Alpha_Beta_Gamma.jpg', 'Alpha/Beta/Gamma', 'Quatorze milliards d\'années résumées en à peine plus de 350 pages, tel est le tour de force réalisé par Jens Harder. Alpha...directions relate et montre, comme on ne les avait jamais vues, l\'évolution des formes des vie, depuis le big bang jusqu\'à l\'apparition de l\'homme. Ces pages impressionnantes confrontent aussi l\'état actuel de notre savoir avec les croyances et représentations des époques antérieurs, souvent naïves ou fantastiques, telles que l\'iconographie en porte témoignage.', 'Pas d\'info pour le moment'),
(14, 11, 2, 'Arzach.jpg', 'Arzach', 'Arzach est constituée d\'une série de cinq histoires autonomes, sortes de « nouvelles graphiques », de quelques planches chacune. Sa particularité réside tout d\'abord en son absence totale de dialogues : on y croise un, voire deux personnages récurrents mais apparemment muets, en tout cas l\'auteur ne leur autorise pas la parole pour s\'exprimer.', 'L\'âge d\'ombre, Le Garage Hermétique'),
(15, 12, 2, 'Astérix.jpg', 'Astérix', 'Nous sommes en 50 avant Jésus-Christ. Toute la Gaule est occupée par les Romains...Toute ? Non ! Car un village peuplé d\'irréductibles Gaulois résiste encore et toujours à l\'envahisseur. Et la vie n\'est pas facile pour les garnisons de légionnaires romains des camps retranchés de Babaorum, Aquarium, Laudanum et Petibonum...', 'Iznogoud, Oumpah-pah le peau rouge'),
(16, 13, 2, 'Berceuse_assassine.jpg', 'Berceuse assassine', 'A 45 ans, Joe Telenko est usé par la vie. Être chauffeur de taxi à New York n\'est pas sans conséquence sur son état, mais il y a surtout Martha, son épouse, clouée dans un fauteuil roulant, qui tourmente son mari. Jusqu\'au jour où celui-ci décide de la tuer...', 'Blue Note, Alter Ego, Quintett'),
(17, 14, 3, 'Animal_Man_par_Grant_Morrison.jpg', 'Animal Man par Grant Morrison', 'Buddy Baker n\'est pas qu\'un héros de seconde zone, c\'est aussi un père de famille dévoué et un fervent défenseur des droits des animaux. Alors qu\'il essaie de donner un nouvel élan à sa carrière de combattant contre le crime, il fera face a de nombreuses expériences aux confins de la réalité, jusqu\'à rencontrer son propre créateur : un auteur nommé Grant Morrison.', 'Pas d\'info pour le moment'),
(18, 15, 3, 'Astonishing_X-Men_par_Joss_Whedon.jpg', 'Astonishing X-Men par Joss Whedon', 'Cyclope et Emma Frost, les nouveaux directeurs de l\'Institut pour Jeunes Surdoués de Charles Xavier, reforment les X-Men avec pour objectif premier celui de surprendre le monde. Mais on apprend malencontreusement l\'existence d\'un gène mutant, ce qui risque de faire avorter leur projet avant même qu\'ils ne l\'aient lancé. Tandis que des mouvements protestataires réclament un \"remède anti-mutant\", les X-Men se mesurent à l\'énigmatique Ord, avec à leurs côtés un allié inattendu, un Colossus ressuscité et monumental ! Et ce n\'est pas tout ! Une mort tragique survient à l\'Institut Xavier et révèle la présence d\'un redoutable ennemi au sein même des X-Men, une personne insoupçonnable (et ce n\'est pas Magnéto !). La tension monte. Les X-Men parviendront-ils à surmonter cette nouvelle épreuve à mesure que le doute s\'installe et qu\'ils se demandent s\'ils peuvent encore compter les uns sur les autres ?', 'Pas d\'info pour le moment'),
(19, 16, 3, 'Batman_Année_un.jpg', 'Batman Année un', 'Gotham City : l\'incarnation de la corruption. Rares sont les flics honnêtes, rares sont les innocents protégés. Et pour la première fois, l\'ombre de la chauve-souris assombrit le ciel. Pour la première fois, les criminels de Gotham City ont peur. La première fois. La première affaire. La première année dans la carrière de Batman, le Chevalier Noir.', 'Pas d\'info pour le moment'),
(20, 17, 3, 'Batman_The_Dark_Knight_Returns.gif', 'Batman The Dark Knight Returns', 'Depuis que ses parents ont été assassinés sous ses yeux par un voleur qui voulait les dépouiller, Bruce Wayne se sert de son immense fortune pour tendre à la perfection physique et mentale. Lorsqu\'il endosse le costume de Batman, il devient le protecteur de Gotham City, et nul ne peut le détourner de sa mission : ramener coûte que coûte l\'ordre et la justice dans la ville.\r\nGotham City, quelques années dans le futur. Batman s\'est retiré de la scène super-héroïque et Gotham a rapidement sombré dans le chaos et la corruption. Un Bruce Wayne vieillissant résistera-t-il à l\'appel du cœur qui le pousse à reprendre du service sous le masque du Chevalier Noir ? Ce volume présente la mini-série complète Batman: The Dark Knight Returns, chef-d\'œuvre incontesté de Frank Miller et Klaus Janson, qui a révolutionné le monde de la bande dessinée à la fin des années 80. ', 'Pas d\'info pour le moment'),
(21, 18, 3, 'Batman_The_Killing_Joke.jpg', 'Batman The Killing Joke', 'Le Joker s’est à nouveau échappé de l’asile d’Arkham. Il a cette fois pour objectif de prouver la capacité de n’importe quel être humain de sombrer dans la folie après un traumatisme. Pour sa démonstration, il capture le commissaire Gordon et le soumet aux pires tortures que l’on puisse imaginer, à commencer par s’attaquer à sa chère fille, Barbara Gordon.', 'Pas d\'info pour le moment');

-- --------------------------------------------------------

--
-- Structure de la table `comics_type`
--

CREATE TABLE `comics_type` (
  `id_type` int(10) UNSIGNED NOT NULL,
  `comics_type` char(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `comics_type`
--

INSERT INTO `comics_type` (`id_type`, `comics_type`) VALUES
(1, 'Manga'),
(2, 'BD'),
(3, 'Comics');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id_user` int(10) UNSIGNED NOT NULL,
  `pseudo` char(20) NOT NULL,
  `password` char(80) NOT NULL,
  `email` char(40) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id_user`, `pseudo`, `password`, `email`, `is_active`) VALUES
(3, 'Nicolas', 'ef8c639cef888732560031607da588094e0ebab3', 'nico@nico.nico', 1);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `author`
--
ALTER TABLE `author`
  ADD PRIMARY KEY (`id_author`);

--
-- Index pour la table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id_cat`);

--
-- Index pour la table `category_comics`
--
ALTER TABLE `category_comics`
  ADD PRIMARY KEY (`id_comics`,`id_cat`),
  ADD KEY `id_comics` (`id_comics`),
  ADD KEY `id_cat` (`id_cat`);

--
-- Index pour la table `comics`
--
ALTER TABLE `comics`
  ADD PRIMARY KEY (`id_comics`),
  ADD KEY `id_type` (`id_type`),
  ADD KEY `id_author` (`id_author`);

--
-- Index pour la table `comics_type`
--
ALTER TABLE `comics_type`
  ADD PRIMARY KEY (`id_type`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `author`
--
ALTER TABLE `author`
  MODIFY `id_author` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT pour la table `category`
--
ALTER TABLE `category`
  MODIFY `id_cat` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;
--
-- AUTO_INCREMENT pour la table `comics`
--
ALTER TABLE `comics`
  MODIFY `id_comics` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT pour la table `comics_type`
--
ALTER TABLE `comics_type`
  MODIFY `id_type` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `category_comics`
--
ALTER TABLE `category_comics`
  ADD CONSTRAINT `id_catFK` FOREIGN KEY (`id_cat`) REFERENCES `category` (`id_cat`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `id_comicsFK` FOREIGN KEY (`id_comics`) REFERENCES `comics` (`id_comics`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `comics`
--
ALTER TABLE `comics`
  ADD CONSTRAINT `id_typeFK` FOREIGN KEY (`id_type`) REFERENCES `comics_type` (`id_type`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
