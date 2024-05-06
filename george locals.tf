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
