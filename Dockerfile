FROM hashicorp/terraform:light
LABEL org.opencontainers.image.source https://github.com/eth-eks/terraform

COPY localstack.tf ./
RUN terraform init
ENTRYPOINT terraform apply -auto-approve
