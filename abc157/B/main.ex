defmodule Main do
    def input(), do: IO.read(:line) |> String.trim()
    def ii(), do: input() |> String.to_integer()
    def li(), do: input() |> String.split(" ") |> Enum.map(&String.to_integer/1)

    @yes "Yes"
    @no "No"

    def is_open(i,j,a, b), do: (a|> Enum.at(i)|>Enum.at(j)) in b

    def bingocheck(a, b, dy,dx) do
        is_open(1,1,a,b) and is_open(1-dy,1-dx,a,b) and is_open(1+dy,1+dx,a,b)
    end
    def solve(a, n, b) do
        for dy <- [0,1], dx <- [0,1], dy==0 and dx==0, reduce: @no do
          acc -> if bingocheck(a,b,dy,dx), do: @yes, else: acc
        end
        |> IO.puts()
    end

    def main() do
        a = for _ <- 1..3, do: li()
        n = ii()
        b = for _ <- 1..n, do: ii()  # type: "List[int]"
        solve(a, n, b)
    end

end
