# Create my module with my functions
defmodule MyModule do
	def div(_,0) do
	 raise MyModule.FirstError  #Send y owm error
	end
  def div(_,2) do
    raise MyModule.SecondError
  end
	def div(a,b) do # Hasn't error return the value
	 a/b
	end
end

# Here I create my errors about my module
defmodule MyModule.FirstError do
	defexception message: "This is my first Error"
end
defmodule MyModule.SecondError do
	defexception message: "I dont want to divide by 2"
end

response = MyModule.div(1,2)
IO.puts(response)
