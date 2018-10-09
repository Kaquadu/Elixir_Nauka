defmodule ListHandler do
  @spec catch_list(list) :: list
  def catch_list(list) do
    IO.puts sum_list(list, 0)
    IO.puts double_list(list)
    IO.puts calc_length(0, list)
  end
  defp sum_list([], accumulator) do
    accumulator
  end
  defp sum_list([head | tail], accumulator) do
    sum_list(tail, head + accumulator)
  end
  defp double_list([]) do
    []
  end
  defp double_list([head | tail]) do
    [head * 2 | double_list(tail)]
  end
  defp calc_length(acc, []) do
    acc
  end
  defp calc_length(acc, [head | tail]) do
    calc_length(acc + 1, tail)
  end
end

numbers = [1, 3, 5, 7, 11]
ListHandler.catch_list(numbers)
