bob_recognizer = fn(person) ->
  expected_name = "Bob"
  {^expected_name, _} = person
end

bob_recognizer.({"Bob", 25})
bob_recognizer.({"Alice", 30})
