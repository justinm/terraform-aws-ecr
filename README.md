terraform-aws-ecr - just another ECR module
-----

Examples
----------

    module "my_ecr_repository" {
        source = "justinm/aws/ecr"
        version = "0.2"
        
        name = "product/dashboard"   
    }
