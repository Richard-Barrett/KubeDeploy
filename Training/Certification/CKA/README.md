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
kubectl run --restart=Never --image=busybox static-busybox --dry-run=client -o yaml --command -- sleep 1000 > /etc/kubernetes/manifests/static-busybox.yaml
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

5. Create a deployment named hr-web-app using the image kodekloud/webapp-color with 2 replicas

ANS: 
```bash
kubectl create deployment hr-web-app --image=kodekloud/webapp-color
kubectl scale deployment hr-web-app --replicas=2
```

6. Create a POD in the finance namespace named temp-bus with the image redis:alpine.

ANS: 
```bash
kubectl run temp-bus --image=redis:alpine --namespace=finance
```

You can check it by running the following:
```bash
kubectl get pods --namespace=finance
```

7. A new application orange is deployed. There is something wrong with it. Identify and fix the issue.

ANS:


8. Create a Persistent Volume with the given specifications:
- Volume Name: pv-analytics
- Storage: 100Mi
- Access modes: ReadWriteMany
- Host Path: /pv/data-analytics

ANS:
Make a file called pv-analytics.yaml
```bash
apiVersion: v1
kind: PersistentVolume
metadata:
  name: pv-analytics
spec:
  capacity:
    storage: 100Mi
  volumeMode: Filesystem
  accessModes:
  - ReadWriteMany
  persistentVolumeReclaimPolicy: Delete
  storageClassName: local-storage
  local:
    path: /pv/data-analytics
  nodeAffinity:
    required:
      nodeSelectorTerms:
      - matchExpressions:
        - key: kubernetes.io/hostname
          operator: In
          values:
          - master
```

The `kubectl apply -f` on the file:
```bash
kubectl apply -f pv-analytics.yaml
```

You should see output similar to this:
```bash
master $ kubectl apply -f pv-analytics.yaml
persistentvolume/pv-analytics created
```
