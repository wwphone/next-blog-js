#!/bin/bash

: '
This will build or run your docker instance for Sonarqube which will be used for code coverage and code analysis.

Once your instance is up and running, Log in to http://localhost:9000 using System Administrator credentials:

login: admin
password: admin

The password will needed to be reset. (eg: wework)
Analyzing a project
Now that youre logged in to your local SonarQube instance, let`s analyze a project:

Select Create new project.

Give your project a Project key and a Display name and select Set up.
Under Provide a token, select Generate a token. Give your token a name, select Generate, and click Continue.
Select your project`s main language under Run analysis on your project, 
and follow the instructions to analyze your project. Here you`ll download and execute a scanner on your code 
(if you`re using Maven or Gradle, the scanner is automatically downloaded).

Reference: https://docs.sonarqube.org/latest/try-out-sonarqube/

Scanner Command Example:  npx sonar-scanner \
  -Dsonar.projectKey=pa-web-v2 \
  -Dsonar.sources=. \
  -Dsonar.host.url=http://localhost:9000 \
  -Dsonar.token=sqp_441b1af0cbcdd1a08a75ff2b8265ae1483a51d96

The above command is excuted using npm scanner package: sonarqube-scanner (https://www.npmjs.com/package/sonarqube-scanner)
'


name='sonarqube'

if ! docker ps -a --format '{{.Names}}' | grep -q "$name"; then
  echo "Building the image..."
  docker run --name $name -e SONAR_ES_BOOTSTRAP_CHECKS_DISABLE=true -p 9000:9000 "$name:latest"
fi


if [[ "$(docker ps -q -f name=$name)" == "" ]]; then
  echo "Starting the container..."
  docker start -ai $name
else
  echo "Container already running."
fi