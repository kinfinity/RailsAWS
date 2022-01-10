terraform{
    backend "s3" {
        bucket  = "kokouterraform"
        encrypt = true
        key     = "railsaws/state"
        region  = "eu-west-1"
    }
    
}