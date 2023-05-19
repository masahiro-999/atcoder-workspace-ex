defmodule Main do
    use Bitwise
    def input(), do: IO.read(:line) |> String.trim()
    def ii(), do: input() |> String.to_integer()
    def li(), do: input() |> String.split(" ") |> Enum.map(&String.to_integer/1)

    def solve(a,b,c,n \\ 0)

    def solve(a,b,c,n) when (a &&& 1)!=0 or (b &&& 1)!=0 or (c &&& 1)!=0 ,do: n

    def solve(a,a,a,n) , do: -1

    def solve(a,b,c,n) , do: solve(b+c>>>1, a+c>>>1, a+b>>>1, n+1)

    def main() do
        [a,b,c] = li()
        solve(a, b, c)
        |> IO.puts()
    end

end
