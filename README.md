# gcpkspl
1- Accessing resources at hashicorp site, assisting me in creating the GCP project</p>
[GCP project creation link ][https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_project]</p>
2- Created the project via applying the project module.</p>
3- Created the database instance and focused on the mysql, the version is listed. Reference-link = [https://cloud.google.com/community/tutorials/managing-gcp-projects-with-terraform]</p>
4- Added username and password components definitions to the database element.</p>
5- Added the cluster components to the strucutre</p>
6- Tag the 'docker image to recommended to prepare for upload to Google docker repo/registry.</p>
```
docker tag  dockerexercisetest/docker_exercise:latest gcr.io/gcpkspl/pett-app:latest
docker push gcr.io/gcpkspl/pett-app:latest
```
