locals{
  total_output = [724,238,219,291,555]
}
output "sumotest"{
    value=sum ([for numberoutput in local.total_output: (numberoutput)])
}
