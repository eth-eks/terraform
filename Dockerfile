FROM hashicorp/terraform:light

COPY localstack.tf ./
RUN terraform init
ENTRYPOINT terraform apply -auto-approve
