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


    def solve(o, e) do
        ans =
        Enum.zip(String.graphemes(o),String.graphemes(e))
        |> Enum.reduce("", fn {o,e},acc -> acc <> o <> e end)

        ans =
        if String.length(o) != String.length(e) do
            ans <> String.slice(o, String.length(o)-1, 1)
        else
            ans
        end
        IO.puts(ans)

    end

    def main() do
        o = input()
        e = input()
        solve(o, e)
    end

end
