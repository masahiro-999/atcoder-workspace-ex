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


    def solve(_n, a) do
        a
        |> Enum.with_index()
        |> Enum.sort(fn a,b -> elem(a,0) < elem(b,0) end)
        |> Enum.map(fn {_value, index} -> index end)
        |> Enum.map(fn x -> x+1 end)
        |> Enum.join(" ")
        |> IO.puts()
    end

    def main() do
        n = ii()
        a = li()  # type: "List[int]"
        solve(n, a)
    end

end
