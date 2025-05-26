Documentation:
on this lab, i am creating a CI/CD pipeline on GCP with terraform

the tools i am using are:
1. google cloud platform (gke, gcs, IAM SA, artifact registry)
2. vscode
3. git
4. github actions

# Preparation
there are a few things that need to be configured before creating the CI Workflow, these things are:
1. GCP Service Account with editor role on IAM
2. Google cloud storage bucket for storing the terraform state
3. enabling the artifact registry API and gke API
4. forking the lab repo.
5. create dockerfile of the app.

# workflow
the workflow that i am creating consist of 3 jobs: infra, build and deploy. the workflow will be triggered when feature branch is pushed.

1. the infra job will provision GCP infra with terraform, the resources used on this terraform deployment are artifact registry for the docker repo and gke autopilot cluster, the terraform state are stored in the google cloud storage bucket that was created earlier. the output will provides the full Docker image path that will be used in the CI pipeline.

2. the build job will build the docker image for the application pushes it to the google artifact registry.

3. the deploy job will deploy the docker image that was created to the GKE cluster using the kubernetes manifests.

when all the jobs run properly,this workflow will automates the infrastructure provisioning, container image build and push, and application deployment to GKE. 

# Terraform
the terraform configuration will create:
1. storing the terraform state on GCS
2. google artifact registry for the docker repo
3. GKE autopilot kubernetes cluster for deployment 
4. creating output for the docker artifact registry URL and the gke cluster name.

# k8s
1. the k8s deployment.yaml will manage the gke cluster with the app dockerfile image running inside, exposed on port 3000.

2. the service.yaml will work as a load balancer service and exposes port 80 to public internet and forward the traffic to port 3000.

this two kubernetes manifests will ensure:
-There are always 2 running pods.
-Traffic is load balanced across the pods.
-If a pod fails, it is automatically replaced.

