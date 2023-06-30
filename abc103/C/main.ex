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


    def gcd(a, 0), do: a;
    def gcd(a, b), do: gcd(b, rem(a, b))

    def lcm(a, b), do: div(a * b, gcd(a, b))

    def solve(n, a) do
        m = for x <-a, reduce: 1 do
          acc -> lcm(x, acc)
        end -1

        a
        |> Enum.map(fn x -> rem(m, x) end)
        |> Enum.sum()
        |> IO.puts()

    end

    def main() do
        n = ii()
        a = li()  # type: "List[int]"
        solve(n, a)
    end

end
