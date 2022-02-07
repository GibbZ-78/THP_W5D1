# THP W4D5

## Rendu (non-validant) de Jean-Baptiste VIDAL pour le 5ème jour de la 4ème semaine du cursus THP "Développeur" - Hiver 2022

### Information
- 5ème jour d'apprentissage de la POO Ruby (application de gossips)
- 2ème fois (et pas la dernière) que j'ajoute un Gemfile (pas super complet mais là quand même) maintenant que j'en ai compris l'intérêt :smile:

### Disclaimer
- Ai instancié une arborescence Rspec mais n'ai pas utilisée la gem car tests unitaires sans intérêt à ce niveau d'exercice
- Pas d'utilisation de Rubocop : on peut écrire du code à peu près propre / normé sans se faire Bigbrotherer, que diable :wink:!
- Pas d'utilisation de Pry : franchement, vu les progs qu'on pond, pas encore utile d'avoir une exécution pas à pas & Co...
  
### Table of content
- db/gossip.csv - Fichier de sauvegarde des potins au format "author|content"
- lib/apps/controller.rb - Classe intégrant toute la logique de traitement
- lib/apps/gossip.rb - Classe de gestion des potins (lecture de tous, ajout d'un et [WIP] effacement d'un potin donné)
- lib/apps/router.rb - Classe dirigeant l'utilisateur vers les différentes options, selon ses choix dans le menu
- lib/views/show.rb - Classe gérant les interactions (affichages, questions...) avec l'utilisateur
- README.md - Le charabia que tu es en train de lire... Et jusqu'au bout, en plus... Belle endurance :wink:!  

### How to
1. Clone the current repo
2. Make sur the "Bundle" gem is installed on your (virtual) machine
3. If so, then launch "bundle" or "bundler" to gather and bind all gems listed in the Gemfile(*)
4. If all went well, you should now be able to launch the main program by throwing a "ruby app.rb" at your favorite xTerm :wink:
5. Now, lay back and let this simple Gossip program bring (back?) light and joy into your life!

(*) Despite I'm using a ".gitignore" file, might be you need to delete an existing "Gemfile.lock" beforehand...

_Enjoy, Wanderer :wink:_
