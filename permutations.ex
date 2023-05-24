def permutations([]), do: [[]]
def permutations(list) do
  for elem <- list, p <- permutations(list -- [elem]), do: [elem | p]
end
