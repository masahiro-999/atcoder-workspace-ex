defmodule Main do
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


    def solve(n, _m, l, r) do
        a = Enum.max(l)
        b = Enum.min(r)
        IO.puts(max(0,b-a+1))
    end

    def main() do
        n = ii()
        m = ii()
        [l,r] = (for _ <- 1..m, do: li())|> Enum.zip()|>Enum.map(&Tuple.to_list/1)
        solve(n, m, l, r)
    end

end
