Deployment Instructions:
Terraform:
Initialize Terraform: terraform init
Apply Terraform configurations: terraform apply
Helm:
Install/Upgrade Helm chart: helm upgrade --install voting-app ./voting-app

## Deployment Instructions

### **Terraform**:

- **Initialize Terraform**:
   ```
   terraform init
   ```
- **Apply Terraform configurations**:
   ```
   terraform apply
   ```
- **Install/Upgrade Helm chart**:
   ```
   helm upgrade --install voting-app ./voting-app
   ```

## Local Deployment example
 ```
 kubectl apply -f k8s-specifications/

        deployment.apps/db created
        service/db created
        deployment.apps/redis created
        service/redis created
        deployment.apps/result created
        service/result created
        deployment.apps/vote created
        service/vote created
        deployment.apps/worker created

% kubectl get deployments

NAME     READY   UP-TO-DATE   AVAILABLE   AGE
db       1/1     1            1           13m
redis    1/1     1            1           13m
result   1/1     1            1           13m
vote     1/1     1            1           13m
worker   1/1     1            1           13m



 kubectl get svc

NAME         TYPE        CLUSTER-IP       EXTERNAL-IP   PORT(S)          AGE
db           ClusterIP   10.96.161.223    <none>        5432/TCP         13m
kubernetes   ClusterIP   10.96.0.1        <none>        443/TCP          25m
redis        ClusterIP   10.111.130.91    <none>        6379/TCP         13m
result       NodePort    10.105.16.152    <none>        5001:31001/TCP   13m
vote         NodePort    10.109.126.121   <none>        5000:31000/TCP   13m

kubectl get pods
NAME                      READY   STATUS    RESTARTS   AGE
db-7fc468458-lx2jc        1/1     Running   0          13m
redis-66949686f7-wzrh2    1/1     Running   0          13m
result-6b9bc65689-ndsvk   1/1     Running   0          38s
vote-69dc45b49c-ds5lx     1/1     Running   0          13m
worker-6fc5d5b668-6h74p   1/1     Running   0          13m


 ```