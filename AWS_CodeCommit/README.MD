# Overview

# AWS CodeCommit is Managed AWS Service

1. AWS provides a comprehensive set of CI/CD services that enables developers to automate and streamline their software delivery processes.
2. AWS CodePipeline , AWS CodeBuild , AWS CodeDeploy are the key services involved in achieving CI/CD on AWS Platform

### CodeCommit is same same as GitHub (Private Repo no public repo)

3. CodeCommit is used to Deploy the source code

4. For Jenkins pipeline we use 'CodePipeline'
5. For Building application maven -> 'AWS CodeBuild'
6. AWS Code Deploy -> ArgoCD for application Deploy

#### Adavantage
   - Managed Git
   - Scalability
   - Reliability

Go to root aws -> IAM account -> codecommit -> create repo -> 

When you Create repo with root account you will get warninig like this ...
Image

7. You can upload a file from UI as well and also from terminal 
8. Repository created in root account, not possible to clone.
9. IAM Policy -> CodeCommit PowerUser.

10. 
```
git clone httpsURL
```

11. Disadvantage 
   - Less Feature
   - AWS Restricted
   - Less Integrations with services outside AWS
   - It has multiple problem with integration


