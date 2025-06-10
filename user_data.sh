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

# Installation de l'agent CloudWatch
cd /home/ec2-user
wget https://s3.amazonaws.com/amazoncloudwatch-agent/ubuntu/amd64/latest/amazon-cloudwatch-agent.deb
dpkg -i -E ./amazon-cloudwatch-agent.deb

# Création du répertoire de configuration
mkdir -p /opt/aws/amazon-cloudwatch-agent/etc

# Copie du fichier de configuration (tu le placeras ensuite manuellement sur la machine)
chown ec2-user:ec2-user /opt/aws/amazon-cloudwatch-agent/etc

# Démarrage de l'agent CloudWatch avec une configuration vide pour l’instant
/opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-ctl \
  -a fetch-config \
  -m ec2 \
  -c file:/opt/aws/amazon-cloudwatch-agent/etc/cloudwatch-agent-config.json \
  -s
