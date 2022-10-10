# Module 5

# Protocols

Protocols are similar to functions with guards because the output or behavior will change based on some condition. In this case base on the data type. Here is an example of this

```elixir
defprotocol MyProtocol do
	# Here I define my functions for my protocol 
	def typeOf(data) #This function behavior will change based on the input data type 
end

# Here I define the behavior based on the data type 
defimpl MyProtocol, for: Integer do #Here is a little module but only for integer
	def typeOf(_data), do: "My Integer"
end

# Here I define the behavior based on the data type 
defimpl MyProtocol, for: String do #Here is a little module but only for string
	def typeOf(_data), do: "My String"
end
```

Notice that protocols are something like a big module with created functions and the ***defimpl*** are little sub-modules with the behavior of each function based on the input data type.

## Protocols with multiple input data

I can create protocols with functions that receive multiple input data, when this occurs the data type selection is based on the **FIRST INPUT DATA**.

## Protocols with structs

As I saw previously structs create maps of a customizable data type, in this case, If I want to work with structs, I will need to create a specific function for the struct data type, because remember that

structs aren’t map data types.  Here is an example:

```elixir
# Create the struct 
defmodule My_Struct do
	defstruct [name:,age:,lastname:]
end

# Create the protocol 
defprotocol My_Protocol do
	# Here I define my functions for my protocol 
	def typeOf(data) #This function behavior will change based on the input data type 
end

# Here I define the behavior based on the data type 
# Integer Behavior
defimpl My_Protocol, for: Integer do #Here is a little module but only for integer
	def typeOf(_data), do: "My Integer"
end

# String behavior
defimpl My_Protocol, for: String do #Here is a little module but only for string
	def typeOf(_data), do: "My String"
end

# Strcut behavior
defimpl My_Protocol, for: My_Struct do #little module but only for customizable struct
	def typeOf(_data), do: "My Struct map"
end
```

Notice that If want to use protocols I need to specify the data type, this could be difficult if I want to define all of data type. Instead of this I can use the any and the methods related to this. Here are some examples about that

```elixir
# any behavior
defimpl My_Protocol, for: any do #little module but that match to any other data type
	def typeOf(_data), do: "Other data types"
end
```

Note: This method should be at the top of the protocol list because matches the desired and not desired data types.

Another way to use any is fallback to any, here is the example:

```elixir
# any behavior
defimpl My_Protocol, for: any do #little module but that match to any other data type
	@fallback_to_any true #This means that the following functions works for any data type
	def typeOf(_data), do: "Other data types"
end
```

# Comprehension

This is an operation into enumerate data structures to generate, filter, and collect using the ***for*** word which loops list/tuple and makes any operation.

### Generator

In the generator operation, the result is a new enumerate element which is the result of any operation. Here is an example:

```elixir
response = for n <- [1,2,3,4], do: n*n
# response = [1,4,9,16] 
```

Notice the comprehension operator **for** that has the n variable which means the n element in the loop.

Also, this supports pattern matching to make operations into enumerating elements that satisfy the match. Here is an example

```elixir
my_list = [yes: 1, no: 2, yes: 3, yes: 4, no: 5]
response = for {:yes,n} <- my_list, do: n*n #Do the operation only when has the key yes: 
# response = [1,9,16]
```

Finally I can make multiples comprehension operations like this example:

```elixir
response = for i <- [:a, :b, :c], j <- [1, 2], do:  {i, j}
# response = [a: 1, a: 2, b: 1, b: 2, c: 1, c: 2]
```

### Filter operations

Another way to use the for operator is to filter inside a list:

```elixir
my_list = [1,2,3,4]
response = for n <- my_list, rem(n,2)==0, do: n*n 
# response = [1,9,16]
```

Notice that the operation will be executed when the guard will be true

### Collectable operation (into)

I can use the into keyword with the comprehension operator to store the result in a different variable, here is an example of creating a map

```elixir
response = for {key,val} <- %{"a"=>1,"b"=>2}, into %{}, do: {key, val*val}
#response = %{"a"=>1,"b"=>4}
```

Notice that into specify where I want to store the result and do: specify what I want to do with the loop values.