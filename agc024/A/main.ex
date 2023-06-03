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


    def solve(a, b, c, k) do
        ans = if rem(k,2)==1, do: b - a, else: a - b
        IO.puts(ans)
    end

    def main() do
        a = ii()
        b = ii()
        c = ii()
        k = ii()
        solve(a, b, c, k)
    end

end
