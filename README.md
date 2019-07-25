# Stage_2019

Les données ITP se trouvent dans le répertoire: /net/krypton/data0/project/drakkar/REFERENCE_DATA/ITP/itp_isas17
"Algorithme_mld.m "lit les données des différents ITP et calcul les valeurs dee MLD et de température/salinité/densité moyenne au sein de la couche de mélange.
La densité est calculée à partir d'une fonction d'état se trouvant dans le dossier "seawater_ver3_3.1".
Le calcul de la mld est basé sur la méthode du gradient maximal des profils de densités.
Ces informations sont stockées dans la matrice "BM" où chaque ligne (de 1 à 10) contient respectivement les informations suivantes:(Numéro instru, Jours, Mois, Annee, MLD, Salinité,Température,Densité,Long,lat)

Plusiers critères éliminent les profils de mld non pertinents. 
critere 3 "La salinité doit être inférieur à 35 psu élimine"
critere 4 "La première mesure de pression doit commencer avant 10 mètres de profondeur" 
critere 5 "La MLD calculée ne doit pas correspondre aux trois premières mesures de pression" 
critere 6 "La MLD calculée ne doit pas se situer à moins de 2 mètres du premier point de mesure"
critere 8 "Les profils doivent contenir au moins 10 mesures" " 
critere 9 "La première mesure de densité doit commencer avant 10 mètres de profondeur"
critere 10 "Suprpession ittérative des outliers" " 

L'algorithme possède plusieurs conditions afin de pouvoir lire de manière générique les données des différents instruments ITP.
Les différentes variables (Long,lat,mld,densité,température,salinité) sont stockées dans un ficher 'filename.mat'.
En lançant l'algorithme pour tout les instruments (1:110) on peut connaître le nombre de profils total récolté par les ITP (variable "cn"), le nombre de profils post-traitement (variable "Nb_profil") et le nombre de profils supprimé par l'ensemble des critères (Nb_profil_sup).

Les cartes représentant les données de mld ainsi que de salinité et de température moyenne au sein de la couche de mélange se trouve dans le dossier: "Cartes". Le code permettant de créer ces cartes se nomme "Seansonal_variability_subplot.m". 
Les figures illustrant les variations de mld ainsi que de salinité et de température moyenne au sein de la couche de mélange en fonction des mois et années se trouvent dans le dossier "Figures". Les codes permettant de tracer ces figures se trouvent dans le dossier "Graphes".
Les codes peremettant de calculer les moyennes mensuelles et interannuelles des paramètres de la couche de mélange sont enregistrées dans le fichier "Calcul des moyennes".
