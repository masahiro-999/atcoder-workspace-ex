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

    def is_ok(i,j,x) do
        d =
        Enum.zip(Enum.at(x,i),Enum.at(x,j))
        |> Enum.map(fn {a,b} -> (a-b)*(a-b) end)
        |> Enum.sum()

        d2 = ceil(:math.sqrt(d))
        d2 * d2 == d
    end

    def solve(n, d, x) do
        for i <- 0..n-2, j<-i+1..n-1, reduce: 0 do
            count -> if is_ok(i,j,x), do: count+1, else: count
        end
        |> IO.puts()

    end

    def main() do
        n = ii()
        d = ii()
        x = for _ <- 1..n, do: li()
        solve(n, d, x)
    end

end
