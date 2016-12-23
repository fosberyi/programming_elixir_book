defmodule MyList do
  def mapsum(list, func) do
    map(list, func)
    |> sum
  end

  defp map([], _), do: []
  defp map([head | tail], func), do: [func.(head) | map(tail, func)]

  def sum([]), do: 0
  def sum([ head | tail ]), do: head + sum(tail)

  def max(list) when length(list) > 0, do: maxp(list, 0)

  defp maxp([], max), do: max
  defp maxp([head | tail], max) when max >= head, do: maxp(tail, max)
  defp maxp([head | tail], max), do: maxp(tail, head)

  def ceasar([], n), do: []
  def ceasar([h|t], n) when h + n > ?z, do: [h+n-26 | ceasar(t, n)]
  def ceasar([h|t], n), do: [h+n | ceasar(t, n)]
end

IO.inspect MyList.sum([1,2,3])

IO.inspect MyList.mapsum([1, 2, 3], &(& 1 * &1))

IO.inspect MyList.max([3,5,8,2])

IO.inspect MyList.ceasar('ryvkve', 13)
