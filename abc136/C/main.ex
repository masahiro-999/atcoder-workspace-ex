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

    def check([_]), do: :true
    def check([h1|[h2|t]]) when h1 >= h2, do: check([h2|t])
    def check([h1|[h2|t]]) when h1+1 == h2, do: check([h2-1|t])
    def check([h1|[h2|t]]) when h1+1 < h2, do: :false

    def solve(n, h) do
        h
        |> Enum.reverse()
        |> check()
        |> if(do: "Yes", else: "No")
        |> IO.puts()

    end

    def main() do
        n = ii()
        h = li()  # type: "List[int]"
        solve(n, h)
    end

end
