echo "------------------- uninstall start --------------------"
echo "------------------- uninstall influxdb --------------------"
helm uninstall influxdb

# echo "------------------- uninstall grafana --------------------"
# helm uninstall grafana

echo "------------------- uninstall demo service --------------------"
kubectl delete -f https://raw.githubusercontent.com/ante-involutum/demo/main/deployment.yaml

# echo "------------------- uninstall jmeter cluster --------------------"
# kubectl delete -f jmeter/deployment.yaml

echo "------------------- uninstall files service --------------------"
kubectl delete -f https://raw.githubusercontent.com/ante-involutum/files/main/deployment.yaml

echo "------------------- uninstall tink service --------------------"
kubectl delete -f https://raw.githubusercontent.com/ante-involutum/tink/main/deployment.yaml

echo "------------------- uninstall console service --------------------"
kubectl delete -f https://raw.githubusercontent.com/ante-involutum/console/main/deployment.yaml

echo "------------------- uninstall nfs --------------------"
helm uninstall svc

echo "------------------- uninstall RBAC --------------------"
kubectl delete -f deployment/RBAC.yaml

# echo "------------------- uninstall pvc --------------------"
# kubectl delete -f deployment/nfs-pvc.yaml


echo "------------------- uninstall done --------------------"
