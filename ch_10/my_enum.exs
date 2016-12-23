defmodule MyEnum do
  def all?([], _func), do: true
  def all?([h|t], func) do
    if func.(h) do
      all?(t, func)
    else
      false
    end
  end
end

ExUnit.start

defmodule MyEnumTest do
  use ExUnit.Case

  test "all? should return true" do
    assert MyEnum.all?([2,3,4], fn x -> x > 1 end) == true
  end

  test "all? should return false" do
    assert MyEnum.all?([1,2,3,45], fn x -> x < 45 end) == false
  end
end
