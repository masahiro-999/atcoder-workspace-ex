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


    def solve(t, l, x, y, q, e) do

    end

    def main() do
        t = ii()
        l = ii()
        x = ii()
        y = ii()
        q = ii()
        e = li()  # type: "List[int]"
        solve(t, l, x, y, q, e)
    end

end
