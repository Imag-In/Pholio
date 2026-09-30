# Pholio

[English](README.md) · **Français**

**Vos photos, sur vos disques, sous votre contrôle.**

Pholio est une application de bureau pour organiser, parcourir et rechercher de grandes collections de photos et
de vidéos — des dizaines de milliers de fichiers — où qu'elles se trouvent : le disque de votre ordinateur, des
disques USB, un NAS ou n'importe quel partage réseau (l'un ou une combinaison, selon les performances attendues).

## Téléchargement

Les installeurs pour **macOS** (Apple Silicon et Intel), **Windows** et **Linux** sont joints à chaque
[release](../../releases/latest).

Dernière version : [![dernière release](https://img.shields.io/github/v/release/Imag-In/Pholio?label=Pholio&color=blue)](../../releases/latest)

| Plateforme | Téléchargement |
|---|---|
| macOS — Apple Silicon (M1 et suivants) | [pholio-macos-arm64.dmg](https://github.com/Imag-In/Pholio/releases/latest/download/pholio-macos-arm64.dmg) |
| macOS — Intel | [pholio-macos-x64.dmg](https://github.com/Imag-In/Pholio/releases/latest/download/pholio-macos-x64.dmg) |
| Windows 64 bits | [pholio-windows-x64.msi](https://github.com/Imag-In/Pholio/releases/latest/download/pholio-windows-x64.msi) |
| Linux 64 bits (Debian, Ubuntu, …) | [pholio-linux-amd64.deb](https://github.com/Imag-In/Pholio/releases/latest/download/pholio-linux-amd64.deb) |

Les versions précédentes, et une somme de contrôle pour chaque installeur, sont sur la
[page des releases](../../releases).

Les installeurs ne sont pas encore signés : votre système peut donc afficher un avertissement la première fois
que vous ouvrez Pholio.

- **macOS** — glissez Pholio dans *Applications* et ouvrez-le une fois ; quand macOS refuse, allez dans
  *Réglages Système → Confidentialité et sécurité* et cliquez sur *Ouvrir quand même* à côté du message
  concernant Pholio. Sur les versions plus anciennes de macOS, un clic droit sur l'application puis *Ouvrir*
  suffit.

  Ou, depuis le Terminal, levez une fois la quarantaine de téléchargement après l'installation — cela ne
  concerne que Pholio :

  ```bash
  xattr -dr com.apple.quarantine /Applications/Pholio.app
  ```

- **Windows** — sur l'écran « Windows a protégé votre ordinateur », cliquez sur *Informations
  complémentaires*, puis *Exécuter quand même*.

  Ou débloquez l'installeur téléchargé avant de le lancer — clic droit, *Propriétés*, cochez *Débloquer* — ou
  depuis PowerShell (cela ne concerne que ce fichier) :

  ```powershell
  Unblock-File -Path "$env:USERPROFILE\Downloads\pholio-windows-x64.msi"
  ```

## Fonctionnalités principales

- **Photothèques** — ajoutez les dossiers que vous voulez, sur autant de disques que vous le souhaitez ;
  Pholio les indexe et suit ce qui change. Plusieurs photothèques indépendantes peuvent coexister.
- **Une chronologie rapide** — toutes vos photos et vidéos dans une seule grille fluide, triée par date et
  regroupée par jour, qui reste réactive sur de très grandes collections. Double-cliquez pour l'affichage plein
  écran, naviguez avec les flèches du clavier.
- **Tout sur une photo** — date de prise de vue, appareil et réglages, informations sur le fichier, lieu sur
  une carte, et la liste complète des métadonnées enregistrées dans le fichier.
- **Corriger ce qui ne va pas** — corrigez une date de prise de vue, ajoutez ou modifiez un lieu, notez une
  photo ; le lieu et la note peuvent aussi s'appliquer d'un coup à la sélection de toute une journée.
- **Lieux** — les positions sont traduites en noms de lieux sans aucune connexion Internet ; une recherche de
  lieux en ligne peut être ajoutée pour des adresses plus précises.
- **Personnes et animaux** — les visages et les animaux sont détectés et regroupés sur votre propre
  ordinateur ; nommez une personne une fois et toutes ses photos deviennent trouvables.
- **Recherche** — tapez un mot, un lieu, une personne, ou combinez des filtres comme une note minimale ou un
  dossier (`plage r:4+`, `p:Alice path:Vacances`). Le `?` à côté de la barre de recherche explique tout.
- **Favoris**, thèmes clair et sombre, anglais et français.

## Vos fichiers restent les vôtres

Pholio ne touche jamais aux images elles-mêmes : aucun réencodage, aucun redimensionnement, aucun
déplacement ni renommage dans votre dos. Son propre index vit dans une base de données séparée.

Quand vous modifiez quelque chose — une date, un lieu, une note, des mots-clés ou des personnes — Pholio
l'écrit dans le fichier, dans les champs de métadonnées standard que comprend toute application photo
sérieuse. Votre travail n'est donc pas enfermé dans Pholio : un autre outil de catalogage, aujourd'hui ou dans
dix ans, lira les mêmes informations.

## Pourquoi une application de bureau

Pholio n'est volontairement **pas** un service cloud.

La plupart des applications photo actuelles veulent que vos images soient envoyées sur les serveurs de
quelqu'un d'autre avant de pouvoir les organiser. Pholio fait l'inverse : il travaille directement sur les
supports que vous possédez déjà — disque interne, disques externes et USB, NAS, partages réseau —, les indexe
correctement et vous permet de tout retrouver en quelques secondes, hors ligne.

L'objectif est d'abord de reprendre le contrôle de vos propres photos. Publier ensuite une sélection dans le
cloud, quand *vous* le décidez, est bienvenu — comme une étape de plus, pas comme un prix d'entrée.

## Une réécriture, avec l'IA

Pholio est la réécriture d'un ancien projet personnel. Cette nouvelle version a été construite avec une aide
importante d'assistants de programmation IA : ils ont écrit une grande partie du code, sous une direction et
une relecture attentives. C'est une expérience grandeur nature de ce qu'un développeur seul peut construire
de cette façon.

## Open source — mais pas ici, pas encore

Pholio est open source. Son code source n'est pourtant **pas** publié sur GitHub, et c'est un choix délibéré.

Utiliser l'IA pour aider à écrire le code est une chose. Laisser ce code servir à entraîner des modèles d'IA
en est une autre, et cela devrait nécessiter l'accord de l'auteur. La politique de GitHub sur l'utilisation des
dépôts hébergés pour l'entraînement de l'IA n'est pas assez claire pour offrir cette garantie ; ce dépôt
n'héberge donc que les installeurs et les notes de version.

Les sources seront bientôt disponibles sur une instance Gitea auto-hébergée — un lien sera ajouté ici.

## Notes de version

Chaque release est accompagnée de ses notes, également conservées dans [`release_note/`](release_note/).

## Crédits

Pholio repose sur de nombreuses bibliothèques open source, des modèles de reconnaissance et des données
cartographiques ouverts : voir [CREDITS.md](CREDITS.md) — également consultable dans l'application, via le
`?` des Paramètres.
