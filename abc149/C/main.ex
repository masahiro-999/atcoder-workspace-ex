defmodule Main do
    import Bitwise
    def next_token(acc \\ "") do
        case IO.getn(:stdio, "", 1) do
          " " -> acc
          "\n" -> acc
          {:error, _} -> acc
          x -> next_token(acc <> x)
        end
    end
    def input(), do: IO.read(:line) |> String.trim()
    def ii(), do: next_token() |> String.to_integer()
    def li(), do: input() |> String.split(" ") |> Enum.map(&String.to_integer/1)

    def div_check(2,_i,_limit) do
        :true
    end

    def div_check(x,i,limit) when i > limit do
        :true
    end
    def div_check(x,i,limit) do
        if rem(x,i)==0,do: :false, else: div_check(x,i+1,limit)
    end

    def is_prime(x) do
        sqrt_x = trunc :math.sqrt(x)
        div_check(x,2,sqrt_x)
    end

    def solve(x) do
        cond do
            is_prime(x) -> IO.puts(x)
            :true -> solve(x+1)
        end
    end

    def main() do
        x = ii()
        solve(x)
    end

end
