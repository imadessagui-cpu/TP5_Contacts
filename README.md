Projet : Gestion de Contacts (Architecture MVC)

Ce projet est une application web de gestion de contacts développée dans le cadre du cours Java EE. L'application suit le design pattern MVC (Modèle-Vue-Contrôleur) pour assurer une séparation nette entre la logique métier et l'interface utilisateur.
🚀 Technologies Utilisées

    Frontend : JSP et JSTL (obligatoire pour éviter le code Java dans les vues).

    Backend : Java Servlets (ControllerServlet).

    Base de données : MySQL.

    Mapping : JDBC.

⚙️ Prérequis

    Serveur MySQL : Doit être installé et configuré sur le port 3306.

    Java JDK 8 ou version supérieure.

    Eclipse IDE pour Enterprise Java Developers.

    Driver JDBC : mysql-connector-j.jar ajouté au Build Path du projet.

🗄️ Configuration de la Base de Données

Avant de lancer l'application, vous devez créer la structure de la base de données. Utilisez le script SQL suivant (disponible dans le fichier database_contact.sql) :
--
CREATE DATABASE IF NOT EXISTS tp5_contacts;
USE tp5_contacts;

CREATE TABLE Contact (
    ID_CONTACT INT NOT NULL AUTO_INCREMENT,
    FIRSTNAME VARCHAR(255),
    LASTNAME VARCHAR(255),
    EMAIL VARCHAR(255),
    PHONE VARCHAR(255),
    ADDRESS VARCHAR(255),
    PRIMARY KEY (ID_CONTACT)
);
--
Note : Le script utilise AUTO_INCREMENT pour la gestion automatique des identifiants.
🛠️ Installation et Utilisation

    Importez le projet dans Eclipse via File > Import > Existing Projects into Workspace.

    Configurez la connexion dans la classe ContactFacade.java :

        URL : jdbc:mysql://localhost:3306/tp5_contacts

        Utilisateur : root

        Mot de passe : (Laissez vide ou saisissez votre mot de passe MySQL).

    Déployez le projet sur un serveur Apache Tomcat.

    Accédez à l'application via l'URL : http://localhost:8080/TP5_Contacts/ControllerServlet.

📂 Structure du Projet

    src/model : Contient les classes Contact (JavaBean) et ContactFacade (Logique JDBC).

    src/controller : Contient la servlet ControllerServlet qui centralise les requêtes.

    WebContent/ : Contient les pages de vue (accueil.jsp, addContact.jsp, etc.) développées avec les   tags JSTL.
