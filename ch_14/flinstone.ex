defmodule Flinstone do
  def run do
    create_process(:fred)
    create_process(:betty)
  end

  def who? do
    receive do
      {sender, token} -> send sender, {:ok, token}
    end
  end

  def create_process(token) do
    p = spawn(Flinstone, :who?, [])
    send p, {self, token}
    receive do
      {:ok, token} -> IO.puts token
    end
  end
end

Flinstone.run()
