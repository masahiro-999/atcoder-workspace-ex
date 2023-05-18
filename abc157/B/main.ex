defmodule Main do
    def input(), do: IO.read(:line) |> String.trim()
    def ii(), do: input() |> String.to_integer()
    def li(), do: input() |> String.split(" ") |> Enum.map(&String.to_integer/1)

    @yes "Yes"
    @no "No"

    def is_open(i,j,a, b), do: (a|> Enum.at(i)|>Enum.at(j)) in b

    def bingocheckx(a, b, dy, dx) do
        is_open(1,1,a,b) and is_open(1-dy,1-dx,a,b) and is_open(1+dy,1+dx,a,b)
    end

    def bingocheckh(a, b, y) do
        is_open(y, 0, a, b) and is_open(y, 1, a, b) and is_open(y, 2,a, b)
    end

    def bingocheckv(a, b, x) do
        is_open(0, x, a, b) and is_open(1, x, a, b) and is_open(2, x,a, b)
    end

    def solve(a, n, b) do
        ans = for {dy, dx} <- [{1,-1}, {1,1}], reduce: @no do
          acc -> if bingocheckx(a,b,dy,dx), do: @yes, else: acc
        end
        ans = for y <- 0..2, reduce: ans do
            acc -> if bingocheckh(a,b,y), do: @yes, else: acc
          end
        ans = for x <- 0..2, reduce: ans do
            acc -> if bingocheckv(a,b,x), do: @yes, else: acc
        end

        IO.puts(ans)
    end

    def main() do
        # Enum.to_list(si())
        a = for _ <- 1..3, do: li()
        n = ii()
        b = for _ <- 1..n, do: ii()  # type: "List[int]"
        solve(a, n, b)
    end

end
