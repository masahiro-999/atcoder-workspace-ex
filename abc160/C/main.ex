defmodule Main do
    def input(), do: IO.read(:line) |> String.trim()
    def ii(), do: input() |> String.to_integer()
    def li(), do: input() |> String.split(" ") |> Enum.map(&String.to_integer/1)

    def pos(i,a), do: elem(a,i)

    def d(0,k,n,a), do:  pos(0,a) + k - pos(n-1,a)
    def d(i,_k,_n,a), do:  pos(i,a) - pos(i - 1, a)

    def solve(k, n, a) do
        d1 = List.to_tuple(a)
        d = for i <- 0..n-1, do: d(i,k,n, d1)
        max_d = Enum.max(d)
        ans = Enum.sum(d) - max_d
        IO.puts(ans)
    end

    def main() do
        [k, n] = li()
        a = li()  # type: "List[int]"
        solve(k, n, a)
    end

end
