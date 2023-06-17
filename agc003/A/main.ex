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

    def solve(s) do

        c =
            s
            |> String.graphemes()
            |> Enum.frequencies()
        ans = (c["N"] ==nil) == (c["S"]==nil) and (c["E"] ==nil) == (c["W"]==nil)
        IO.puts(if ans, do: "Yes", else: "No")

    end

    def main() do
        s = input()
        solve(s)
    end

end
