resource "aws_s3_bucket" "test" {
    bucket = "my-unique-bucket-name"  //BUCKET NAME MUST BE UNIQUE; also acl key has been depreciated, by default set to private. 
    tags   = {  //s3 bucket name tag
        Name        = "test-bucket"
    }
  
}