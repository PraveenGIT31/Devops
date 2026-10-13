# 🚀 DevOps Journey

> A sample website project to learn end-to-end deployment with **GitHub**, **Docker**, and **Kubernetes**.

![GitHub Actions](https://github.com/PraveenGIT31/Devops/actions/workflows/ci-cd.yml/badge.svg)

---

## 📁 Project Structure

```
Devops/
├── app/
│   ├── index.html          # Main landing page
│   ├── style.css           # Dark, glassmorphism styles
│   └── script.js           # Particle animation & interactions
├── Dockerfile              # Docker image (nginx:alpine)
├── .dockerignore           # Excludes unnecessary files from build
├── k8s/
│   ├── deployment.yaml     # Kubernetes Deployment (2 replicas)
│   └── service.yaml        # Kubernetes Service (NodePort)
├── .github/
│   └── workflows/
│       └── ci-cd.yml       # GitHub Actions CI/CD pipeline
└── README.md
```

---

## ⚙️ Prerequisites

| Tool | Version | Install |
|------|---------|---------|
| Docker Desktop | Latest | [docker.com](https://www.docker.com/products/docker-desktop) |
| kubectl | Latest | `brew install kubectl` |
| minikube | Latest | `brew install minikube` |

---

## 🛠️ Quick Start

### 1️⃣ Clone the Repo

```bash
git clone https://github.com/PraveenGIT31/Devops.git
cd Devops

# Open in browser directly
open app/index.html
```

---

### 2️⃣ Build & Run with Docker

```bash
# Build the Docker image
docker build -t devops-app:latest .

# Run the container locally
docker run -d -p 8080:80 --name devops-app devops-app:latest

# Visit the site
open http://localhost:8080

# Stop and remove container
docker stop devops-app && docker rm devops-app
```

---

### 3️⃣ Push Image to Docker Hub

```bash
# Login to Docker Hub
docker login

# Tag the image with your username
docker tag devops-app:latest <your-username>/devops-app:latest

# Push to Docker Hub
docker push <your-username>/devops-app:latest
```

> ⚠️ Replace `<your-username>` with your Docker Hub username everywhere.

---

### 4️⃣ Deploy to Kubernetes (Local — minikube)

```bash
# Start minikube
minikube start

# Apply all K8s manifests
kubectl apply -f k8s/

# Check pod status
kubectl get pods

# Get all resources
kubectl get all

# Open the app in browser
minikube service devops-service

# Or get the URL manually
minikube service devops-service --url
```

---

### 5️⃣ Useful kubectl Commands

```bash
# View running pods
kubectl get pods

# Describe a pod (debug info)
kubectl describe pod <pod-name>

# View pod logs
kubectl logs <pod-name>

# Scale up to 3 replicas
kubectl scale deployment devops-app --replicas=3

# Rolling update (after pushing a new image)
kubectl rollout restart deployment/devops-app

# Check rollout status
kubectl rollout status deployment/devops-app

# Rollback to previous version
kubectl rollout undo deployment/devops-app

# Delete all resources
kubectl delete -f k8s/
```

---

## 🔄 GitHub Actions CI/CD

The pipeline in [`.github/workflows/ci-cd.yml`](.github/workflows/ci-cd.yml) automatically:

1. **Triggers** on every push to `main`
2. **Builds** the Docker image
3. **Pushes** the image to Docker Hub

### Setup Required Secrets

Go to **GitHub → Settings → Secrets and variables → Actions** and add:

| Secret | Value |
|--------|-------|
| `DOCKER_USERNAME` | Your Docker Hub username |
| `DOCKER_PASSWORD` | Your Docker Hub password or access token |

---

## 🧠 Key Concepts Learned

| Concept | Technology | Key Files |
|---------|-----------|-----------|
| Source Control | GitHub | All files |
| CI/CD Automation | GitHub Actions | `.github/workflows/ci-cd.yml` |
| Containerization | Docker | `Dockerfile`, `.dockerignore` |
| Container Registry | Docker Hub | (pushed via Actions) |
| Container Orchestration | Kubernetes | `k8s/deployment.yaml`, `k8s/service.yaml` |
| Web Server | Nginx (alpine) | `Dockerfile` → `nginx:alpine` |

---

## 📚 Resources

- [GitHub Actions Docs](https://docs.github.com/en/actions)
- [Docker Get Started](https://docs.docker.com/get-started/)
- [Kubernetes Basics](https://kubernetes.io/docs/tutorials/kubernetes-basics/)
- [minikube Docs](https://minikube.sigs.k8s.io/docs/)
- [nginx Docker Hub](https://hub.docker.com/_/nginx)

---

## 🌐 Tech Stack

| Layer | Technology |
|-------|-----------|
| Website | HTML, CSS, JavaScript |
| Web Server | Nginx (Alpine) |
| Containerization | Docker |
| Registry | Docker Hub |
| CI/CD | GitHub Actions |
| Orchestration | Kubernetes |
| Local K8s | minikube |

---

*Built to learn. Deployed to inspire.* 🚀
