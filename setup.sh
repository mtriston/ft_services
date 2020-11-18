# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    setup.sh                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mtriston <mtriston@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/11/05 12:04:19 by mtriston          #+#    #+#              #
#    Updated: 2020/11/18 21:25:32 by mtriston         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!bin/bash

echo "................Minikube starting................"
minikube start	--vm-driver=virtualbox --cpus=2 --memory 4000
eval $(minikube docker-env)
minikube addons enable metallb
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"

echo "................Launch Dashboard................"
minikube dashboard &

echo "................Building Docker Images................"

echo "................Building Nginx................"
docker build -t nginx ./srcs/nginx

echo "................Building Wordpress................"
docker build -t wordpress ./srcs/wordpress

echo "................Building PhpMyAdmin................"
docker build -t wordpress ./srcs/phpmyadmin

echo "................Building MySQL................"
docker build -t mysql ./srcs/mysql

echo "................Kubernetes Claster Creation................"

echo "................Creation of Config Map (metallb)................"
kubectl apply -f configMap.yaml

echo "................Creation of Secrets................"
kubectl apply -f secrets.yaml

echo "................Creation of Nginx................"
kubectl apply -f nginx.yaml

echo "................Creation of MySQL................"
kubectl apply -f mysql.yaml

echo "................Creation of WordPress................"
kubectl apply -f wordpress.yaml

echo "................Creation of WordPress................"
kubectl apply -f phpmyadmin.yaml

