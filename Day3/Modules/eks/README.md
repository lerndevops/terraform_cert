![image](https://user-images.githubusercontent.com/45846027/127533751-06e6ff17-4598-4404-91bb-532e422ec1b8.png)


#### terraform init --upgrade=true
#### terraform plan
#### terraform apply --auto-approve    ---> This may take 10 mins to complete

## Configure kubectl on local terraform box

  * echo "deb http://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
  * curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
  * sudo apt-get update ; clear
  * sudo apt-get install -y kubectl

## Run the following command to retrieve the access credentials for your cluster and automatically configure kubectl.
  ####  aws eks --region $(terraform output -raw region) update-kubeconfig --name $(terraform output -raw cluster_name)
  ####  kubectl get nodes 
  ####  kubectl get pods --all-namespaces
  


