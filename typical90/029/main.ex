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


    def solve(w, n, l, r) do

    end

    def main() do
        w = ii()
        n = ii()
        [_,_] = (for _ <- 1..n, do: li())|> Enum.zip_with(&(&1))
            #_ の部分をlに変更する事 = ii()
            #_ の部分をrに変更する事 = ii()
        solve(w, n, l, r)
    end

end
