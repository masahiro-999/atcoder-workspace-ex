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


    def solve(q, t, x) do

    end

    def main() do
        q = ii()
        [_,_] = (for _ <- 1..q, do: li())|> Enum.zip_with(&(&1))
            #_ の部分をtに変更する事 = ii()
            #_ の部分をxに変更する事 = ii()
        solve(q, t, x)
    end

end
