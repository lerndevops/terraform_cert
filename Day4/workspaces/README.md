### Documentation : https://www.terraform.io/docs/cli/workspaces/index.html

#### terraform workspace list     -- to see list of all workspaces
    * By Default there will be a default workspace called "default"
    
#### terraform workspace show     -- to see current workspace
#### terraform workspace new dev  -- to create new workspace called dev (it creates and switches)
#### terraform workspace select default -- to go to default workspace


##### All the details (in fact state files ) are stored in foder ### terraform.tfstate.d with workspace names.
