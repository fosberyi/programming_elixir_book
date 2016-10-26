defmodule Spawn3 do
  def greet do
    receive do
      {sender, msg} -> send sender, {:ok, "Hello #{msg}!"}
    end
  end
end

pid = spawn(Spawn3, :greet, [])

send pid, {self, "Kerms!"}

receive do
  {:ok, msg} -> IO.puts msg
end

send pid, {self, "Piggy!"}

receive do
  {:ok, msg} -> IO.puts msg
  after 1000 ->
    IO.puts "Bye, bye greeter"
end
