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


    def solve(s) do
        s_list = String.graphemes(s)
        count_0 = Enum.count(s_list, fn x -> x =="0" end)
        count_1 = Enum.count(s_list, fn x -> x =="1" end)
        ans = length(s_list) - abs(count_0 - count_1)
        IO.puts(ans)
    end

    def main() do
        s = input()
        solve(s)
    end

end
