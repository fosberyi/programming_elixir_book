defmodule Stack.ServerTest do
  use ExUnit.Case
  alias Stack.Server

  test "it should pop the last value off of the init'd stack" do
    Server.start_link(["ian", 70, "other"])
    assert "ian" == Stack.Server.pop
  end

  test "it should push a value to the top of the stack" do
    Server.start_link(["ian", 70, "other"])
    Server.push("tother")
    assert ["tother", "ian", 70, "other"] == Stack.Server.stack()
  end

  test "it should terminate when told to do so" do
    Server.start_link(["ian", 70, "other"])
    assert :ok == Server.shuterdown()
    #catch_exit(Stack.Server.stack())
  end
end
