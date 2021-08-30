# faasdtf
You will need to have a Hetzner API key and SSH key already set up. To run, clone this repo and add terraform.tfvars file that contains your API key. It should look something like this:

```
hcloud_token = "<your-token-here>"
```

You will want to update vars.tf to your preferred server name, server type and SSH key. 

Then you can run `terraform init` and `terraform plan` to see what is going to be created. If it looks good, run `terraform apply` to create the server. 

After `terraform apply` returns the IP address, login in to that server using ssh and get the generated password with `cat /var/lib/faasd/secrets/basic-auth-password`. With the password, login as user `admin` to `http:<ip address>:8080\ui` 

The OpenFaas UI lets you create functions and you can also use the faas-cli. When you are done, you can delete the server with `terraform destroy`.  

```
```
