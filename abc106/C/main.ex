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

    # 答えは、入力に1以外の文字がきた場合は以降の文字は考慮不要
    def get_ans([a | _], k) when a != "1", do: a
    def get_ans([a | tail], 1), do: a
    def get_ans(["1" | tail], k), do: get_ans(tail, k-1)

    def solve(s, k) do
        # x = 500_0000_0000_0000
        s
        |> Integer.to_string()
        |> String.graphemes()
        |> get_ans(k)
    end

    def main() do
        s = ii()
        k = ii()
        solve(s, k)
        |> IO.puts()
    end

end
