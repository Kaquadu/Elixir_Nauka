defmodule NumberSplitter do
  def call(number, decode_map) do
    split_number(number, decode_map, "")
  end

  defp split_number("", _, _), do: {:error, "Incorrect number"}
  defp split_number(<<x::bytes-size(1)>> <> rest = number, decode_map, accumulator) do
    accumulator = accumulator <> x
    if Map.get(decode_map, accumulator) && String.length(rest) == decode_map[accumulator] do
      [accumulator, rest]
    else
      split_number(rest, decode_map, accumulator)
    end
  end

end

decode_map = %{"10" => 6, "113" => 7, "12" => 6, "48" => 9, "13" => 7, "15" => 7, "24" => 8, "312" => 8}
IO.inspect NumberSplitter.call("10123132", decode_map)
IO.inspect NumberSplitter.call("48666123123", decode_map)
IO.inspect NumberSplitter.call("", decode_map)
IO.inspect NumberSplitter.call("32131", decode_map)
