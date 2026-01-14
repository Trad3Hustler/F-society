## Description
Ce projet contient un script Termux appelé `F-society.sh`.  
Il automatise certaines tâches pratiques sur Termux et propose des fonctionnalités OSINT comme l’IP lookup et l’analyse des IDs Discord.

---

## Installation
1. Installer Termux (si ce n'est pas déjà fait) depuis le **Play Store** ou **F-Droid**.
2. Ouvrir Termux et mettre à jour les paquets :

`bash
pkg update && pkg upgrade -y`

3. Installer Git et curl :

`bash
pkg install git curl -y`

4. Cloner le dépôt :

`bash
git clone https://github.com/Trad3Hustler/F-society.git`

5. Aller dans le dossier du projet :

`bash
cd F-society`

6. Rendre le script exécutable :

`bash
chmod +x F-society.sh`

7. Lancer le script :

`bash
bash F-society.sh`

---

## Utilisation
- Le menu s’affiche avec des options numérotées `[1]`, `[2]`, etc.  
- Couleurs :  
  - `[` et `]` → rouge  
  - Numéro → blanc  
  - Texte de l’option → jaune  
- Branding : `𝙖𝙣𝙤𝙣𝙮𝙢𝙤𝙪𝙨.𝙙𝙤𝙨` en vert  
- Menu interactif et retour automatique après chaque action

---

## Options principales
- `[1] YOUR IP` : Affiche ton IP publique  
- `[2] DISCORD SERVER` : Ouvre le lien du serveur Discord  
- `[3] IP LOOKUP` : Recherche détaillée sur une IP (IPv4 ou IPv6)  
- `[4] DISCORD ID OSINT` : Analyse un ID Discord et donne :
  - Date et heure de création  
  - Âge du compte  
  - Worker ID, Process ID, Increment  
  - Timestamps Discord et Unix  

---

## Contribution
Les contributions sont les bienvenues !  
Fork le projet et fais un pull request avec tes améliorations.

---

## Changelog

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

### 🔴 v1.4 
- Script multi-shell complet (Termux + iSH)
- Menu infini avec retour automatique
- Option 1 : affiche IP + retour menu
- Option 2 : Discord auto sur Termux, affiche lien sur iSH
- Option 0 : quitte proprement
- Couleurs et ASCII art conservés
- Tag version v1.4 créé

### 🟢 v1.5
- Ajout de l’**IP Lookup** qui fonctionne pour **IPv4 et IPv6**
- Vérification de validité des IP
- Affichage complet des informations IP (via ipinfo.io)

### 🟣 v1.6
- Menu stylé `[1] YOUR IP`, `[2] DISCORD SERVER`, etc.
  - `[` et `]` rouges, numéro blanc, texte des options jaune
- Branding changé : `by : ice` en vert
- Ajout de l’**option 4 : Discord ID OSINT**
  - Affiche date de création, âge du compte, worker ID, process ID, increment
- Code plus propre et structuré
- Améliorations de la navigation et de la compatibilité Termux

### 🟤 v2.0🔥

- Refonte et ajouts majeurs du script F-society.sh
- Ajout de l’indication de version V2 sous le logo
- Menu aligné en 3 colonnes pour une meilleure lisibilité
- Nettoyage de l’affichage (suppression des bugs de couleurs et textes trop longs)
- Suppression du branding inutile pour un rendu plus propre
- Option 4 renommée en DISCORD ID (OSINT retiré du titre)
- Nouvelles options :
- PHONE LOOKUP (+33)
- Analyse basique d’un numéro français avec affichage des informations publiques possibles
- Les données sensibles non accessibles sont affichées comme Unknown
- USERNAME OSINT
- Vérification réelle de l’existence d’un username sur : GitHub, Instagram, Twitter et TikTok
- Si le compte existe, le lien est affiché
- Si le compte n’existe pas, NOT FOUND est affiché
- Utilisation d’un User-Agent réel pour éviter les faux résultats
- EMAIL OSINT
- Fonctionne avec tous les fournisseurs courants : Gmail, Live, Outlook, Hotmail, Yahoo, etc.
- Affiche le domaine, le fournisseur et les enregistrements MX si disponibles
- FAKE ID
- Génération d’une fausse identité cohérente à partir d’un prénom et d’un nom
- Âge aléatoire entre 12 et 20 ans
- Numéro de téléphone commençant toujours par +33
- Username généré automatiquement (jamais NOT FOUND)
- Email cohérent avec le username
---

## Licence
MIT
EOF
