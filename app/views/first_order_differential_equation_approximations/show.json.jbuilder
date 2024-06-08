json.approximated_solution do
  json.array! @operation_response.approximated_solution.each.map(&:itself) do |object|
    json.abscissa object.abscissa
    json.ordinate object.ordinate
  end
end
