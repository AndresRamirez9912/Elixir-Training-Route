# Create the struct
defmodule MyStruct do
	defstruct [:name,:age,:lastname]
end


# Create the protocol
defprotocol MyProtocol do
	# Here I define my functions for my protocol
	def typeOf(data) #This function behavior will change based on the input data type
end


# Here I define the behavior based on the data type
  # Integer Behavior
  defimpl MyProtocol, for: Integer do #Here is a little module but only for integer
    def typeOf(data), do: "My Integer #{data}"
  end

  # String behavior
  defimpl MyProtocol, for: String do #Here is a little module but only for string
    def typeOf(data), do: "My String #{data}"
  end

  # Strcut behavior
  defimpl MyProtocol, for: MyStruct do #little module but only for customizable struct
    def typeOf(data), do: "My Struct map #{data}"
  end

result =  MyProtocol.typeOf(2)
IO.puts(result)
