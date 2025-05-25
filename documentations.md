Documentation:
on this lab, i am creating a CI/CD pipeline on GCP with terraform

# Preparation
there are a few things that need to be configured before creating the CI Workflow, these things are:
1. GCP Service Account with editor role on IAM
2. Google cloud storage bucket for storing the terraform state
3. enabling the artifact registry API and gke API

# workflow
the workflow that i am creating consist of 3 jobs: infra, build and deploy. the workflow will be triggered when feature branch is pushed.

1. the infra job will provision GCP infra with terraform, the resources used on this terraform deployment are artifact registry for the docker repo and gke autopilot cluster, the terraform state are stored in the google cloud storage bucked that was created earlier. the output will provides the full Docker image path that will be used in the CI pipeline.


2. the build job will build the docker image for the application pushes it to the google artifact registry.

3. the deploy job will deploy the docker image that was created to the GKE cluster using the kubernetes manifests.

when all the jobs run properly,this workflow will automates the infrastructure provisioning, container image build and push, and application deployment to GKE. 