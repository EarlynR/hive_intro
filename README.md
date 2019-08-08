## Hive on AWS 

### Introduction 

This repository provides information on how to run Hive in an EMR cluster. This is for educational purposes only. This is a living document so the more I learn, the most information there will be. 

### Requirements 

- AWS Account
- AWS CLI

### AWS Services Used 

- EMR
- S3 
- EC2

### Programs 

- Datagrip 

### Steps 
* Upload files into [s3](http://holowczak.com/getting-started-with-hive-on-amazon-elastic-map-reduce-emr/). 
    * You can use AWS CLI
    * You can go to your account at AWS and upload them manually
* Create a key pair
    * Your computer will automatically download the pem file. Most likely it will go to the Downloads folder
* Move pem file in $HOME/.ssh 
* Change the permission
    * chmod 400 {keyfile}.pem
* Go to the EMR Services page 
* Create Cluster 
    * Choose the most recent release (1st choice)
    * Choose the core hadoop application (1st choice)
    * Choose m5.xlarge as instance type (1st choice)
        * Pricing [here](https://aws.amazon.com/emr/pricing/) in case you need it 
    * Choose 3 instance (default option)
    * Use key pair that you just created. 
* Send s3 files to EMR cluster 
* Run Hive queries 
