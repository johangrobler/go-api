docker build -t registry.digitalocean.com/nooka-docker-registry/fiber-hostname-app:v2 .


docker push registry.digitalocean.com/nooka-docker-registry/fiber-hostname-app:v2
 

kubectl --kubeconfig k8s-nooka-kubeconfig.yaml apply -f deployment.yml

kubectl --kubeconfig k8s-nooka-kubeconfig.yaml set image deployment/fiber-app fiber-app=registry.digitalocean.com/nooka-docker-registry/fiber-hostname-app:v2
 