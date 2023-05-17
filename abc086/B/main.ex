defmodule Main do
    def input(), do: IO.read(:line) |> String.trim()
    def ii(), do: input() |> String.to_integer()
    def li(), do: input() |> String.split(" ") |> Enum.map(&String.to_integer/1)

    @yes "Yes"
    @no "No"

    def solve(a, b) do
        n = String.to_integer("#{a}#{b}")
        sqrtn = ceil(:math.sqrt(n))
        cond do
          n == sqrtn * sqrtn -> @yes
          true -> @no
        end
        |> IO.puts()

    end

    def main() do
        [a, b] = li()
        solve(a, b)
    end

end
