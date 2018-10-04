defmodule ListHandler do
  @spec catch_list(list) :: list
  def catch_list(list) do
    IO.puts sum_list(list, 0)
    IO.puts double_list(list)
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
end

numbers = [1, 3, 5, 7, 11]
ListHandler.catch_list(numbers)
