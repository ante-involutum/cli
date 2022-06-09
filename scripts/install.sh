echo "kakax will be install start..."

echo "install nfs-server-provisioner..."
helm repo add nfs-ganesha-server-and-external-provisioner https://kubernetes-sigs.github.io/nfs-ganesha-server-and-external-provisioner/
helm install svc nfs-ganesha-server-and-external-provisioner/nfs-server-provisioner -f deployment/nfs-values.yaml
echo "install nfs-pvc..."
kubectl apply -f deployment/nfs-pvc.yaml

echo "install RBAC..."
kubectl apply -f deployment/RBAC.yaml

echo "------------------- install influxdb --------------------"
helm repo add bitnami https://charts.bitnami.com/bitnami
helm install influxdb bitnami/influxdb

echo "------------------- Get the influxdb credentials --------------------"
echo "User: admin"
echo "Password: $(kubectl get secret influxdb --namespace default -o jsonpath="{.data.admin-user-password}" | base64 --decode)"
echo "Token: $(kubectl get secret influxdb --namespace default -o jsonpath="{.data.admin-user-token}" | base64 --decode)"

# echo "------------------- install grafana --------------------"
# helm install grafana bitnami/grafana

echo "------------------- install demo service --------------------"
kubectl apply -f https://raw.githubusercontent.com/ante-involutum/demo/main/deployment.yaml

# echo "------------------- install jmeter cluster --------------------"
# kubectl apply -f https://raw.githubusercontent.com/ante-involutum/jmeter/main/deployment.yaml

echo "------------------- install files service --------------------"
kubectl apply -f https://raw.githubusercontent.com/ante-involutum/files/main/deployment.yaml

echo "------------------- install tink service --------------------"
kubectl apply -f https://raw.githubusercontent.com/ante-involutum/tink/main/deployment.yaml

echo "------------------- install  done --------------------"