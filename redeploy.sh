docker build -t  registry.digitalocean.com/nooka-docker-registry/fiber-hostname-app:v3 .

docker run -p 8080:8080  fiber-hostname-app:v3


docker push registry.digitalocean.com/nooka-docker-registry/fiber-hostname-app:v3
 

kubectl --kubeconfig k8s-nooka-kubeconfig.yaml apply -f deployment.yml

kubectl --kubeconfig k8s-nooka-kubeconfig.yaml set image deployment/fiber-app fiber-app=registry.digitalocean.com/nooka-docker-registry/fiber-hostname-app:v2
 
kubectl  --kubeconfig k8s-nooka-kubeconfig.yaml rollout status deployment/fiber-app
