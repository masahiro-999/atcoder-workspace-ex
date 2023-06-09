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

        s_mid = String.slice(s,2,String.length(s)-3)

        num_caps =
        String.to_charlist(s)
        |> Enum.count(fn x -> x < ?a end)

        ans = String.slice(s,0,1) == "A"
         and String.contains?(s_mid, "C")
         and num_caps == 2
        IO.puts(if ans, do: "AC", else: "WA")
    end

    def main() do
        s = input()
        solve(s)
    end

end
