#!/bin/bash

# Mise à jour du système
apt-get update -y
apt-get upgrade -y

# Installation outils utiles
apt-get install -y htop jq

# Création utilisateur parkauto-user
useradd -m -s /bin/bash parkauto-user
echo "parkauto-user ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/parkauto-user
chmod 440 /etc/sudoers.d/parkauto-user

# Configuration SSH pour parkauto-user (clé publique à ajouter manuellement dans ~/.ssh/authorized_keys)
mkdir -p /home/parkauto-user/.ssh
chmod 700 /home/parkauto-user/.ssh
touch /home/parkauto-user/.ssh/authorized_keys
chmod 600 /home/parkauto-user/.ssh/authorized_keys
chown -R parkauto-user:parkauto-user /home/parkauto-user/.ssh

# Exemple cron : sauvegarde fictive toutes les nuits à 2h (à adapter selon besoin)
echo "0 2 * * * /usr/bin/echo 'Backup script à personnaliser'" | crontab -u parkauto-user -

# Désactivation de la connexion par mot de passe SSH (forcer uniquement clé)
sed -i 's/^#PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config
systemctl reload sshd
