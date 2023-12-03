# Gestion des Hôtels et Villes

Ce projet offre une solution complète de gestion des hôtels et des villes, mettant en œuvre un ensemble de technologies avancées pour assurer une performance optimale et une expérience utilisateur transparente. Les technologies principales utilisées dans cette application sont les suivantes : EJB (Enterprise JavaBeans), JSP (JavaServer Pages), Wildfly (Application Server) et Hibernate (ORM - Object-Relational Mapping). Ces technologies fonctionnent de concert pour permettre des opérations CRUD (Create, Read, Update, Delete) sur les données des hôtels et des villes, ainsi que le filtrage dynamique des hôtels par ville.

## Technologies Utilisées

### 1. Enterprise JavaBeans (EJB)

**Qu'est-ce que EJB ?**
Enterprise JavaBeans, communément appelé EJB, est une architecture de développement d'applications Java pour la construction de composants serveur. Ces composants sont des objets réutilisables qui peuvent être déployés sur des serveurs d'applications pour fournir des services distribués.

**Comment EJB est-il utilisé dans ce projet ?**
Dans notre application, EJB est utilisé pour encapsuler la logique métier des opérations CRUD sur les hôtels et les villes. Les composants EJB facilitent la gestion des transactions et la communication entre les différentes parties de l'application.

### 2. JavaServer Pages (JSP)

**Qu'est-ce que JSP ?**
JavaServer Pages (JSP) est une technologie Java qui permet la création de pages Web dynamiques basées sur la syntaxe XML, HTML ou d'autres types de documents. Les JSP combinent du code Java avec des balises spéciales pour générer du contenu Web dynamique.

**Comment JSP est-il utilisé dans ce projet ?**
Les pages JSP dans notre application sont responsables de la présentation des données côté client. Elles intègrent du code Java pour récupérer et afficher les informations des hôtels et des villes dans un format convivial.

### 3. Wildfly (Application Server)

**Qu'est-ce que Wildfly ?**
Wildfly, anciennement connu sous le nom de JBoss, est un serveur d'applications open-source compatible avec la plateforme Java EE (Enterprise Edition). Il offre un environnement d'exécution robuste pour déployer des applications d'entreprise.

**Comment Wildfly est-il utilisé dans ce projet ?**
Wildfly est le serveur d'applications sur lequel notre application est déployée. Il gère les connexions clients, fournit des services d'exécution et assure la sécurité des transactions.

### 4. Hibernate (Object-Relational Mapping - ORM)

**Qu'est-ce que Hibernate ?**
Hibernate est un framework Java populaire qui facilite le mappage des objets Java aux tables de bases de données relationnelles. Il offre une abstraction entre la logique métier de l'application et la persistance des données.

**Comment Hibernate est-il utilisé dans ce projet ?**
Dans notre application, Hibernate simplifie l'accès aux données stockées dans la base de données. Il convertit les objets Java en enregistrements de base de données et vice versa, permettant ainsi des opérations de CRUD efficaces.

## Fonctionnalités

1. **CRUD des Hôtels :**
   - Ajouter un nouvel hôtel avec des détails tels que le nom, l'adresse, le téléphone et la ville associée.
   - Mettre à jour les informations d'un hôtel existant.
   - Supprimer un hôtel de la base de données.

2. **CRUD des Villes :**
   - Ajouter une nouvelle ville avec un nom spécifique.
   - Mettre à jour le nom d'une ville existante.
   - Supprimer une ville de la base de données.

3. **Filtrage par Ville :**
   - Filtrer la liste des hôtels par ville pour afficher uniquement les hôtels associés à une ville spécifique.

## Les interfaces de l'application 
### La Page d'accueil 

![1](https://github.com/Kenza-raki/EJB-JSP/assets/116951093/50f3ebf6-d9d8-45a0-8ca1-8b3d77c84623)

### Gestion des Hotels


![X5](https://github.com/Kenza-raki/EJB-JSP/assets/116951093/fee77d9f-1c39-48e7-91ea-432507282705)



**Video démonstratif de ces operations des CRUD:**


https://github.com/Kenza-raki/EJB-JSP/assets/116951093/69e8c4d1-d517-4d0f-9f6e-01de1086311f



### Gestion des Villes


![11](https://github.com/Kenza-raki/EJB-JSP/assets/116951093/05f82554-49e6-4ede-8e1a-26dca934d9f1)



**Video démonstratif de ces operations des CRUD:**



https://github.com/Kenza-raki/EJB-JSP/assets/116951093/55e26e27-0cf6-4af8-9e7f-391f3a5ab50d



### Le Nombre des hotels Par Villes



https://github.com/Kenza-raki/EJB-JSP/assets/116951093/6f933301-1d02-4bc2-b896-1c017d7874fd




## Configuration du Projet

Pour mettre en place ce projet sur votre environnement de développement local, suivez ces étapes :

1. **Prérequis :**
   - Java JDK installé.
   - Maven pour la gestion des dépendances.
   - Wildfly Server pour le déploiement.
   - Base de données compatible Hibernate (MySQL, PostgreSQL, etc.).

2. **Configurer Wildfly :**
   - Déployez le projet sur Wildfly en utilisant le fichier WAR généré.

3. **Configurer la Base de Données :**
   - Paramètres de connexion à la base de données dans le fichier `persistence.xml`.

4. **Exécuter le Projet :**
   - Lancez le serveur Wildfly.
   - Accédez à l'application via votre navigateur préféré.

## Structure du Projet

- `src/`: Le répertoire du code source de l'application.
- `WebContent/`: Contient les pages JSP et les ressources Web.
- `persistence.xml`: Fichier de configuration Hibernate.

## Contribuer

Les contributions sont les bienvenues! Pour contribuer, suivez ces étapes :
1. Fork du projet.
2. Créer une branche pour votre fonctionnalité (`git checkout -b feature/NouvelleFonctionnalite`).
3. Commit de vos modifications (`git commit -m 'Ajout d'une nouvelle fonctionnalité'`).
4. Push vers la branche (`git push origin feature/NouvelleFonctionnalite`).
5. Ouvrir une pull request.

## Auteurs

- Kenza Raki
