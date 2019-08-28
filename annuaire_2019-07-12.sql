# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Hôte: 127.0.0.1 (MySQL 5.5.5-10.1.31-MariaDB)
# Base de données: annuaire
# Temps de génération: 2019-07-12 12:57:31 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Affichage de la table categories
# ------------------------------------------------------------

DROP TABLE IF EXISTS `categories`;

CREATE TABLE `categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `categorie` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(192) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `categorie_icon` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `categorie_image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categories_categorie_unique` (`categorie`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;

INSERT INTO `categories` (`id`, `categorie`, `slug`, `categorie_icon`, `categorie_image`, `created_at`, `updated_at`, `deleted_at`)
VALUES
	(1,'Ecoles','ecoles','icofont-hotel','ecoles.png','2019-05-28 15:20:15','2019-05-28 15:20:15',NULL),
	(2,'Centre de langue','centre-de-langue','icofont-restaurant','centre-de-langue.png','2019-05-28 15:20:20','2019-05-28 15:20:20',NULL),
	(3,'Cours de soutien','cours-de-soutien','icofont-hotel','cours-de-soutien.p,g','2019-05-28 15:20:24','2019-05-28 15:20:24',NULL),
	(4,'Espace de jeux','espace-de-jeux','icofont-restaurant','espace-de-jeux.png','2019-05-28 15:20:28','2019-05-28 15:20:28',NULL);

/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table etablissement_niveau_etude
# ------------------------------------------------------------

DROP TABLE IF EXISTS `etablissement_niveau_etude`;

CREATE TABLE `etablissement_niveau_etude` (
  `etablissement_id` int(10) unsigned NOT NULL,
  `niveau_etude_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `etablissement_niveau_etude_etablissement_id_index` (`etablissement_id`),
  KEY `etablissement_niveau_etude_niveau_etude_id_index` (`niveau_etude_id`),
  CONSTRAINT `etablissement_niveau_etude_etablissement_id_foreign` FOREIGN KEY (`etablissement_id`) REFERENCES `etablissements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `etablissement_niveau_etude_niveau_etude_id_foreign` FOREIGN KEY (`niveau_etude_id`) REFERENCES `niveau_etudes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `etablissement_niveau_etude` WRITE;
/*!40000 ALTER TABLE `etablissement_niveau_etude` DISABLE KEYS */;

INSERT INTO `etablissement_niveau_etude` (`etablissement_id`, `niveau_etude_id`, `created_at`, `updated_at`)
VALUES
	(11,2,NULL,NULL),
	(11,4,NULL,NULL),
	(11,1,NULL,NULL),
	(11,3,NULL,NULL),
	(171,2,NULL,NULL),
	(171,4,NULL,NULL),
	(171,1,NULL,NULL),
	(171,3,NULL,NULL),
	(172,2,NULL,NULL),
	(172,4,NULL,NULL),
	(172,1,NULL,NULL),
	(172,3,NULL,NULL),
	(3,2,NULL,NULL),
	(3,4,NULL,NULL),
	(3,1,NULL,NULL),
	(3,3,NULL,NULL),
	(1,2,NULL,NULL),
	(1,4,NULL,NULL),
	(1,1,NULL,NULL),
	(1,3,NULL,NULL),
	(2,2,NULL,NULL),
	(2,1,NULL,NULL);

/*!40000 ALTER TABLE `etablissement_niveau_etude` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table etablissements
# ------------------------------------------------------------

DROP TABLE IF EXISTS `etablissements`;

CREATE TABLE `etablissements` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL,
  `categorie_id` int(10) unsigned DEFAULT NULL,
  `nom_contact` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `etablissement` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `adresse` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `zone_id` int(10) unsigned DEFAULT NULL,
  `ville_id` int(10) unsigned DEFAULT NULL,
  `tel` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fax` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `whatsapp` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `maps` text COLLATE utf8mb4_unicode_ci,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `site_web` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mensualite_min` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mensualite_max` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `niveau_etude` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `etat` tinyint(1) DEFAULT '1',
  `latitude` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `longitude` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `etablissements_user_id_foreign` (`user_id`),
  KEY `etablissements_categorie_id_foreign` (`categorie_id`),
  KEY `etablissements_zone_id_foreign` (`zone_id`),
  KEY `etablissements_ville_id_foreign` (`ville_id`),
  CONSTRAINT `etablissements_categorie_id_foreign` FOREIGN KEY (`categorie_id`) REFERENCES `categories` (`id`),
  CONSTRAINT `etablissements_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `etablissements_ville_id_foreign` FOREIGN KEY (`ville_id`) REFERENCES `villes` (`id`),
  CONSTRAINT `etablissements_zone_id_foreign` FOREIGN KEY (`zone_id`) REFERENCES `zones` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `etablissements` WRITE;
/*!40000 ALTER TABLE `etablissements` DISABLE KEYS */;

INSERT INTO `etablissements` (`id`, `user_id`, `categorie_id`, `nom_contact`, `email`, `etablissement`, `description`, `adresse`, `zone_id`, `ville_id`, `tel`, `fax`, `whatsapp`, `maps`, `photo`, `site_web`, `mensualite_min`, `mensualite_max`, `niveau_etude`, `etat`, `latitude`, `longitude`, `updated_at`, `created_at`, `deleted_at`)
VALUES
	(1,1,1,'Hefiri Nawal','gsr@gsr.ac.ma','Groupe Scolaire De La Résidence 3','Fondé en 1982, le GSR s\'est solidement enraciné à partir d\'un groupuscule primaire \"la résidence\" pour devenir à ce jour un établissement aux dimensions imposantes qui jouit d\'une renommée nationale et internationale: le G.S.R (Groupe Scolaire la Résidence).\n\nEn effet, depuis sa création, le GSR a été au cœur de plusieurs réformes pédagogiques : mise en place d\'une Formation bilingue enrichie reconnue par le MEN, puis l\'intégration en 2004 de l\'esprit international dans la culture de ses enseignements et de ses pratiques pédagogiques, ainsi que la création en 2007 d\'une section française, de la maternelle à la terminale, homologuée par le MEN Français....et l\'innovation pédagogique n\'en demeure pas moins en continuelle mouvance.','N° 32, Rue Omar El Idrissi - Mers Sultan',48,1,'0522450592','0522450593',NULL,'<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3323.9219546405657!2d-7.610025784797295!3d33.58137558073681!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x431012cf72f2b90a!2sGroupe+Scolaire+La+R%C3%A9sidence+-+Maternelle+Palais!5e0!3m2!1sfr!2sma!4v1561978390246!5m2!1sfr!2sma\" width=\"333\" height=\"333\" frameborder=\"0\" style=\"border:0\" allowfullscreen></iframe>','1559570106.jpeg','http://www.gsr.ac.ma',NULL,NULL,'creche,primair,college',1,'33.581952','-7.606979','2019-07-01 11:50:24','2019-06-11 10:15:39',NULL),
	(2,1,1,NULL,'contact@gsse.ma','Groupe Scolaire Saint Exupery','A la crèche maternelle Saint Exupéry, nous suivons un programme éducatif dicté par l’épanouissement et le bien-être des enfants de 0 à 6 ans. Nous nous inspirons des modèles  des grandes institutions de la petite enfance dans le monde (la Finlande, la France, le Canada..).','Rue des Eperviers Angle Rue de la Pie Oasis',49,1,'0661242146','0522259454','0661242146','<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3324.5946401200104!2d-7.642214584914091!3d33.56390685075329!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0xda7d2cc5d3f8f4b%3A0x3fef30165999fbee!2sGroupe+scolaire+Saint+Exup%C3%A9ry+-+cr%C3%A8che+%C3%A0+Casablanca!5e0!3m2!1sfr!2sma!4v1560162012396!5m2!1sfr!2sma\" width=\"333\" height=\"333\" frameborder=\"0\" style=\"border:0\" allowfullscreen></iframe>','1559641338.jpeg','http://www.gsse.ma',NULL,NULL,'creche',1,'33.565100','-7.639940','2019-07-01 14:05:41','2019-06-11 10:15:39',NULL),
	(3,1,1,'Alaoui Bouhamid Nadia','contact-Junior@gslecedre.com','Groupe Scolaire Le Cèdre',NULL,'16, 18, 20, rue Mohamed BAHI Palmiers',51,2,'0661143211','0522234082',NULL,'<iframe src=\"https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d13295.801546965627!2d-7.631303!3d33.5806374!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0xd0f0c77f360f1a71!2sGroupe+Scolaire+Le+C%C3%A8dre+Coll%C3%A8ge!5e0!3m2!1sfr!2sma!4v1561728540120!5m2!1sfr!2sma\" width=\"800\" height=\"600\" frameborder=\"0\" style=\"border:0\" allowfullscreen></iframe>','1559572517.png','www.gslecedre.com',NULL,NULL,'creche,primair,college,lycee',1,'33.581585','-7.631131','2019-06-28 13:30:26','2019-06-11 10:15:39',NULL),
	(4,1,2,'Mr Benkirane','almadina@madina.ma','Écoles Al Madina Ghandi',NULL,'36, Bis bd Ghandi , Rivièra, Casablanca',19,1,'0661427000','0522505097',NULL,'<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d53188.271346625144!2d-7.615826024675043!3d33.572417283374456!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0xda7cc82ed8248ff%3A0x590bf8d9000ea5a5!2sGroupe+scolaire+almadina!5e0!3m2!1sfr!2sma!4v1560162109481!5m2!1sfr!2sma\" width=\"800\" height=\"600\" frameborder=\"0\" style=\"border:0\" allowfullscreen></iframe>','1561714699.jpeg','http://www.almadina.ma/',NULL,NULL,'creche,primair,college,lycee',1,'33.566240','-7.640556','2019-06-28 09:38:19','2019-06-11 10:15:39',NULL),
	(5,1,1,'Benseghir Amina Bennis','info@mammahabiba.com','Institution Mamma Habiba',NULL,'12 Rue des Mouettes BeauSéjour',14,1,'0522801699',NULL,'0659278749','<iframe src=\"https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d13298.412986420084!2d-7.647719!3d33.5636833!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0xfc9e80864ff7f153!2sMamma+Habiba!5e0!3m2!1sfr!2sma!4v1561716418011!5m2!1sfr!2sma\" width=\"800\" height=\"600\" frameborder=\"0\" style=\"border:0\" allowfullscreen></iframe>','1559641971.jpeg','http://www.mammahabiba.com',NULL,NULL,'creche,primair',1,'33.564524','-7.647547','2019-06-28 10:09:30','2019-06-11 10:15:39',NULL),
	(6,2,2,'Said Bassit','info@gso.ma','Groupe scolaire Ouhoud 2',NULL,'50, Allée De La Plage Ain Sebaa',2,1,'0522353329','0522353500',NULL,'<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3324.193380655527!2d-7.675375384797454!3d33.574327980738595!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0xda7d33924a40631%3A0xc6251281582b2908!2sECOLE+OUHOUD!5e0!3m2!1sfr!2sma!4v1560164526621!5m2!1sfr!2sma\" width=\"800\" height=\"600\" frameborder=\"0\" style=\"border:0\" allowfullscreen></iframe>','1559642103.jpeg','www.gso.ma',NULL,NULL,'creche,primair,college,lycee',1,'','','2019-06-10 15:13:46','2019-06-11 10:15:39',NULL),
	(7,1,2,'Olivier Subrini','contact@subrini.ma','Subrini Val Fleuri',NULL,'13, Rue Stéphane Mallarmé, Val Fleuri',69,1,'0522254094','0522914994',NULL,'https://goo.gl/maps/F3LKzsukeWeXXPZK8','1559642252.jpeg','www.subrini.ma',NULL,NULL,'creche,primair,college,lycee',1,'','','2019-06-10 15:13:46','2019-06-11 10:15:39',NULL),
	(8,2,2,'Hanane Jaouire','gsalfarabi@gmail.com','Groupe Scolaire Al Farabi 2',NULL,'N° 24, Rue Guercif - C. Moulay Youssef',18,1,'0522491905','0520201767',NULL,'https://goo.gl/maps/ivp8SHDxGNfHTnoDA','1559657042.jpeg','contact@gslajoconde.ma',NULL,NULL,'creche,primair,college,lycee',1,'','','2019-06-10 15:13:46','2019-06-11 10:15:39',NULL),
	(9,2,2,'Stitni Siham','contact@gslajoconde.ma','Groupe Scolaire La Joconde',NULL,'Lot ESSAFA I 4 Oulfa Arrondissement Hay Hassani',50,1,'0522658165','0522658265',NULL,'<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d26600.07549710708!2d-7.6723970113969635!3d33.55313113246607!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0xda62cbe823bb0a5%3A0xfdf6a8a7c52b5a1!2slajoconde!5e0!3m2!1sfr!2sma!4v1560160807366!5m2!1sfr!2sma\" width=\"800\" height=\"600\" frameborder=\"0\" style=\"border:0\" allowfullscreen></iframe>','1559657217.jpeg','www.gslajoconde.ma',NULL,NULL,'creche,primair,college,lycee',1,'','','2019-06-10 15:13:46','2019-06-11 10:15:39',NULL),
	(10,2,2,'Souad Kharchafi','contact@elouatkikaoukabi.com','Institution El Ouatki Kaoukabi',NULL,'Lotissement Wakanti, Rue 3, N° 4, Route D\'Azemour - C. Anfa',3,1,'0522948259','0522948259',NULL,'<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3324.1430861410868!2d-7.681653084797439!3d33.575633980738296!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0xda7d340fd348eeb%3A0xddcdc0a1963a9673!2sEcole+El+Ouatki+Kaoukabi!5e0!3m2!1sfr!2sma!4v1560164573685!5m2!1sfr!2sma\" width=\"600\" height=\"450\" frameborder=\"0\" style=\"border:0\" allowfullscreen></iframe>','1559657940.jpeg','www.elouatkikaoukabi.com',NULL,NULL,'college,lycee',1,'','','2019-06-10 15:13:46','2019-06-11 10:15:39',NULL),
	(11,1,2,'Touriya El Otmani','almadina@madina.ma','Écoles Al Madina Ain Sebaa',NULL,'Km 9 route de Rabat Ain Sebâa',2,1,'0661482182','0522756969',NULL,'https://goo.gl/maps/QVDo1zsNxx2rKv6b6','1561712739.jpeg','www.almadina.ma',NULL,NULL,'creche,primair,college,lycee',1,'33.606387','-7.524651','2019-06-28 09:33:31','2019-06-11 10:15:39',NULL),
	(12,2,2,'Abderrhmane Ech-Cherqaoui','taiba.casa1999@gmail.com','Institution Taiba',NULL,'N° 77, Rue Abou Dabi Oasis - C. Maarif',47,1,'0661913775','0522981719',NULL,'https://goo.gl/maps/DHkKgApjQjDqo38h8','default.png','www.ecoletaiba.ma',NULL,NULL,'creche,primair,college',1,'','','2019-06-10 15:13:46','2019-06-11 10:15:39',NULL),
	(13,2,2,'Elbissari Abdelfettah','lesecoleslahlou@gmail.com','Les Ecoles Lahlou',NULL,'Ajnane Elbernoussi Ahl Loughlam Elazhar',71,1,'0522733800','0522737379',NULL,'https://goo.gl/maps/mvgthmBKvtvLqJ8GA','default.png','www.ecoleslahlou.com',NULL,NULL,'creche,primair,college,lycee',1,'','','2019-06-10 15:13:46','2019-06-11 10:15:39',NULL),
	(14,2,1,'Kinini Amina','institution.sofiati@gmail.com','Institution Sofiati',NULL,'Lotissement communal , lot n°4, sidi maarouf',62,1,'0661180163','0661163261',NULL,'https://goo.gl/maps/CHCTVuoFfjupEZCi6','default.png','www.institutionsofiati.com',NULL,NULL,'creche,primair',1,'','','2019-06-10 15:13:46','2019-06-11 10:15:39',NULL),
	(15,2,2,'Olivier Subrini','contact@subrini.ma','Subrini Val Fleuri',NULL,'13, Rue Stéphane Mallarmé, Val Fleuri',47,1,'0522254094','0522914994',NULL,'https://goo.gl/maps/D69HtxbtFko5b8cS7','default.png','www.subrini.ma',NULL,NULL,'creche,primair,college,lycee',1,'','','2019-06-10 15:13:46','2019-06-11 10:15:39',NULL),
	(16,2,2,'Hanane Jaouire','gsalfarabi@gmail.com','Groupe Scolaire Al Farabi 2',NULL,'N° 24, Rue Guercif - C. Moulay Youssef',18,1,'0520201767','0522491905',NULL,'https://goo.gl/maps/ivp8SHDxGNfHTnoDA','default.png','www.gsalfarabi.com',NULL,NULL,'creche,primair,college,lycee',1,'','','2019-06-10 15:13:46','2019-06-11 10:15:39',NULL),
	(17,2,2,'Abderrahim Laasri','gssanaa@hotmail.com','Institution Sanaâ',NULL,'N° 362-364, Bd. Oum Errabia',50,1,'0522908238','0522908238',NULL,'https://goo.gl/maps/eknGzujiWhJvnHB7A','default.png','www.gssanaa.com',NULL,NULL,'creche,primair,college,lycee',1,'','','2019-06-10 15:13:46','2019-06-11 10:15:39',NULL),
	(18,2,2,'Joundy Adil','direction@ileauxtresors.org','L\'Ile Aux Trésors',NULL,'N° 59, Rue France Ville, Oasis - C. Maarif',47,1,'0661586762','0522252378',NULL,'https://goo.gl/maps/4VU7nBEF2w6y8d3w8','default.png','www.ileauxtresors.org',NULL,NULL,'creche',1,'','','2019-06-10 15:13:46','2019-06-11 10:15:39',NULL),
	(19,2,2,'Bennouna Mohamed Imad','rahmounipote@gmail.com','G Scolaire Rahmouni Potentiel',NULL,'N° 10, Rue Des Roitelets, Oasis - C. Maarif',47,1,'0522251102',NULL,NULL,'https://www.google.com/maps/place/Groupe+Scolaire+Rahmouni+POTENTIEL/@33.5512039,-7.643534,17z/data=!3m1!4b1!4m5!3m4!1s0xda62d369f2cfe1b:0x20c1ebf797974fc8!8m2!3d33.5511994!4d-7.6413453','default.png','www.gsrp.ma',NULL,NULL,'creche,primair',1,'','','2019-06-10 15:13:46','2019-06-11 10:15:39',NULL),
	(20,2,1,'BENKABBOU Anas','ecoleryadsafwa@gmail.com','Ryad Safwa',NULL,'23 Soluna 2 Route Imouzzer',98,5,'0535618700',NULL,NULL,'https://www.google.com/maps/place/%C3%89cole+priv%C3%A9e+Ryad+Safwa/@33.9917695,-4.9893996,17z/data=!3m1!4b1!4m5!3m4!1s0xd9f8b91fd1e27d3:0x16dfac2439bbbc80!8m2!3d33.9917651!4d-4.9872109','default.png','www.ecoleryadsafwa.com',NULL,NULL,'creche,primair,college,lycee',1,'','','2019-06-10 15:13:46','2019-06-11 10:15:39',NULL),
	(21,2,1,'Badr El Azouzi','groupescolairebenabdallah@gmail.com','Groupe Scolaire Benabdallah',NULL,'Lotissement Yasmine Route De Casablanca',1,3,'0661190278','0524303945',NULL,'https://goo.gl/maps/t7rRA95856wtM1eb6','default.png','www.groupescolairebenabdallah.ma',NULL,NULL,'creche,primair,college,lycee',1,'','','2019-06-10 15:13:46','2019-06-11 10:15:39',NULL),
	(22,2,1,'Bennani Smires Fadela','info@crechekenzi.com','Jardin d\'enfants Kenzi',NULL,'19, rue Abbas Ibn Ahnaf -ex Marey',3,1,'0661393148','0522390953',NULL,'https://goo.gl/maps/3Esij1tb2ZsFpC888','default.png','www.kenzi.ma',NULL,NULL,'creche',1,'','','2019-06-10 15:13:46','2019-06-11 10:15:39',NULL),
	(23,1,1,'El Ittaoui Khadija','asam-annajah@menara.ma','Asam Annajah',NULL,'Lotissement Belbakkar 2 Daoudia',204,3,'0524313211',NULL,NULL,NULL,'default.png','www.asam-annajah.com',NULL,NULL,'',1,'','','2019-06-10 15:13:46','2019-06-11 10:15:39',NULL),
	(24,1,1,'Farouq Hilali','etablissement.hilali@gmail.com','Hilali',NULL,'N° 3, Avenue Mohamed 6- Gueliz',197,3,'0661242689','0524430670',NULL,NULL,'default.png','www.ecolehilali.com',NULL,NULL,'',1,'','','2019-06-10 15:13:46','2019-06-11 10:15:39',NULL),
	(25,2,1,'Andaloussi Mustapha','administration@elbilialycee.com','Collège Lycée Elbilia',NULL,'N° 24, Avenue Ahmed Cherci',3,1,'0522361630','0522368517',NULL,'https://goo.gl/maps/S32HcYp5ov6BDkE57','default.png','www.elbilia.ma',NULL,NULL,'college,lycee',1,'','','2019-06-10 15:13:46','2019-06-11 10:15:39',NULL),
	(26,1,1,'Abderrahim Laasri','gssanaa@hotmail.com ','Institution Sanaâ',NULL,'N° 362-364, Bd. Oum Errabia',1,1,'522908238','','','','default.png','www.gssanaa.com','','','',1,'','','2019-06-10 15:13:46','2019-06-11 10:15:39',NULL),
	(27,2,1,'Nadia Benghanem','benghanemnadia@gmail.com','Jannati',NULL,'8, Allée des peupliers, Ain Sebaa',2,1,'0522512597',NULL,NULL,'https://goo.gl/maps/Gmf1Udn5E8axKArCA','default.png','www.ecolejannati.com',NULL,NULL,'creche,primair',1,'','','2019-06-10 15:13:46','2019-06-11 10:15:39',NULL),
	(28,2,1,'Abdelmajid Drissi','skalli-gsa@menara.ma','Groupe Scolaire Anfa',NULL,'81, Bd Ghandi',3,1,'0522362433','0522399540',NULL,NULL,'default.png','www.gsamb.ma',NULL,NULL,'creche,primair,college,lycee',1,'','','2019-06-10 15:13:46','2019-06-11 10:15:39',NULL),
	(29,2,1,'Cherkaoui Makdade','contact@groupelasecondemaison.ma','Groupe Scolaire La Seconde Maison',NULL,'Route 1100 Sidi Maarouf Casablanca',62,1,'0660911150','0522232323',NULL,'https://www.google.com/maps/place/Groupe+scolaire+seconde+maison/@33.5038117,-7.6321748,17z/data=!3m1!4b1!4m5!3m4!1s0xda62da1f0af3f47:0x5a439e43adc81572!8m2!3d33.5038072!4d-7.6299861','default.png','www.groupelasecondemaison.ma',NULL,NULL,'creche,primair,college,lycee',1,'','','2019-06-10 15:13:46','2019-06-11 10:15:39',NULL),
	(30,2,1,'Maaroufi Naima','chateauenfants@gmail.com','Au Château Des Enfants',NULL,'3,Rue Souhail Ben Addi Quartier Palmiers',51,1,'0610577296',NULL,NULL,'https://goo.gl/maps/vTiLKFWV9p6ksLx97','default.png','www.chateauenfants.com',NULL,NULL,'creche',1,'','','2019-06-10 15:13:46','2019-06-11 10:15:39',NULL),
	(31,2,1,'Jamai Bouchra','m.damoul@ecoleyassamine.com','Groupe Scolaire Yassamine',NULL,'N° 4 Bis, Rue De La Pie, Riviera Oasis C. Maarif',49,1,'0522238684',NULL,NULL,NULL,'default.png','www.ecoleyassamine.com',NULL,NULL,'creche,primair,college,lycee',1,'','','2019-06-10 15:13:46','2019-06-11 10:15:39',NULL),
	(32,2,1,'El Mabrouk ilham','alminbat.1967@gmail.com','Al Minbat',NULL,'N° 37, Avenue Mehdi Ben Barka Souissi',179,2,'0537750506',NULL,NULL,'https://goo.gl/maps/t97L2tq6rjHr87xa6','default.png','www.alminbat.ma',NULL,NULL,'creche,primair,college,lycee',1,'','','2019-06-10 15:13:46','2019-06-11 10:15:39',NULL),
	(33,2,1,'Lemrhari Habiba','gshightech@live.fr','Groupe Scolaire High - Tech',NULL,'Avenue Bani Wrayine, Rue chraga, Souissi',179,2,'0537756238',NULL,NULL,'https://goo.gl/maps/b2fnALyFkgS6mfP37','default.png','www.gshightech.com',NULL,NULL,'creche,primair,college,lycee',1,'','','2019-06-10 15:13:46','2019-06-11 10:15:39',NULL),
	(34,2,1,'Zineb Mraihy - Bouchra Foudal','email@email.com','Groupe Scolaire Al Boustane',NULL,'Hay Falah Bd Idriss Aharty N° 9',80,1,'0522726682',NULL,NULL,NULL,'default.png','www.gs.alboustane.net',NULL,NULL,'creche,primair,college,lycee',1,'','','2019-06-10 15:13:46','2019-06-11 10:15:39',NULL),
	(35,2,1,'Bazni Brahim','hanane.touri2012@gmail.com','Ajial Al Madina',NULL,'Lot Al Izdihar Hay El Houda Rue 4 Residence 53',196,8,'0522328090',NULL,NULL,'https://goo.gl/maps/YjS5at7n4BERhGVf6','default.png','http://www.ajialalmadina.com/',NULL,NULL,'creche,primair,college,lycee',1,'','','2019-06-10 15:13:46','2019-06-11 10:15:39',NULL),
	(36,2,1,'HASSANE BOUNIF','medalfatih@gmail.com','Groupe Scolaire Mohamed El Fatih',NULL,'adresse',47,1,'0522283109','0522283075',NULL,'https://goo.gl/maps/ybsC9qQTFJMHaNN2A','default.png','www.mohammedalfatih.com/',NULL,NULL,'creche,primair,college,lycee',1,'','','2019-06-10 15:13:46','2019-06-11 10:15:39',NULL),
	(37,1,1,'Majida Ksikes','contact@ecolelamrani.ac.ma','Institution Lamrani',NULL,'N° 1 Bis, Hay Massira 3 - Menara Gueliz',197,3,'0644343133',NULL,NULL,'<iframe src=\"https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d3396.4816624416276!2d-8.0662851!3d31.6480396!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0xdafebe1ea2cdaf3%3A0xe63814f5fb8fb9a6!2sInstitution+Lamrani!5e0!3m2!1sfr!2sma!4v1561717593691!5m2!1sfr!2sma\" width=\"800\" height=\"600\" frameborder=\"0\" style=\"border:0\" allowfullscreen></iframe>','1561717694.jpeg','www.ecolelamrani.ac.ma',NULL,NULL,'creche,primair,college,lycee',1,'31.648245','-8.064064','2019-06-28 10:28:15','2019-06-11 10:15:39',NULL),
	(38,2,1,'Benshaikh Safia','administration@riadalandalous.com','Riad Alandalous',NULL,'Quartier Riad Al Andalous, Bd Abderrahim Bouabid, Hay Riad',161,2,'0537570003',NULL,NULL,'https://goo.gl/maps/Zik67g7mSUa1ZAXw6','default.png','www.riadalandalous.com',NULL,NULL,'creche,primair,college,lycee',1,'','','2019-06-10 15:13:46','2019-06-11 10:15:39',NULL),
	(39,1,1,'Zineb Mraihy - Bouchra Foudal','','Groupe Scolaire Al Boustane',NULL,'3, Rue Des Gers Av. Nador Polo/El Maarif',1,1,'522726682','','','','default.png','www.gs.alboustane.net','','','',1,'','','2019-06-10 15:13:46','2019-06-11 10:15:39',NULL),
	(40,2,1,'Hassan Ridouane','hilali.targa@gmail.com','Etablissement Hilali Targa',NULL,'Lotissement Ibtissam Targua',198,3,'0524341341',NULL,NULL,'<iframe src=\"https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d13584.445958306633!2d-8.056898!3d31.6581694!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x9ba1fddbc7d61541!2sEtablissement+HILALI+Targa!5e0!3m2!1sfr!2sma!4v1559648660016!5m2!1sfr!2sma\" width=\"800\" height=\"600\" frameborder=\"0\" style=\"border:0\" allowfullscreen></iframe>','1559649032.jpeg','http://www.hilalitarga.com',NULL,NULL,'creche,primair,college,lycee',1,'','','2019-06-10 15:13:46','2019-06-11 10:15:39',NULL),
	(41,2,1,'Hervé Arnone-Demoy','hervearnone@gmail.com','Arnone Demoy',NULL,'N° 3 et 7 Rue De Roussillon - C. Maarif',47,1,'0522265033',NULL,NULL,'https://goo.gl/maps/XGQM8U7JG79vTxep8','default.png','www.arnone-demoy.ma',NULL,NULL,'creche,primair',1,'','','2019-06-10 15:13:46','2019-06-11 10:15:39',NULL),
	(42,1,1,'Nadia Benghanem','benghanemnadia@gmail.com ','Jannati',NULL,'8, Allée des peupliers, Ain Sebaa Casablanca',1,1,'522512597','','','','default.png','www.ecolejannati.com','','','',1,'','','2019-06-10 15:13:46','2019-06-11 10:15:39',NULL),
	(43,2,1,'Najat Albi - Malika Fatrane','alboustanealfassih@gamil.com','Al Boustane Alfassih',NULL,'Hay Moulay Rachid Groupe 6 Rue 39 n°32',8,1,'0522718505',NULL,NULL,'https://goo.gl/maps/NyvN3CNJaSp23k2bA','default.png','www.gs.alboustane.net',NULL,NULL,'creche,primair,college,lycee',1,'','','2019-06-10 15:13:46','2019-06-11 10:15:39',NULL),
	(44,2,1,'Boussahfa Abdelilah','alexandrejunior@gsalexandre.ma','Groupe Scolaire Alexandre 2',NULL,'N°1 Allée des mélias, Ain Sebâa - Casablanca.',2,1,'0522671650',NULL,NULL,'https://goo.gl/maps/xc5yLGLJLtbgihdJ8','default.png','www.gsalexandre.ma',NULL,NULL,'creche,primair,college,lycee',1,'','','2019-06-10 15:13:46','2019-06-11 10:15:39',NULL),
	(45,2,1,'Sidki Abdelhakim','institut.californie@gmail.com','Californie I',NULL,'Bd Panoramique Rue 2 N 4 Californie',19,1,'0522507709',NULL,NULL,'<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d26606.45491626006!2d-7.657303211427759!3d33.532406741420296!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0xda62d3baa06a56f%3A0xffe9eedb3223e40a!2sInstitut+Californie!5e0!3m2!1sfr!2sma!4v1560163554065!5m2!1sfr!2sma\" width=\"800\" height=\"600\" frameborder=\"0\" style=\"border:0\" allowfullscreen></iframe>','1559570177.jpeg','http://www.ecolescalifornie.ma/',NULL,NULL,'creche,primair,college,lycee',1,'','','2019-06-10 15:13:46','2019-06-11 10:15:39',NULL),
	(46,2,1,'Hakima Jebli','groupescolairearrihab@gmail.com','Groupe Scolaire Arrihab',NULL,'Bd.Idriss El Harti N° 24 Hay My Rachid',8,1,'0522700555',NULL,NULL,'https://goo.gl/maps/cvHNZGoSkXru3Kid9','default.png',NULL,NULL,NULL,'creche,primair,college',1,'','','2019-06-10 15:13:46','2019-06-11 10:15:39',NULL),
	(47,2,1,'Imane Lahbabi','collegelyceelarganier@gmail.com','L\'Arganier Junior',NULL,'Izdihar Extension Ep',199,3,'0524355059',NULL,NULL,'https://goo.gl/maps/QsWuBc5nisMScCwZ9','default.png','hrrp://www.lyceelarganier.com',NULL,NULL,'creche,primair,college,lycee',1,'','','2019-06-10 15:13:46','2019-06-11 10:15:39',NULL),
	(48,2,1,'Mina Hari','almanara@menara.ma','Al Manara',NULL,'N° 149- 21 Hay Zguoura - C. Ain Chok',1,1,'0522521895',NULL,NULL,'https://goo.gl/maps/6B2K9noNpVR6kY4j8','default.png',NULL,NULL,NULL,'creche,primair,college,lycee',1,'','','2019-06-10 15:13:46','2019-06-11 10:15:39',NULL),
	(49,2,1,'Younes Tantaoui El Araki','contact@elaraki.ac.ma','El Araki 2',NULL,'Riad Nakhil, Route De Casa',200,3,'0524305550',NULL,NULL,'https://goo.gl/maps/GqX7THqv3XmiZmKb7','default.png','http://www.elaraki.ac.ma',NULL,NULL,'creche,primair,college,lycee',1,'','','2019-06-10 15:13:46','2019-06-11 10:15:39',NULL),
	(50,2,1,'Youness Jarek','alanbar.g.s.p@gmail.com','Groupe Scolaire El Anbar',NULL,'Hay Al Qods, Groupe Zenata 2, N° 352,353,354',5,1,'0522768406',NULL,NULL,'https://goo.gl/maps/D4VhdieC4khAZDFW7','default.png','www.anbar.ma',NULL,NULL,'creche,primair,college,lycee',1,'','','2019-06-10 15:13:46','2019-06-11 10:15:39',NULL),
	(51,2,1,'Seffar Abderrafie','gsgrandmaghreb@gmail.com','Al Maghreb Al Kabir',NULL,'163 Bd Maati Bouabid Cite Adila',47,1,'0522629955','0522636585',NULL,NULL,'default.png','http://www.gsgrandmaghreb.com',NULL,NULL,'creche,primair,college,lycee',1,'','','2019-06-10 15:13:46','2019-06-11 10:15:39',NULL),
	(52,2,1,'Hamza El Amine','ecole@elamine.net','Annexe Ecole El Amine',NULL,'Hay Errahma, Rue 12, N° 12 - Moulay Rachid',8,1,'0522719931',NULL,NULL,'https://goo.gl/maps/4jJq46wsyf1TngB97','default.png','http://www.elamine.net',NULL,NULL,'college,lycee',1,'','','2019-06-10 15:13:46','2019-06-11 10:15:39',NULL),
	(53,2,1,'Benfellah Ahmed','maisonanfa@ecam-maroc.org','Ecole Maison D\'Anfa',NULL,'17, Zenket Ain Harrouda Quartier Racine',3,1,'0522396348',NULL,NULL,'https://goo.gl/maps/M8u3YseWyU3Z8kR77','default.png','http://www.maisondanfa.org',NULL,NULL,'creche,primair',1,'','','2019-06-10 15:13:46','2019-06-11 10:15:39',NULL),
	(54,2,1,'Lahihi Fatima','emaaail@emaill.com','Etablissement Prix Nobel',NULL,'benmsik',4,1,'0522562158',NULL,NULL,'https://goo.gl/maps/qymchUpQY2n5mZjPA','default.png','http://www.ecolesprixnobel.com',NULL,NULL,'creche,primair',1,'','','2019-06-10 15:13:46','2019-06-11 10:15:39',NULL),
	(55,2,1,'Benazouz Soumaya','chemselmaarifa@yahoo.fr','Chems El Maarifa',NULL,'N° 5, Rue Ziyaida, Aviation -',180,2,'0537754031',NULL,NULL,'https://goo.gl/maps/CoNJSTEAhEe3DVnZ8','default.png',NULL,NULL,NULL,'creche,primair,college,lycee',1,'','','2019-06-10 15:13:46','2019-06-11 10:15:39',NULL),
	(56,1,1,'Nawal Hefiri','gsr@gsr.ac.ma','Lycée Groupe Scolaire La Résidence',NULL,'N° 89, Boulevard 2 Mars sultan',9,1,'0522809050',NULL,NULL,'https://goo.gl/maps/fVuroid6ZkvbRWHBA','default.png','http://www.gsr.ac.ma',NULL,NULL,'creche,primair,college,lycee',1,'','','2019-06-10 15:13:46','2019-06-11 10:15:39',NULL),
	(57,2,1,'Salhi Feth Allah','groupescolairescientifique@gmail.com','Groupe Scolaire Scientifique',NULL,'Lot 45e Taybia Route mehdia',201,9,'0537360662','0537360662',NULL,'https://goo.gl/maps/rmj4AEpz2SQDwiyo8','default.png','http://www.gssk.ma',NULL,NULL,'creche,primair,college,lycee',1,'','','2019-06-10 15:13:46','2019-06-11 10:15:39',NULL),
	(58,2,1,'Fatima Latifi','groupescolaireriad@gmail.com','Groupe Scolaire Riad',NULL,'Bd. Tarik Bnou Ziad, Hay riad el andlous ain chok',1,1,'0522217649',NULL,NULL,'https://goo.gl/maps/89GZFbrbKKdCLKwV8','1559570218.png','http://www.ecolesriad.com',NULL,NULL,'creche,primair,college,lycee',1,'','','2019-06-10 15:13:46','2019-06-11 10:15:39',NULL),
	(61,2,1,'Imane Lahbabi','collegelyceelarganier@gmail.com','L\'Arganier Junior',NULL,'Izdihar Extension Ep',201,3,'524355059',NULL,NULL,'https://goo.gl/maps/U4pmXjm9jdc7Ji8n8','default.png','www.lyceelarganier.com','','','college,lycee',1,'','','2019-06-10 15:13:46','2019-06-11 10:15:39',NULL),
	(62,1,1,'Benfellah Ahmed','anfa@ecam-maroc.org','Ecole Maison D\'Anfa',NULL,'17, Zenket Ain Harrouda Quartier Racine',1,1,'522396348',' 05.22.94.69.50','','','default.png',' www.maisondanfa.org','','','',1,'','','2019-06-10 15:13:46','2019-06-11 10:15:39',NULL),
	(63,2,1,'Benabdallah Meriem','institution2palmiers@gmail.com','Institution Les Deux Palmiers',NULL,'Lotissement les palmiers, rue N°58',201,3,'0524490028','0524490021',NULL,'https://goo.gl/maps/Ho7gfLN79hskfzX36','default.png','http://www.lesdeuxpalmiers.com',NULL,NULL,'creche,primair',1,'','','2019-06-10 15:13:46','2019-06-11 10:15:39',NULL),
	(64,2,1,'fellah mohamed','contact@valdanfa.com','Val Anfa1',NULL,'Angle Av. Driss Slaoui Et Rue Ibn Hamdiss',1,1,'0522393032','0522393032',NULL,'<iframe src=\"https://www.google.com/maps/embed?pb=\" width=\"600\" height=\"450\" frameborder=\"0\" style=\"border:0\" allowfullscreen></iframe>','default.png','http://www.valdanfa.com',NULL,NULL,'creche,primair,college,lycee',1,'','','2019-06-10 15:13:46','2019-06-11 10:15:39',NULL),
	(65,2,1,'Saidi Zoubida','contact@wahy-alqalam.ma','Wahy Alqalam',NULL,'Villa N°1 Avenue EL Menzeh, Yacoub AL Mansour',181,2,'0537280666',NULL,NULL,'https://goo.gl/maps/DTHB9gqfATkd73bz6','default.png','http://www.wahy-al-qalam-leader.ma/',NULL,NULL,'creche,primair',1,'','','2019-06-10 15:13:46','2019-06-11 10:15:39',NULL),
	(66,2,1,'Lamlyah Fouzia','info@carrejunior.com','Carré Junior',NULL,'Angle Rostand et Gardanne Oasis',49,1,'0522983112','0522983097',NULL,'https://goo.gl/maps/BGe25A5VeyYMKhKQA','default.png','http://www.carrejunior.com',NULL,NULL,'creche',1,'','','2019-06-10 15:13:46','2019-06-11 10:15:39',NULL),
	(67,1,1,'younes Tantaoui El Araki','contact@elaraki.ac.ma','El Araki 2',NULL,'Riad Nakhil, Route De Casa ',1,3,'524305550','05.24.30.55.44','','','default.png','www.elaraki.ac.ma','','','',1,'','','2019-06-10 15:13:46','2019-06-11 10:15:39',NULL),
	(68,2,1,'Maroubi Abdallah','nfo@ecoleyassamine.ma','Groupe Scolaire Yassamine',NULL,'n  4 Bis, Impasse De La Rue De La Pie, Oasis - C. Maarif',49,1,'0522256357','0522257034',NULL,'https://goo.gl/maps/rCeR1JDwt73LFEKz6','default.png','http://www.ecolesyassamine.com/',NULL,NULL,'creche,primair,college,lycee',1,'','','2019-06-10 15:13:46','2019-06-11 10:15:39',NULL),
	(69,2,1,'Belaasri Nadia','mandelaschoolcasa@gmail.com','Mandela',NULL,'60, rue Capitaine Thériat , Bd Ibn Tachfine – Ain borja',10,1,'0522602206',NULL,NULL,'https://goo.gl/maps/yJyoX7LEhi3fD1ti6','default.png','http://www.mandelaschool.ma',NULL,NULL,'creche,primair',1,'','','2019-06-10 15:13:46','2019-06-11 10:15:39',NULL),
	(70,2,1,'Bahaddou Khalid','pedagokids@gmail.com','Pedago',NULL,'Boulevard El Qods Lotissement lhamra Ain chock',1,1,'0522875458',NULL,NULL,NULL,'default.png',NULL,NULL,NULL,'creche,primair',1,'','','2019-06-10 15:13:46','2019-06-11 10:15:39',NULL),
	(71,2,1,'Benslama Sanae','contact.aisebaa@henrimatisse.ma','Henri Matisse',NULL,'Bd. Imam Ali Ain Sebaa',2,1,'0522355454','0522355470',NULL,'https://goo.gl/maps/GGRu7q17rEapMPjh8','default.png','http://www.gshenrimatisse.com',NULL,NULL,'creche,primair,college,lycee',1,'','','2019-06-10 15:13:46','2019-06-11 10:15:39',NULL),
	(72,2,1,'Belkoudi Hasna','ecole.lapensee@gmail.com','La Pensée',NULL,'Villa Sacem N° 20 - Sidi Maarouf - Ain Chok',1,1,'0522321292','0522580232',NULL,'https://goo.gl/maps/3GbNRY269nnyDKXc6','default.png','http://www.ecolelapensee.ma',NULL,NULL,'creche,primair',1,'','','2019-06-10 15:13:46','2019-06-11 10:15:39',NULL),
	(73,2,1,'Labibe Moubarak','ecolelasaadia@hotmail.com','Assaâdia',NULL,'Hay Assaâdia -Gueliz (Aarab Sebbah Gheris)',197,3,'0544446824','0524446127',NULL,'https://goo.gl/maps/nPshEEENqsb5fVX76','default.png','http://www.lasaadia.org',NULL,NULL,'creche,primair',1,'','','2019-06-10 15:13:46','2019-06-11 10:15:39',NULL),
	(74,2,1,'Rachid Haddaj','email1@email.com','Les Palmiers',NULL,'N° 76, Rue Abdelhamid Ben Badis Ain Sebaa',1,1,'0522343757','0522663079',NULL,'https://goo.gl/maps/xkEuKbDSzopqofnt9','default.png','http://www.institutscolairelespalmiers.com',NULL,NULL,'creche,primair,college,lycee',1,'','','2019-06-10 15:13:46','2019-06-11 10:15:39',NULL),
	(75,2,1,'Daoudi Imane','fccdirection89@gmail.com','Fes City School',NULL,'Lot Park,N°45 Champs De Course',201,5,'0535932486','0535932486',NULL,'https://goo.gl/maps/HB1PpN837UenE5pbA','default.png','http://ecole.fescityschool.com/',NULL,NULL,'creche,primair',1,'','','2019-06-10 15:13:46','2019-06-11 10:15:39',NULL),
	(76,2,1,'Lahihi Fatima','etsprixnobel@gmail.com','Groupe Scolaire Copernic',NULL,'Lot Tissir Quartier Mohamed Belhassan Elouazzani Rue 68',201,10,'0522562158','0522564697',NULL,'https://goo.gl/maps/vNo687yGwe1D4qZq9','default.png','http://www.ecolesprixnobel.com/',NULL,NULL,'creche,primair,college',1,'','','2019-06-10 15:13:46','2019-06-11 10:15:39',NULL),
	(77,2,1,'Mr Bahhar','email2@email.com','Groupe Scolaire Ponts De L\'Avenir',NULL,'Voie HH 4 Hay Allaimoum (Près de hay assalam)',50,1,'0522893545','0522893580',NULL,'https://goo.gl/maps/vFm5V1LFBqRqo5wE9','default.png','http://www.pontsdelavenir.ma',NULL,NULL,'creche,primair,college,lycee',1,'','','2019-06-10 15:13:46','2019-06-11 10:15:39',NULL),
	(78,2,1,'Bouhima Abderrahman','groupescolairezola@hotmail.fr','Groupe Scolaire Zola 4',NULL,'Lotissement Massmoudi Targa N°121',198,3,'0524494949',NULL,NULL,'https://goo.gl/maps/1RCmrXBYbnsRTnSWA','default.png','http://www.gszola.com',NULL,NULL,'creche,primair,college,lycee',1,'','','2019-06-10 15:13:46','2019-06-11 10:15:39',NULL),
	(79,2,1,'Imane Khadija','contatc@gsoumlil.com','Groupe Scolaire Oumlil',NULL,'Lotissement Oumlil 143 H.H 10 Hay Hassani',7,1,'0522913182','0522913179',NULL,NULL,'default.png','http://www.gsoumlil.com',NULL,NULL,'creche,primair',1,'','','2019-06-10 15:13:46','2019-06-11 10:15:39',NULL),
	(80,2,1,'Anasse Mikou','gsa@iihem.ac.ma','Groupe Scolaire Atlas',NULL,'Avenue Mohamed VI, Km 4.2, (Route des Zaërs) Souissi (Aarab Sebbah Gheris)',179,2,'0537638798','0537659770',NULL,'https://goo.gl/maps/67CthTAwqYZoxYeN6','default.png','http://www.gsatlas.ma',NULL,NULL,'creche,primair,college,lycee',1,'','','2019-06-10 15:13:46','2019-06-11 10:15:39',NULL),
	(81,2,1,'Souad Boutaleb','ecolesanounou@gmail.com','Ecoles Sanounou 2',NULL,'N° 25, Lot. Essalama, Sidi Maarouf',62,1,'0522974845','à522321460',NULL,'https://goo.gl/maps/aYxnjcSnWw6XQ4GV7','default.png','http://www.ecolesanounou.com/',NULL,NULL,'creche,primair,college',1,'','','2019-06-10 15:13:46','2019-06-11 10:15:39',NULL),
	(82,1,1,'Hamza El Amine','ecole@elamine.net','Annexe Ecole El Amine',NULL,'Hay Errahma, Rue 12, N° 12 - Moulay Rachid',1,1,'522719931','','','','default.png',' www.elamine.net','','','',1,'','','2019-06-10 15:13:46','2019-06-11 10:15:39',NULL),
	(83,2,1,'Zouhair Mohcine','academiefrancisvalery@gmail.com','Francis Valéry',NULL,'Avenue C (Zone Industr.Est)- Aïn Sebaa, Hay Karam',2,1,'0522660022',NULL,NULL,'https://goo.gl/maps/PqaEXYWaVJRgijF56','default.png','http://www.academiefrancisvalery.ma/',NULL,NULL,'creche,primair,college,lycee',1,'','','2019-06-10 15:13:46','2019-06-11 10:15:39',NULL),
	(84,2,1,'Guessouss Ahmed','jeanne.darc@menara.ma','Jeanne D\'Arc',NULL,'N°57, Boulevard My Youssef C.Sidi Balyout',61,1,'0522220170','0522220170',NULL,'https://goo.gl/maps/xCuS19p6Ekfj7U7A8','default.png','http://www.groupejeannedarc.com/',NULL,NULL,'creche,primair,college,lycee',1,'','','2019-06-10 15:13:46','2019-06-11 10:15:39',NULL),
	(85,2,1,'Nabiha Magzari','abc.ecole@hotmail.com','Abc',NULL,'Residence Majorelle, Route Tadert, Ouled Taleb - Ain Chok',1,1,'0522873628','0522873629',NULL,'https://goo.gl/maps/kS17ivoNZ52QtLf97','default.png',NULL,NULL,NULL,'creche',1,'','','2019-06-10 15:13:46','2019-06-11 10:15:39',NULL),
	(86,2,1,'Mme Nadia','info@ecolelesparents.ma','Groupe Scolaire Les Parents',NULL,'N° I 49 – I 50 Rue 13 Opération Lissasfa CP 20200',50,1,'0522891080','0522891076',NULL,'https://goo.gl/maps/kfeqC8u2zdqpMaZi7','default.png','http://www.ecolelesparents.ma',NULL,NULL,'creche,primair',1,'','','2019-06-10 15:13:46','2019-06-11 10:15:39',NULL),
	(87,2,1,'MAASSOUL','info@ecolelatoureiffel.ma','Groupe Scolaire Tour Eiffel',NULL,'Lot.Al Hadika, Im.Chellah, Hay Al Walaa Sidi Moumen',63,1,'0522705858','0522708899',NULL,'https://goo.gl/maps/dMFMGWu6DyVicr3b6','default.png','www.ecolelatoureiffel.ma',NULL,NULL,'creche,primair',1,'','','2019-06-10 15:13:46','2019-06-11 10:15:39',NULL),
	(88,2,1,'Abdeslem Ben Chekri','ecole.elfath1@gmail.com','El Fath',NULL,'Rue Ibn Haoukal, Avenue Hassan II - Agdal Riyad',94,2,'0537733742','0537769158',NULL,'https://goo.gl/maps/hBGwQZBqCZsuhGce7','default.png','http://www.elfath.ac.ma',NULL,NULL,'creche,primair',1,'','','2019-06-10 15:13:46','2019-06-11 10:15:39',NULL),
	(89,2,1,'Abdelali Tantaoui El Araki','contact@elaraki.ac.ma','El Araki Issil',NULL,'Lot N° 1 Issil Riad Ennakhil, Route de Casablanca',201,3,'0524306917','0524311391',NULL,'https://goo.gl/maps/HuXXyijh5UUZ4yfB7','default.png','http://www.elaraki.ac.ma',NULL,NULL,'creche,primair,college,lycee',1,'','','2019-06-10 15:13:46','2019-06-11 10:15:39',NULL),
	(90,2,1,'Fouzia BERRADA','contact@ecoleriviera.com','Groupe Scolaire Riviera',NULL,'36, Rue Clément Marot, Quartier Riviera - C. Maarif',47,1,'0522256556','0522986022',NULL,'https://goo.gl/maps/zYqDCjsd1oMgrM2S7','default.png','www.ecoleriviera.com',NULL,NULL,'creche,primair,college,lycee',1,'','','2019-06-10 15:13:46','2019-06-11 10:15:39',NULL),
	(91,2,1,'Nayma El Firdoussi','ecolealomam2@hotmail.fr','Institution Massar Alomam',NULL,'Lot 3 Doha Furom Massira 1 Route D\'Essaouira',201,3,'0524342163','0524395557',NULL,'https://goo.gl/maps/m26qQiVtt8p7vRYX9','default.png','http://www.institutionalomam.com/',NULL,NULL,'creche,primair,college,lycee',1,'','','2019-06-10 15:13:46','2019-06-11 10:15:39',NULL),
	(92,1,1,' Belhaj Soulami Rajae','contact@valdanfa.com','Val D\'Anfa 2',NULL,'Avenue Ibnou Hamdis, Angle Rue N° 3 - C. Anfa',1,1,'522950881','05.22.95.08.79','','','default.png',' www.valdanfa.com','','','',1,'','','2019-06-10 15:13:46','2019-06-11 10:15:39',NULL),
	(93,2,1,'Sajid Milouda','contact@gslb.ma','Louis Bertrand Junior',NULL,'3, Rue Jabal Tadghine, Hay Essalam.',47,1,'0522996996',NULL,NULL,'https://goo.gl/maps/p9TCsJ6vNtKSkLkV6','default.png',NULL,NULL,NULL,'creche,primair,college,lycee',1,'','','2019-06-10 15:13:46','2019-06-11 10:15:39',NULL),
	(94,2,1,'Ilham Chami','contact@ecolefontaine.com','La Fontaine (Groupe Scolaire Subrini)',NULL,'N 12. Rue Ibnou Khillikane , Palmiers',7,1,'0522258056',NULL,NULL,'https://goo.gl/maps/nfaDcNWRVh76EcuH7','default.png','http://www.ecolefontaine.com',NULL,NULL,'creche',1,'','','2019-06-10 15:13:46','2019-06-11 10:15:39',NULL),
	(95,2,1,'Nadia Jabri','institutjabri@gmail.com','Institution Jabri',NULL,'N° 5, Rue D Arménie, Quartier Des Hopitaux - C. Maarif',47,1,'0522862828','0522860166',NULL,'https://goo.gl/maps/kLRSHDWRzoHSLP9YA','default.png','http://www.institutionjabri.ma',NULL,NULL,'creche,primair,college,lycee',1,'','','2019-06-10 15:13:46','2019-06-11 10:15:39',NULL),
	(96,2,1,'anonyme','email3@email.com','Boustane Al Malaika',NULL,'Av. Ahmed Zafzaf Secteur 1 Lot 3 Tacharouk Sidi Moumen',63,1,'0522707018',NULL,NULL,'https://goo.gl/maps/jERmusePBqdGHEEE8','default.png',NULL,NULL,NULL,'creche,primair,college,lycee',1,'','','2019-06-10 15:13:46','2019-06-11 10:15:39',NULL),
	(97,2,1,'Olivier Subrini','contact@subrini.ma','Subrini Oulfa',NULL,'N° 213, Bd. Abou Regreg Hay El Oulfa',50,1,'0522914994','0522892404',NULL,'https://goo.gl/maps/fGxKhrMTpboAirFs8','default.png','http://www.subrini.ma',NULL,NULL,'creche,primair,college,lycee',1,'','','2019-06-10 15:13:46','2019-06-11 10:15:39',NULL),
	(98,2,1,'Fouad Lyoubi','khalilgibran1986@gmail.com','Jabrane Khalil Jabrane',NULL,'Bir Kacem - Souissi',179,2,'0537759659','0537752948',NULL,'https://goo.gl/maps/r2yHfJJA6P4eGXwj9','default.png','http://www.khalilgibranschool.net',NULL,NULL,'creche,primair,college,lycee',1,'','','2019-06-10 15:13:46','2019-06-11 10:15:39',NULL),
	(99,2,1,'Khadija Mekkaoui Ouahi','contact@gsromandie.ma','Groupe Scolaire Romandie',NULL,'N° 4, Rue Abou Hassan Assghir - C. Maarif',47,1,'0522943120','0522943119',NULL,'https://goo.gl/maps/zSjqd4V1qegEFcXp7','default.png','http://www.gsromandie.ma',NULL,NULL,'creche,primair,college,lycee',1,'','','2019-06-10 15:13:46','2019-06-11 10:15:39',NULL),
	(100,2,1,'Achab Abderrahim','ghallabcite@gmail.com','La Cité',NULL,'Angle Route D\'Azemour Et Rue N°1 Quartier Wakanati Ain Diab',11,1,'0522944404','0522940468',NULL,'https://goo.gl/maps/B1DWZqM1dUJ4PF5V6','default.png','http://www.ecolelacite.ma',NULL,NULL,'creche,primair',1,'','','2019-06-10 15:13:46','2019-06-11 10:15:39',NULL),
	(101,2,1,'El Maskyny Abdelhadi','email5@email.com','La Confiance',NULL,'Hay Warda, Rue 29 n°29, Q. Sidi Moumen',63,1,'0522716578','0522352946',NULL,'https://goo.gl/maps/wQzGaKmXTstYu6FS7','default.png','http://www.gs-laconfiance.com',NULL,NULL,'creche,primair,college,lycee',1,'','','2019-06-10 15:13:46','2019-06-11 10:15:39',NULL),
	(102,1,1,'Bakkali Oumama','email@email.com','Newton Privé',NULL,'Rue ibn khafaja, Anfa - Mohammedia Mohammedia',1,4,'0523316551','0523316550',NULL,NULL,'default.png','http://www.nischool.org',NULL,NULL,'1',1,'33.698120','-7.379807','2019-06-28 13:33:07','2019-06-11 10:15:39',NULL),
	(103,2,1,'Simmou Mohammed','ecolelatoureiffe@gmail.com','Ecole La Tour Effel',NULL,'Sidi Moumen Sec 3 Lot Ec 7 Hay Walaa',63,1,'0522705858','0522708899',NULL,'https://goo.gl/maps/KfiPtTpiwfjsX6eX8','default.png','http://www.ecolelatoureiffel.ma',NULL,NULL,'creche,primair',1,'','','2019-06-10 15:13:46','2019-06-11 10:15:39',NULL),
	(104,2,1,'Mohamed Saad Guennouni','contact@institut-agdal.com','Institution Agdal',NULL,'7, Rue Ahmed El Kadmiri Ex Albert Samain,Valfleuri,Maârif',47,1,'0522256698','0522256463',NULL,'https://goo.gl/maps/31aEB6u3d2XSjedX6','default.png','www.institut-agdal.ma',NULL,NULL,'creche,primair,college,lycee',1,'','','2019-06-10 15:13:46','2019-06-11 10:15:39',NULL),
	(105,1,1,'Amrouk Nadia','ecolelaperle@hotmail.fr','La Perle',NULL,'Lot Vermont N° 171 Rue 5 Polo',1,1,'522506987','05.22.87.21.29','','','default.png','','','','',1,'','','2019-06-10 15:13:46','2019-06-11 10:15:39',NULL),
	(106,2,1,'Abdelwahad Chiadmi','info@elyakada.com','Al Yakada Centre',NULL,'N° 10 Cité Lotissement Roni Tabriquet',201,11,'0537861710','0537861710',NULL,NULL,'default.png','http://www.elyakada.com',NULL,NULL,'creche,primair,college,lycee',1,'','','2019-06-10 15:13:46','2019-06-11 10:15:39',NULL),
	(107,1,1,'Khadija Mekkaoui Ouahi','contact@gsromandie.ma','Groupe Scolaire Romandie',NULL,'N° 4, Rue Abou Hassan Assghir - C. Maarif',1,1,'522943120','05.22.94.31.19','','','default.png','www.gsromandie.ma','','','',1,'','','2019-06-10 15:13:46','2019-06-11 10:15:39',NULL),
	(108,1,1,'Daoudi Imane','fccdirection89@gmail.com ','Fes City School',NULL,'Lot Park,N°45 Champs De Course',1,5,'535932486','535932486','','','default.png','http://ecole.fescityschool.com','','','',1,'','','2019-06-10 15:13:46','2019-06-11 10:15:39',NULL),
	(109,2,1,'Aicha Akouissi','ecoleouzoud@yahoo.fr','Ouzoud I',NULL,'Lot. Dar El Chaoui, N° 66, Hay El Oussra - C. Ain Chok',1,1,'0522523740','0522219384',NULL,'https://goo.gl/maps/azHdtBhHnabefcsX7','default.png','http://www.ecoleouzoud.com',NULL,NULL,'creche,primair',1,'','','2019-06-10 15:13:46','2019-06-11 10:15:39',NULL),
	(110,2,1,'Asma Abbad El Andaloussi','contact@oisillons.com','Les Oisillons',NULL,'Résidence Kawtar II, Route CT 1100 - C. Sidi Maarouf',62,1,'0522973925','0522973925',NULL,NULL,'default.png','http://www.oisillons.com',NULL,NULL,'creche,primair',1,'','','2019-06-10 15:13:46','2019-06-11 10:15:39',NULL),
	(111,2,1,'REDOUANI mohamed','institutionalqalam@gmail.com','Complexe Scolaire Al Qalam',NULL,'R.P 40, Cité Dakhla - Agadir .B.P 8201',201,7,'0528234323','0528234324',NULL,'https://goo.gl/maps/DKBV5G5eJw21sBaa6','default.png','http://www.alqalam.ma',NULL,NULL,'creche,primair',1,'','','2019-06-10 15:13:46','2019-06-11 10:15:39',NULL),
	(112,2,1,'Raja Ben Chamia','raja244@hotmail.fr','Ajial Ennakhil',NULL,'M\'hamid 8 N°33',201,3,'0616424139','0524394257',NULL,'https://goo.gl/maps/5rRPfxPTq12zvMEr7','default.png',NULL,NULL,NULL,'creche,primair',1,'','','2019-06-10 15:13:46','2019-06-11 10:15:39',NULL),
	(113,2,1,'Sahid Abderrahim','ecole.noha@gmail.com','Noha',NULL,'Residences Noha Route Socoma Mhamid',202,3,'0524371537','0524371537',NULL,'https://goo.gl/maps/q1s6YkrD8p61JWiQ8','default.png','http://www.institutnoha.com',NULL,NULL,'creche,primair,college',1,'','','2019-06-10 15:13:46','2019-06-11 10:15:39',NULL),
	(114,2,1,'Naima Jamia','contact@montessoricasablanca.com','Montessori',NULL,'6, Lot. Hanane. Bd Panoramique. Califonie',19,1,'0522219668',NULL,NULL,'https://goo.gl/maps/P4RixicqMbSVA7da6','default.png',NULL,NULL,NULL,'creche,primair,college',1,'','','2019-06-10 15:13:46','2019-06-11 10:15:39',NULL),
	(115,2,1,'Ahidi Mohamed','ecolechama@gmail.com','Chama',NULL,'Tamensourt Tranche 2',201,3,'0524013022',NULL,NULL,'https://goo.gl/maps/yoyF7Y24m21YxPkj6','default.png',NULL,NULL,NULL,'creche,primair,college',1,'','','2019-06-10 15:13:46','2019-06-11 10:15:39',NULL),
	(116,2,1,'Saadia Manssouri','charlesfoucauld@ecam-maroc.org','Ecole Charles De Foucaud',NULL,'N° 115, Boulevard My Idriss 1 Er - C. Maarif',47,1,'0522860122','0522863524',NULL,'https://goo.gl/maps/pAFDyUwvbDA5wsZ99','default.png','http://www.foucauld-casa.org',NULL,NULL,'creche,primair,college',1,'','','2019-06-10 15:13:46','2019-06-11 10:15:39',NULL),
	(117,2,1,'El Kihal Rabia','gsalhidaya@yahoo.fr','Al Hidaya',NULL,'Bd de Meknès, Rue 30 Lotiss. Safa Inara, Q. Aïn Chok',1,1,'0522215858',NULL,NULL,'https://goo.gl/maps/4S9MoEM81D2f1Yus5','default.png','http://www.gsalhidaya.com',NULL,NULL,'creche,primair,college,lycee',1,'','','2019-06-10 15:13:46','2019-06-11 10:15:39',NULL),
	(118,2,1,'Ben Hayoun Abdelhakim','gsangebleu@gmail.com','Ecole Ange Bleu',NULL,'Ben Hayoun Abdelhakim',201,12,'0523352817','0523350537',NULL,'https://goo.gl/maps/SfUZ3hNEncxaF5Lv6','default.png','http://www.gsangebleu.com/index.php',NULL,NULL,'primair,college,lycee',1,'','','2019-06-10 15:13:46','2019-06-11 10:15:39',NULL),
	(119,2,1,'Hassan Goumghar','aljil.aljadid12@gmail.com','Institution Privee Aljil Aljadid',NULL,'N° 53/54 Quartier Bizounkad Afrag',201,13,'0528865757','0528865757',NULL,'https://goo.gl/maps/3i1vLX9xf1Z75Xza8','default.png','http://www.aljilaljadid.sitew.com',NULL,NULL,'creche,primair',1,'','','2019-06-10 15:13:46','2019-06-11 10:15:39',NULL),
	(120,2,1,'Ghizlane Laktami','olmprimaire@yahoo.fr','Groupe Scolaire Olm',NULL,'291, Avenue Mohamed VI',201,2,'0537651566','0537651383',NULL,'https://goo.gl/maps/QatvMEMq6BLn1wyf8','default.png','http://www.gsolm.ma',NULL,NULL,'creche,primair',1,'','','2019-06-10 15:13:46','2019-06-11 10:15:39',NULL),
	(121,2,1,'Mme Loubna','contact@lazurjunior.com','Lazur Junior',NULL,'N° 12, Rue La Vezere, Polo - C. Maarif',47,1,'0661313708','0522282929',NULL,'https://goo.gl/maps/D9tBdhQhdNak6kxB6','default.png','http://www.lazurjunior.com',NULL,NULL,'creche,primair',1,'','','2019-06-10 15:13:46','2019-06-11 10:15:39',NULL),
	(122,2,1,'Mohamed Fadli','farahinfopriv@yahoo.fr','Lycée Al Farah',NULL,'Amal 2, Rue 68, N° 3- Al Idrissia',72,1,'0522283699','0522283709',NULL,'https://goo.gl/maps/V7X5sAUoPk3Uuwwz5','default.png','http://www.lyceeelfarah.com',NULL,NULL,'college,lycee',1,'','','2019-06-10 15:13:46','2019-06-11 10:15:39',NULL),
	(123,2,1,'ABBAD ANDALOUSSI rachida','gshamiltonfes','Hamilton',NULL,'Lot Ader N15 Route Ain Chkef',203,5,'0668357936','0535611830',NULL,'https://goo.gl/maps/NKcdwxee9bq9MagN7','default.png',NULL,NULL,NULL,'college,lycee',1,'','','2019-06-10 15:13:46','2019-06-11 10:15:39',NULL),
	(124,2,1,'Filali Ansari Said','filali55@hotmail.com','Escalade 2',NULL,'22 Krimat 2 Bd Dakhla',1,1,'0522216247',NULL,NULL,'https://goo.gl/maps/3MnkNk2a7iGXSq7o7','default.png','http://www.escaladeschool.ma',NULL,NULL,'creche,primair,college,lycee',1,'','','2019-06-10 15:13:46','2019-06-11 10:15:39',NULL),
	(125,2,1,'Salimi Kamal','alhanane@menara.ma','Al Hanane 1',NULL,'Hay Anouar Souss Agadir',201,7,'0528226700','0528221106',NULL,'https://goo.gl/maps/FxuYsMhVkcBdgjZ59','default.png','http://alhanane1.com/',NULL,NULL,'creche,primair',1,'','','2019-06-10 15:13:46','2019-06-11 10:15:39',NULL),
	(126,2,1,'Amagdoul Noura','groupescolaireariha@gmail.com','Ariha',NULL,'86, Quartier Sakar, Cité Mohammadia - Daoudiat',204,3,'05024292922','00524330568',NULL,'https://goo.gl/maps/h8j7Tbto3AkwgUMc8','default.png',NULL,NULL,NULL,'college,lycee',1,'','','2019-06-10 15:13:46','2019-06-11 10:15:39',NULL),
	(127,2,1,'Elkouche Mohammed','toubkal.tanger@gmail.com','Toubkal Tanger',NULL,'Z.I Guezenaya Lot .1124. Tanger',1,6,'0539393818',NULL,NULL,'https://goo.gl/maps/YwmE7NQJmg1a2p7MA','default.png','http://toubkaltanger.com',NULL,NULL,'creche,primair',1,'','','2019-06-10 15:13:46','2019-06-11 10:15:39',NULL),
	(128,2,1,'Samouh Amal','contact@almilad.com','Almilad',NULL,'113-115 Hay Douma Groupe 5 Rue 8 Sidi Moumen',63,1,'0522703350','0522700547',NULL,'https://goo.gl/maps/eDtzkx3rCnJ2ve7Z6','default.png','http://www.almilad.net',NULL,NULL,'creche,primair,college',1,'','','2019-06-10 15:13:46','2019-06-11 10:15:39',NULL),
	(129,2,1,'MEZOUGHI Fatima Ezzahra','direction@gmail.com','Groupe Scolaire La Relance',NULL,'Lot Alfadila 99 Rte Ain Chkaf',203,5,'0535967878',NULL,NULL,'https://goo.gl/maps/AzhCq4h93pmjRTPx7','default.png','http://gslarelance.com/',NULL,NULL,'creche,primair',1,'','','2019-06-10 15:13:46','2019-06-11 10:15:39',NULL),
	(130,2,1,'Bouabid Jelam','contact@etablissementelirfane.com','El Irfane',NULL,'Rouidate 1, Saida 7 - Gueliz',197,3,'0524314480','0524314371',NULL,'https://goo.gl/maps/fSHkStgnGhnCQAQi7','default.png','http://www.etablissementelirfane.com',NULL,NULL,'creche,primair,college,lycee',1,'','','2019-06-10 15:13:46','2019-06-11 10:15:39',NULL),
	(131,2,1,'Ech-Chaitami Rachida','ioui2school@gmail.com','Ioui 2',NULL,'311, Lotissement Riad De Palais Sud Azli',201,3,'0524343486','0524343486',NULL,'https://goo.gl/maps/zJ5fpn74mejQeoMt9','default.png','www.ioui2.com',NULL,NULL,'creche,primair,college',1,'','','2019-06-10 15:13:46','2019-06-11 10:15:39',NULL),
	(132,1,1,'Hassan Goumghar','aljil.aljadid12@gmail.com','Institution Privee Aljil Aljadid',NULL,'N° 53/54 Quartier Bizounkad Afrag',1,13,'528865757','528865757','','','default.png','http://www.aljilaljadid.sitew.com','','','',1,'','','2019-06-10 15:13:46','2019-06-11 10:15:39',NULL),
	(133,1,1,'Mohamed Fadli','farahinfopriv@yahoo.fr','Lycée Al Farah',NULL,'Amal 2, Rue 68, N° 3- Al Idrissia',1,1,'522283699','05.22.28.37.09','','','default.png','www.lyceeelfarah.com','','','',1,'','','2019-06-10 15:13:46','2019-06-11 10:15:39',NULL),
	(134,1,1,'Filali Ansari Said','filali55@hotmail.com','Escalade 2',NULL,'22 Krimat 2 Bd Dakhla',1,1,'522216247','','','','default.png','','','','',1,'','','2019-06-10 15:13:46','2019-06-11 10:15:39',NULL),
	(135,2,1,'MBrotala Yassir','ecole.alyawm.info@gmail.com','Ecole Al Yawm',NULL,'LOT. ALKHOLF RUE 36 N°1 SIDI MAÂROUF',1,1,'0661869867','0522975107',NULL,'https://goo.gl/maps/YkdmjAEE7M9MXcEb7','default.png',NULL,NULL,NULL,'creche,primair',1,'','','2019-06-10 15:13:46','2019-06-11 10:15:39',NULL),
	(136,2,1,'Abdelhafid El Aakil','ecoleassafir@gmail.com','Ambassadeur',NULL,'Lotissement Hassan Bd. Tah, N° 571-573 - Ain Chok',1,1,'0522219414','0522219414',NULL,'https://goo.gl/maps/z5CMyf9yXi5v7sGx6','default.png','http://www.ecolelambassadeur.com',NULL,NULL,'creche,primair,college,lycee',1,'','','2019-06-10 15:13:46','2019-06-11 10:15:39',NULL),
	(137,2,1,'Allou Mohammed','si.allou@gmail.com','Jean De La Fontaine',NULL,'12, Rue Abdelwahed Merrakchi Hay Ellaymoune',201,2,'0673986673',NULL,NULL,'https://goo.gl/maps/Bi1giaG5muDvrzyCA','default.png',NULL,NULL,NULL,'creche,primair',1,'','','2019-06-10 15:13:46','2019-06-11 10:15:39',NULL),
	(138,1,1,'Hassan Goumghar','aljil.aljadid12@gmail.com','Institution Privee Aljil Aljadid',NULL,'N° 53/54 Quartier Bizounkad Afrag',1,13,'528865757','528865757','','','default.png','http://www.aljilaljadid.sitew.com','','','',1,'','','2019-06-10 15:13:46','2019-06-11 10:15:39',NULL),
	(139,2,1,'Aicha Idaoujaa','gsjassanip@gmail.com','Etablissement Jassani',NULL,'N° 6, Rue Ait Atta, Hay Hassani - Inezgane',201,14,'0528335260','0528333133',NULL,'https://goo.gl/maps/R3snHMC5d8JzT6Ar6','default.png',NULL,NULL,NULL,'creche,primair,college,lycee',1,'','','2019-06-10 15:13:46','2019-06-11 10:15:39',NULL),
	(140,2,1,'Bouchareb Khadija','administration@leonafricain.ma','Leon L\'Africain',NULL,'N°416,Bd Val d\'anfa Bourgogne',18,1,'0522396513','0522398662',NULL,'https://goo.gl/maps/t1tHqHcJfbbBw3ZG7','default.png','http://www.leonafricain.ma',NULL,NULL,'college,lycee',1,'','','2019-06-10 15:13:46','2019-06-11 10:15:39',NULL),
	(141,2,1,'Nawal Hefiri','gsr@gsr.ac.ma','Groupe Scolaire La Résidence 4',NULL,'3, rue El Barii Dabbas - ex Grurie , Q. Mers Sultan',48,1,'0522451549',NULL,NULL,'https://goo.gl/maps/815SUPn8fCzZLBef7','default.png',NULL,NULL,NULL,'primair',1,'','','2019-06-10 15:13:46','2019-06-11 10:15:39',NULL),
	(142,2,1,'Hind Elkharoubi','Institutmajorelle@gmail.com','Majorelle 2',NULL,'Almassira 2 Hay Moulay Rachid',8,1,'0522717843','0522712260',NULL,'https://goo.gl/maps/ZWqxXFJ3W5zm6cgh6','default.png',NULL,NULL,NULL,'creche,primair',1,'','','2019-06-10 15:13:46','2019-06-11 10:15:39',NULL),
	(143,2,1,'HASSANI IDRISSI Kawthar','contact@ida-gf.ma','Institut De L Agdal',NULL,'N° 27, Rue Soumaya - Agdal',94,2,'0537671119','0537671119',NULL,'https://goo.gl/maps/NA8FGpgBoqynZYcb6','default.png','http://www.ida-gf.ma',NULL,NULL,'lycee',1,'','','2019-06-10 15:13:46','2019-06-11 10:15:39',NULL),
	(144,2,1,'Jiaf Brahim','lyceesouissi@gmail.com','Lycée Scientifique Souissi',NULL,'11, Avenue Mohamed Ben Hassan El Ouazzani',201,2,'0537756690','0537759712',NULL,'https://goo.gl/maps/abyRntcqMMB2ph11A','default.png','www.lyceescientifique.net',NULL,NULL,'lycee',1,'','','2019-06-10 15:13:46','2019-06-11 10:15:39',NULL),
	(145,2,1,'Mr Zaim(Primaire) et Mr Harkouch(Collège et Lycée)','ecoleslepont@gmail.com','Le Pont',NULL,'548, Bd Panoramique Californie Ain Chock',19,1,'0522525282','0522525284',NULL,'https://goo.gl/maps/9NbcZxbq4Hw8gcx78','default.png','www.ecolelepont.net',NULL,NULL,'creche,primair,college,lycee',1,'','','2019-06-10 15:13:46','2019-06-11 10:15:39',NULL),
	(146,1,1,'Ben Hayoun Abdelhakim','gsangebleu@gmail.com','Ecole Ange Bleu',NULL,'Avenue Ibn Toumerte El Jadida',1,12,'523352817','523350537','','','default.png','http://www.gsangebleu.com/index.php','','','',1,'','','2019-06-10 15:13:46','2019-06-11 10:15:39',NULL),
	(147,1,1,'Elkouche Mohammed','toubkal.tanger@gmail.com','Toubkal Tanger',NULL,'Z.I Guezenaya Lot .1124. Tanger',1,6,'539393818','539395896','','','default.png','','','','',1,'','','2019-06-10 15:13:46','2019-06-11 10:15:39',NULL),
	(148,1,1,'MEZOUGHI Fatima Ezzahra','direction@gmail.com','Groupe Scolaire La Relance',NULL,'Lot Alfadila 99 Rte Ain Chkaf',1,2,'535967878','','','','default.png','','','','',1,'','','2019-06-10 15:13:46','2019-06-11 10:15:39',NULL),
	(149,1,1,'Laaouar Mostafa','fes.etab@yahoo.fr','Groupe Scolaire Mohamed Al Fatih',NULL,'110 Lot Hajoui Doukkarat',1,5,'535651459','535651455','','','default.png','','','','',1,'','','2019-06-10 15:13:46','2019-06-11 10:15:39',NULL),
	(150,2,1,'Asmaa Alami','o.alaoui@ghita-immobilier.ma','Caramel',NULL,'N° 45, Bd Ghandi, Rue Ibn Hazem',47,1,'0522393398','0522399131',NULL,'https://goo.gl/maps/mRLr3yQXVzS143Zi8','default.png',NULL,NULL,NULL,'creche',1,'','','2019-06-10 15:13:46','2019-06-11 10:15:39',NULL),
	(151,1,1,'HASSANI IDRISSI Kawthar','contact@ida-gf.ma','Institut De L Agdal',NULL,'N° 27, Rue Soumaya - Agdal',1,2,'537671119','537671119','','','default.png','','','','',1,'','','2019-06-10 15:13:46','2019-06-11 10:15:39',NULL),
	(152,1,1,'Salimi Kamal','alhanane@menara.ma','Al Hanane 1',NULL,'Hay Anouar Souss Agadir',1,7,'528226700','528221106','','','default.png','','','','',1,'','','2019-06-10 15:13:46','2019-06-11 10:15:39',NULL),
	(153,1,1,'Abdeljalil Lebani','ecolelaperle@hotmail.fr ','La Perle',NULL,'Lotiss. Badr -ex Vermont, Rue 5 N°7, Polo, Californie',1,1,'522506987','','','','default.png','','','','',1,'','','2019-06-10 15:13:46','2019-06-11 10:15:39',NULL),
	(154,1,1,'Mohamed Fadli','farahinfopriv@yahoo.fr','Lycée Al Farah',NULL,'Amal 2, Rue 68, N° 3- Al Idrissia',1,1,'522283699','05.22.28.37.09','','','default.png','','','','',1,'','','2019-06-10 15:13:46','2019-06-11 10:15:39',NULL),
	(155,1,1,'MBrotala Yassir','ecole.alyawm.info@gmail.com','Ecole Al Yawm',NULL,'LOT. ALKHOLF RUE 36 N°1 SIDI MAÂROUF AINCHOCK CASABLANCA',1,1,'522975107','','','','default.png','','','','',1,'','','2019-06-10 15:13:46','2019-06-11 10:15:39',NULL),
	(156,2,1,'Aicha Idaoujaa','gsjassanip@gmail.com','Etablissement Jassani',NULL,'N° 6, Rue Ait Atta, Hay Hassani - Inezgane',201,14,'528335260','528333133',NULL,'https://goo.gl/maps/R3snHMC5d8JzT6Ar6','default.png',NULL,'','','creche,primair,college,lycee',1,'','','2019-06-10 15:13:46','2019-06-11 10:15:39',NULL),
	(157,2,1,'El Firdoussi Nayma','ecolealomam2@hotmail.fr','Al Omam',NULL,'Route D\'Essaouira Massira I N°2 Doha Forum',205,3,'0524342427','0524395307',NULL,'https://goo.gl/maps/6HSrpnKyHxwYCYec9','default.png',NULL,NULL,NULL,'creche,primair,college,lycee',1,'','','2019-06-10 15:13:46','2019-06-11 10:15:39',NULL),
	(158,2,1,'Nabaji Abdallah','collegelyceelarganier@gmail.com','Lycée Arganier',NULL,'Izdihar Extension Ep',1,3,'0524355059',NULL,NULL,'https://goo.gl/maps/E71F9FMo9BaM4roi9','default.png',NULL,NULL,NULL,'college,lycee',1,'','','2019-06-10 15:13:46','2019-06-11 10:15:39',NULL),
	(159,2,1,'Iferden Badreddine','badrane.ecole@gmail.com','Etablissment Badrane Prive',NULL,'Boukhalef Al Irfane Tanger',1,6,'0539940424','0539940424',NULL,'https://goo.gl/maps/4iTuxMkmmjJskqDW6','default.png',NULL,NULL,NULL,'creche,primair',1,'','','2019-06-10 15:13:46','2019-06-11 10:15:39',NULL),
	(160,2,1,'Mme Guadalupe Carmona','notredamedelapaix.rabat@gmail.com','Notre Dame De La Paix',NULL,'N° 6, Rue Aguelmane Sidi Ali - Agdal',94,2,'0537772960','0537774198',NULL,'https://goo.gl/maps/AyoCXv1tF12xNGPP7','default.png',NULL,NULL,NULL,'creche,primair',1,'','','2019-06-10 15:13:46','2019-06-11 10:15:39',NULL),
	(161,1,1,'Hind Elkharoubi','Institutmajorelle@gmail.com','Majorelle 2',NULL,'Almassira 2 Hay Moulay Rachid',1,1,'522717843','05.22.71.22.60','','','default.png','','','','',1,'','','2019-06-10 15:13:46','2019-06-11 10:15:39',NULL),
	(162,1,1,'Bouabid Jelam','contact@etablissementelirfane.com ','El Irfane',NULL,'Rouidate 1, Saida 7 - Gueliz',1,3,'524314480','05.24.31.43.71','','','default.png','','','','',1,'','','2019-06-10 15:13:46','2019-06-11 10:15:39',NULL),
	(163,2,1,'ZIYADI Mourad','jacquescartier.groupe@gmail.com','Groupe Scolaire Jacques Cartier',NULL,'19, Ain El Atti, Beni Mellal',201,15,'0691128669',NULL,NULL,'https://goo.gl/maps/J9ywAhdSqsiNpkFNA','default.png',NULL,NULL,NULL,'creche,primair',1,'','','2019-06-10 15:13:46','2019-06-11 10:15:39',NULL),
	(164,2,1,'El Farmi Fatima','taiba.eba@gmail.com','Taiba',NULL,'N° 27, Rue Nouakchout, Quartier Montfleuri Ii',1,5,'0535962180','0535962180',NULL,'https://goo.gl/maps/86uCi9hnBgNehmGt7','default.png','http://www.ecole-taiba.com',NULL,NULL,'creche,primair,college,lycee',1,'','','2019-06-10 15:13:46','2019-06-11 10:15:39',NULL),
	(165,2,1,'Abderahman Azalim','contactabdounizar@gmail.com','Groupe Scolaire Abdou Nizar',NULL,'Massira 1-A N° 74, Hay El Hassani',201,3,'0524349399','0524497918',NULL,'https://goo.gl/maps/fdLAvoZPi81T6yxy9','default.png','www.abdounizar.com',NULL,NULL,'creche,primair,college',1,'','','2019-06-10 15:13:46','2019-06-11 10:15:39',NULL),
	(166,2,1,'Hassan Zemrari','gsmariedefrance@gmail.com','Marie De France',NULL,'N° 3-4 Lotissement Zin Essalam Tit Mellil',201,16,'0522510642',NULL,NULL,NULL,'default.png',NULL,NULL,NULL,'creche,primair',1,'','','2019-06-10 15:13:46','2019-06-11 10:15:39',NULL),
	(167,2,1,'Meriji Fouzia','chagraouiqe@gmail.com','Nidal Al Oula',NULL,'N° 94 Massira 1 D',201,3,'0524346834','0524343990',NULL,'https://goo.gl/maps/cHi4DQoguD6VGfeeA','default.png','http://www.nidal.ma',NULL,NULL,'creche,primair,college',1,'','','2019-06-10 15:13:46','2019-06-11 10:15:39',NULL),
	(168,1,1,'Saida Radi','gsangebleu@gmail.com','Groupe Scolaire L\' Ange Bleu',NULL,'35 Avenue Ibn Toumert - El Jadida',1,12,'523358411','523350537','','','default.png','http://www.gsangebleu.com','','','',1,'','','2019-06-10 15:13:46','2019-06-11 10:15:39',NULL),
	(169,2,1,'Ahmed Albadri','aljaouzia@gmail.com','Groupe Scolaire Al Jawzia',NULL,'Avenue Tareq Ibno Ziad Lotissement Annaser',1,17,'0537643333',NULL,NULL,'https://goo.gl/maps/cs95mzDKsSVrgw7p8','default.png',NULL,NULL,NULL,'creche,primair,college,lycee',1,'','','2019-06-10 15:13:46','2019-06-11 10:15:39',NULL),
	(170,2,1,'KHAWA Ghada','ghada997@hotmail.com','Le Petit Canadien',NULL,'Rue Annasr Villa N° 6',201,18,'0535514271',NULL,NULL,'https://goo.gl/maps/nU6f7NH7GzPAHf9J6','1559659407.jpeg',NULL,NULL,NULL,'creche',1,'','','2019-06-10 15:13:46','2019-06-11 10:15:39',NULL),
	(171,1,1,'','polo@madina.ma','Écoles Al Madina Polo',NULL,'52, Bd Nador, Polo, Casablanca.',53,1,'0522210505','0522520462','0662101692','<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3324.919681104877!2d-7.6109134!3d33.5554631!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0xda632a9e80e0271%3A0x60bb1c9c9e5101d6!2s%C3%89coles+Al+Madina+Site+Polo!5e0!3m2!1sfr!2sma!4v1561715173502!5m2!1sfr!2sma\" width=\"800\" height=\"600\" frameborder=\"0\" style=\"border:0\" allowfullscreen></iframe>','1561715452.jpeg','http://www.almadina.ma/',NULL,NULL,NULL,1,'33.555733','-7.610940','2019-06-28 09:50:52','2019-06-28 09:50:52',NULL),
	(172,1,1,'','almadina@madina.ma','Écoles Al Madina Californie',NULL,'Lotissement Bellevue 2, rue 3, Californie',19,1,'0522505097','0522504960','0661427000','<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3325.4542463629296!2d-7.637545784914609!3d33.54157235191558!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0xda62d3faa22f10d%3A0x1635d2bdab0df08a!2s%C3%89coles+Al+Madina+Site+Californie!5e0!3m2!1sfr!2sma!4v1561715703223!5m2!1sfr!2sma\" width=\"800\" height=\"600\" frameborder=\"0\" style=\"border:0\" allowfullscreen></iframe>','1561715738.jpeg','http://www.almadina.ma/',NULL,NULL,NULL,1,'33.541765','-7.635325','2019-06-28 09:55:38','2019-06-28 09:55:38',NULL);

/*!40000 ALTER TABLE `etablissements` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table gmaps_geocache
# ------------------------------------------------------------

DROP TABLE IF EXISTS `gmaps_geocache`;

CREATE TABLE `gmaps_geocache` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `latitude` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `longitude` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `infowindow_content` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `gmaps_geocache` WRITE;
/*!40000 ALTER TABLE `gmaps_geocache` DISABLE KEYS */;

INSERT INTO `gmaps_geocache` (`id`, `address`, `latitude`, `longitude`, `infowindow_content`, `created_at`, `updated_at`)
VALUES
	(6,'Adresse 1','33.5950627','-7.6187768','Test1',NULL,NULL);

/*!40000 ALTER TABLE `gmaps_geocache` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table gmaps_geocaches
# ------------------------------------------------------------

DROP TABLE IF EXISTS `gmaps_geocaches`;

CREATE TABLE `gmaps_geocaches` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ville_id` int(10) unsigned DEFAULT NULL,
  `zone_id` int(10) unsigned DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `latitude` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `longitude` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `infowindow_content` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `gmaps_geocaches_ville_id_foreign` (`ville_id`),
  KEY `gmaps_geocaches_zone_id_foreign` (`zone_id`),
  CONSTRAINT `gmaps_geocaches_ville_id_foreign` FOREIGN KEY (`ville_id`) REFERENCES `villes` (`id`),
  CONSTRAINT `gmaps_geocaches_zone_id_foreign` FOREIGN KEY (`zone_id`) REFERENCES `zones` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `gmaps_geocaches` WRITE;
/*!40000 ALTER TABLE `gmaps_geocaches` DISABLE KEYS */;

INSERT INTO `gmaps_geocaches` (`id`, `ville_id`, `zone_id`, `address`, `latitude`, `longitude`, `infowindow_content`, `created_at`, `updated_at`)
VALUES
	(1,1,2,'Km 9 route de Rabat Ain Sebâa','33.609418','-7.524209','Ecole Almadina, Ain Sebaa','2019-06-10 15:13:46','2019-06-10 15:13:46'),
	(2,NULL,NULL,'12 Rue des Mouettes BeauSéjour','33.564005','-7.647698','Institution Mamma Habiba','2019-06-10 15:13:46','2019-06-10 15:13:46'),
	(3,NULL,NULL,'76 rue abdelhamid bnou badiss, Casablanca 20250','33.615006','-7.541137','Institut scolaire les palmiers','2019-06-10 15:13:46','2019-06-10 15:13:46'),
	(4,NULL,NULL,'16, 18, 20, rue Mohamed BAHI Palmiers','33.580977','-7.631303','Groupe Scolaire Le Cèdre Collège','2019-06-10 15:13:46','2019-06-10 15:13:46'),
	(5,NULL,NULL,'Rue ibn khafaja, Anfa - Mohammedia','33.697496','-7.379925','Newton International School','2019-06-10 15:13:46','2019-06-10 15:13:46');

/*!40000 ALTER TABLE `gmaps_geocaches` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table migrations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;

INSERT INTO `migrations` (`id`, `migration`, `batch`)
VALUES
	(1,'2014_10_12_000000_create_users_table',1),
	(2,'2014_10_12_100000_create_password_resets_table',1),
	(3,'2016_06_01_000001_create_oauth_auth_codes_table',1),
	(4,'2016_06_01_000002_create_oauth_access_tokens_table',1),
	(5,'2016_06_01_000003_create_oauth_refresh_tokens_table',1),
	(6,'2016_06_01_000004_create_oauth_clients_table',1),
	(7,'2016_06_01_000005_create_oauth_personal_access_clients_table',1),
	(8,'2019_05_27_100020_create_categories_table',1),
	(9,'2019_05_27_100335_create_villes_table',1),
	(10,'2019_05_27_100238_create_zones_table',2),
	(11,'2019_05_28_101245_create_etablissements_tables',3),
	(12,'2019_06_10_131704_creat_table_niveau_etudes',4),
	(19,'2019_06_11_145822_create_etablissement_niveau_etude_tables',5),
	(25,'2019_06_25_161000_create_gmaps_geocaches_table',7),
	(26,'2019_06_25_161108_add_column_gmaps__geocache_id_to_etablissements',8),
	(27,'2019_06_25_143230_create_gmaps_geocache_table',9),
	(28,'2019_06_27_141628_add_columns_ville_id_zone_id_to_gmaps_geocaches_table',10),
	(29,'2019_06_27_153311_add_columns_latitude_longitude_etablissements_table',11),
	(30,'2019_06_28_103117_add_column_latitude_longitude_villes_table',12);

/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table niveau_etudes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `niveau_etudes`;

CREATE TABLE `niveau_etudes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `niveau` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `niveau_etudes` WRITE;
/*!40000 ALTER TABLE `niveau_etudes` DISABLE KEYS */;

INSERT INTO `niveau_etudes` (`id`, `niveau`, `created_at`, `updated_at`)
VALUES
	(1,'Crèche','2019-06-10 00:00:00','2019-06-10 00:00:00'),
	(2,'Primaire','2019-06-10 00:00:00','2019-06-10 00:00:00'),
	(3,'Collége','2019-06-10 00:00:00','2019-06-10 00:00:00'),
	(4,'Lycée','2019-06-10 00:00:00','2019-06-10 00:00:00');

/*!40000 ALTER TABLE `niveau_etudes` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table oauth_access_tokens
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oauth_access_tokens`;

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `client_id` int(10) unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Affichage de la table oauth_auth_codes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oauth_auth_codes`;

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `client_id` int(10) unsigned NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Affichage de la table oauth_clients
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oauth_clients`;

CREATE TABLE `oauth_clients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_clients_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Affichage de la table oauth_personal_access_clients
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oauth_personal_access_clients`;

CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_personal_access_clients_client_id_index` (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Affichage de la table oauth_refresh_tokens
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oauth_refresh_tokens`;

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Affichage de la table password_resets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `password_resets`;

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Affichage de la table users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'profil.png',
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`id`, `name`, `type`, `photo`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `deleted_at`)
VALUES
	(1,'Brahim ZAID','admin','1559137809.png','zaidbrahim@gmail.com',NULL,'$2y$10$SQgKr1MAVlzMFPtN84ENu.kLbkGcyQwJ6XmxV1kQVSjAu8s8RsKZK','ljTR8d5bO9z0LoSKgxk7j6XXjIFylE8MKkWGAzR7uTYDBx0jFGW7uKsDFmFy','2019-05-28 15:19:33','2019-05-29 13:50:09',NULL),
	(2,'Adnane','user','1559138183.png','adnane.harchaoui@allin.ma',NULL,'$2y$10$Ut9EndE0dMngLaXcZUFBvu9pIl6nqy3LuGEPZd8BHGH8PgEv/byOi','rek7aBmnIiPbE1Bsn6JoEf6Ma8RVgtFdvvak0MEx082Facwk8J1rMo7AV4hv','2019-05-29 13:49:28','2019-05-29 13:56:23',NULL);

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table villes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `villes`;

CREATE TABLE `villes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ville` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default.png',
  `etat` tinyint(1) NOT NULL DEFAULT '1',
  `favorie` tinyint(1) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `latitude` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `longitude` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `villes` WRITE;
/*!40000 ALTER TABLE `villes` DISABLE KEYS */;

INSERT INTO `villes` (`id`, `ville`, `image`, `etat`, `favorie`, `created_at`, `updated_at`, `deleted_at`, `latitude`, `longitude`)
VALUES
	(1,'Casablanca','casa.png',1,1,'2019-05-15 13:32:16','2019-06-28 10:53:05',NULL,'33.573109','-7.589843'),
	(2,'Rabat','rabat.png',1,1,'2019-05-15 13:33:03','2019-06-28 10:53:41',NULL,'33.971588','-6.849813'),
	(3,'Marrakech','marrakech.png',1,1,'2019-05-15 13:33:11','2019-06-28 10:52:14',NULL,'31.629473','-7.981084'),
	(4,'Mohammedia','mohammedia.png',1,1,'2019-05-15 13:33:18','2019-06-28 11:39:21',NULL,'33.702850','-7.372210'),
	(5,'Fes','fes.png',1,1,'2019-05-15 13:33:24','2019-06-29 10:51:59',NULL,'34.018124','-5.007845'),
	(6,'Tanger','tanger.png',1,1,'2019-05-15 13:33:34','2019-06-29 10:51:07',NULL,'36.644424','-93.264442'),
	(7,'Agadir','agadir.png',1,1,'2019-05-15 13:33:41','2019-06-29 10:50:16',NULL,'30.427755','-9.598107'),
	(8,'Berrechid','default.png',1,0,'2019-05-17 09:51:27','2019-06-29 10:49:46',NULL,'33.270981','-7.584740'),
	(9,'Kénitra','kenitra.png',1,1,'2019-05-17 09:51:59','2019-06-29 10:49:07',NULL,'34.267471','-6.562630'),
	(10,'Bensliman','default.png',1,0,'2019-05-17 09:52:13','2019-06-29 10:48:26',NULL,'33.613920','-7.121860'),
	(11,'Salé','sale.png',1,1,'2019-05-17 09:52:18','2019-06-29 10:47:51',NULL,'34.053570','-6.792860'),
	(12,'El-Jadida','default.png',1,0,'2019-05-17 09:53:10','2019-06-29 10:47:10',NULL,'33.248350','-8.516350'),
	(13,'Tiznit','default.png',1,0,'2019-05-17 09:53:26','2019-06-29 10:46:18',NULL,'29.693300','-9.724540'),
	(14,'Inezgane','default.png',1,0,'2019-05-17 09:53:35','2019-06-29 10:45:29',NULL,'30.354670','-9.533500'),
	(15,'Béni Mellal','default.png',1,0,'2019-05-17 09:54:06','2019-06-29 10:44:51',NULL,'32.336128','-6.355260'),
	(16,'Tit Mellil','default.png',1,0,'2019-05-17 09:54:15','2019-06-29 10:44:06',NULL,'33.557170','-7.484750'),
	(17,'Témara','temara.png',1,1,'2019-05-17 09:54:22','2019-06-28 10:51:27',NULL,'33.929932','-6.914300'),
	(18,'Meknès','meknes.png',1,1,'2019-05-17 09:54:32','2019-06-28 10:50:47',NULL,'33.894470','-5.549240');

/*!40000 ALTER TABLE `villes` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table zones
# ------------------------------------------------------------

DROP TABLE IF EXISTS `zones`;

CREATE TABLE `zones` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ville_id` int(10) unsigned DEFAULT NULL,
  `zone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `zones_ville_id_foreign` (`ville_id`),
  CONSTRAINT `zones_ville_id_foreign` FOREIGN KEY (`ville_id`) REFERENCES `villes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `zones` WRITE;
/*!40000 ALTER TABLE `zones` DISABLE KEYS */;

INSERT INTO `zones` (`id`, `ville_id`, `zone`, `created_at`, `updated_at`, `deleted_at`)
VALUES
	(1,1,'Aïn Chock','2019-05-15 13:32:16','2019-05-15 13:32:16',NULL),
	(2,1,'Aïn Sebaâ','2019-05-15 13:32:16','2019-05-15 13:32:16',NULL),
	(3,1,'Anfa','2019-05-15 13:32:16','2019-05-15 13:32:16',NULL),
	(4,1,'Ben M\'sick','2019-05-15 13:32:16','2019-05-15 13:32:16',NULL),
	(5,1,'Sidi Bernoussi','2019-05-15 13:32:16','2019-05-15 13:32:16',NULL),
	(6,1,'Al Fida','2019-05-15 13:32:16','2019-05-15 13:32:16',NULL),
	(7,1,'Hay Hassani','2019-05-15 13:32:16','2019-05-15 13:32:16',NULL),
	(8,1,'Hay Moulay Rachid','2019-05-15 13:32:16','2019-05-15 13:32:16',NULL),
	(9,1,'2 Mars','2019-05-15 13:32:16','2019-05-15 13:32:16',NULL),
	(10,1,'Aïn Borja','2019-05-15 13:32:16','2019-05-15 13:32:16',NULL),
	(11,1,'Aïn Diab','2019-05-15 13:32:16','2019-05-15 13:32:16',NULL),
	(12,1,'Al Batha','2019-05-15 13:32:16','2019-05-15 13:32:16',NULL),
	(13,1,'Alsace Lorraine','2019-05-15 13:32:16','2019-05-15 13:32:16',NULL),
	(14,1,'Beauséjour','2019-05-15 13:32:16','2019-05-15 13:32:16',NULL),
	(15,1,'Belvédère','2019-05-15 13:32:16','2019-05-15 13:32:16',NULL),
	(16,1,'Ben Ejdia','2019-05-15 13:32:16','2019-05-15 13:32:16',NULL),
	(17,1,'Benmsik','2019-05-15 13:32:16','2019-05-15 13:32:16',NULL),
	(18,1,'Bourgogne','2019-05-15 13:32:16','2019-05-15 13:32:16',NULL),
	(19,1,'Californie','2019-05-15 13:32:16','2019-05-15 13:32:16',NULL),
	(20,1,'Centre Ville','2019-05-15 13:32:16','2019-05-15 13:32:16',NULL),
	(21,1,'C.I.L','2019-05-15 13:32:16','2019-05-15 13:32:16',NULL),
	(22,1,'Derb Ghallef','2019-05-15 13:32:16','2019-05-15 13:32:16',NULL),
	(23,1,'Derb Omar','2019-05-15 13:32:16','2019-05-15 13:32:16',NULL),
	(24,1,'El Manar El Hank','2019-05-15 13:32:16','2019-05-15 13:32:16',NULL),
	(25,1,'Ferme Bretone','2019-05-15 13:32:16','2019-05-15 13:32:16',NULL),
	(26,1,'Florida','2019-05-15 13:32:16','2019-05-15 13:32:16',NULL),
	(27,1,'Fonciere','2019-05-15 13:32:16','2019-05-15 13:32:16',NULL),
	(28,1,'Gauthier','2019-05-15 13:32:16','2019-05-15 13:32:16',NULL),
	(29,1,'Habous','2019-05-15 13:32:16','2019-05-15 13:32:16',NULL),
	(30,1,'Hay Mohammadi','2019-05-15 13:32:16','2019-05-15 13:32:16',NULL),
	(31,1,'Hay Hana','2019-05-15 13:32:16','2019-05-15 13:32:16',NULL),
	(32,1,'Hay Inara','2019-05-15 13:32:16','2019-05-15 13:32:16',NULL),
	(33,1,'Hay Laymouna','2019-05-15 13:32:16','2019-05-15 13:32:16',NULL),
	(34,1,'Hermitage','2019-05-15 13:32:16','2019-05-15 13:32:16',NULL),
	(35,1,'Hippodrome','2019-05-15 13:32:16','2019-05-15 13:32:16',NULL),
	(36,1,'Hôrloge','2019-05-15 13:32:16','2019-05-15 13:32:16',NULL),
	(37,1,'Industriel Nord','2019-05-15 13:32:16','2019-05-15 13:32:16',NULL),
	(38,1,'La Gare','2019-05-15 13:32:16','2019-05-15 13:32:16',NULL),
	(39,1,'La Gironde','2019-05-15 13:32:16','2019-05-15 13:32:16',NULL),
	(40,1,'Laimoune','2019-05-15 13:32:16','2019-05-15 13:32:16',NULL),
	(41,1,'Les Camps','2019-05-15 13:32:16','2019-05-15 13:32:16',NULL),
	(42,1,'Les Cretes','2019-05-15 13:32:16','2019-05-15 13:32:16',NULL),
	(43,1,'Les Princesses','2019-05-15 13:32:16','2019-05-15 13:32:16',NULL),
	(44,1,'Lissasfa','2019-05-15 13:32:16','2019-05-15 13:32:16',NULL),
	(45,1,'Longchamps','2019-05-15 13:32:16','2019-05-15 13:32:16',NULL),
	(46,1,'Lusitania','2019-05-15 13:32:16','2019-05-15 13:32:16',NULL),
	(47,1,'Maarif','2019-05-15 13:32:16','2019-05-15 13:32:16',NULL),
	(48,1,'Mers Sultan','2019-05-15 13:32:16','2019-05-15 13:32:16',NULL),
	(49,1,'Oasis','2019-05-15 13:32:16','2019-05-15 13:32:16',NULL),
	(50,1,'Oulfa','2019-05-15 13:32:16','2019-05-15 13:32:16',NULL),
	(51,1,'Palmier','2019-05-15 13:32:16','2019-05-15 13:32:16',NULL),
	(52,1,'Parc','2019-05-15 13:32:16','2019-05-15 13:32:16',NULL),
	(53,1,'Polo','2019-05-15 13:32:16','2019-05-15 13:32:16',NULL),
	(54,1,'Quartier des Hôpitaux','2019-05-15 13:32:16','2019-05-15 13:32:16',NULL),
	(55,1,'Racine','2019-05-15 13:32:16','2019-05-15 13:32:16',NULL),
	(56,1,'Riviera','2019-05-15 13:32:16','2019-05-15 13:32:16',NULL),
	(57,1,'Roches Noires','2019-05-15 13:32:16','2019-05-15 13:32:16',NULL),
	(58,1,'Route d\'Azemmour','2019-05-15 13:32:16','2019-05-15 13:32:16',NULL),
	(59,1,'Route d\'El Jadida','2019-05-15 13:32:16','2019-05-15 13:32:16',NULL),
	(60,1,'Sbata','2019-05-15 13:32:16','2019-05-15 13:32:16',NULL),
	(61,1,'Sidi Belyout','2019-05-15 13:32:16','2019-05-15 13:32:16',NULL),
	(62,1,'Sidi Maarouf','2019-05-15 13:32:16','2019-05-15 13:32:16',NULL),
	(63,1,'Sidi Moumen','2019-05-15 13:32:16','2019-05-15 13:32:16',NULL),
	(64,1,'Sidi Othmane','2019-05-15 13:32:16','2019-05-15 13:32:16',NULL),
	(65,1,'Sour Jdid','2019-05-15 13:32:16','2019-05-15 13:32:16',NULL),
	(66,1,'Tantonville','2019-05-15 13:32:16','2019-05-15 13:32:16',NULL),
	(67,1,'Triangle d\'Or','2019-05-15 13:32:16','2019-05-15 13:32:16',NULL),
	(68,1,'Val d\'Anfa','2019-05-15 13:32:16','2019-05-15 13:32:16',NULL),
	(69,1,'Val Fleuri','2019-05-15 13:32:16','2019-05-15 13:32:16',NULL),
	(70,1,'Al Qods','2019-05-15 13:32:16','2019-05-15 13:32:16',NULL),
	(71,1,'Bernoussi','2019-05-15 13:32:16','2019-05-15 13:32:16',NULL),
	(72,1,'Hay Al Amal','2019-05-15 13:32:16','2019-05-15 13:32:16',NULL),
	(73,1,'Hay M\'barka','2019-05-15 13:32:16','2019-05-15 13:32:16',NULL),
	(74,1,'Hay Mansour','2019-05-15 13:32:16','2019-05-15 13:32:16',NULL),
	(75,1,'Hay Tarik','2019-05-15 13:32:16','2019-05-15 13:32:16',NULL),
	(76,1,'Zone Industrielle','2019-05-15 13:32:16','2019-05-15 13:32:16',NULL),
	(77,1,'Al Madina Aljadida','2019-05-15 13:32:16','2019-05-15 13:32:16',NULL),
	(78,1,'Bournazil','2019-05-15 13:32:16','2019-05-15 13:32:16',NULL),
	(79,1,'Hay Albaraka','2019-05-15 13:32:16','2019-05-15 13:32:16',NULL),
	(80,1,'Hay Alfalah','2019-05-15 13:32:16','2019-05-15 13:32:16',NULL),
	(81,1,'Hay Almassira 1','2019-05-15 13:32:16','2019-05-15 13:32:16',NULL),
	(82,1,'Hay Almassira 2','2019-05-15 13:32:16','2019-05-15 13:32:16',NULL),
	(83,1,'Hay Almassira 3','2019-05-15 13:32:16','2019-05-15 13:32:16',NULL),
	(84,1,'Hay Moulay Rachid 1','2019-05-15 13:32:16','2019-05-15 13:32:16',NULL),
	(85,1,'Hay Moulay Rachid 2','2019-05-15 13:32:16','2019-05-15 13:32:16',NULL),
	(86,1,'Hay Moulay Rachid 3','2019-05-15 13:32:16','2019-05-15 13:32:16',NULL),
	(87,1,'Hay Moulay Rachid 4','2019-05-15 13:32:16','2019-05-15 13:32:16',NULL),
	(88,1,'Hay Moulay Rachid 5','2019-05-15 13:32:16','2019-05-15 13:32:16',NULL),
	(89,1,'Hay Moulay Rachid 6','2019-05-15 13:32:16','2019-05-15 13:32:16',NULL),
	(90,1,'Hay Rajaa','2019-05-15 13:32:16','2019-05-15 13:32:16',NULL),
	(91,1,'Hay Sadri','2019-05-15 13:32:16','2019-05-15 13:32:16',NULL),
	(92,1,'Zone Industrielle Moulay Rachid','2019-05-15 13:32:16','2019-05-15 13:32:16',NULL),
	(93,1,'Autre secteur','2019-05-15 13:32:16','2019-05-15 13:32:16',NULL),
	(94,5,'Agdal','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),
	(95,5,'Fès Médina','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),
	(96,5,'Jnan El ward','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),
	(97,5,'Les Mérinides','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),
	(98,5,'Saies','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),
	(99,5,'Zouagha','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),
	(100,5,'Autre secteur','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),
	(101,5,'Ain Haroun','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),
	(102,5,'Ancienne Médina','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),
	(103,5,'Ben Souda','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),
	(104,5,'Dar Dbibagh','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),
	(105,5,'Dar Mehrez','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),
	(106,5,'Hay Saada','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),
	(107,5,'Lyrac','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),
	(108,5,'Mellah','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),
	(109,5,'Mont fleuri','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),
	(110,5,'Moulay Abdallah','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),
	(111,5,'Oued Fès','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),
	(112,5,'Place Alaouine','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),
	(113,5,'Talaa','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),
	(114,5,'Route d\'Immouzere','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),
	(115,5,'Mont Fleuri 2','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),
	(116,5,'Route d\'Aeroport','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),
	(117,5,'Ouled Tayeb','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),
	(118,5,'Route de Sefrou','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),
	(119,5,'Route Ain Chkaf','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),
	(120,5,'Narjis','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),
	(121,5,'Boutaaa','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),
	(122,5,'El Keddan','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),
	(123,5,'El Mokhfia','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),
	(124,5,'Laayoun','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),
	(125,5,'Qasbat Ennouar','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),
	(126,5,'Rahbet Zbib','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),
	(127,5,'Zekak Erroumane','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),
	(128,5,'Bad Boujloud','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),
	(129,5,'Batha','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),
	(130,5,'Centre','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),
	(131,5,'Douh','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),
	(132,5,'Hamria','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),
	(133,5,'Hay Atlas','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),
	(134,5,'Hay Fadela','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),
	(135,5,'Hay Palestine','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),
	(136,5,'Route de Meknes','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),
	(137,5,'Sidi Brahim','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),
	(138,5,'Ain Noqbi','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),
	(139,5,'Jnane Eddar','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),
	(140,5,'Oued Bou Fekhane','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),
	(141,5,'Sehb El Ward','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),
	(142,5,'Sehrij Gnawa','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),
	(143,5,'Ain kadous','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),
	(144,5,'Al Hadiqa','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),
	(145,5,'Belkhiat','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),
	(146,5,'Ben Debbab','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),
	(147,5,'Ben Zakour','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),
	(148,5,'Dher Lkhmiss','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),
	(149,5,'Hay Agadir','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),
	(150,5,'Hay Hassani','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),
	(151,5,'Hay Mohammedi','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),
	(152,5,'Hay Ouifak','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),
	(153,5,'Quartier Ben Slimane','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),
	(154,5,'Tghat','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),
	(155,5,'Fes Jdid','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),
	(156,5,'Hay Moulay Abdellah','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),
	(157,5,'Mechouar','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),
	(158,5,'Aaouinat Hajjaj','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),
	(159,5,'Ain Amiyer','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),
	(160,5,'Hay Hassani','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),
	(161,5,'Hay Riad','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),
	(162,5,'Mourabitine','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),
	(163,5,'Zone Industrielle Sidi Brahim','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),
	(164,2,'Aakkari','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),
	(165,2,'Agdal','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),
	(166,2,'Aviation','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),
	(167,2,'Diour Jamaa','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),
	(168,2,'Douar el Hajja','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),
	(169,2,'Hassan','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),
	(170,2,'Hay el Fath','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),
	(171,2,'Hay Nahda','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),
	(172,2,'Hay Riad','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),
	(173,2,'Les Ambassadeurs','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),
	(174,2,'Les Orangers','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),
	(175,2,'Les Oudayas','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),
	(176,2,'Mabella','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),
	(177,2,'Massira','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),
	(178,2,'Médina de Rabat','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),
	(179,2,'Souissi','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),
	(180,2,'Taqaddoum','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),
	(181,2,'Yacoub El Mansour','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),
	(182,2,'Youssoufia','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),
	(183,2,'Autre secteur','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),
	(184,2,'Quartier de l\'Océan','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),
	(185,2,'Al Irfane','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),
	(186,2,'Guich Oudaya','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),
	(187,2,'Haut Agdal','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),
	(188,2,'Riyad','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),
	(189,2,'Riyad Extension','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),
	(190,2,'Abi Ragrag','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),
	(191,2,'Aviation - Mabella','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),
	(192,2,'El Youssoufia','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),
	(193,2,'Hay Al Farah','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),
	(194,2,'Hay Arrachad','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),
	(195,2,'Mechouar','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),
	(196,8,'Hay EL Houda','2019-05-20 14:10:43','2019-05-20 14:10:43',NULL),
	(197,3,'Guéliz','2019-05-20 14:23:22','2019-05-20 14:23:22',NULL),
	(198,3,'Masmoudi','2019-05-20 14:55:29','2019-05-20 14:55:29',NULL),
	(199,3,'AL Fadel','2019-05-20 15:23:56','2019-05-20 15:23:56',NULL),
	(200,3,'Riad Assalam','2019-05-20 15:33:46','2019-05-20 15:33:46',NULL),
	(201,9,'Autre','2019-05-21 12:35:09','2019-05-21 12:35:09',NULL),
	(202,3,'Mhamid','2019-05-28 10:07:49','2019-05-28 10:07:49',NULL),
	(203,5,'Ain Chkef','2019-05-28 13:24:18','2019-05-28 13:24:18',NULL),
	(204,3,'Daoudiat','2019-05-28 14:14:26','2019-05-28 14:14:26',NULL),
	(205,3,'Route D\'Essaouira','2019-05-29 12:24:10','2019-05-29 12:24:10',NULL);

/*!40000 ALTER TABLE `zones` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
