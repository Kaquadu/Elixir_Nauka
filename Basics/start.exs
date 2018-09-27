add = fn a, b -> a + b end
double = fn a -> add.(a,a) end

IO.puts "Hello world from Elixir"
IO.puts 0b1010 + 0x1F + 0o777
IO.puts 0b1010 / 2
IO.puts div 0b1010, 2
IO.puts round(3.58)
IO.puts trunc(3.58)
IO.puts :hello
IO.puts is_atom(:hello)
IO.puts is_binary("hello")
IO.puts is_boolean(true)
IO.puts byte_size("helloooo:)")
IO.puts String.length("helloooo:)")
IO.puts String.upcase("helloooo:)")
IO.puts String.downcase("HELLOOOO:)")
IO.puts add.(1,2)
IO.puts double.(6)
