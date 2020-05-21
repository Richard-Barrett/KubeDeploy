# Pod Templates

## kubectl Pod Commands 
* Run an Nginx Pod
```
kubectl run nginx --image=nginx --generator=run-pod/v1
```
* Run a Redis Pod
```
kubectl run redis --image=redis --generator=run-pod/v1
```

## Describe Pods
```
kubectl describe pod <pod_name>
```

## Delete Pods
```
kubectl delete pod <pod_name>
```

## Edit Pods
```
kubectl edit pod <pod_name>
```
