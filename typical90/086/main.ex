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

    MOD = 1000000007

    def solve(n, q, x, y, z, w) do

    end

    def main() do
        n = ii()
        q = ii()
        [_,_] = (for _ <- 1..q, do: li())|> Enum.zip_with(&(&1))
            #_ の部分をxに変更する事 = ii()
            #_ の部分をyに変更する事 = ii()
            #_ の部分をzに変更する事 = ii()
            #_ の部分をwに変更する事 = ii()
        solve(n, q, x, y, z, w)
    end

end
