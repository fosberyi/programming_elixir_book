defmodule FibCalculator do
  def fib(scheduler) do
    send scheduler, {:ready, self}
    receive do
      {:fib, n, client} ->
        send client, {:answer, n, fib_calc(n), self}
      fib(scheduler)
      {:shutdown} -> exit(:normal)
    end
  end

  defp fib_calc(0), do: 0
  defp fib_calc(1), do: 1
  defp fib_calc(n), do: fib_calc(n-1) + fib_calc(n-2)
end

defmodule Scheduler do
  def run(num_procs, module, func, to_calculate) do
    (1..num_procs)
      |> Enum.map(fn(_) -> spawn(module, func, [self]) end)
      |> schedule_processes(to_calculate, [])
  end

  def schedule_processes(procs, queue, results) do
    receive do
      {:ready, pid} when length(queue) > 0 -> [next | tail] = queue
      send pid, {:fib, next, self}
      schedule_processes(procs, tail, results)

      {:ready, pid} -> send pid, {:shutdown}
      if length(procs) > 1 do
        schedule_processes(List.delete(procs, pid), queue, results)
      else
        Enum.sort(results, fn{n1, _}, {n2, _} -> n1 <= n2 end)
      end

      {:answer, number, result, _pid} ->
        schedule_processes(procs, queue, [{number, result} | results])
    end
  end
end

to_procs = [37,37,37,37,37,37,37]

Enum.each 1..10, fn num_procs ->
  {time, result} = :timer.tc(
                 Scheduler, :run, [num_procs, FibCalculator, :fib, to_procs]
               )

    if num_procs == 1 do
      IO.puts inspect result
      IO.puts "\n # time(s)"
    end
    :io.format "~2B ~.2f~n", [num_procs, time/1000000.0]
end

