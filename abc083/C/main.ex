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

    def get_ans(i, limit, count) when i <= limit, do: get_ans(i*2, limit, count + 1)
    def get_ans(i, limit, count) when i > limit, do: count

    def solve(x, y) do
        get_ans(x, y, 0)
        |>IO.puts()
    end

    def main() do
        x = ii()
        y = ii()
        solve(x, y)
    end

end
