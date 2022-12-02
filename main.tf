module "iam" {
    source = "./iam"
}

module "ec2" {
    source = "./ec2"
    instance_profile_name = module.iam.instance_profile
}

module "s3" {
    source = "./s3"
    bucket_name = "majoie2022"
    
}