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

    def is_kaibun(s) do
        s == String.reverse(s)
    end

    def find_kaibun(len,s) do
        for x<-0..String.length(s)-len do
            is_kaibun(String.slice(s,x,len))
        end
        |> Enum.any?
    end
    def solve(s) do
        for l <- String.length(s)..1,-1 do
            if find_kaibun(l,s) do
                l
            else
                0
            end
        end
        |> Enum.max
        |> IO.puts
    end

    def main() do
        s = input()
        solve(s)
    end

end
