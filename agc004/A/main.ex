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

    def no_even(a,b,c) do
        [_,b,c]=Enum.sort([a,b,c], :desc)
        b*c
    end

    def solve(a, b, c) do
        find_even = Enum.filter([a,b,c],fn x -> rem(x,2)==0 end)
        cond do
          find_even == [] -> no_even(a,b,c)
          :true -> 0
        end
        |> IO.puts()
    end

    def main() do
        a = ii()
        b = ii()
        c = ii()
        solve(a, b, c)
    end

end
