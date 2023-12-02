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


    def solve(s) do
        # 次のPythonのコードをElixirに変換する
        # S = I()
        # s = [s for s in S]
        # s.sort()
        # ans = "".join(s)
        # print(ans)
        s = String.graphemes(s)
        s = Enum.sort(s)
        ans = Enum.join(s)
        IO.puts(ans)
    end

    def main() do
        s = input()
        solve(s)
    end

end
