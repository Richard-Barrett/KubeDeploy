# CKA Cheatsheet 

## Common Questions:

1. Create a service messaging-service to expose the messaging application within the cluster on port 6379.

ANS:
```bash
kubectl expose pod messaging --port=6379 --name messaging-service
```

2. Create a static pod named static-busybox on the master node that uses the busybox image and the command sleep 1000

ANS:
```bash
kubectl run --restart=Never --image=busybox static-busybox --dry-run -o yaml --command -- sleep 1000 > /etc/kubernetes/manifests/static-busybox.yaml
```

3. Expose the hr-web-app as service hr-web-app-service application on port 30082 on the nodes on the cluster

ANS:
```bash 
Run the command 

kubectl expose deployment hr-web-app --type=NodePort --port=8080 --name=hr-web-app-service --dry-run -o yaml > hr-web-app-service.yaml 

to generate a service definition file. Then edit the nodeport in it and create a service.
```

4. Use JSON PATH query to retrieve the osImages of all the nodes and store it in a file /opt/outputs/nodes_os_x43kj56.txt

ANS:
```bash
Run the command 

kubectl get nodes -o jsonpath='{.items[*].status.nodeInfo.osImage}' > /opt/outputs/nodes_os_x43kj56.txt
```
