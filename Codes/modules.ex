# Create my module
defmodule MyModule do
  # Here I can create all my functions associated to my module
  def mySum(a,b) do
    a+b # The function return the last line
  end

  # Create a private function
  defp myPrivateFunc do
      "Hello I'm a private function"
  end

  def usePrivateFunc do
    myPrivateFunc() # The function is privat, this means only inside the module I can use it
  end
end

# Test my function and module
result = MyModule.mySum(1,2)
IO.puts(result)
IO.inspect(MyModule.usePrivateFunc()) # Call the public function that uses the private function
