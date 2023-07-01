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


    def solve(a, b, c) do
        [a,b,c] = Enum.sort([a,b,c])
        move_a = div(b-a+1,2) + rem(b-a,2)# b-aを2で割って切り上げ.行きすぎたら一つ戻す
        move_c = c - b
        IO.puts(move_a + move_c)
    end

    def main() do
        a = ii()
        b = ii()
        c = ii()
        solve(a, b, c)
    end

end
