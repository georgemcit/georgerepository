variable "simple_nested_list" {
  type    = list(list(string))
   default = [["a", "b"], ["c", "d"], ["e", "f"]]
}
variable "map_presidents_countries" {
  type    = list(list(string))
   default = [["Obama","Justin","Kim jong Un"], ["United States","Canada", "North Korea"]]
}
variable "number_list" {
  type    = list(list(string))
   default = [[2,2,2],[1,2,3],[2,3,2],[3,1,3]]
}
variable "nested_list" {
  type    = list(list(string))
  default = [["a", "b"], ["c", "d"], ["e", "f"]]
}

variable "nested_map" {
  type    = map(map(string))
  default = {
    group1 = {"name" = "Alice", "age" = "25"}
    group2 = {"name" = "Bob", "age" = "30"}
    group3 = {"name" = "Charlie", "age" = "35"}
  }
}
locals{
   simple_local_flattened_list = flatten(var.simple_nested_list)
   number_list = flatten(var.number_list)
   flattened_list = flatten(var.nested_list)
   flattened_map  = flatten([for k, v in var.nested_map : [for kk, vv in v : { group = k, key = kk, value = vv }]])
   characters = ["luke", "yoda", "darth"]
  enemies_destroyed = [4252, 900, 20000056894]
  character_enemy_map =   { for index,character in local.characters: # Convert character list to a set
      character => local.enemies_destroyed[index]
  }
}
locals{
  total_output = [724,238,219,291,555]
}
output "sumotest"{
    value=sum ([for numberoutput in local.total_output: (numberoutput)])
}
output "simple_local"{
    value = local.simple_local_flattened_list
}
output "flattened_list"{
    value = local.flattened_list
}
output "flattened_map"{
    value = local.flattened_map
}
