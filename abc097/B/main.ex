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

    def find_max(i,x) do
      find_max(i,x,i*i,0)
    end

    def find_max(i,x,p,prev) when p<=x do
        find_max(i,x,i*p,p)
    end

    def find_max(i,x,p,prev) do
        prev
    end

    def solve(1) do
      1
    end

    def solve(x) do
        x2 = ceil(:math.sqrt(x))
        for i <- 2..x2, reduce: 1 do
          acc -> max(find_max(i,x),acc)
        end
    end

    def main() do
        x = ii()
        solve(x)
        |> IO.puts()
    end

end
