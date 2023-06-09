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


    def solve(n, t, a, h) do
        f = fn x -> abs(a-(t-x*0.006))end
        h
        |> Enum.map(f)
        |> Enum.with_index()
        |> Enum.min(fn {v1,k1},{v2,k2} -> v1 < v2 end)
        |> elem(1)
        |> Kernel.+(1)
        |> IO.puts()
    end

    def main() do
        n = ii()
        t = ii()
        a = ii()
        h = li()  # type: "List[int]"
        solve(n, t, a, h)
    end

end
