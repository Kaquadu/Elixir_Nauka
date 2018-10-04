defmodule DictOperations do
  def get_older(dict) do
    dict = %{dict | age: dict.age+1}
  end
  def rename(dict, namae) do
    dict = %{dict | name: namae}
  end
  def change_wrok(dict, work) do

  end
  def where_work(dict) do
    dict.works_at
  end
end

 bob = %{:name => "Bob", :age => 25, :works_at => "Initech"}

bob = DictOperations.get_older(bob)
IO.puts bob.age
IO.puts DictOperations.where_work(bob)
bob = DictOperations.rename(bob, "Rudolf")
IO.puts bob.name
