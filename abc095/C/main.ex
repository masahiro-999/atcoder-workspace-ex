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

    def calc_price_a(a1,a,b,c,x,y) do
        a2 = x - a1
        c1 = a2*2
        b1 = max(0, y - a2)
        a * a1 + b * b1 + c * c1
    end

    def calc_price_b(b1,a,b,c,x,y) do
        b2 = y - b1
        c1 = b2*2
        a1 = max(0, x - b2)
        a * a1 + b * b1 + c * c1
    end

    def solve(a, b, c, x, y) do
        ans1 =
        for a1 <- 0..x, reduce: a*x+b*y do
          acc -> min(acc, calc_price_a(a1,a,b,c,x,y))
        end

        ans2 =
        for b1 <- 0..y, reduce: a*x+b*y do
            acc -> min(acc, calc_price_b(b1,a,b,c,x,y))
        end

        IO.puts(min(ans1, ans2))
    end

    def main() do
        a = ii()
        b = ii()
        c = ii()
        x = ii()
        y = ii()
        solve(a, b, c, x, y)
    end

end
