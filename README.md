This is a starter template for [Learn Next.js](https://nextjs.org/learn).




# Static Code Analysis Integration using SonarQube with Next.js

For this we will be using SonarQube sever (community version) and snoarqube-scanner packages. SonarLint is also a good plugin that can be integrated to your favourite IDE for development.

## Installation
Install SonarQube server. You can find the installation guide in the official documentation.(https://docs.sonarqube.org/latest/setup-and-upgrade/install-the-server/).

runSonarqube.sh has been added build and run docker instance for your local development. You can run it as bash command. (eg. bash ./runSonarqube.sh)

Install sonarqube-scanner npm package. You can download the scanner from the official website.(https://www.npmjs.com/package/sonarqube-scanner)

## Setup Configuration

After building docker instance, we can set up configuration to run the scanner using sonarqube via port 9000 (http://localhost:9000/projects?view=leak)

You can find the configuration guide in the official documentation. (https://docs.sonarqube.org/latest/try-out-sonarqube/   )

