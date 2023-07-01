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

    def get_ans([h|[]]) when rem(h,2)==0, do: 2
    def get_ans([h|[]]) when rem(h,2)==1, do: 1
    def get_ans([h|t]) when rem(h,2)==0, do: 2*get_ans(t)
    def get_ans([h|t]) when rem(h,2)==1, do: 1*get_ans(t)

    def pow(n,0), do: 1
    def pow(n,x), do: n*pow(n,x-1)

    def solve(n, a) do
        IO.puts(pow(3,n) - get_ans(a))
    end

    def main() do
        n = ii()
        a = li()  # type: "List[int]"
        solve(n, a)
    end

end
