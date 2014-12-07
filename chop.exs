defmodule Chop do
  def guess(actual, _, current_guess) when actual == current_guess, do: IO.puts current_guess
  def guess(_, range, n) when !(n in range), do: IO.puts "Unguessable"

  def guess(actual, first..last, current_guess) when current_guess > actual do
    IO.puts "Is it #{current_guess}"
    guess actual, first..current_guess, div(current_guess - first, 2)
  end

  def guess(actual, first..last, current_guess) when current_guess < actual do
    IO.puts "Is it #{current_guess}"
    guess actual, current_guess..last, div(last - current_guess, 2)
  end
end
