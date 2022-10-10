# Module 3

# Modules and functions

Modules are functions group that do similar jobs, to create a module here is an example:

```elixir
defmodule MyModule do 
	
	# Write the functions here
	
	# Write the functions here

	# Write the functions here
	
end
```

Notice that I wrote the module name with the **first letter in uppercase, in Elixir this is mandatory**, If I don’t do that, the module cannot be found and return an error.

# Functions

In Elixir, functions are expressions that receive data by arguments and return a value or some values, to create them I can type def or dep according if I want a public function (def) or a private function

```elixir
# Create a public function 
def mySum(a,b) do 
		a + b 
	end	
end

# Create a private function 
defp myPrivateFunc() do
	"Hi I'm a private function"
end
```

Notice that when I create a private function I can use them only inside the module, If I want to use it outside the module, it returns an error.

Also, functions can be created with guards, remember that guards are conditions that determine if the function can be executed or not. Here is an example:

```elixir
defmodule MyMathModule do
  def zero?(0) do #This is a function that will be executed if the input argument is zero
    true
  end

  def zero?(x) when is_integer(x) do #This is a function that will be executed 
    false                            #if the guard is true
  end
end
```

Notice the ‘?’ at the end of the first function, this is a notation that helps to the developer that this function returns a Boolean

## Default arguments in functions

When I create functions I can create an input parameter with default values as in other programming languages, notice that If the function receives an argument at the called moment the default value will be changed by the new input parameter. Here is an example to clarify it:

```elixir
defmodule MyModule do 
	def sumTwo(a, b \\\\ 2) do  # The default value is the b argument that has a two value 
		a + b # sum both numbers 
	end
end

result = MyModule.sumTwo(1) # Sum 1 + 2 (default value) 

result = MyModule.sumTwo(1,3) # Sum 1 + 3 (the default value is changed by the input value)
```

# Elixir’s Projects (usually) Organization

Usually, the Elixir’s project has this file folders distribution:

1. **Folder _build:** Here are stored compilation artifacts
2. **Folder lib:** Here is stored the elixir code (.ex files)
3. **Folder test:** Here are stored the test files (.exs files)

# Function Capturing

If I have a named function I can save it in a variable, using the & ass the following example:

```elixir
MyMathModule.zero(0) # This is the function I created in the previous example

myFunc = &MyMathModule.zero?/1 #I'm storing the address of the function that receives 
															 #1 argument and store in the variable

result = myFunc.(0) # Use the function as a anonymous function, withe the dot before ()
```

If I see in the anonymous function something like a &1 ,&2, etc. This means the first, second, etc input argument of the function. Here is an example:

```elixir
captured = &(&1 + 1) #capture the expresion that sum +1 at the first input argument

result = captured.(1) #sum 1 + 1 
```

# Recursion

In elixir, the normal loops don’t exist because the iterator variable has to change, violating the immutability of Elixir’s property. Instead of the normal loops, we use recursive functions to make a loop. Here is an example looping a number list to sum each one

```elixir
defmodule MyMatchModule do
  def sum_list([head | tail], accumulator) do
    sum_list(tail, head + accumulator)
  end

  def sum_list([], accumulator) do
    accumulator
  end
end
```

Remember that list can be used as a head-tail data structure, in this case, I use it to separate the head in each iteration to sum with the accumulator. Finally when the list is empty Elixir executes the second function because the matching it’s true and returns accumulator stopping the iteration .

# Enumerates and Streams

## Enumerables

Enumerables are collections, this means, data structures with enumerables position. Some examples are lists, tuples, maps, etc. Each position has a number and I can count each one to know the element dimension.

To handle these data structures easily Elixir has the Enum module where I can find some functions, here are some examples:

```elixir
result = Enum.map([1, 2, 3], fn x -> x * 2 end)
# result = [2,4,6]
```

This function [Enum.map](http://Enum.map) takes an input map and apply the function in the second argument to each element. In this case, take the input number and return it multiplied by two.

This function work with whatever enumerate data structure such as list, tuples, maps, etc.

## Pipe Operator

The following operator works as a normal pipe, this means the left side result is sending to the right side as a input

```elixir
|>
```

## Streams

Streams are a module as Enum but in this case, the result of any function is something like a stream object (an element of stream data type). This is very useful when I want to make some operations with pipes, the intermedium result doesn’t matter if it’s a list or stream or whatever else. At the end when a stream object is used as an Enum input parameter the result is a normal list. Here is an example:

```elixir
iex> 1..100_000 |> Stream.map(&(&1 * 3)) |> Stream.filter(odd?)

# First create a list of numbers from 1 to 100.000
# Second this list is sent to a map function that multiplies each element by 3
# Third the result of second ste[ is filter creating a new list with the odd numbers
```

# Processes

Processes are something as threads, the base of concurrent programming

## Spawn

This function create a new process that take a function and execute it in another process and **when the function ends** returns a PID (process identifier)

```elixir
result = spawn(fn -> 1 + 2 end) # This example function doesn't need input parameters
# result = <0.40.0> #This is the process identifier 

Process.alive?(result) #Function to know if a selected process it's alive
false
```

### Send data between process

When I want to send data I need to use the function send/2 as the following example:

```elixir
pid_self =self()
message ={:hello, "Andres"}
pid= spawn(send(pid_self,message)) #Create a process and send itself data 
```

When I want to send data I have two arguments:

1. pid_self: The first argument it’s de process identifier that I want to send information
2. message: The second argument it’s the data to send

### Receive data between process

When I receive data the information it’s stored in the mailboxes and waits until clauses match the received message to execute the code, if the message never matches the receiver process stops until a message matches successfully. To open the mailbox I should use the receive function as the following example:

```elixir
receive do #This is the mailbox 
	{:hello, "Andres"} -> "Hello Andres" # This is the clauses
	{:hello, "Juan"} -> "Hello Juan" # This is the clauses
	{:bye, "Ana"} -> "Bye Ana" # This is the clauses
end
```

Remember, if any clauses match the receiver process waits until any match, in this case I can create a time out that if any match in X time, the the code return the result in this section. Here is the example:

```elixir
receive do #This is the mailbox 
	{:hello, "Andres"} -> "Hello Andres" # This is the clauses
	{:hello, "Juan"} -> "Hello Juan" # This is the clauses
	{:bye, "Ana"} -> "Bye Ana" # This is the clauses
  after 1_000 -> #After 1s waiting then execute this 
	"Timeout :("
end
```

## Links

Links are used to sending messages as spawn, the difference is if one of the process through error this process still running but without any activity, this cause that the other process will be keep listening and don{t run, stopping all the process. This isn’t good  for the process, so links it’s send data and connect both process if any though error the other though too and stop them.

To send data and link two process use `spawn_link` function as the following example:

```elixir
iex> spawn_link(fn -> raise "oops" end) #This process will fail 
```

## Tasks

tasks it’s another way to send information, the difference is tasks return the PID and a :ok flag to have e a better handle about the process if anything goes wrong. To create a task use the function `Task**.**start` Here is an example:

```elixir
iex> Task.start(fn -> raise "oops" end) # This task will fail
```

## State

State is using the task as a memory, I mean creating a process that keeps running all the time, and when I receive something store it by re-calling itself with the new parameter untill receive a different

```elixir
defmodule KV do
  def start_link do
    Task.start_link(fn -> loop(%{}) end)
  end

  defp loop(map) do
    receive do
      {:get, key, caller} ->
        send caller, Map.get(map, key)
        loop(map)
      {:put, key, value} ->
        loop(Map.put(map, key, value))
    end
  end
end
```

Here the loop function is running cycling and re-calling itself with a input map that Works as memory.

This is a few complicated, so Elixir has a module that do this job, is the Agent module that has the functions start to init a memory state and the functions update and get to handle the memory state.

### Register a PID with a customizable name

If I want to set the PID of a process with a special name (i.e. something more friendly than just numbers) I can use the Process module whit the register function, here is an example:

```elixir
pid = self() #Know the PID of my process 
Process.register(pid, :myProcess) #set the name of the actual process 
```

Notice that the second argument must be an atom