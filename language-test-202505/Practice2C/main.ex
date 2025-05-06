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


    def solve(t, n, m, a, b) do

    end

    def main() do
        t = ii()
        [_,_] = (for _ <- 1..t, do: li())|> Enum.zip_with(&(&1))
            #_ の部分をnに変更する事 = ii()
            #_ の部分をmに変更する事 = ii()
            #_ の部分をaに変更する事 = ii()
            #_ の部分をbに変更する事 = ii()
        solve(t, n, m, a, b)
    end

end
