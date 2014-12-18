fizz = fn
  0, 0, _ -> 'FizzBuzz'
  0, _, _ -> 'Fizz'
  _, 0, _ -> 'Buzz'
  _, _, num -> num
end

buzz = fn
  n -> fizz.(rem(n,3), rem(n,5), n)
end

defmodule FizzBuzzCase do
  def upto(count) when count > 0 do
    1..count |> Enum.map(&fizzbuzz/1)
  end
  defp fizzbuzz(n) do
    case { rem(n, 3) == 0, rem(n, 5) == 0 } do
      { true, true } -> IO.puts "FizzBuzz"
      { true, false } -> IO.puts "Fizz"
      { false, true } -> IO.puts "Buzz"
      { false, false } -> IO.puts n 
    end
  end
end
