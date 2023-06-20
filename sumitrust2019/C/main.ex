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

    def check(x,max_i,max_i) do
      :false
    end
    def check(x,i,max_i) do
        xx = x-i*100
        if xx <= 5*i do
          :true
        else
            check(x,i+1,max_i)
        end
      end

    def solve(x) do
        min_i = div(x,100)+1
        IO.puts(if check(x, 1, min_i), do: 1, else: 0)
    end

    def main() do
        x = ii()
        solve(x)
    end

end
