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

    def ans([],_,k) do
      k
    end

    def ans(a,n,k) when hd(a) == n do
      ans(tl(a), n+1, k)
    end

    def ans(a,n,k) do
      ans(tl(a), n, k+1)
    end

    def solve(n, a) do
        ret = ans(a,1,0)

        IO.puts(if ret==n, do: -1, else: ret)
    end

    def main() do
        n = ii()
        a = li()  # type: "List[int]"
        solve(n, a)
    end

end
