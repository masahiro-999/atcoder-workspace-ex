defmodule Main do
    def input(), do: IO.read(:line) |> String.trim()
    def ii(), do: input() |> String.to_integer()
    def li(), do: input() |> String.split(" ") |> Enum.map(&String.to_integer/1)


    def solve(n) do
        x = trunc(n/1.08)
        cond do
          trunc(x*1.08) == n -> IO.puts(x)
          trunc((x+1)*1.08) == n -> IO.puts(x+1)
          true -> IO.puts(":(")
        end
    end

    def main() do
        n = ii()
        solve(n)
    end

end
