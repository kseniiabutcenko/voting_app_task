
I run the appliction in local cluster (minicube) 

For auto-scaling in Kubernetes, I use the Horizontal Pod Autoscaler (HPA). The HPA automatically scales the number of pods in a deployment or replica set based on observed CPU utilization or other select metrics.

1. But first I enable the addon: 

minikube addons enable metrics-server

2. Then I will add vote-hpa.yaml 

The HPA is targeting the vote deployment.
The number of replicas will be adjusted between 1 and 5.
The target CPU utilization is 50%. If the average CPU utilization exceeds 50%, the HPA will create additional pods. If it's below 50% and there are more than one replica, it will remove pods.

3. I applied that as 
kubectl apply -f vote-hpa.yaml

4. And can monitor via: 
kubectl get hpa
