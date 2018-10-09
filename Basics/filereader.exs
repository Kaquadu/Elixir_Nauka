defmodule FileReader do
  def lines_length(path) do
    File.stream!(path)
    |> Stream.with_index
    |> Enum.each(fn({line, index}) ->
      IO.puts "#{index + 1}. #{String.length(line)}" end)
  end
  def longest_line_length(path) do
    File.stream!(path)
    |> Stream.map(&String.length(&1))
    |> Enum.max
    #|> find_max(0)
  end

  def longest_line_context(path) do
    File.stream!(path)
    |> Stream.map(&{&1, String.length(&1)})
    |> Enum.max_by(fn({line, length}) -> length end)
  end

  def words_per_line(path) do
    File.stream!(path)
    |> Stream.map(&String.split(&1, " "))
    |> Enum.count
  end

  def find_max([], curr_max), do: curr_max
  def find_max([head | tail], curr_max) do
    if head>curr_max do
      find_max(tail, head)
    else
      find_max(tail, curr_max)
    end
  end

  def sum_list([], acc), do: acc
  def sum_list([head | tail], acc) do
    sum_list(tail, acc+head)
  end
end

#IO.inspect FileReader.longest_line_length("streams.exs")
#IO.inspect FileReader.longest_line_context("streams.exs")
#IO.inspect FileReader.sum_list([1, 2, 3, 4, 5, 6], 0)
IO.inspect FileReader.words_per_line("streams.exs")
