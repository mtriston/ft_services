# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    setup.sh                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mtriston <mtriston@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/11/05 12:04:19 by mtriston          #+#    #+#              #
#    Updated: 2020/12/01 21:40:28 by mtriston         ###   ########.fr        #
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

echo "................Building FTPS................"
docker build -t ftps ./srcs/ftps

echo "................Building Wordpress................"
docker build -t wordpress ./srcs/wordpress

echo "................Building PhpMyAdmin................"
docker build -t phpmyadmin ./srcs/phpmyadmin

echo "................Building MySQL................"
docker build -t mysql ./srcs/mysql

echo "................Building InfluxDB................"
docker build -t influxdb ./srcs/influxdb

echo "................Building Grafana................"
docker build -t grafana ./srcs/grafana

echo "................Kubernetes Claster Creation................"

echo "................Creation of Config Map (metallb)................"
kubectl apply -f ./srcs/yaml/configMap.yaml

echo "................Creation of Secrets................"
kubectl apply -f ./srcs/yaml/secrets.yaml

echo "................Creation of Nginx................"
kubectl apply -f ./srcs/yaml/nginx.yaml

echo "................Creation of FTPS................"
kubectl apply -f ./srcs/yaml/ftps.yaml

echo "................Creation of MySQL................"
kubectl apply -f ./srcs/yaml/mysql.yaml

echo "................Creation of PhpMyAdmin................"
kubectl apply -f ./srcs/yaml/phpmyadmin.yaml

echo "................Creation of WordPress................"
kubectl apply -f ./srcs/yaml/wordpress.yaml

echo "................Creation of InfluxDB................"
kubectl apply -f ./srcs/yaml/influxdb.yaml

echo "................Creation of Grafana................"
kubectl apply -f ./srcs/yaml/grafana.yaml
