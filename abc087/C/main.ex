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

    def rev_accumulate(x) do
        Enum.reduce(x, [], fn
            elem,[h|t]-> [h + elem|[h|t]]
            elem,[]-> [elem]
        end)
    end


    def solve(n, a) do
        [a1,a2] = a
        acc1 = rev_accumulate(a1)|> Enum.reverse()
        acc2 =
            a2
            |> Enum.reverse()
            |> rev_accumulate()

        Enum.zip(acc1, acc2)
        |> Enum.map(fn {a,b}-> a+b end)
        |> Enum.max()
        |> IO.puts()
    end

    def main() do
        n = ii()
        a = for _ <- 1..2, do: li()
        solve(n, a)
    end

end
