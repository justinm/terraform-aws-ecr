terraform-aws-ecr - just another ECR module
-----

Basic Uses
----------

    module "my_ecr_repository" {
        source = "justinm/aws/ecr"
        version = "0.2"
        
        name = "product/dashboard"   
    }