# Deploy Python Application on AWS EC2 

1. Launch EC2 Instances
2. Choose Amazon Linux with Free tier t2.micro in Mumbai Region.
3. Create a Key-Pair with .pem file
4. Enable 8501 port in Security Group
5. Add Elastic IP , Which does't change the IP address of EC2 instance .
6. Connect EC2 instance from the terminal with below command.

```
ssh -i "newaws.pem" ec2-user@PublicIPAddressOfYourInstance
```

```
sudo yum update -y
```

```
sudo yum upgrade -y
```

```
yum install git
```

```
git clone https://github.com/Spidy20/InNews.git
```

#### Check python & pip available in EC2 machine
```
python
```

```
yum install python3-pip
```

```
python3 -m pip
```

### Install all the requirement of the application
```
cd InNews/
```

```
python3 -m pip install -r requirements.txt
```

### Check the Application is Running
```
python3 -m streamlit run App.py
```

### Click on External URL