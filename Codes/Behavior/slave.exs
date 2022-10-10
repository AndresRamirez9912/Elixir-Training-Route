defmodule MyMathModule.Slave do
  @behaviour MyMathModule.Master
  def sum(a,b) do
    a+b
  end
  def multiply(a,b) do
    a*b
  end
end
