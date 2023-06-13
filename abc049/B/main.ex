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


    def solve(h,w,c) do
        for line <- c do
            IO.puts(line)
            IO.puts(line)
        end
    end

    def main() do
        h = ii()
        w = ii()
        c = for _ <- 1..h, do: input()
        solve(h,w,c)
    end

end
