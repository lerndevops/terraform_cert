#### Terraform can get the module from various sources.
https://www.terraform.io/docs/language/modules/sources.html

* The source argument in a module block tells Terraform where to find the source code for the desired child module.

* Terraform uses this during the module installation step of terraform init to download the source code to a directory on local disk so that it can be used by other Terraform commands.

##### The module installer supports installation from a number of different source types, as listed below.

* Local paths (Default)

* Terraform Registry

* GitHub

* Bitbucket

* Generic Git, Mercurial repositories

* HTTP URLs

* S3 buckets

* GCS buckets
