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

  def shuterdown do
    GenServer.cast(__MODULE__, {:shutdown, :bye})
  end

  def handle_call(:stack, _from, stack) do
    {:reply, stack, stack}
  end

  def handle_call(:pop, _from, stack) do
    [top | tail] = stack
    {:reply, top, tail}
  end

  def handle_cast({:push, val}, stack) do
    { :noreply, [val | stack]}
  end

  def handle_cast({:shutdown, :bye}, stack) do
    {:stop, :shutdown, stack}
  end

  def terminate(reason, state) do
    IO.puts "Shutting down because: #{reason}, my final state #{inspect state}"
    :ok
  end
end

