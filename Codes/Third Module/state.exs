defmodule KV do
  def start_link do
    Task.start_link(fn -> loop(%{}) end)
  end

  defp loop(map) do
    receive do
      {:get, key, caller} ->
        send caller, Map.get(map, key)
        loop(map)
      {:put, key, value} ->
        loop(Map.put(map, key, value))
    end
  end
end

# use the memory
{:ok, pid} = KV.start_link()
{:put, :hello, :world} # Add a element to the memory
send(pid, {:get, :hello, pid}) #Get the value of the key hello (it talk to my process )

receive do
  {:hello, :word} ->
    IO.inspect("It works")
  after 1_000 ->
    IO.inspect("Not works :(")
end
