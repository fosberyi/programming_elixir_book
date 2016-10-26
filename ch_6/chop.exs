defmodule Chop do
  def guess(actual, range = low..high) do
    guess = div(low+high, 2)
    print_guess(guess)
    _guess(actual, guess, range)
  end

  defp _guess(actual, actual, _) do
    IO.puts "It's #{actual}"
  end

  defp _guess(actual, guess, _low..high)
    when guess < actual,
    do: guess(actual, guess+1..high)

  defp _guess(actual, guess, low.._high)
    when guess > actual,
    do: guess(actual, low..guess-1)
  
  defp print_guess(guess),
    do: IO.puts "Is it #{guess}?"
end
