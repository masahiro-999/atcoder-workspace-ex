defmodule Main do

    def stdin() do
        {_ok, input_data} = File.read("/dev/stdin")
        input_data |> String.split("\n", trim: true)
    end
    def input(stream) do
        stream
        |> IO.read(:line)
        |> String.trim()
    end

    def ii(input_data) do
        [line | rest] = input_data
        {rest, line |> String.to_integer()}
    end

    def li(input_data) do
        # input_dataの先頭の一行を取り出し、整数のリストに変換して返す
        [line | rest] = input_data
        {rest, line |> String.split(" ") |> Enum.map(&String.to_integer/1)}
    end

    def li(input_data,n) do
        # input_dataの先頭のn行を取り出し、整数のリストのリストに変換して返す
        {lines,rest} = Enum.split(input_data, n)
        {rest, lines |> Enum.map(fn line -> String.split(line, " ") |> Enum.map(&String.to_integer/1) end)}
    end

    def main() do
        lines = stdin()
        {lines, n} = ii(lines)
        {lines, lr} = li(lines, n)
        solve(n, lr)
    end

    def solve(n, lr) do
        sum_l =
            lr
            |> Enum.map(&Enum.at(&1, 0))
            |> Enum.sum()
        d = 0-sum_l
        d = if d < 0 do
            1000000000000000000
        else
            d
        end
        # IO.inspect(lr, label: "lr")
        {d, result_list} = lr
            |> Enum.reduce({d,[]}, fn [l, r], {d,result_list} ->
                {d - min(d,(r - l)), [l + min(d,(r - l)) | result_list]}
            end)
        cond do
          d == 0 -> IO.puts("Yes\n" <> Enum.join(result_list|>Enum.reverse(), " "))
            true -> IO.puts("No")
        end
    end
end
