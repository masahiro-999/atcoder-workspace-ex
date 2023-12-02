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

    # MOD = 998244353

    def solve(n) do

        # 次のPythonのコードをElixirに変換する
        # Elixirは関数型言語であることを考慮すること。
        # N = II()
        # dp = [[0]*9 for _ in range(N)]
        # for i in range(9):
        #     dp[0][i] = 1
        # for i in range(0,N-1):
        #     for j in range(9):
        #         if j > 0:
        #             dp[i+1][j-1] += dp[i][j]
        #         if j < 8:
        #             dp[i+1][j+1] += dp[i][j]
        #         dp[i+1][j] += dp[i][j]
        #         dp[i+1][j] %= MOD
        # # print(dp)
        # ans = sum(dp[N-1]) % MOD
        # print(ans)

        t = create_all_one_list(9)
        # tに対して、add_tuple_with_shiftをn-1回適用する
        for i <- 1..n-1, do: t = add_list_with_shift(t)
        # tの要素の合計をMODで割った余りを出力する
        IO.puts(Enum.sum(t) |> rem(MOD))
    end

    def create_all_one_list(size) do
        #   長さがsize、要素の値が1のリストを作成する
        #   例: size=3の場合、[1,1,1]を返す
        for i <- 1..size, do: 1
    end


    def add_list_with_shift(l) do
        #   リストlの要素を以下のようにシフトして加算したリストを返す。
        # ret[i] = l[i-1] + l[i] + l[i+1]
        shift_left1 = Enum.drop(l, 1)
        shift_right1 = Enum.take(l, length(l) - 1)
        shift_right1 = [0 | shift_right1]
        Enum.zip3(shift_left1, l, shift_right1) |> Enum.map(fn {x, y, z} -> x + y + z end)
    end


    def main() do
        n = ii()
        solve(n)
    end

end
