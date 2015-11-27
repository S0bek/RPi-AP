# RPi-AP
Quelques scripts pour monter un AP sur Raspberry Pi
- Déposer tout ces fichiers et dossier dans le repertoire /etc/init.d du serveur
- Rendre exécutables tous les fichiers shell
- Lancer une exécution des scripts pour pouvoir tester leur fonctionnement

Les scripts ont besoin pour des paquets hostapd iw iw-tools et isc-dhcp-server pour pouvoir fonctionner.

Il faut aussi que:
- tous les fichiers de configuration AP aient été correctement modifiés,
- que l'adaptateur externe soit branché,
- que le module soit chargé dans le noyau de l’adaptateur externe,
- que l'adresse mac du RPi soit renseignée au niveau du routeur principal pour plus de contrôle,
- que l’adresse IP du RPi soit fixe,
- que les règles firewall iptables soient correctement définies
(normalement la politique de définition du NAT : activer l'ip forwarding dans proc sys --> propriété forward.)

Tout cela doit être suffisant pour que le point d'accès soit dores et déjà fonctionnel!

