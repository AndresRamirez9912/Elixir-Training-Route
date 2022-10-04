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

### Atoms

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

### Functions in Elixir

To create functions in elixir I have to use the reserved words **fn** and **end** (the function must be between these words). Here is an example:

```elixir
add = fn a , b -> a + b end 
```

Notice that I create a anonymous function and store it in the add variable, also after the fn word I type the number of input parameters and the after the → I write the desired output

## IO Library Functions

This is a library that allow input messages and output messages similar as the fmt library in Go

### Output strings

To show messages in console I need to use the **puts** function as the following example:

```elixir
IO.puts("Hello word") 
```
