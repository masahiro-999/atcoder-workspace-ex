defmodule Main do
    def input(), do: IO.read(:line) |> String.trim()
    def ii(), do: input() |> String.to_integer()
    def li(), do: input() |> String.split(" ") |> Enum.map(&String.to_integer/1)


    def calc(a,b,c) do
        (Enum.zip(a,b)
        |> Enum.map(fn {a,b} -> a*b end)
        |> Enum.sum()) + c
    end

    def solve(n, m, c, b, a) do
        a
        |> Enum.map(fn x -> calc(x,b,c) end)
        |> Enum.count(&(&1>0))
        |> IO.puts()

    end

    def main() do
        [n, m, c] = li()
        b = li()  # type: "List[int]"
        a = for _ <- 1..n, do: li()
        solve(n, m, c, b, a)
    end

end
