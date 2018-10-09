defmodule Fibonacci do
  def calc_sequence(n, arg1, arg2) do
    if (n > 0) do
      calc_sequence(n-1, arg2, arg1 + arg2)
    else
      arg1
    end
  end
end

IO.puts Fibonacci.calc_sequence(11, 0, 1)
