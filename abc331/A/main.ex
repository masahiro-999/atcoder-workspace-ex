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

    def next_day(y,m,d, end_of_day, end_of_month) when d < end_of_day, do: {y,m,d+1}
    def next_day(y,m,d, end_of_day, end_of_month) when d == end_of_day, do: next_month(y,m, end_of_month)

    def next_month(y,m, end_of_month) when m < end_of_month, do: {y,m+1,1}
    def next_month(y,m, end_of_month) when m == end_of_month, do: {y+1,1,1}

    def solve(m, d, y, end_of_month, end_of_day) do
        {y,m,d} = next_day(y,m,d, end_of_day, end_of_month)
        IO.puts("#{y} #{m} #{d}")
    end

    def main() do
        end_of_month = ii()
        end_of_day = ii()
        y = ii()
        m = ii()
        d = ii()
        solve(m, d, y, end_of_month, end_of_day)
    end

end
