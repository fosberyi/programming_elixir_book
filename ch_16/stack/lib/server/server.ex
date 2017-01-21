defmodule Stack.Server do
  use GenServer

  def start_link(stack) do
    {:ok, server} = GenServer.start_link(Stack.Server, stack)
    server
  end

  def pop(server) do
    GenServer.call(server, :pop)
  end

  def handle_call(:pop, _from, stack) do
    {:reply, List.last(stack), List.delete_at(stack, -1)}
  end
end

