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


    def solve(n, sp) do
        sp
        |> Enum.with_index()
        |> Enum.sort(fn
            {{s, p1},_}, {{s, p2},_}-> p1 >= p2
            {{s1, _},_}, {{s2, _},_}-> s1 <= s2
        end)
        |> Enum.map(&elem(&1,1)+1)
        |> Enum.join("\n")
        |> IO.puts()
    end

    def main() do
        n = ii()
        sp = (for _ <- 1..n, do: {next_token(),ii()})
        solve(n, sp)
    end

end
