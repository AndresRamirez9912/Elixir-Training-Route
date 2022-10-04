## Pattern Matching

As in other programming languages to assign values to a variable use the = character

```elixir
x = 25 # assign the value 25 to the variable called X
```

In Elixir happened something special, when the two elements of assign are equal doesn’t return an error, here is an example:

```elixir
x = 25 
25 = x #in Othelanguageses this return error but in elixir not because both are equal
```

As Golan I can assign some values to different variables at the same time, here are an example:

```elixir
{a,b,c,d} = {"hello", :apple, 25 , 14} 
```

Notice that I need to use the brackets { } to group the variables and the values inside tuples (also I can do it in a list) but HAVE TO BE the same data structure, here are an example with a list

```elixir
[a,b,c,d] = ["hello", :apple, 25 , 14] 
```

In lists, I can match thinking as a head-tail structure, the head is the first element and the tail is another list that has the rest elements

```elixir
[head | tail ] = [1,2,3,4,5]
# head has the first element-> head = 1 
# tail has the rest element-> tail  = [2,3,4,5] 
```

Finally, when I’m assigning values to any variable I can call functions on the left of the equal, this return error, as the following example:

```elixir
length([1, [2], 3]) = 3
```

## Pin connector

The pin connector (^) means that the variable is used as the value, not as a variable. Here is an example to explain the concept

```elixir
x = 5 # Assign the value to x 

y = ^x # ^x is 5 because use the value, not the variable

^x == 5 # This is treu because I'm doing 5 == 5 because ^x use the value not the variable 
```

## Skip receive a data

When I have functions or I’m assigning some variables but I don’t want to store specific data I can skip with the _ operator as Go

```elixir
[head | _] = [1, 2, 3] #Store head as 1 and skip the tail 
```

# Cases

Case is a switch structure as in other programming languages, but this compares the value if matched with the desired case. has the following structure

```elixir
case 1 do #in this case I'm gonna compare the value 1
	2 -> #First condition 
	"This condition won't match because 1 != 2"
	3 -> #Second condition 
  "This condition won't match because 1 != 3"
	1 -> #Third condition 
	"This condition will match because 1 = 1"
	_ -> #Fourth Condition (Something like a default in switch case )
	"This condition will match because hasn't a condition"
end #End of the case  
```

Notice that the cases are separated by the → character. Also, I can create a case evaluating a tuple or list, here are an example

```elixir
case {1,2,3} do #in this case I'm gonna compare the value 1
	{2,4,6} -> #First condition 
	"This won't match with the case"
	{1,x,3} -> #Second condition 
	"This will match on the sides and X assign the 2 value, the result this line is executed"
	{1,2,2} -> #Third condition 
	"This won't match because the last element doesn't equal"
	_ -> #Fourth Condition (Something like a default in switch case )
	"Again the condition _ match with everything"
end #End of the case  
```

Also, I can change the case value instead of a value or tuple or something like that I can type a variable to make it more autonomous.

Cases also can have extra conditions inside each condition as this example:

```elixir
case {1, 2, 3} do
   {1, x, 3} when x > 0 ->
     "Will match because x will have to get the value 2 and 2 > 0"
 end
```

When any of the conditions inside cases match then the case return an error

```elixir
case :ok do 
	:erro -> 
	"Wont' match because this atoms are different"
end
# return (CaseClauseError) no case clause matching: :ok
```

## Clauses in Anonymous Functions

I can add clauses in functions to have different outputs based on the input parameters, here are an example:

```elixir
function = fn 
						x,y when x > 0 -> x + y # First clauses
						x,y -> x*y #Default clauses if the others doesn't work
					 end
```

Notice that this function has 2 input parameters: x, y and one output. In anonymous functions all the clauses should have the same number of input parameters, here are an example how to DO NOT create a anonymous function

```elixir
function = fn 
						x,y when x > 0 -> x + y # Two input parameters 
						x,y,z -> x*y #Three input parameters ERROR
					 end
```

## Cond

Cond is another Elixir structure similar to a switch statement. In this case, I have different cases without an input variable. This is used when I have to check different conditions and find the first one who runs. Here are an example of this:

```elixir
cond do 
	2 + 2 == 5 -> 
	# This doesn't true, won't be executed
	x + 5 == 5 -> 
	# This doesn't true, won't be executed
	1 + 1 == 2 -> 
	# This is true and will be executed
end
```

as the Case, the Cond returns an error if any of the conditions is executed. To avoid this it’s recommended to add a true condition at the end of the structure as the following example:

```elixir
cond do 
	2 + 2 == 5 -> 
	# This doesn't true, won't be executed
	x + 5 == 5 -> 
	# This doesn't true, won't be executed
	1 + 1 == 3 -> 
	# This doesn't true, won't be executed
	true -> 
	#This is the last condition to avoid an error 
end
```

## If and unless

In Elixir and other programming languages the if works equal but Elixir also has the unless statement that works as the if but in this case, a false condition executes the code. Here are some examples:

```elixir
if true do 
	" This will be executed"
end 

unless false do # Remember with the false condition the code is executing 
	" This will be executed"
end 
```

Also, I can add an else statement to execute other code in case the principal condition doesn’t run.

```elixir
if false do 
	"This won't be executed"
else
	"This will be executed"  
end 
```

# Binaries

in Elixir every string and character it’s converted to code points, this is similar to an ASCII conversion having a standard.

## BitStrings

This is an Elixir data type denoted with the <<>> elements and contains a sequence of bits in memory, here is an example:

```elixir
<<3>> #This is "show me the number of bits to create the number 3
<<3::4>> #This is the same as <<3>> 
```

The other way to write BitStrings is using the notation <<x: :n>> where n is the number of bits that build the x string. In the previous code, I wrote <<3:  :4 >> because in binary the number 3 it’s building using 4 bits (0011)

## CharList

The charList is a list of integer numbers that represent the code point of a character, to create it I need to write a chain inside single quotes ‘’. Here is an example:

```elixir
myCharList = 'hello'
# result = [?h, ?e, ?l, ?l, ?o] #Notice the ?before the char mean the code point
# result = [104, 101, 322, 322, 111] This is the same as before array bit with the integer
```

### Convert Charlist to String

to convert a list of an integer code point use the function to_string as the following example:

```elixir
myCharList = [104, 101, 322, 322, 111]
result = to_string(myCharList)
# result = "hello"
```

### Convert String to CharList

```elixir
myString = "hola"
result = to_charlist(myString)
# result = [104, 101, 322, 322, 111]
```