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


    def solve(n, v) do
        v = Enum.sort(v)
        for x <- tl(v), reduce: hd(v) do
          acc -> (acc + x)/2
        end
        |> IO.puts()
    end

    def main() do
        n = ii()
        v = li()  # type: "List[int]"
        solve(n, v)
    end

end
