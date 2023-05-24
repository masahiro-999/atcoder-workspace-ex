defmodule Main do
    import Bitwise
    def next_token(acc \\ "") do
        case IO.getn(:stdio, "", 1) do
          " " -> acc
          "\n" -> acc
          x -> next_token(acc <> x)
        end
    end
    def input(), do: IO.read(:line) |> String.trim()
    def ii(), do: next_token() |> String.to_integer()
    def li(), do: input() |> String.split(" ") |> Enum.map(&String.to_integer/1)

    def permutations([]), do: [[]]
    def permutations(list) do
      for elem <- list, p <- permutations(list -- [elem]), do: [elem | p]
    end

    def get_i(p_all, p) do
        p_all
        |> Enum.with_index()
        |> Enum.find(fn {x,i} -> x==p end)
        |> elem(1)
    end

    def solve(n, p, q) do
        p_all = (for x <- 1..n,do: x)
        |> permutations()

        abs(get_i(p_all, p)-get_i(p_all, q))
        |> IO.puts()
    end

    def main() do
        n = ii()
        p = li()  # type: "List[int]"
        q = li()  # type: "List[int]"
        solve(n, p, q)
    end

end
