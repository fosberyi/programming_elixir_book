defmodule Parallel do
  def pmap(coll, fun) do
    me = self
    coll
      |> Enum.map(fn(ele) ->
        spawn_link fn -> (send me, {self, fun.(ele)}) end
      end)
      |> Enum.map(fn(pid) ->
        receive do
          {^pid, result} -> result
        end
      end)
  end
end
