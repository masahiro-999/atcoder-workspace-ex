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


    def solve(n, m, s_x, s_y, x, y, d, c) do

    end

    def main() do
        n = ii()
        m = ii()
        s_x = ii()
        s_y = ii()
        [_,_] = (for _ <- 1..n, do: li())|> Enum.zip_with(&(&1))
            #_ の部分をxに変更する事 = ii()
            #_ の部分をyに変更する事 = ii()
        [_,_] = (for _ <- 1..m, do: li())|> Enum.zip_with(&(&1))
            #_ の部分をdに変更する事 = input()
            #_ の部分をcに変更する事 = ii()
        solve(n, m, s_x, s_y, x, y, d, c)
    end

end
