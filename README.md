# Terraform CI/CD Demo Google Cloud

This repository demonstrates using Github Actions to create a CI/CD pipeline that deploys Terraform infrastructure to Google Cloud.

## Preparing Google Cloud to run the example

1. You will need a Google Cloud project. Note the Project ID, you will need it in your Terraform configuration. Make sure the Compute Engine API is enabled in your project.

1. Create a Cloud Storage bucket. It will be used for the Terraform backend state file. Note the bucket name as you will use it in your Terraform configuration. 

1. Create a Google Cloud Service account with Editor privileges. Generate a key, download it to your computer and rename the file `key.json`. You will need this file later.


## Preparing the GitHub Repo

1. Log onto your GitHub account.  

1. Navigate to thie following repository and fork it into your account: https://github.com/drehnstrom/terraform-cicd-demo-gcp 

1. Click on the __Actions__ menu. Then, click the __I understand my workflows, go ahead and enable them__ button. 

1. In your new repository, click on __Settings__, then __Secrets | Actions__.

1. Create a new repository secret with the name `GOOGLE_CREDENTIALS`. The value or the secret will be the contents of your `key.json` file, but with the new line characters removed. Use the following bash command to strip newline characters: `cat key.json | tr -s '\n' ' '`. Run this command from the folder where you saved your Service Account key file. 

1. Once the secret is created navigate to the file `space-invaders/provider.tf` in your GitHub repository. 

1. In the `backend` configuration, change the `bucket` value to the name of the bucket you created earlier. 

1. Now open the `space-invaders/terraform.tfvars` file and change the `project_id` variable to the id of your Google Cloud project. 


## Examing the CI/CD pipeline code file

1. Open the `.github/workflows/terraform.yaml` file.

1. Have a look at the code. The pipeline runs whenever there is a push or pull request. The __Checkout__, __Setup Terraform__, and __Terraform Init__ steps always run. The __Terraform Plan__ step only runs when there is a pull request. The __Terraform Apply__ step only runs when there is a push to the main branch. 


## Running the Pipeline

1. Create a new branch called `dev` and switch to it. 

1. From the Github website open the `space-invaders/terraform.tfvars` file. Click the edit button and change the value of `instance_count` from `0` to `1`. Commit the change. 

1. Click on the __Actions__ link. You should see your pipeline running. Click on it and you can see the detail. 

1. Now create a pull request to merge the dev branch into main. Once the pull request is created, again click the __Actions__ link. You should see the pipeline running again. Investigate the output of the __Terraform Plan__ step. 

1. Nothing has been created thus far because the __Terraform Apply__ step only runs on a push to main. Click one the __Pull requests__ menu and approve the merge. 

1. Again, click on the __Actions__ link and you should see the pipeline running. 

1. Go to your Google Cloud project. In __Compute Engine__ you should see a new virtual machine was created. In __VPC | Firewall__ you should see a new firewall rule was created. 


## Cleaning up the resources

1. Repeat the steps in the prior section, but change the `instance_count` variable in the `space-invaders/terraform.tfvars` file back to `0`. Make sure you make the edits on the dev branch. Commit the change, then make a pull request, and finally approve the pull request. 

1. Go to your Google Cloud project and verify that the Compute Engine virtual machine and the firewall rule have been deleted. 
 
