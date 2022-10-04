# Elixir-Training-Route

# Functional programming (FP) Fundamentals 

## When Use Functional programming

Use it when you need to transform or process one data (this means one thing at the moment)

## What is Functional Programming

It’s  create functions that do a specific task and return a result. In projects I create some functions and concatenate them to make complex process.

## Side Effects

The functions must haven’t side effects, this means **the function always return the expected result in any environment**

## Mutation

This aspect is in functions were they transform the input argument

## Shared state

This function depends of the input value and share the input argument with other functions

## Asynchronous code

This functions execute code in a specific moment, not always when it’s running

## Declarative code

This type of functions describe what it does (the code inside it describes explicitly what it does)

## Imperative code

This type of functions describe how it does (the code inside it describes explicitly how it does) normally has more longer functions than the declarative functions

## Separation

This is a recommendation to create little functions, just make a specific task as short as possible to avoid bugs having complex functions

## Composition

This means write functions to use it as a input in another functions, not just program normally functions

## Immutability

The functions that I’ll do not modify the input argument just copy and then modify the copy

## Memorization

Try to store past result to avoid re run functions that take time

## Currying

This is a technique that instead of run a big function that receive some arguments create little functions that receive one argument, process it and then return a result

# Introduction to Elixir 

# REPL

In some programming languages they have the REPL tool that is a console / script where I can write code and the console execute it in real time. It’s like the go command in the CMD. In elixir to open this I need to type “iex” in the command windows and then start to type the code.

# Basic Syntax

## Basic Data types

This language has the common data types as other programming languages

```elixir
1          # integer
0x1F       # integer
1.0        # float
true       # boolean
:atom      # atom / symbol
"elixir"   # string
[1, 2, 3]  # list
{1, 2, 3}  # tuple 
true       # boolean
false      # boolean 
```

## Basic Math operations

Also this has the typical arithmetical operations

```elixir
1 + 1 # 2
5 * 5 # 25
10 / 2 # 5.0 (The / operator always return a float result) 
div(10,2) # 5 (The div function return the integer result) 
rem(10,3) # 1 (The rem function return the mod result) -> 10 % 3  
```

## Check Data types

Elixir has built-in function to know if a variable / value is a specific data type. They return a Boolean  result and can be use for integer, Boolean, floats or numbers for example:

```elixir
is_boolean(true) #The function is this called "is_boolean"
is_integer(3.82) #The function is this called "is_integer"
```

## Atoms

In elixir the constants are called atoms and the value its the name. I mean I don’t store the atom in another variable, the variable is the atom and the value is the atom’s name.

```elixir
:apple # the atom is creating by the : at the beggining of the word
:apple == :orange #Also I can make logical operations between atoms 
```

## Strings

To make strings in elixir I just type the phrase / chain inside quotes

```elixir
"Hello Word"
```

Also I can create strings base on the atoms using the #{ } notation. Inside the brackets type the atom to convert it

```elixir
:apple 
#{:apple} # Convert to string
```

### Concatenate Strings

To create a new string by the sum of two of the them I use the <> operator, as the following example:

```elixir
result "Hello" <> "Bye"
# result = "HelloBye" 
```

Notice that When I concatenate them result a new string without a space between both strings

## Anonymous Functions in Elixir

To create anonymous functions in elixir I have to use the reserved words **fn** and **end** (the function must be between these words). Here is an example:

```elixir
add = fn a , b -> a + b end 
```

Notice that I create a anonymous function and store it in the add variable, also after the fn word I type the number of input parameters and the after the → I write the desired output

When I want to call the function I use the name AND A DOT to avoid bugs between an add variable and the add anonymous function

```elixir
add = fn a , b -> a + b end 
add.(1,2) # Notice the dot to say THIS IS A FUNCTION
```

**Note:** Elixir identified functions by the number of arguments that they receive, to know check if a function receive a exactly number of arguments use the following function

```elixir
is_function(add, 1) # Check if this function receive 1 argument 
is_function(add, 2) # Check if this function receive 2 argument
is_function(add, n) # Check if this function receive n gument
```

**Important aspect:** When I use functions they pass by value not reference, this means that When I receive a value and change it, the original variable (out of the function) doesn’t be affect, **the copy of this variable inside the function was changed, not the original**

## Data Information

When I’m not sure about a specific data type or something like that I can use the **i** function that return all information about the data, here are an example:

```elixir
i "Hello"
Term
  'hello'
Data type
  List
Description
  ...
Raw representation
  [104, 101, 108, 108, 111]
Reference modules
  List
Implemented protocols
  ...
```

## List

List are arrays (the same as python list) in Elixir the data type inside list doesn’t matter, this means that I can have integer, strings, atoms, etc. inside the same list.

```elixir
myList = [1 , 2, true, "Hello"] # I create a list with square brackets [ ]
length(myList) #Know the length of the list (return 4 in this case)
```

### List Operations

### 1. Concatenate

I can concatenate two list using the operator ++ or  - - to delete elements from a list. This operations return a new list, **THE ORIGINAL LIST DOESN’T BE MODIFIED** Here are some examples:

```elixir
result =[1,2,3,4] ++ [5,6,7] # Concatenate this two list 
# Result =  [1,2,3,4,5,6,7]
result = [1, true, 2, false, 3, true] -- [true, false] # Delete in first list this elements 
# Result = [1, 2, 3, true]
```

## Tuples

In Elixir (as python) has the tuple data structure. In elixir this structure is continuously in  memory, this means that all of the tuple’s operations run faster than in list and can handle different data type inside it

```elixir
myTuple = {:ok, "Hello"} # I create tuples with { }
```

## Tuples Operations

### 1. Index tuples

When I want to get the element inside a specific position use the **elem** function as the following example:

```elixir
myTuple = {:ok, "Hello"} # create my tuple 
data = elem(myTuple,1) #Get the element inside the position 1 (return "Hello")
```

### 2. Know the tuple size

Using the tuple_size function I can know this value

```elixir
myTuple = {:ok, "Hello"} # create my tuple 
size = tuple_size(myTuple) #Get the size of the tuple
```

### 3. Add elements inside a tuple

Using the put_elem function I can add new elements. The result it’s a new tupple, remember that in elixir are data it’s immutable, means that in functions never is changed. here are an example of this function:

```elixir
myTuple = {:ok, "Hello"} # create my tuple 
result = put_elem(myTuple, 2,"Bye") #Add the bye string in the position 2
# result = {:ok, "Hello", "Bye"}
```

Notice that I have to write the position where I want to put the element, this can be used to modify existing elements adding the new element in the position where an element exist

```elixir
myTuple = {:ok, "Hello"} # create my tuple 
result = put_elem(myTuple, 0,"Bye") #Add the bye string in the position 2
# result = {:"Bye", "Hello"}
```

## Boolean Operations

Elixir has the normal logical operations >, <, ≥, ≤, &, | |, etc.

The different elements are “and”, “or” and the “===”operators:

- **and, or:** This are logical operations but the difference it’s that the left side determine the result, if the left one doesn’t say the result execute the right position, here are an example:

  ```elixir
  false and raise("This error will never be raised")
  # result false
  ```

Notice that the right position has and error but the left one determine the result, so elixir doesn’t execute the right position

- **==:** This is a comparation operation but in numbers just compare the integer position

- **===:** This is a comparation operation but in numbers compare strictly the number, the integer position and the point float part

  ```elixir
  1 == 1.0 #Not strictly 
  # result true 
  1 === 1.0 # strictly 
  # result false
  ```

## IO Library Functions

This is a library that allow input messages and output messages similar as the fmt library in Go

### Output strings

To show messages in console I need to use the **puts** function as the following example:

```elixir
IO.puts("Hello word") 
```
