# Stage été 2023 - journal de bord

## <u>Jour 1 - 14/06</u>

### Matin

Explication de l'objet du stage avec Gustavo et Florian jusqu'à 10 heures puis travail
> Mon sujet : mettre au point un module de mesure de taux de remplissage, température, humidité et <b><u>odeurs</b></u> intégré à une poubelle et compatible avec un microcontrôleur donné (ESP32).

> Autres sujets : Adapter un capteur d'angle pour une vanne connectée (Gustavo) et adapter le partage des données d'une flotte de capteurs sur réseau WISE (et potentiellement LoRa, MBIoT, etc.)

Premières recherches sur "comment qualifier chimiquement et mesurer une mauvaise odeur" (quels composés sont émis par la décomposition de matière organique)

Recherche de capteurs d'odeur (H2S, NH3, CH4)

### Après-midi

Recherche de capteurs d'odeur et fumée, d'humidité et de température, ainsi que de distance.

### Soir

Sortie au Piraat et resto après le travail

## <u>Jour 2 - 15/06</u>

### Matin

Mise en forme Excel de la liste de composants trouvés la veille pour présentation au maître de stage.
Présentation des résultats au maître de stage.
Conclusion : bien pour le capteur de distance ToF (déàjà disponible sur place), nouvelles recherches pour les autres capteurs car pas IP67.
> Nouvelles recherches

### Après-midi

Poursuite des recherches de composants, capteurs HT IP67 trouvés mais demande de prix en attente ; toujours rien pour les capteurs de VOCs.

Filipe m'a envoyé la documentation d'un capteur particulier qui me tente bien, je l'étudie un peu mais le ferai plus en détail demain.

Parti à 16 heures pour état des lieux d'appartement.

## <u>Jour 3 - vendredi 16/06</u>

Travail de synthèse pour être capable de présenter mes recherches à n'importe qui (maître de stage en l'occurrence) et pour mieux cibler mes besoins afin de trouve les capteurs les plus adaptés

Définition de critères précis, notamment pour les gaz

<b><i>Je retiendrai l'intérêt de dresser une liste de critères à satisfaire pour le cas d'usage visé.</b></i>

> Établissement d'un CdCF


## <u>Jour 4 - lundi 19/06</u>

### Matin

Revue du CdCF pour adapter les critères fixés
Nouveau capteur VCSEL trouvé chez ST, adapté à la profondeur des PAV de 125 m3 
Élimination des capteurs Alphasense car IP54 seulement ? (à vérifier avec Filipe)

### Après-midi

Rédaction d'une liste Excel de composants
Vérification de la pertinence de la mesure de SO4 (pas pertinent pour les odeurs de décomposition de déchets)

## <u>Jour 5 - mardi 20/06</u>

### Matin

Brasage de quelques headers à un capteur ST VL53L0X Satellite disponible au bureau. Problème : tous les pads acceptent la brasure à 300 °C avec une panne très fine sauf VDD. Solution : changer pour une panne large et augmenter la température.
> Hypothèse : il est possible que les pads qui fonctionnent bien soient liés à un circuit très court ou très fin et montent assez vite à la température eutectique du bronze 99C (227 °C, cf. <a href="https://doi.org/10.1080/14686996.2019.1591168">article sur l'eutectique des bronzes</a>), ce qui n'est pas le cas du pad VDD, sûrement parce que celui-ci peine à arriver à cette température. Entre temps, le composant s'échauffe et risque des dégâts irréversibles. La panne plus large transfère plus facilement la chaleur et la température augmentée du fer (400+ °C) produit un gradient de température plus important, favorisant la fusion de l'étain <u>et</u> la chauffe du pad à cette température.

### Après-midi

Programmation du VL53L0X Satellite avec des librairies et test des différents modes de précision permis par la lib. Le capteur semble très précis et la lib le rend très simple d'utilisation ; il convient maintenant d'attendre de voir comment tous les composants s'assemblent.

## <u>Jour 6 - mercredi 21/06</u>

### Matin

Brasage de tous les headers de l'ESP32-C3-MINI-1. Pénible pcq les headers rentraient difficilement dans les trous prévus à cet effet.
> Truc important appris en brasant : appliquer l'étain au point où la panne, la tige et le contact se touchent pour une répartition plus efficace du métal en fusion.

Mauvais ESP donc brasage d'un mini D1 ESP32 WROOM 32 
> Brasage impeccable, mon hypothèse semble se confirmer.

### Après-midi

Réécriture du programme pour VL53L0X pour qu'il affiche le traux de remplissage en pourcent.
Découvert des fonctionnalités BLE de l'ESP32.

## <u>Jour 7 - jeudi 22/06</u>

### Matin

Pas grand chose... recherches sur les fonctionnalités Deep Sleep de l'ESP32, déplacement de plusieurs PAV, découverte du code source du PAV.
Nouvelles déplaisantes des capteurs de H2S et NH3 dont le prix est très élevé et dont les échantillons ne sont pas gratuits.

### Après-midi

Travail sur le Deep Sleep pour le comprendre.
Lecture du code source.

## <u>Jour 8 - vendredi 23/06</u>

## <u>Jour 9 - lundi 26/06</u>

### Matin


Réunion avec l'équipe pour faire le point sur l'avancée des tâches de chacun.
À faire :
 - Établissement d'une liste de capteurs à acheter pour la première phase de développement
 - Intégration d'une solution de mesure du taux de remplissage et réveil au bon moment au code du PAV
 - Essai et positionnement des capteurs dans l'abri-bac


### Après-midi

Discussion avec Benjamin autour du programme arduino dont il m'a donné une version plus exploitable que celle que m'a donnée Filipe. Il semblerait que l'ESP32 utilisé (WROOM-32) ait un layout différent en termes de broches utilisées. Notamment, il se pourraît qu'une des broches utilisées par le code de Benjamin soit en lien avec la mémoire flash sur mon ESP32. À vérifier en testant les broches et en comparant les documentations.
> Je vais devoir tout recoder à la main (+/-) en faisant attention aux broches utilisées

## <u>Jour 10 - mercredi 28/06</u>

Absence le 27/09 pour dentiste, aujourd'hui on code.

### Matin

Recherches RTC et NTP

### Après-midi 

Réécriture de la partie synchronisation RTC NTP à la main ; ça fonctionne à merveille.

## <u>Jour 11 - 29/06</u>

### Matin

Exploration et réécriture d'autres fonctionnalités du code de Benjamin en attendant d'avoir les capteurs.

### Après-midi

## <u>Jour 12 - vendredi 30/06</u>

## <u>Jour 13 - lundi 03/07</u>

Réception des capteurs et travail sur leur utilisation
> Tout ne fonctionne pas (l'ESP32 WROOM 32 ne me permet apparamment pas de relever la tension analogique aux bornes des capteurs, le VL53L3CX ne fonctionne pas, même avec l'exemple de la librairie) mais ça progresse
Changement d'ESP pour un Devkit v1

## <u>Jour 14 - mardi 04/07</u>

### Matin

Mise au point d'une procédure pour tester la fiabilité des MQx et d'un moyen de simuler le fonctionnement des abri-bacs en situation réelle
Discussion avec Filipe sur les cartes mentales
> TOUJOURS SPÉCIFIER LE BESOIN DANS UN PROJET
Dessin d'une carte mentale autour de ce principe, procédure de test incluse

### Après-midi

??? Combat contre le #&\^]_ d'ADC de l"ESP32

## <u>Jour 15 - mercredi 05/07</u>

### Matin 

Petit échange avec Filipe au cours duquel il me parle de la demande d'une cliente souhaitant compter le nombre d'ouvertures d'un abri-bac
Poursuite du combat contre l'ADC de l'ESP32, lequel m'a occupé jusqu'au soir.

### Après-midi

Poursuite sans succès du combat contre mon désormais ennemi juré
Test d'interrupteurs magnétiques - fonctionnels

## <u>Jour 16 - jeudi 06/07</u>

### Matin

Victoire sur mon feu ennemi juré - calibrage de l'ADC de l'ESP32 réussi !
SOLUTION : brancher une source d'alimentation précise et stable sur la broche VP et l'utiliser comme référence vref pour l'ADC. On rajoute aussi un facteur de calibrage permettant d'ajuster au mieux les valeurs.

```cpp
#include <driver/adc.h>
#include <esp_adc_cal.h>

float read_voltage_ADC1_corrected(adc1_channel_t ADC_channel)
{
    float calibration = 1.06; // Adjust for ultimate accuracy when input is measured using an accurate DVM, if reading too high then use e.g. 0.99, too low use 1.01
    float vref = 1100;
    esp_adc_cal_characteristics_t adc_chars;
    esp_adc_cal_characterize(ADC_UNIT_1, ADC_ATTEN_DB_11, ADC_WIDTH_BIT_12, 1100, &adc_chars);
    vref = adc_chars.vref;  
    adc_set_data_inv(ADC_UNIT_1, true);                                                                            // Obtain the device ADC reference voltage
    return (adc1_get_raw(ADC_channel)/4095.0) * 3.3 *(1100 / vref) * calibration; // ESP by design reference voltage in mV
}

void setup()
{
    Serial.begin(BAUD_RATE);
}

void loop()
{
    Serial.print(analogRead(GPIO_NUM_34));
    Serial.print(" | ");
    Serial.print(read_voltage_ADC1_corrected(ADC1_CHANNEL_6));
    Serial.print("\n");
    delay(800);
}
```

### Après-midi

Test des interrupteurs magnétiques et écriture d'un court programme FreeRTOS pour compter le nombre d'ouvertures et gérer l'absence de fermeture de l'abri-bac.
Rédaction d'un bref compte-rendu des deux jours

## <u>Jour 17 - vendredi 07/07</u>

### Matin

Réunion de fin de semaine avec le maître de stage :
> Je dois maintenant dresser un plan de test pour mettre les technologies essayées à l'épreuve en conditions réelles.

Début de plan de test avec carte mentale ; adaptation en version protocolaire

### Après-midi

Recherches sur Node-RED pour trouver comment faire un serveur distant auquel on pourraît envoyer un JSON depuis l'ESP32

## <u>Jour 18 - lundi 10 juillet</u>

### Matin

Poursuite des recherches sur NodeRED pour créer un serveur distant et finalisation du plan de test

Plan de test terminé et soumis à Filipe

### Après-midi

Mise-à-jour du firmware de cartes avec module GSM censées partir chez un client sous peu. Brasage (compliqué) de deux modules.

## <u>Jour 19 - mardi 11 juillet</u>

### Matin

Téléversement du code de boutons connectés et tests rapides pour une commande pressante.

### Après-midi

Idem avec moins de cartes
Dérbasage de résistances CMS au fer à air chaud

## <u>Jours 20 et 21 (jusqu'au 13 juillet inclus)</u>

### Toute la journée

Apport d'aide à Filipe et Thibault pour plusieurs commandes, recherche infructueuse de problèmes dans des codes mal écrits. Travail très pénible malgré mon incapacité à en ressentir les effets immédiatement.

### Week-end du 14 juillet

Difficultés mentales liées entre autre à ces soucis et cet acharnement. Il me faut apprendre à poser mes limites sans jamais les atteindre ni les repousser. Conseils à demander à Filipe ou d'autres ?

## <u>Jours 22 et 24 - de lundi au mercredi 19 juillet</u>

Healing... Rendez-vous dentaire à Paris le 18 juillet après-midi.

### Journée du 19/07

Finalisation d'une commande de Periclean-CAM (brasures, tests, packaging) à envoyer par la poste au SMD à l'attention de Filipe qui prévoit de se rendre sur place pour élucider les dysfonctionnemnets restants. Tous ces travaux se sont faits en coopération avec la team de stagiaires 💪

## <u>Jour 25 - jeudi 20 juillet</u>

### Matin

Recherches supplémentaires sur la communication wifi de l'esp et comment faire des resquêtes http en arduino.

### Après-midi

Bidouillage Node-RED

## <u>Jour 26 - vendredi 21 juillet</u>

### Matin

Amélioration serveur Node-RED et essais simples http ESP32

### Après-midi

Mise en place du serveur Node-RED terminée, le serveur est opérationnel et contient un dashboard magnifique. L'ESP32 envoie bien des données toutes les secondes pour mettre la température et l'humidité à jour.

## <u>Jour 27 - lundi 24 juillet</u>

### Matin

Amélioration du Node-RED (jauges plus grosses) et du code de l'ESP32 pour ajouter le deep sleep.

### Après-midi

Essai de conversion tension d'entrée/concentration en CO2 des relevés du MQ-135.

## </u>Jour 28 - mardi 25 juillet</u>

### Matin

Nouveaux essais infructueux de conversion tension-concentration. Déduction mathématique de la résistance du capteur en fonction de la tension mesurée en entrée, calcul de $R_0$ à partir de la résistance mesurée du capteur à un instant précis et de la concentration $C_0$ de gaz dans ces conditions. Équation utile : 
$ \displaystyle\frac{R_S}{R_0} = pC^m$,
où $R_S$ est la résistance du capteur, $R_0$ sa résistance interne à la concentration de gaz $C_0$, m la pente de la droite tracée par $\displaystyle\frac{R_S}{R_0}=f(C)$ dans un diagramme loglog et p son ordonnée à l'origine. Tous ces graphiques déterminés par les fabricants sont trouvables dans la datasheet du capteur et peuvent être traités grâce à <a href="https://automeris.io/WebPlotDigitizer/">WebPlotDigitizer</a> et Excel.

### Après-midi

Succès de la conversion, mon device mesure désormais une concentration en ppm, pas encore exacte ; il ne reste donc plus qu'à étalonner le tout. Erreurs commises : confusion entre diagram loglog et affichage classique d'une fonction "logarisée" dans un graphique cartésien à BOND. Notamment : $\displaystyle m = \frac{log_{10}(y_2)-log_{10}(y_1)}{log_{10}(x_2)-log_{10}(x_1)}$

## <u>Jour 29 - mercredi 26 juillet</u>

### Matin et après-midi

Adaptation du code de l'ESP et du Node-RED pour accuieillir les données de concentration en CO2. Succès majeur, calibrage possible et précision acceptable.

## <u>Jour 30 - jeudi 27 juillet</u>

### Matin

Mes requêtes http ne fonctionnent plus, je suis incapable de comprendre pourquoi malgré aucun changement dans le code.

### Après-midi
    
Découverte d'une erreur de core dump (section de la mémoire Flash manquante ?)

## <u>Jour 31 - vendredi 28 juillet</u>

### Matin

Effacement (factory reset) de la mémoire flash de l'ESP32 grâce à esptool. Fonctionne miraculeusement, plus aucune erreur de core dump.

### Après-midi 

Réécriture tu programme. A fonctionné à merveille jusqu'à ~16 h 30. No comprendo mais au pire osef, la techno est validée, reste à envoyer ça sur IoThink.
VACANCES !

## <u>Jour 32 - lundi 7 août</u>

De retour de vacances (trop courtes mais reposantes), motivé à avancer sur mon projet sans m'attarder sur les problèmes du 28 juillet.

### Matin

Mesurer R0 au bureau pour H2S, osef si pas précis avec l'ADC, d'autant plus qu'on mesure une différence
Seuil 'pue' ou 'ne pue pas'

AJD : liste achats pour tests odeurs ; compteur d'ouvertures (produit final)

Nécessité des tests terrain très élevée - envoi données quatre fois par jour
IoThink limité à 8 trames par jour

Documentation de projet

NOtion de service - vendre de la data

Arrêter de faire de la technique (fine) pour faire de la technique

Problème en IoT : le réseau. Mauvais réseau = surconsommation pour essayer d'envoyer des données
Ainsi, annoncer un produit qui dure dix ans finit par durer 2 ans

Toujours plus facile de conquérir un marché avec un produit qui n'existe pas encore

### Après-midi

Ajouter une variable au code du contrôle d'accès pour activer le code des capteurs d'odeurs
Utiliser boîtier du contrôle d'accès avec les cartes déjà présentes pour les boîtiers de test

## <u>Jour 33 - mardi 8 août</u>

### Matin

Réunion d'avancement de cinq minutes pour se tenir au courant des problèmes qui nous bloquent dans notre progression quotidienne.
Travail sur une adaptation odeurs du code du MQ-135

### Après-midi 

Même travail

Normalement tout fonctionne, à ceci près que je ne peux pas encore trouver une concentration non nulle (du moins pas de manière très simple à vérifier - il va falloir tester plus).

## <u>Jour 34 - mercredi 9 août</u>

### Matin

Nettoyage du code et adaptation au debug.

J'ai passé plusieurs heures à comprendre qu'il fallait ajouter un `delay(1000);` après l'activation des capteurs avant de pouvoir prendre une mesure.

### Après-midi

On avance, le code est clair et fonctionnel. La structure est simple : un fichier main, un fichier fonctions contenant les fonctions de mesures et les définitions de variables et directives de preprocessing, plusieurs fichiers de fonctions organisées par thématiques et inclus dans le fichier de fonctions principal. De cette facon, le code du main est très bref, organisé en sections et clair, notamment parce que les fonctions sont explicites et en français. 

## <u>Jour 35 - jeudi 10 août</u>

### Matin

Mise-à-jour du code du dispositif de test pour prendre des mesures de concentration en H2S et HT

### Après-midi

Mise-à-jour du code pour que la carte se connecte à internet et envoie ses données sur Node-RED

Découverte de la raison du problème de liaison entre la carte et Node-RED sur les réseaux Wi-Fi du Lab'O. Il est très probable que le pare-feu des réseaux ait bloqué la connexion entre les deux car l'esp est capable de se connecter à internet, de poster des données sur des sites existants et répertoriés. Le serveur Node-RED est capable de recevoir des données en post de la part de sites existants également.

Pour vérifier cette hypothèse, j'ai connecté mon ordinateur et la carte sur mon réseau privé (partage de connexion). L'envoi de données est un succès.

## <u>Jour 36 - vendredi 11 août</u>

### Matin et Après-midi

Amélioration du code de l'ESP et du serveur Node-RED:
- l'ESP calcule la durée du réveil en fonction de dates définies dans le code et de l'heure actuelle automatiquement
- Le serveur est désormais capable d'afficher la concentration en sulfure de dihydrogène, la température et l'humidité sur un tableau de bord dynamique imp;
eccable. Il peut également tout enregistrer dans un fichier CSV sur le disque de l'ordinateur qui l'héberge.

Essais infructueux d'alimentation de l'ESP par une batterie ; à réitérer.

## <u>Jour 37 - lunid 14 août</u>

### Matin

Compte-rendu du travail de la semaine passée à toute l'équipe :

<i>"Bonjour à tous,

 

La réunion n'ayant pas eu lieu, je voulais vous faire part de mon avancée de la semaine passée par écrit.

 

J'ai travaillé sur un banc de test pour la détéction d'odeurs. Les composants nécessaires ont été commandés par Filipe et lui sont parvenus ; j'attends de les avoir en main pour tout assembler sur la poubelle que nous avons ici. J'ai aménagé mon code pour que la détection d'odeur soit opérationnelle et réglé le souci que j'avais concernant l'envoi de données via Internet. Désormais, la carte est capable d'envoyer les mesures prises par les capteurs à un serveur distant comme celui que j'ai créé à partir de l'outil Node-RED. Celui-ci récupère les données envoyées dans une trame, les affiche sur un tableau de bord et les consigne dans un fichier CSV daté, stocké sur la machine qui héberge le serveur afin que nous puissions suivre l'évolution de l'odeur de la poubelle. Le code pourraît s'adapter à l'ajout d'un autre capteur pour mesurer la concentration en ammoniac sans aucun souci (le seul capteur d'odeur actuellement installé relève la concentration en H2S dans l'air).

 

Pour la suite, toujours en ce qui concerne la détection d'odeurs, il me reste à documenter mon travail, notamment pour que Benjamin ou une autre personne puisse se servir de mon code à l'avenir ; trouver un moyen d'alimenter le device avec des batteries sans compromettre le fonctionnement des capteurs d'odeurs ; assembler la poubelle.

 

Enfin, au sujet d'autres tâches, j'aimerais travailler sur le compteur d'ouvertures, ce que je compte faire en attendant de pouvoir assembler le banc de test. Je me porte également volontaire pour participer à la réunion avec le support Acconeer, entreprise fabriquant le capteur de distance radar sur lequel Florian travaillait. Pour rappel, Florian n'a trouvé aucun moyen de le faire fonctionner et le support ne lui fournissait que des réponses vagues et incompatibles avec l'activité de leur entreprise.

 

Merci de votre lecture et bonne journée à tous : )"</i>

Contact avec l'entreprise qui s'occupe du réseau internet du Lab'O au sujet de la rupture de liaison entre l'ESP32 et mon ordinateur pour les prévenir et savoir quel pourraît être le souci.

<b>Découverte fascinante de Doxygen</b>

Petit point avec Filipe qui a trouvé la solution au problème des boutons et cams :
> <u>Constat initial</u> : les boutons et caméras n'envoient pas de trame via le réseau mais parviennent à se connecter à internet.

> <u>Problème</u> : la synchronisation avec l'heure réelle ne se fait pas correctement donc IoThink (le serveur réceptionnant les données) rejette la trame envoyée.

> <u>Solution trouvée</u> : synchroniser systématiquement l'horloge interne RTC avec celle du module SIM7080G, elle-même synchronisée via GSM à chaque réveil de la carte.

> <b>TRES INTERESSANT !!!</b>

Composants pour le banc de test-odeurs reçus, la fabrication va bientôt pouvoir commencer. Appel d'offre reçu pour le même dispositif mais mesurant des concentrations en hydrocarbures. 

<u>Tâches à accomplir</u> :
1. Travailler sur le compteur d'ouvertures
    - Chercher à réutiliser le contrôle d'accès en utilisant les broches du RFID en tant que GPIO et 
    - Programmer de mon côté
    - Réunir les deux codes
2. IoThink
    - Me débrouiller pour envoyer des données depuis le banc de test sur IoThink
    - Faire un décodeur et traiter des données
3. Détection d'hydrocarbures
    - Trouver et tester le bon MQx pour détecter des hydrocarbures et l'ajouter à un dispositif similaire
    - Étalonner le capteur pour ce but précis


## <u>Jour 38 - mercredi 16 août</u>

### Matin

Réunion avec un ingénieur d'Acconeer pour Florian, j'ai parlé anglais et suédois et compris des choses sur le fonctionnement du module XM125, notamment sur comment le programmer. Un petit CR a été transmis à Filipe.

### Après-midi

Brasage du dispositif de test.

## <u>Jour 39 - jeudi 17 août</u>

### Matin

Brasage du dispositif de test - quelques modifications et fin du brasage
Test concluent.

### Après-midi 

Travail sur le compteur d'ouvertures (le code de Benjamin est très compliqué à reprendre et débuguer, il est très brouillon).

## <u>Jour 40 - vendredi 18 août</u>

Travail sur le compteur d'ouvertures - portage et réécriture intégrale de plusieurs fonctions écrites de manière illisible et floue. Création d'une petite documentation avec Doxygen

## <u>Jour 41 - lundi 21 août</u>

### Matin

Réunion d'équipe, voici quelques notes :

<i>Ajouter VL53L0
Ajouter MQ-137
IoThink
Compteur ouvertures : aller voir Benjamin pour le PCB du bouton connecté
Traiter l'ouverture comme le compteur de butée, aussi bien mécaniquement que programmatiquement
Envoyer nmobre d'ouvertures dans la trame de vie
Reflasher les boutons connectés avec la liste traçabilité produits
Si connecté au port série que l'on vient de flasher, mise à jour de l(heuer et ça fonctionne TJS
Si je débranche, ça ne marche plus.
besoin d'appuyer plusieurs fois pour que le réseau soit capté parfois
Si problèmes, appelerwq
</i>

Travail sur l'alimentation par batteries. Solution indiquée par Benjamin pour utiliser une alim 5V : deux batteries en série, okay mais <b>surtout</b> avec un régulateur step-down pour s'assurer que la tension de sortie est stable. Composant (réglable) utilisé : LM2596 (breakout board).

### Après-midi

Assemblage de l'alimentation par batteries et ajout d'un interrupteur entre les deux batteries. Tout fonctionne normalement. Blocage du potentiomètre permettant de régler la tension de sortie du régulateur avec du joint de salle de bain (silicone ?).

Travail sur l'intégration du MQ-137 dans le code puis travail sur l'ajout du VL53L0X pour le taux de remplissage.

## <u>Jour 42 - mardi 22 août</u>

### Matin

Ajout du MQ-137 sur la carte et finalisation du code.
<u>NB</u>. Il est important de retirer le capteur MQ de sa carte (référence MQ-XL-V2.0) pour mesurer la résistance $R_L$ (potentiomètre RP2) avec les pads apparents les plus proches du texte "...<b>V2.0</b>". 

### Après-midi

Colle loctite JAMAIS sur PEx et PTx

## <u>Jour 43 - mercredi 23 août</u>

### Matin

Réglage de quelques raccourcis sur VSCodium pour le souligné, intalique et gras en Markdown à l'aide de <a href="https://stackoverflow.com/questions/57598673/vs-code-create-keyboard-shortcuts-for-bold-italics-underline">stack overflow</a>.
```json
    {
        "key": "ctrl+b",
        "scope": "markdown",
        "command": "editor.action.insertSnippet",
        "when": "editorTextFocus && editorLangId == 'markdown'",
        "args": 
        {
            "snippet": "<b>$TM_SELECTED_TEXT$0</b>"
        }
    },
```

Découverte des codes Markdown pour l'italique et le gras avec des astériques ou des underscores ainsi que du trait horizontal avec trois tirets, underscores ou astérisques.

### Après-midi

Assemblage et hydrofugation du boîtier du système de test
Configuration d'IoThink pour afficher des graphiques montrant l'évolution des grandeurs mesurées

## <u>Jour 44 - jeudi 24 août</u>

### Matin

Ajout d'un bouton extérieur au boîtier
Résolution d'un problème dans le code qui empêchait la carte de se réveiller aux heures prévues et calculait la durée de veille n'importe comment

### Après-midi

Autres modifications du code

## <u>Jour 45 - vendredi 25 août</u>

### Matin

Observation des trames reçues : trames de 5 h envoyées en double, trames de 11 heures en triple.
La date des trames est la bonne mais l'heure est légèrement anticipée (4 h 57 et 5 h)

Conclusion : la durée de veille était mal calculée à cause du temps d'exécution des fonctions qui suivent le moment où l'on récupère la date et l'heure dans une variable --> trop courte

Solution : augmenter le temps de veille de quelques minutes. Actuellement essai avec 10 minutes.

### Après-midi

Travail sur le rapport et vérification du bon envoi des trames

## <u>Jour 46 - lundi 28 août</u>

### Matin

Réunion hebdomadaire habituelle

<i>Mes tâches : 

Fixer tous les composants
virer les aimants

SAV boutons connectés - 0

visser le boîtier dans la poubelle - 1

Ajout de la mesure de la tension de la batterie et envoie sur IoThink
Modification du code de l'ESP pour faire un réveil toutes les six heures par timer

Compteur d'ouvertures : pas de verrouillage du tout - 3


Coder intégration VL53 en commentaires 1.5

Documentation - 2 (rapport de stage + code + schémas + documentation du calibrage/étalonnage)


Prendre rdv pour fiche métier

Envoyer en historique le nombre d'ouvertures par jour. Pas besoin de refaire le code.</i>

Travail sur les améliorations de bugs du banc de test


### Après-midi

Travail sur le compteur d'ouvertures

## <u>Jour 47 - mardi 29 août</u>

### Toute la journée

SAV sur les boutons connectés : mise à jour du firmware et identification des modules défectueux

## <u>Jour 48 - mercredi 30 août</u>

### Matin

Mise à jour du firmware des modules GSM sur les boutons défaillants ; réparation des boutons défectueux

Conclusion : tous fonctionnent parfaitement après ces réparations

## <u>Jour 49 - jeudi 31 août</u>

### Matin

Réunion débrief avec Filipe, très satisfait de notre travail :
<i>

Attitude et savoir-être +++
Très bien intégrés à l'équipe
bonne base technique
"coché toutes les cases"
Pas tout terminé pcq grande charge de travail mais obvious

Attitude de résolution de problèmes autonome

<u>Pour Gustavo</u> :
- Répartir le code dans des fonctions différentes
- Renommer les variables pour qu'elles soient claires
- Utiliser des macros #define
- Utiliser ArduinoJson
- JAMAIS de nombres magiques
- FreeRTOS pour utiliser les deux coeurs de l'ESP32

<u>Pour moi</u> :
- poster tous les fichiers où il faut
- MS Lists
- ESP Mesh
- ESP Mesh ?

Pour un entretien :
- j'aimerais être payé tant mais je sors d'école donc donnez-moi [moins] et si dans 6 mois si vous êtes satisfaits, renégocions

Ne pas aller dans les boîtes de conseil/consulting car on n'y apprend rien
Si passionné par la techno, aller au bout de la techno
Si on doute sur ses capacités, LE DIRE (sinon on n'a pas confiance en nous)

</i>

### Après-midi

Échange téléphonique avec notre tuteur, M. Christophe Léger

rédaction d'une notice sur l'étalonnage des capteurs MQ-x














# Quelques fonctions ESP32 utiles qui m'ont sauvé la vie

## Alimentation

### Déterminer la cause du réveil

```cpp
void afficher_cause_reveil(void)
{
    Serial.println("-------------- Affichage de la cause du réveil ------------\n");

    Serial.println("Itération n° " + String(compteur_cycles_effectues) + "\n");

    esp_sleep_wakeup_cause_t wakeup_reason = esp_sleep_get_wakeup_cause();

    switch (wakeup_reason)
    {
    case ESP_SLEEP_WAKEUP_EXT0:
        Serial.println("Réveil causé par un signal externe utilisant RTC_IO\n");
        break;
    case ESP_SLEEP_WAKEUP_EXT1:
        Serial.println("Réveil causé par un signal externe utilisant RTC_CNTL\n");
        break;
    case ESP_SLEEP_WAKEUP_TIMER:
        Serial.println("Réveil causé par le timer :)\n");
        break;
    case ESP_SLEEP_WAKEUP_TOUCHPAD:
        Serial.println("Réveil causé par le pad tactile\n");
        break;
    case ESP_SLEEP_WAKEUP_ULP:
        Serial.println("Réveil causé par le programme ULP\n");
        break;
    default:
        Serial.printf("Cause du réveil différente de la veille profonde : %d\n", wakeup_reason);
        Serial.println();
        break;
    }
}
```

### Connaître la date et l'heure actuelles

```cpp 
auto obtenir_date_et_heure_actuels() -> tm
{
    struct tm maintenant;
    if (!getLocalTime(&maintenant))
    {
        Serial.println("Obtension de la date actuelle impossible");
    }

    return maintenant;
}
```

```cpp
unsigned int calcul_numero_cycle_en_cours(tm maintenant)
{
    int numero_cycle_en_cours = 0;
    while (maintenant.tm_hour >= HEURE_PREMIERES_MESURES + numero_cycle_en_cours * INTERVALLE_HORAIRE_MESURES)
    {
        numero_cycle_en_cours++;
    }

    return numero_cycle_en_cours;
}
```

### Calculer une durée de veille avec RTC

```cpp
unsigned int calcul_duree_de_veille_RTC_secondes()
{
    Serial.println("------------- Calcul de la durée de veille RTC ------------\n");

    configTime(UTC_TZ_OFFSET, DAYLIGHT_OFFSET, NTP_SERVER);

    struct tm maintenant = obtenir_date_et_heure_actuels();
    delay(1000);
    Serial.println(&maintenant);

    DateTime date_et_heure_actuels(
        maintenant.tm_year + 1900,
        maintenant.tm_mon + 1,
        maintenant.tm_mday,
        maintenant.tm_hour,
        maintenant.tm_min,
        maintenant.tm_sec);

    DateTime date_et_heure_reveil(
        maintenant.tm_year + 1900,
        maintenant.tm_mon + 1,
        maintenant.tm_mday,
        //? réveil X fois par jour. Le calcul suivant rend possible cette propriété quelle que soit l'heure à laquelle on démarre et connecte l'appareil.
        (HEURE_PREMIERES_MESURES + calcul_numero_cycle_en_cours(maintenant) * INTERVALLE_HORAIRE_MESURES) % 24,
        0,
        0);

    if (date_et_heure_actuels >= date_et_heure_reveil)
    {
        Serial.println("Prochain réveil prévu demain à " + String(date_et_heure_reveil.hour()) + " heures");
        date_et_heure_reveil = date_et_heure_reveil + 86400;
    }
    else
    {
        Serial.println("Prochain réveil prévu aujourd'hui à " + String(date_et_heure_reveil.hour()) + " heures");
    }

    // Calcul de la durée jusqu'au prochain réveil
    unsigned int duree_de_veille_secondes = (date_et_heure_reveil - date_et_heure_actuels).totalseconds();

    Serial.println("Durée de veille : " + String(duree_de_veille_secondes) + " secondes\n");

    return duree_de_veille_secondes;
}
```

### Mettre l'appareil en veille profonde

```cpp
void mise_en_veille(int temps_de_veille_secondes)
{
    Serial.println("---------------------- Mise en veille ---------------------\n");

    ++compteur_cycles_effectues;

    esp_sleep_enable_timer_wakeup(temps_de_veille_secondes * SECONDES_EN_MICROSECONDES);
    Serial.println("===================== Fin du programme ====================\n\n");
    Serial.flush();
    esp_deep_sleep_start();
}
```

## Connexion en Wi-Fi

```cpp
void connexion_en_wifi(void)
{
    Serial.println("-------------------- Connexion en Wi-Fi -------------------\n");

    WiFi.begin(WIFI_SSID, WIFI_PASSWORD);
    Serial.println("En attente de connexion Wi-Fi...");
    while (WiFi.status() != WL_CONNECTED)
    {
    }
    Serial.println("Connexion établie !");
#ifdef DEBUG
    Serial.print("Adresse IP : ");
    Serial.println(WiFi.localIP());
#endif
    Serial.println();
}
```

## Envoi de données en http

```cpp
void http_post(String data_to_post, String server_path)
{
    Serial.println("----------------- Envoi des données en HTTP ---------------\n");

    http.begin(server_path.c_str());

#ifdef SERVER_ACCESS_KEY
    http.addHeader("Authorization", SERVER_ACCESS_KEY);
#endif

    int code_erreur = http.POST(data_to_post);
    if (code_erreur > 0)
    {
        Serial.println("Données envoyées :)\n");
        return;
    }

    int i = 0;
    while ((code_erreur != 200 || code_erreur != 304) && i++ < 4)
    {
        Serial.println("Erreur POST : " + String(code_erreur));
        Serial.println("Nouvel essai...");
        code_erreur = http.POST(data_to_post);
    }
    Serial.println();
}
```
## Demande de page HTTP

```cpp
void http_get(String server_path)
{
    http.begin(server_path.c_str());
    int code_erreur = http.GET();

    if (code_erreur <= 0)
    {
        Serial.println("Erreur GET : " + String(code_erreur));
        return;
    }

#ifdef DEBUG
    Serial.println("Contenu de la page web :\n");
    Serial.println(http.getString());
    Serial.println();
#endif
}
```

## JSON

```cpp
String mesures_json_string()
{
    Serial.println("--------- Prise de mesures et construction du JSON --------\n");

    StaticJsonDocument<64> json;

    Serial.println("Mesures en cours...");

    allumer_SHT();
    delay(1000);
    sht.read();
    json["temperature"] = sht.getTemperature();
    json["humidity"] = sht.getHumidity();
    eteindre_SHT();

    allumer_capteur_H2S();
    delay(1000);
    json["hydrogendisulfide"] = mesure_concentration_H2S_ppm();
    json["ammonia"] = mesure_concentration_NH3_ppm();
    eteindre_capteur_odeurs();
    // json["ammonia"] = mesure_concentration_NH3();

    String data_string;
    serializeJson(json, data_string);
    Serial.println("Mesures terminées :)\n");
    Serial.println("Objet à envoyer :");
    Serial.println(data_string + '\n');

    json.clear();
    return data_string;
}
```

## Lecture de tension sur le CAN de l'ESP32

```cpp
double lecture_tension_ADC1_corrigee(adc1_channel_t ADC_channel)
{
    double calibration = 1.06; // Adjust for ultimate accuracy when input is measured using an accurate DVM, if reading too high then use e.g. 0.99, too low use 1.01
    double vref = 1100;
    esp_adc_cal_characteristics_t adc_chars;
    esp_adc_cal_characterize(ADC_UNIT_1, ADC_ATTEN_DB_11, ADC_WIDTH_BIT_12, 1100, &adc_chars);
    vref = adc_chars.vref;
    adc_set_data_inv(ADC_UNIT_1, true);                                              // Obtain the device ADC reference voltage
    return (adc1_get_raw(ADC_channel) / 4095.0) * 3.3 * (1100 / vref) * calibration; // ESP by design reference voltage in mV
}
```
