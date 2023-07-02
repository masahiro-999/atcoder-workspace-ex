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

    MOD = 998244353

    def solve(r, g, b, k, x, y, z) do

    end

    def main() do
        r = ii()
        g = ii()
        b = ii()
        k = ii()
        x = ii()
        y = ii()
        z = ii()
        solve(r, g, b, k, x, y, z)
    end

end
