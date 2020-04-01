# DevOps_Microservices_Project
[![HatWithPins>](https://circleci.com/gh/HatWithPins/DevOps_Microservices_Project.svg?style=svg)](https://circleci.com/gh/HatWithPins/DevOps_Microservices_Project)

This is repo is made for the Cloud DevOps Engineer Nanodegree Program module 5: Microservices at Scale using AWS & Kubernetes. The project deploys a machine learning model (the app.py file) in a kubernetes cluster. The ML model takes some imputs about the house market and use them to make a prediction about the pricing in Boston.

To run this locally, you will need Python3, Pylint, Hadolint, Docker, Kubernetes and Minikube. Then you must follow the next steps inside a terminal:

1. git clone https://github.com/HatWithPins/DevOps_Microservices_Project
2. cd DevOps_Microservices_Project
3. python3 -m venv ~/.devops
4. source ~/.devops/bin/activate

Then, inside the virtual enviroment, you can type "make install" to install and build dependencies. Makefile also contains a **lint** section. Also, the pylint par have an extra --disable=W1202. This is because the logging in app.py triggers some warnings. If you have installed hadolint locally and want to use it, uncomment the **hadolint Dockerfile** in Makefile. Now, for running and triying the whole system, there are three scripts:

* **run_docker.sh** builds and expose the web app. It takes the configuration from Dockerfile and expose the 80 port to recieve the prediction petition.
* **run_kubernetes.sh** does the same as above, but with a kubernetes cluster instead.
* **make_prediciton.sh** can be used to test the deploymen.

The other relevan files in this repo are **upload_docker.sh** to upload the docker image to Docker Hub (you should modify the dockerpath inside this file if you want to upload to another repository) and /.circleci/config.yml. About the last one, the original code in the source repository (https://github.com/udacity/DevOps_Microservices.git) had some problems in the building and in the linting, so I ended making a separate hadolint job (called **lint**) to check Dockerfile and, in the build job, there is an additional installation during the checkout space. It seems that CircleCI uses *setuptools*, so this additional installation helps with that. In fact, this was giving me some trouble until I found this information here https://discuss.circleci.com/t/pip-install-fails-in-ci-runs-fine-in-ssh/665
