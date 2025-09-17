# Linux / Mac
#export TF_VAR_username=Dushyant

# Windows PowerShell
#$env:TF_VAR_username="Dushyant"

#terraform init
#terraform apply

#------------Passing a list from environment-------------------------

output "show_username" {
  value = "My username is ${var.username}"
}


#-------------------------------------

# Linux / Mac
#export TF_VAR_names='["Dushyant", "Ritu", "Aman"]'

# Windows PowerShell
#$env:TF_VAR_names='["Dushyant", "Ritu", "Aman"]'
#------------------------------------------

output "list_example" {
  value = "First name: ${var.names[0]}, All names: ${join(", ", var.names)}"
}
