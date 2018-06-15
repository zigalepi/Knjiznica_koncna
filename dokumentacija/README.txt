Moja Knjižnica
V projketu smo poskušali vspostaviti knjižnico, kjer uporabniki lahko dajo knjige v posojo ali pa si jih sami izposodijo.
Storitve so na voljo le registriranim uporabnikom, prav tako imajo ti možnost komentiranja in dodajanja na seznam želja, 
medtem ko imajo neregistrirani uporabniki le vpogled do komentarjev in knjig; do vnosa/dodajanja knjig, profila pa sploh nimajo dostopa.

Kako zaèeti
Za testno uporabo "Moje knjižnjice" na osebnem raèunalniku potrebujemo razvoijalno okolje, kot je IntelliJ IDEA ali Eclipse. Celoten projekt iz GitHub uvozimo v željeno razvijalno okolje in poženemo "KnjiznicaNoviApp" v desnem zgornjem kotu. Pazimo, da zaženemo aplikacijo le enkrat, saj drugaèe bo port na katerem želimo tesitrati že poln in aplikacija bo vrnila napako. Po konèanem nalaganju se nam na "local port-u", v našem primeru se ta nahaja pod številko v Spring datoteki imenovani "application.properties" pod "resources" ali viri - v tem primeru se port glasi 2223.

Pred zagonom
V razvijalnem okolju potrebujem JDK - Java Development Kit, ki ga je potrebno izbrati pri zagonu projetka. Dostopno na: http://www.oracle.com/technetwork/java/javase/downloads/index.html
Navodila za dodajanje JDK, èe ga nismo izbrali ob odprtju projekta: https://www.jetbrains.com/help/idea/configuring-mobile-java-sdk.html

Prav tako potrebujemo Spring, saj je temelj za povezovanje naših spletnih strani s podatkovno bazo. 
Spring dodamo v projekt po naslednjih korakih: https://www.tutorialspoint.com/spring/spring_hello_world_example.htm

Za spreminjanje podatkovne baze uporabimo MySQL Workbench, kjer so razvidne vse tabele s podatki aplikacije. Dostopno na: https://www.mysql.com/products/workbench/

Implementacija in uporaba Moja knjižnica trenutno ni možna na strežniku, saj je še v postopku razvoja. 

Znane napake: èe na enem raèunalniku delate z JDK verzji 10, in preklopite na drugem na nižjo verzijo, je možno, da nekateri deli ne bodo dealli, saj je JDK razlikuje. Zato prosimo, da preverite, da imate JDK poenoten na vseh raèunalnikih.

Zgrajeno z
Spring - The web framework used
Maven - Dependency Management
Java - general-purpose computer-programming language
JSP -  technology that helps software developers create dynamically generated web pages based on HTML
JavaScript - a high-level, interpreted programming language used to make webpages interactive
CSS - a style sheet language used for describing the presentation of a document written in a markup language like HTML
HTML - the standard markup language for creating web pages and web applications.
MySQL - an open-source relational database management system

Dodajanje
Projekt je možno spreminjati, vendar nove verzije ni možno potisniti na GitHub, sej bi se lahko koda pomešala. Èe mislite, da ste našli rešitev za kakšno napako ali ste najdli izboljšavo, prosimo da nas kontaktirate na enega izmed sledeèih e-mail naslovov: toni.ivcetic@gmail.com, gasper.reher@gmail.com, marko.zemljaric@gmail.com, ziga.susin@gmail.com. Vaša kontribcija bo razvidna v spremembah (Changelog, version control) in na koncu dokumenta v Zahvalah.

Verzije
GitHub

Avtorji
Anton Haramija Ivèetiæ - front end, dokumentacija, kotrole verzij
Marko Zemljariè - front end
Gašper Reher - back end, baza, povezava med front endom in bazo
Žiga Šusin - back end, poenotenost izgleda front enda

Licenca
Ta projekt je pod licenco Fakultete za elektrotehniko, raèunalništvo in informatiko. Je odprtokoden, dostopen za lastno uporabo vseh, ne pa za tržne namene.

Zahvale
Cobiss - za inspiracijo iskalnih funkcij knjig.