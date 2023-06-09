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


    def solve(n, a, b) do
        IO.puts div(n,a+b)*a + min(a, rem(n,a+b))

    end

    def main() do
        n = ii()
        a = ii()
        b = ii()
        solve(n, a, b)
    end

end
