#1. install terraform
#2. `terraform init`
#3. `terraform apply`


resource aws_sqs_queue "queues" {
  for_each = toset(var.queues)

  name                      = each.key
  delay_seconds             = 10
  max_message_size          = 4096
  message_retention_seconds = 86400
  receive_wait_time_seconds = 10
  #  redrive_policy = jsonencode({
  #    #deadLetterTargetArn = aws_sqs_queue.terraform_queue_deadletter.arn
  #    maxReceiveCount     = 4
  #  })

  tags = {
    Name = each.key
  }
}

variable queues {
  type = list
  default = [
    "alerts",
    "payment_sync",
    "trade_sync",
    "transfer_sync"
  ]
}

provider aws {
  access_key                  = "test"
  region                      = "us-west-1"
  secret_key                  = "test"
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true
  endpoints {
    sqs                    = "http://127.0.0.1:4566"
  }
}
