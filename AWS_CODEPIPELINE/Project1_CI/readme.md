## AWS Code Pipeline Project CI
<div align="center">
  <img src="./public/CIOnly1.jpg" alt="Logo" width="100%" height="50%">
</div>

### Python Flask Basic Application

#### Steps

AWS Account -> CodeBuild -> Build Project -> Create Project -> [Name -> Description -> Source-1 GitHub -> Public Repo -> Repo URL -> Authenticate with GitHub-> Manage default source credential]

AWS CodePipeline Invokes the AWS CodeBuild

Environment ->  like provide the env for CodeBuild it could be 
1. AWS EC2 machine or Docker image

Choose EC2 -> Ubuntu -> Standard -> Latest Image CodePipeline will run on this environment

Service Role -> New Service role -> 

BuildSpec ->  Write pipeline script here 

Create Credential in AWS SystemManager -> Parameter Store

Create Service Role -> IAM -> Roles -> Codebuild service attach here -> next

Attach System manager role to a CodeBuild ssm full access 
```
AmazonSSMFullAccess

CodeBuildBasePolicy-CI-ap-south-1

CodeBuildCodeConnectionsSourceCredentialsPolicy-CI-ap-south-1
```

Success you will see

