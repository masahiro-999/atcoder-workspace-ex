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

    @mod 998244353

    def solve(n) do

        t = create_all_one_list(9)

        Enum.reduce(1..n-1, t, fn _, acc -> add_list_with_shift(acc) end)
        |>Enum.sum()
        |>rem(@mod)
        |>IO.puts()
    end

    def create_all_one_list(size) do
        #   長さがsize、要素の値が1のリストを作成する
        #   例: size=3の場合、[1,1,1]を返す
        for i <- 1..size, do: 1
    end


    def add_list_with_shift(l) do
        Enum.zip([
            tl(l)++[0],
            l,
            [0|l]
        ])
        |> Enum.map(fn {x, y, z} -> rem(x + y + z, @mod) end)
    end


    def main() do
        n = ii()
        solve(n)
    end

end
