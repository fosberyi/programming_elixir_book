defmodule Stack.Server do
  use GenServer

  def start_link(stack) do
    {:ok, server} = GenServer.start_link(__MODULE__, stack, name: __MODULE__)
    server
  end

  def pop do
    GenServer.call(__MODULE__, :pop)
  end

  def stack do
    GenServer.call(__MODULE__, :stack)
  end

  def push(val) do
    GenServer.cast(__MODULE__, {:push, val})
  end

  def handle_call(:stack, _from, stack) do
    {:reply, stack, stack}
  end

  def handle_call(:pop, _from, stack) do
    {:reply, List.last(stack), List.delete_at(stack, -1)}
  end

  def handle_cast({:push, val}, stack) do
    { :noreply, [val | stack]}
  end
end

