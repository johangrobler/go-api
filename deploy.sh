# build docker
docker build -t fiber-hostname-app .

# run docker
docker run -p 3000:3000 fiber-hostname-appkubectl

# deploy to: nooka-docker-registry
# docker tag <my-image> registry.digitalocean.com/<my-registry>/<my-image>

docker tag fiber-hostname-app registry.digitalocean.com/nooka-docker-registry/fiber-hostname-app


# docker push registry.digitalocean.com/<my-registry>/<my-image>

docker push registry.digitalocean.com/nooka-docker-registry/fiber-hostname-app


kubectl --kubeconfig k8s-nooka-kubeconfig.yaml apply -f deployment.yml

kubectl --kubeconfig k8s-nooka-kubeconfig.yaml apply -f service.yml

kubectl --kubeconfig k8s-nooka-kubeconfig.yaml get svc fiber-app-service