defmodule MyLoops do
  def sumList([head | tail], counter)do
    sumList(tail,counter+head) # call itselft each element
  end
  def sumList([],counter) do
    counter # Return the last position
  end
end
IO.puts(MyLoops.sumList([5,6,7],0))
