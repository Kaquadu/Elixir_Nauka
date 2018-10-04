defmodule Number_Splitter do
  def incoming_call(number, decode_map) do
    number_splitter(number, decode_map, "")
  end


  defp number_splitter(number, decode_map, accumulator) do
    <<x::bytes-size(1)>> <> rest = number
    IO.puts accumulator <> x
    IO.puts rest
    value = key_checker([x, rest], decode_map)
    IO.puts value
    if value do
      [x, rest]
    else
      number_splitter(rest, decode_map, accumulator <> x)
    end
  end

  defp key_checker([x, rest], decode_map) do
    Map.has_key?(decode_map, x) && decode_map[x] == String.length(rest)
  end
end

decode_map = %{"10" => 6, "113" => 7, "12" => 6, "48" => 9, "13" => 7, "15" => 7, "24" => 8, "312" => 8}
Number_Splitter.incoming_call("10123123", decode_map)
