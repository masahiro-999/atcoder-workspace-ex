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

    def is_possible(t,x,y) when abs(x)+abs(y) <= t and rem(t-(abs(x)+abs(y)),2)==0, do: true
    def is_possible(t,x,y), do: false

    def solve(txy) do
        ans = for {[t1,x1,y1],[t2,x2,y2]} <- Enum.zip([[0,0,0]|txy], txy), reduce: true do
                acc -> acc and is_possible(t2-t1, (x2-x1), (y2-y1))
            end
        case ans do
            true -> "Yes"
            _ -> "No"
        end
    end

    def main() do
        n = ii()
        txy = for _ <- 1..n, do: li()
        solve(txy) |> IO.puts()
    end

end
