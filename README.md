# Projet ParkAuto

## Description

Ce projet ParkAuto est une application déployée sur AWS avec une infrastructure Kubernetes (EKS) automatisée via Terraform. 

L'objectif est de gérer une application microservices pour la location de véhicules avec CI/CD complet via GitHub Actions.

## Ce qui a été réalisé

- Création de l'infrastructure AWS avec Terraform :
  - VPC avec sous-réseaux publics et privés
  - Cluster EKS (Kubernetes) dans la région `eu-west-3`
  - Bucket S3 pour les backups avec versioning activé

- Automatisation CI/CD avec GitHub Actions :
  - Provisionnement de l’infrastructure via Terraform
  - Construction et push des images Docker sur un registry (GitHub Container Registry ou DockerHub)
  - Déploiement des manifests Kubernetes sur le cluster EKS
  - Exécution des tests Maven sur les microservices

## Prérequis

- AWS CLI configurée avec des clés d’accès IAM
- Compte DockerHub ou GitHub Container Registry avec un token d’accès
- GitHub Secrets configurés (AWS credentials, DockerHub credentials, kubeconfig encodé en base64)

## Utilisation

1. Modifier les fichiers Terraform pour personnaliser l’infrastructure si besoin
2. Pousser les changements sur la branche `main` pour déclencher la CI/CD
3. Surveiller le pipeline GitHub Actions pour vérifier le déploiement

---

Projet en cours de développement dans le cadre d’une formation DevOps.
