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


    def solve(a, b) when a <=0 and b >= 0, do: "Zero"
    def solve(a, b) when a >0 and b > 0, do: "Positive"
    def solve(a, b) when rem(b-a,2)==1, do: "Positive"
    def solve(a, b), do: "Negative"

    def main() do
        a = ii()
        b = ii()
        solve(a, b)
        |> IO.puts()
    end

end
