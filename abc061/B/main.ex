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


    def solve(n, m, a, b) do
        t = for i <- a ++ b, reduce: %{} do
          acc -> Map.update(acc, i, 1, &(&1+1))
        end
        for i <- 1..n do
          IO.puts(Map.get(t,i,0))
        end
    end

    def main() do
        n = ii()
        m = ii()
        [a,b] = (for _ <- 1..m, do: li())|> Enum.zip()|>Enum.map(&Tuple.to_list/1)
        solve(n, m, a, b)
    end

end
