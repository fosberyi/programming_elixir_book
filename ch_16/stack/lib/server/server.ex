defmodule Stack.Server do
  use GenServer

  def start_link(stack) do
    {:ok, server} = GenServer.start_link(Stack.Server, stack)
    server
  end

  def pop(server) do
    GenServer.call(server, :pop)
  end

  def stack(server) do
    GenServer.call(server, :stack)
  end

  def push(server, val) do
    GenServer.cast(server, {:push, val})
  end

  def handle_call(:stack, _from, stack) do
    {:reply, stack, stack}
  end

  def handle_call(:pop, _from, stack) do
    {:reply, List.last(stack), List.delete_at(stack, -1)}
  end

  def handle_cast({:push, val}, stack) do
    { :noreply, List.insert_at(stack, 0, val) }
  end
end

