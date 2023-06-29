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

    def get_ans(x,100), do: get_ans(x,101)
    def get_ans(0,n), do: '#{n}'
    def get_ans(1,n), do: '#{n}00'
    def get_ans(2,n), do: '#{n}0000'


    def solve(d, n) do
        get_ans(d,n)
        |> IO.puts()
    end

    def main() do
        d = ii()
        n = ii()
        solve(d, n)
    end

end
