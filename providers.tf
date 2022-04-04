provider aws {
  access_key                  = "test"
  region                      = "us-west-1"
  secret_key                  = "test"
  s3_force_path_style         = true
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true
  endpoints {
    s3                     = "http://127.0.0.1:4566"
    sqs                    = "http://127.0.0.1:4566"
  }
}
