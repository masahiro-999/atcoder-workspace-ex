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

    def ans(x1, y1, x2, y2) do
        dx = x2 - x1
        dy = y2 - y1
        [x2 - dy, y2 + dx, x1 - dy, y1 + dx]
    end


    def solve(x1,y1,x2,y2) do
        ans(x1,y1,x2,y2)
        |>Enum.join(" ")
        |>IO.puts()
    end

    def main() do
        [x1,y1,x2,y2] = li()
        solve(x1,y1,x2,y2)
    end

end
