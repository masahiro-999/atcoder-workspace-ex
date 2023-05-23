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

    def choco(a,d) do
        1+div((d-1), a)
    end

    def solve(n, d, x, a) do
        ans = a
        |> Enum.reduce(0, fn x, acc-> acc + choco(x,d) end)
        ans = ans + x
        IO.puts(ans)
    end

    def main() do
        n = ii()
        [d, x] = li()
        a = for _ <- 1..n, do: ii()  # type: "List[int]"
        solve(n, d, x, a)
    end

end
