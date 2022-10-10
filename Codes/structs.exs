defmodule Perfil do
  defstruct [:name, :age, :country, :food] #This is something like a class, I can create maps based
                                            #of this module. With this elements as a key, no more or less
end
map_Perfil= %Perfil{age: 22,country: "Colombia",food: "Huevo",name: "Andres"} # Create my map struct
IO.puts(map_Perfil.__struct__) #Print the class or struct of my map (this is type Perfil)
