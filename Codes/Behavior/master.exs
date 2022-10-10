defmodule MyMathModule.Master do
  # Here I write the methods that the slave have to implement
  @callback sum(number,number) :: number
  @callback multiply(number,number) :: number

  def sum(module, a,b) do
    module.sum(a,b)
  end
end

result = MyMathModule.Master.sum(MyMathModule.slave,1,2)
