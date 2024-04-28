# allow-usb

Un script Bash basique pour gérer les périphériques USB bloqués par USBGuard.

## Fonctionnalités

- Vérifie les périphériques USB bloqués par USBGuard.
- Affiche un avertissement en cas de détection de plusieurs périphériques USB non autorisés.
- Autorise le dernier périphérique bloqué ou permet de tester le processus.

## Prérequis

- [USBGuard](https://github.com/USBGuard/usbguard) installé et configuré.

## Utilisation

Exécutez le script depuis le terminal. Assurez-vous d'avoir les autorisations nécessaires pour accéder à USBGuard.

```bash
sudo ./allow-usb.sh
```
## Options disponibles :

    --test : Mode test. Affiche les actions qui auraient été effectuées sans les appliquer réellement.

## Installation

Aucune installation n'est requise. Téléchargez simplement le script et assurez-vous qu'il est exécutable.

```bash
chmod +x allow-usb.sh
```
## Exemples

```bash
sudo ./allow-usb.sh
```

```bash
sudo ./allow-usb.sh --test
```

## Contributions

Les contributions sont les bienvenues. Si vous trouvez un problème ou souhaitez améliorer le script, veuillez ouvrir une nouvelle issue ou envoyer une pull request.

## Licence

Ce projet est sous licence MIT.
