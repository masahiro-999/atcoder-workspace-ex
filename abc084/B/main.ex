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

    def is_digit(s) do
      (String.graphemes(s)
      |> Enum.count(fn x -> x >"9" or x < "0" end)
      ) == 0
    end

    def solve(a, b, s) do
        str_a = String.slice(s,0,a)
        str_m = String.slice(s,a,1)
        str_b = String.slice(s,a+1,b)
        IO.puts(if is_digit(str_a) and str_m == "-" and is_digit(str_b), do: "Yes", else: "No")
    end

    def main() do
        a = ii()
        b = ii()
        s = input()
        solve(a, b, s)
    end

end
