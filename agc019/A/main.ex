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


    def solve(q, h, s, d, n) do
        p = [q*4, h*2, s]
        min_1l = Enum.min(p)
        if min_1l < d/2 do
          n * min_1l
        else
          div(n,2)*d + rem(n,2)*min_1l
        end
        |> IO.puts()
    end

    def main() do
        q = ii()
        h = ii()
        s = ii()
        d = ii()
        n = ii()
        solve(q, h, s, d, n)
    end

end
