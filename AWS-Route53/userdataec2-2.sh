#!/bin/bash

sudo apt update -y
sudo apt install apache2 -y

sudo bash -c 'echo "<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Adarsha D Shetty - DevOps Engineer</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }
        .container {
            width: 80%;
            margin: auto;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        }
        h1 {
            color: #333;
        }
        h2 {
            color: #555;
        }
        .profile-links a {
            text-decoration: none;
            color: #0073b1;
            font-weight: bold;
        }
        .skills, .experience, .education {
            margin-bottom: 20px;
        }
        .skills ul {
            list-style-type: none;
            padding: 0;
        }
        .skills ul li {
            background: #0073b1;
            color: white;
            display: inline-block;
            padding: 5px 10px;
            margin: 5px;
            border-radius: 4px;
        }
    </style>
</head>
<body>

    <div class="container">
        <h1>Adarsha D Shetty</h1>
        <h2>DevOps Engineer</h2>
        <p>
            I am a DevOps Engineer with 2 years of experience, passionate about automating workflows, improving infrastructure, and delivering reliable solutions.
        </p>

        <div class="profile-links">
            <p>
                <strong>GitHub:</strong> <a href="https://github.com/adarshadshetty" target="_blank">github.com/adarshadshetty</a><br>
                <strong>LinkedIn:</strong> <a href="https://www.linkedin.com/in/adarsha-d-shetty-532909217/" target="_blank">linkedin.com/in/adarsha-d-shetty-532909217/</a>
            </p>
        </div>

        <div class="skills">
            <h2>Skills</h2>
            <ul>
                <li>AWS</li>
                <li>Docker</li>
                <li>Kubernetes (K8s)</li>
                <li>Ansible</li>
                <li>Python</li>
                <li>Java</li>
                <li>DSA</li>
                <li>Linux</li>
                <li>Monitoring (Grafana, Prometheus)</li>
                <li>CI/CD (Jenkins)</li>
                <li>Git & Git Bash</li>
                <li>Shell Scripting</li>
                <li>Terraform</li>
                <li>Microservices</li>
            </ul>
        </div>

        <div class="experience">
            <h2>Experience</h2>
            <p>DevOps Engineer with 2 years of experience, working on cloud infrastructure, automation, and continuous integration/delivery systems.</p>
        </div>

        <div class="education">
            <h2>Education</h2>
            <p>Completed my engineering degree with a focus on software development and system design.</p>
        </div>

    </div>

</body>
</html>
" > /var/www/html/index.html'

sudo systemctl restart apache2