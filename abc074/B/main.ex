defmodule Main do
    def input(), do: IO.read(:line) |> String.trim()
    def ii(), do: input() |> String.to_integer()
    def li(), do: input() |> String.split(" ") |> Enum.map(&String.to_integer/1)


    def solve(n, k, x) do
        for xi <-x, reduce: 0 do
            acc -> acc + min(xi, k-xi)*2
        end
        |>IO.puts()
    end

    def main() do
        n = ii()
        k = ii()
        x = li()  # type: "List[int]"
        solve(n, k, x)
    end

end
