# Normal Generating
response = for n <- [1,2,3,4], do: n*n
IO.puts("The result of this operation is: #{response}")

# Generating with condition (guard)
my_list = [yes: 1, no: 2, yes: 3, yes: 4, no: 5]
response = for {:yes,n} <- my_list, do: n*n #Do the operation only when has the key yes:
IO.puts("The result of this operation with guard is: #{response}")

# Multiple Comprehension
response = for i <- [:a, :b, :c], j <- [1, 2], do:  {i, j}
IO.puts("The result of multiple comprehension is: #{response}")
