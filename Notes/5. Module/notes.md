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

# Sigils

Sigils are string operations that elixir has where I can make regular expressions or strings that can represent whatever character. To create a sigils a just need to write the ~ before a string and the following character define what kind o sigils is the strings.

```elixir
regular_expresion = ~r/hola|bye/ 
```

### Regular expressions

This is an expression that can contain a character set, it’s used when I want to limit my strings. It’s created by adding a r next to the sigils character `~r` and then, the regular expression. Here is an example:

```elixir
regular_name= ~r/Andres/i #the i at the end means without the uppercase or lowecase
result "Andres"== regular_name 
#result = true 
```

### Strings and Charlist

Using ~s before ( ) I can create strings as “”

```elixir
my_string = ~s(Hello, I can use "" and '' without any problem)
```

This also apply to create charlist, use ~c before ()

### Word List

using ~w I can create word list separated by spaces, this result a list of words

```elixir
my_list = ~w(Hello how are you)
#my_list =[hello,how,are,you]
```

If I add at the end of the brackets a data type character I can set what kind of data type I want in my word list

- c =char
- s =string
- a = atoms

```elixir
my_list = ~w(Hello how are you)a #a at the end of the ()
#my_list =[:hello,:how,:are,:you] #Array of atoms 
```

### Calendar and Time

with ~D I can create a calendar element with [yyy-mm-dd], here is an example:

```elixir
date = ~D[2022-10-10] 
date.year #I can index by the dot
```

this is equal to creating a time data type, but in this case using the ~T[hh:mm:ss:ms]

# Try, Catch and rescue

## Errors

The error occurs when something exceptional occurs in the code or I call the function `raise`

that create errors

```elixir
# exceptional error
result = "hola" + 1 #Try to sum a string with a number

# Create my own error
raise "auichi" #Create an error which error message it's auchi  
```

## Try-Catch

This is a way to handle errors and avoid the code crash. Instead of this I can write code to run in case any error occurs, the element has the common structure

```elixir
try do
	#Here goes the potentially dangerous 
	rescue 
	# Here goes the code in case that the potentially dangerous goes wrong and throw error
end 
```

Here is an example but with code

```elixir
try do 
	raise "error" #I created an error 
rescue 
	RuntimeError -> "Error!" #Pattern matchin if the core return RuntimeError
end
```

Many developers don’t use try-catch instead of, they use pattern matching with the case. They type a case where the potentially dangerous action returns an error and another case where it returns a good result.

## Create my own type of errors

If I want my own errors with descriptions and customizable names I can do this:

```elixir
defmodule Module.FirstError do
	defexception message: "This is my first Error"
end 

defmodule MyModule do
	def div(a,0) do
	 raise Module.FirstError  #Send error 
	end
	def div(a,b) do # Hasn't error return the value 
	 a/b 
	end
end 
```

## Types and specs

When I create functions inside modules I can write documentation (like I see in previous modules) but also I can write the output data type using the `@spec.` Here is an example:

```elixir
defmodule MyModule do
	@spect sum(number,number)::number #notice the :: before the type 
	def sum(a,b) do
		a+b
	end

@spect multiply(number,number)::number #notice the :: before the type 
	def multiply(a,b) do
		a*b
	end
end
```

For each function I can define the output data type

# Behaviour

This is something similar as interfaces in other programming languages, in this case I have a command to specify what method the slave modules should implemet (or have) to comply the behavior. Here is an example:

```elixir
defmodule MyMathModule.Master do
  # Here I write the methods that the slave have to implement
  @callback sum(number,number) :: number
  @callback multiply(number,number) :: number

end 
```

in This example, this module is the master and say that whatever module wants implement its behavior needs to implement the sum and multiply functions with these input arguments and data type.

```elixir
defmodule MyMathModule.Slave do
  @behaviour MyMathModule.Master
  def sum(a,b) do
    a+b
  end
  def multiply(a,b) do
    a*b
  end
end
```

This is the other module If I see, this module uses the methods that need to be implemented and has the command `@behaviour`  this means that this module implements the behavior of the master module