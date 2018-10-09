employees = ["John", "Bob", "David"]
#|> Enum.with_index
|> Stream.with_index
|> Enum.each( fn ({employee, index}) ->
  IO.puts "#{index + 1}. #{employee}" end)


[9, -1, "foo", 49, 36]
|> Stream.filter(&is_number(&1) and &1 > 0)
|> Stream.map(&{&1, :math.sqrt(&1)})
|> Stream.with_index
|> Enum.each( fn({{input, result}, index}) ->
  IO.puts "#{index + 1}. Input: #{input}, sqrt: #{result}" end
)
