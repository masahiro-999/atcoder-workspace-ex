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

    def val(s, i) do
      abs(
        (
        s
        |>String.slice(i,3)
        |>String.to_integer()
        ) - 753
        )
    end
    def solve(s) do
        max_n = String.length(s)-3
        for i <- 0..max_n, reduce: 1<<<60 do
          ans -> min(ans, val(s, i))
        end
        |> IO.puts()
    end

    def main() do
        s = input()
        solve(s)
    end

end
