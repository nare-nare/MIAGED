L’objectif du TP donné était de réaliser un ensemble de MVP pour pouvoir obtenir un maximum de retours client avec un minimum d’effort.<br>
Cet ensemble le MVP m’a permis de réaliser une petite application nommée «MIAGED».<br>

/////////////////////////////////////////////////////US#1 : [MVP] Interface de login//////////////////////////////////////////<br>
Après le lancement du projet, l’interface de login sera affichée. <br>Pour vous connecter, vous pouvez entrer les informations suivantes :<br>
   -Email : houdajonhy@gmail.com    -Password : HOUDA123<br><br><br>
Si un email et un password sont incorrect (c’est-à-dire  que le compte n’existe pas), un message d’erreur est affiché dans la console mais l’application fonctionne toujours 😊
<br><br><br>
J’ai aussi ajouter une interface de création de compte, il suffit de cliquer sur« créer un », et remplir tous les champs du formulaire. <br>
Le remplissage du formulaire doit être fait dans les bonnes conditions parmi elles on trouve :     <br>  ![image](https://user-images.githubusercontent.com/87307477/209481032-f8aad151-a7c5-4181-b7d8-c303e44c45c4.png)
                                                                                                                  
-Le mot de passe doit contenir au moins 6 caractères, sinon un message d’erreur de cette forme sera affiché :  <br>
-Le compte ne doit pas être déjà existant <br>![image](https://user-images.githubusercontent.com/87307477/209481040-d5a4fde9-007c-4cb2-8364-faade728c3b9.png)

=> a la création du compte, l’utilisateur sera redirigé directement vers l’interface des produits et pourra naviguer sur l’application, c’est-à-dire qu’il n’a pas besoin de se connecter de nouveau.
<br> <br> <br> <br> <br> <br> <br> <br> <br> 
/////////////////////////////////////////////////////US#2 : [MVP] Liste de vêtements////////////////////////////////////////// <br>
Apres avoir rempli les champs de connexion, une verification va etre faite dans la base de données et la page de liste de vetements sera affichée.
<br>Cette page est sous forme de plusieurs produits, et aussi une BottomNavigationBar composée de trois entrées et leurs icones correspondantes :
Acheter, Panier et Profil<br> <br> <br> <br> <br> <br> <br> <br> <br> 
/////////////////////////////////////////////////////US#3 : [MVP] Détail d’un vêtement //////////////////////////////////////////
<br> Chaque produit contient ses propres informations, et a l'appui sur un article,  on pourra soit l'ajouter au panier soit ajouter aux favoris(La liste des favoris n'est pas
encore réalisée, ce bouton est maintenant juste comme un bouton "j'aime" pour aimer un article)
<img width="732" alt="image" src="https://user-images.githubusercontent.com/87307477/209481330-e9dbdc1c-401b-414b-a910-de614e397753.png">

<br> <br> <br> <br> <br> <br> <br> <br> <br> 
/////////////////////////////////////////////////////US#4 : [MVP] Le panier//////////////////////////////////////////////////
<br> Le panier contient la liste des articles ajoutés par l'utilisateur, il pouura notamment en retirer.
<br> <br> <br> <br> <br> <br> <br> <br> <br> 
/////////////////////////////////////////////////////US#5 : [MVP] Profil utilisateur ////////////////////////////////////////<br> 
L'utilisateur pourra modifier toutes ses informations entrées lors de la creation du compte(sauf le mot de passe car fire base n'a pas donné l'acces)<img width="199" alt="image" src="https://user-images.githubusercontent.com/87307477/209481443-e51c38c8-6820-4d2a-8617-81c238b93432.png">
<br> <br> <br> <br> <br> <br> <br> <br> <br> 
/////////////////////////////////////////////////////Deconnection////////////////////////////////////////<br> 
Pour la deconnection, j'ai preferer de la mettre dans la barre de tache et sous forme d'une icone.
