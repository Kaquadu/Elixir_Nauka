defmodule TodoList do
  defstruct auto_id: 1, entries: HashDict.new

  def new, do: %TodoList{}

  def new(entries \\ []) do
    Enum.reduce(entries, %TodoList{}, &add_entry(&2, &1))
  end

  def add_entry(%TodoList{entries: entries, auto_id: auto_id} = todo_list, entry) do
    entry = Map.put(entry, :id, auto_id)
    new_entries = HashDict.put(entries, auto_id, entry)

    %TodoList{todo_list | entries: new_entries, auto_id: auto_id+1}
  end

  def delete_entry(%TodoList{entries: entries, auto_id: auto_id} = todo_list, entry_id) do
    new_entries = HashDict.delete(entries, entry_id)
    %TodoList{todo_list | entries: new_entries}
  end

  def update_entry(%TodoList{entries: entries} = todo_list, entry_id, updater_function) do
    case entries[entry_id] do
      nil -> todo_list

      old_entry ->
        old_entry_id = old_entry.id
        new_entry = %{id: ^old_entry_id} = updater_function.(old_entry)
        new_entries = HashDict.put(entries, new_entry.id, new_entry)
        %TodoList{todo_list | entries: new_entries}
    end
  end

  def update_entry(todo_list, %{} = new_entry) do
    update_entry(todo_list, new_entry.id, fn(_) -> new_entry end)
  end

  def entries(%TodoList{entries: entries}, date) do
    entries
    |> Stream.filter(fn({_, entry}) -> entry.date == date end)
    |> Enum.map(fn({_, entry}) -> entry end)
  end

end

defmodule TodoList.CsvImporter do
  def import(path) do
    File.stream!(path)
    |> Stream.map(&String.replace(&1, "\n", ""))
    |> Stream.map(&String.split(&1, ","))
    |> Stream.map(fn([date, todo]) ->
      new_date = String.split(date, "/")
      [new_date, todo]
    end)
    |> Enum.map(fn([date, todo]) ->
      new_date = parse_date(date, {})
      %{date: new_date, title: todo}
    end)
    |> TodoList.new()
  end

  def parse_date([], new_date) do new_date end
  def parse_date([head | tail], new_date) do
    new_date = Tuple.append(new_date, String.to_integer(head))
    parse_date(tail, new_date)
  end
end

todo_list = TodoList.new
  |> TodoList.add_entry(%{date: {2013, 12, 20}, title: "Shopping"})
  |> TodoList.add_entry(%{date: {2013, 12, 21}, title: "Dentist"})
  |> TodoList.add_entry(%{date: {2013, 12, 22}, title: "Cinema"})
  |> TodoList.update_entry(1, &Map.put(&1, :date, {2013, 12, 23}))
  |> TodoList.delete_entry(3)


entries = [
%{date: {2013, 12, 19}, title: "Dentist"},
%{date: {2013, 12, 20}, title: "Shopping"},
%{date: {2013, 12, 19}, title: "Movies"}
]

todo_list_acc = TodoList.new(entries)

IO.inspect(todo_list)
IO.inspect(todo_list_acc)

TodoList.CsvImporter.import("todo_list.csv")
|> IO.inspect
