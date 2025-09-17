terraform {
  required_version = ">= 1.0.0"
}

# ---------------------------
# Variables setup or create separate variable.tf
# ---------------------------

variable "names" {
  type    = list(string)
  default = ["dush", "kumar", "dev"]
}

variable "person" {
  type = map(string)
  default = {
    name = "dush"
    role = "engineer"
  }
}

# ---------------------------
# String Functions
# ---------------------------

output "upper_example" {
  value = upper("dushyant")     # DUSHYANT
}

output "lower_example" {
  value = lower("HELLO")        # hello
}

output "title_example" {
  value = title("hello world")  # Hello World
}

output "replace_example" {
  value = replace("my name", "name", "friend")  # my friend
}

output "substr_example" {
  value = substr("terraform", 0, 5)  # terra
}

# ---------------------------
# List / Collection Functions
# ---------------------------

output "join_example" {
  value = join(",", var.names)   # dush,kumar,dev
}

output "element_example" {
  value = element(var.names, 1)  # kumar
}

output "length_example" {
  value = length(var.names)      # 3
}

output "contains_example" {
  value = contains(var.names, "dev")  # true
}

output "concat_example" {
  value = concat(var.names, ["extra"]) # ["dush","kumar","dev","extra"]
}

# ---------------------------
# Map / Object Functions
# ---------------------------

output "lookup_example" {
  value = lookup(var.person, "role", "NA")  # engineer
}

output "keys_example" {
  value = keys(var.person)   # ["name","role"]
}

output "values_example" {
  value = values(var.person) # ["dush","engineer"]
}

# ---------------------------
# Numeric Functions
# ---------------------------

output "min_example" {
  value = min(5, 10, 2)   # 2
}

output "max_example" {
  value = max(5, 10, 2)   # 10
}

output "abs_example" {
  value = abs(-42)        # 42
}

output "ceil_example" {
  value = ceil(4.3)       # 5
}

output "floor_example" {
  value = floor(4.7)      # 4
}

# ---------------------------
# Other Handy Functions
# ---------------------------

output "coalesce_example" {
  value = coalesce("", "fallback", "other")  # fallback
}

output "format_example" {
  value = format("Hello, %s!", "Dushyant")  # Hello, Dushyant!
}

output "uuid_example" {
  value = uuid()   # Random UUID
}

output "timestamp_example" {
  value = timestamp()  # Current UTC timestamp
}

# ---------------------------
# Dynamic Lookup Function use in terraform
# ---------------------------

variable "userage" {
  type = map(number)
  default = {
    Dushyant = 26
    Ritu     = 24
  }
}

variable "username" {
  type    = string
  default = "Dushyant"
}

output "first_block" {
  value = "My name is ${var.username} and my age is ${lookup(var.userage, var.username, "NA")}"
}
