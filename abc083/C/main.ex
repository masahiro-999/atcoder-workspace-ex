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


    def solve(x, y) do
        # 314159265 358979323846264338
        div(y,x)
        |> Integer.to_string(2)
        |> String.length()
        |>IO.puts()

    end

    def main() do
        x = ii()
        y = ii()
        solve(x, y)
    end

end
