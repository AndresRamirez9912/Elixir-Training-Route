defmodule My_module do
  @moduledoc """
   Hello, Welcome to my module :D
  """
  @my_name Andres
	def say_hello do
    IO.inspect("Hello I'm #{@my_name}")
	end

  @my_port 8080
	def server_port do
		IO.inspect("The server was initialize on port #{@my_port}")
	end
end

My_module.say_hello() #Notice that the constans are in Elixir array
