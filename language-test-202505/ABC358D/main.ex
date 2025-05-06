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

    end

    def main() do
        n = ii()
        m = ii()
        a = li()  # type: "List[int]"
        b = li()  # type: "List[int]"
        solve(n, m, a, b)
    end

end
