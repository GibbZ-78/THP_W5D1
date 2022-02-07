# THP W5D1

## Rendu (validant) de Jean-Baptiste VIDAL pour le 1er jour de la 5ème semaine du cursus THP "Développeur" - Hiver 2022

### Information
- 6ème jour d'apprentissage de la POO Ruby (application de gossips... Encore)
- 3ème fois (et pas la dernière) que j'ajoute un Gemfile (pas super complet mais il jour son rôle) maintenant que j'en ai compris l'intérêt :smile:
- 1er essai de Sinatra : pas mal, simple d'utilisation, surtout avec ses complément 'rakeup' et 'shotgun'

### Disclaimer
- Ai instancié une arborescence Rspec mais n'ai pas utilisée la gem car tests unitaires sans intérêt à ce niveau d'exercice
- Pas d'utilisation de Rubocop : on peut écrire du code à peu près propre / normé sans se faire Bigbrotherer, que diable :wink:!
- Pas d'utilisation de Pry : franchement, vu les progs qu'on pond, pas utile d'avoir une exécution pas à pas & Co...
  
### Table of content
- db/gossip.csv - Fichier de sauvegarde des potins au format "id|author|content"
- lib/apps/applicationcontroller.rb - Classe intégrant toute la logique de traitement
- lib/apps/gossip.rb - Classe de gestion des potins (lecture de tous, ajout d'un, mise à jour ou effacement d'un potin donné)
- lib/views/*.erb - Ensemble des templates HTML (intégrant du Ruby) utilisés par l'application via les méthodes GET et POST
- README.md - Le charabia que tu es en train de lire... Et jusqu'au bout, en plus... Belle endurance :wink:!  

### How to
1. Clone the current repo
2. Before going farther ensure the 'config.ru' file is present at the root directory. Also check for the 'Gemfile'.
3. Make sur the "Bundle" gem is installed on your (virtual) machine
4. If so, then launch "bundle" or "bundler" in your xTerm windows to gather and bind all gems listed in the 'Gemfile'(*)
5. If all went well, you should now be able to launch the main program from the root directory by firing a violent "shotgun -p 4567" at your favorite xTerm :wink:
6. Now, lay back and let this gentle Gossip program bring (back?) light and joy into your life!

(*) Despite I'm using a ".gitignore" file, might be you need to delete the existing "Gemfile.lock" beforehand, if present...

_Enjoy, Wanderer :wink:_
