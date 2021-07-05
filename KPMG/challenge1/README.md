GCP terraform architecture written in scripts is having below componentes:

Layer1: 
A set of frontend VMs load balanced under HTTPS external load balancer.
I have used centOS machine directly, but it is recommended to create an image out of our code build first.

Layer2:
A set of frontend VMs load balanced under HTTPS external load balancer.
I have used external LB so that mobile app also can use backend APIs.
If we don't have mobile app then we can use HTTPS internal LB.
I have used centOS machine directly, but it is recommended to create an image out of our code build first.

Layer3:
A Cloud SQL server which stores the database.
Here I have created a Cloud SQL DB but we can create any DB we want.

Layer1 can can communicate with layer2 only by mentioning Layer2 LB endpoint/ideally DNS record which points to Layer2 LB in its code.
Layer2 can communicate with Layer3 by using DNS record which points to Cloud SQL LB/IP address in its code.

In order to run the code you should have a service account file with specific access/roles.