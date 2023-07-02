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

    MOD = 1000000007

    def solve(n, b, k, c) do

    end

    def main() do
        n = ii()
        b = ii()
        k = ii()
        c = li()  # type: "List[int]"
        solve(n, b, k, c)
    end

end
