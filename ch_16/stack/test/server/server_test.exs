defmodule Stack.ServerTest do
  use ExUnit.Case

  test "it should pop the last value off of the init'd stack" do
    {:ok, stack} = GenServer.start_link(Stack.Server, ['ian', 70, 'other'])
    assert { :ok, 'other' } == GenServer.call(stack, :pop)
  end
end

defmodule Stack.Server do
  use GenServer

  def handle_call(:pop, _from, stack) do
    {:reply, { :ok, List.last(stack) }, List.delete_at(stack, -1)}
  end
end
