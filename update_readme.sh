p#!/data/data/com.termux/files/usr/bin/bash

# Dossier du projet
PROJECT_DIR=~/F-society
cd $PROJECT_DIR || { echo "Dossier $PROJECT_DIR introuvable !"; exit 1; }

# Remplacer README.md avec le nouveau texte
cat > README.md << 'EOF'
Société F
Fsociety.sh - Mon script pour Termux.

Description
Ce projet contient un script Termux appelé Fsociety.sh.
Il automatise certaines tâches pratiques sur Termux.

Installation
Installer Termux (si ce n'est pas déjà fait) depuis le Play Store ou F-Droid.

Ouvrez Termux et mettez à jour les paquets, puis installez Git :

pkg update && pkg install git -y
Cloner le dépôt :
git clone https://github.com/Trad3Hustler/F-society.git
Aller dans le dossier du projet :
cd F-society
Rendre le script exécutable (si nécessaire) :
chmod +x F-society.sh
Utilisation
Lancer le script :

bash F-society.sh
Contribution
Les contributions sont les bienvenues !

Changelog F-society (v1.1 --> v1.4)

### 🟡 v1.1
- ASCII art remplacé par un banner rouge multi-lignes
- Lignes "=============================================" en jaune
- "by anonymous.dos" en vert
- Option 0 quitte proprement
- Menu plus esthétique

### 🟠 v1.2
- Menu en boucle : retour automatique au menu après chaque option
- Option 1 : affiche l’IP puis propose de revenir au menu
- Gestion des choix invalides : retourne au menu

### 🔵 v1.3
- Option 2 (Discord) ouvre automatiquement le lien sur Termux
- Compatible iSH (iOS) : affiche le lien à copier si ouverture automatique non disponible
- Menu et couleurs conservés

### 🔴 v1.4 🎭
- Script multi-shell complet (Termux + iSH)
- Menu infini avec retour automatique
- Option 1 : affiche IP + retour menu
- Option 2 : Discord auto sur Termux, affiche lien sur iSH
- Option 0 : quitte proprement
- Couleurs et ASCII art conservés
- Tag version v1.4 créé

Licence
MIT
EOF

# Ajouter, commit et push
git add README.md
git commit -m "Mise à jour du README avec changelog v1.1 → v1.4"
git push origin main

echo "README.md mis à jour et poussé sur GitHub !"
