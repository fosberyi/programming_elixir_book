defmodule Stack.ServerTest do
  use ExUnit.Case

  test "it should pop the last value off of the init'd stack" do
    stack = Stack.Server.start_link(["ian", 70, "other"])
    assert "other" == Stack.Server.pop(stack)
  end
end
