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


    def solve(n, q, x, y, q) do

    end

    def main() do
        n = ii()
        q = ii()
        [_,_] = (for _ <- 1..n, do: li())|> Enum.zip_with(&(&1))
            #_ の部分をxに変更する事 = ii()
            #_ の部分をyに変更する事 = ii()
        q = li()  # type: "List[int]"
        solve(n, q, x, y, q)
    end

end
