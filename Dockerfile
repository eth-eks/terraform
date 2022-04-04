FROM hashicorp/terraform:light
LABEL org.opencontainers.image.source https://github.com/eth-eks/terraform

COPY providers.tf ./
RUN terraform init
COPY localstack.tf ./
ENTRYPOINT terraform apply -auto-approve
