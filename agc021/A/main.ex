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


    def solve(n) do
        n_list = '#{n}'
        ans = (length(n_list)-1)*9 + (hd(n_list) - ?0 - 1)
        n_list
        |> tl()
        |> Enum.all?(fn x -> x==?9 end)
        |> if([do: ans+1, else: ans])
        |> IO.puts()
    end

    def main() do
        n = ii()
        solve(n)
    end

end
