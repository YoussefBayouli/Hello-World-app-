
# Running Flask Hello World Application

This guide provides instructions for running a simple Flask "Hello World" application using Docker and Kubernetes.

## Prerequisites

Before you begin, ensure you have the following installed:

- Docker: For building and managing containers.
- Kubernetes cluster: You can use Minikube for local deployment or any managed Kubernetes service.
- `kubectl`: Command-line tool for Kubernetes.
- `minikube`: (Optional) For local Kubernetes testing.

## Running Locally with Docker

1. **Pull the Docker Image**

   Pull the Docker image containing the Flask application:

   ```bash
   docker pull spacegeekops/flask-hello-world:latest
   ```

2. **Run the Docker Container**

   Run the Docker container:

   ```bash
   docker run -d -p 5000:5000 spacegeekops/flask-hello-world:latest
   ```

3. **Access the Application**

   Open your web browser and navigate to `http://localhost:5000` to see the "Hello, World!" message.

## Deploying on Kubernetes

You can deploy the entire application stack with a single YAML document. Save the provided deployment.yaml and service.yaml files to your local machine, and then deploy them:

    kubectl apply -f kubernetes-all-resources.yml

Or you can choose what you want to deploy following the next steps 

1. **Create Namespace**

   If deploying on Kubernetes, create a namespace for the application:

   ```bash
   kubectl create namespace hello-world-flask
   ```

2. **Deploy the Application**

   Deploy the Flask application using the provided YAML file:

   ```bash
   kubectl apply -f deployment.yml -n hello-world-flask
   ```

3. **Expose the Application**

   Expose the application using a LoadBalancer service:

   ```bash
   kubectl apply -f service.yaml -n hello-world-flask
   ```

4. **Access the Application**

   - If using Minikube, get the URL by running:
     ```bash
     minikube service python-hello-world-service -n hello-world-flask
     ```

   - For other environments, check the LoadBalancer IP or hostname provided by your cloud provider.

## Testing and Verification

1. **Verify Pods and Services**

   Check the status of your pods and service:

   ```bash
   kubectl get pods,svc -n hello-world-flask
   ```

2. **Access the Application**

   Navigate to the URL or IP provided by your service exposure method to see the "Hello, World!" message.

## Cleanup

To delete the deployed resources:

```bash
kubectl delete all --all -n hello-world-flask
kubectl delete namespace hello-world-flask
```

## Conclusion

Follow the instructions provided in this guide to run the Flask application locally with Docker or deploy it on a Kubernetes cluster. Adjust the deployment parameters and configurations according to your specific production needs and environment.
