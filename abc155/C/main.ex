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


    def solve(n, s) do
        c = Enum.frequencies(s)
        {_,max_c} = Enum.max(c, fn {_, v1}, {_, v2} -> v1 >= v2 end)

        c
        |> Enum.filter(fn {k,v} -> v == max_c end)
        |> Enum.map(fn {k,v}->k end)
        |> Enum.sort()
        |> Enum.join("\n")
        |> IO.puts()

    end

    def main() do
        n = ii()
        s = for _ <- 1..n, do: input()  # type: "List[str]"
        solve(n, s)
    end

end
