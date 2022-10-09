# IO Module

## Input Data

Using the gets function I can receive data from the console

```elixir
result= IO.gets("Input message")
```

## Output data

Using the puts function I can print values from the console

```elixir
IO.puts("Here is the output message")
```

Notice that If I want to print a function result or something like that I need to use the inspect function, as the following example:

```elixir
IO.inspect("The result is #{result}") #Print the result 
```

## File Module

This library/module allows handling external files as IO data.

When I want to open a file in a specific address and then modify or read the data I can use this module because it opens in binary mode. Here is an example:

```elixir
# Open the file 
{:ok, file} = File.open("/FileAddress/file",[:write]) #Notice the second argument

# Modify the file
err =IO.binwrite(file,"Hello, I'm a modification") #This return an error if it will occurs 

# Read the file
{err,data}=File.read("/FileAddress/file") #Get the file information 

# Close the file
File.close(file) # I don't need to use it more
```

Here is a simple way to handle files when I know that the files exist and don’t return an error

If I want a file handle with an error handler I can create this function with code if the file handler return error.

```elixir
case File.read("/FileAddress/file") do
	{:ok, data} -> "All goes good :) "
	{:error, reason} -> "All goes wrong :("
end
```

If the read operation return error, the response of the function will be {:error, reason} where “reason“ it’s the error message, If I have the {:ok, data} to store the function response the pattern matching doesn’t match and return an error.

# Path Module

This is a module for handler paths or file addresses. It has some functions but  this here are two of them

```elixir
response = Path.join("home", "myFile") #this return home/myFile

response = Path.expand("~/myFile") #This return the project address/myFile
```

## Module Attributes

In Elixir, I can set three module attributes and each one helps a specific aspect. The attributes are:

### Annotation

I can write a module description to help future developers or the user when typing the help function, here are the different annotations that I can write to my module

- `@moduledoc`  Provide documentation for the current module
- `@doc` Provide documentation for the next function or macro
- `@spec` Provide the return value data type of the next function or macro
- `@behaviour`  Provide the OTP or behavior

All of this attributes must be written as strings inside “” as the following example:

```elixir
defmodule My_Module do
  @moduledoc """
  This is a review of my module, you are welcome :D

	This module has different math functions 
  """

  @doc """
  mySum function sum 2 inputs element and return the result 
  """
  def my_Sum(a, b), do: a + b

	@doc """
  mySum function multiply 2 inputs element and return the result 
  """
  def my_Multiply(a, b), do: a * b

end
```

### Constants

In Elixir I can write constants before the function creation as an initial state, here are some examples:

```elixir
defmodule My_Module do
	@my_name Andres
	def say_hello do
		IO.inspect(@my_name)
	end
end
```

### Accumulating attributes

I can create an array with elements to use in my functions and add or remove elements. Here is the example creating this array

```elixir
defmodule My_Module do
	Module.register_attribute __MODULE__, :param_Array, accumulate: true

	def say_hello do
		@param_Array :Hello #Add new element to the array 
		IO.inspect(@my_name)
	end
end
```