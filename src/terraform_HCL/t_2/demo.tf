
output "name" {
        value = "my name is ${var.name}"
}


#passing list to variable

output "first_block" {
		value = " hi ${var.name2[0]}" # passing the 0 index string from list
}
