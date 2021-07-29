### Documentation : https://www.terraform.io/docs/cli/workspaces/index.html

#### By Default there will be a default workspace called "default"

    * terraform workspace list     -- to see list of all workspaces
    * terraform workspace show     -- to see current workspace
    * terraform workspace new dev  -- to create new workspace called dev (it creates and switches)
    * terraform workspace new prod  -- to create new workspace called prod (it creates and switches)
    * terraform workspace select default -- to go to default workspace
    
### All the details (in fact state files ) are stored in foder  "terraform.tfstate.d" with workspace named folders.
### default workspace details are stored in terraform.tfstate file as usual. 

![image](https://user-images.githubusercontent.com/45846027/127548518-1cc4f755-7993-4668-aa49-e606333c52fb.png)
![image](https://user-images.githubusercontent.com/45846027/127549383-03c23e77-9c64-4a25-a31a-8fbe7ae0a345.png)



