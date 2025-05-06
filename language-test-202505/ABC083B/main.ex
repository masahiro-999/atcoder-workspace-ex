defmodule Main do
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

    def sum_digit(x) when x<10, do: x
    def sum_digit(x), do: sum_digit(div(x,10)) + rem(x,10)

    def solve(n, a, b) do
        for x <- 1..n, reduce: 0 do
          acc -> acc + if a <= sum_digit(x) and sum_digit(x) <= b, do: x, else: 0
        end
    end

    def main() do
        n = ii()
        a = ii()
        b = ii()
        solve(n, a, b)
        |> IO.puts()
    end

end
