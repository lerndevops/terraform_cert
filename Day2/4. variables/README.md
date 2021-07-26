## Different Data Types

* String: " Good Morning "
* list : an array of values like ["east", "west", "south"]. These will be represed as indexes [0], [1], [2]
* map: Dictionary of values like {trainer="Joe", age=30}
* number: numeric value like "12345"


## Variable Definition Precedence

### The above mechanisms for setting variables can be used together in any combination. If the same variable is assigned multiple values, Terraform uses the last value it finds, overriding any previous values. Note that the same variable cannot be assigned multiple values within a single source.

#### Terraform loads variables in the following order, with later sources taking precedence over earlier ones:

* Environment variables
* The terraform.tfvars file, if present.
* The terraform.tfvars.json file, if present.
*  Any *.auto.tfvars or *.auto.tfvars.json files, processed in lexical order of their filenames.
*  Any -var and -var-file options on the command line, in the order they are provided. (This includes variables set by a Terraform Cloud workspace.)



