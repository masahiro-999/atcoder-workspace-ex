defmodule Main do
    def input(), do: IO.read(:line) |> String.trim()
    def ii(), do: input() |> String.to_integer()
    def li(), do: input() |> String.split(" ") |> Enum.map(&String.to_integer/1)

{% if mod %}
    MOD = {{ mod }}
{% endif %}
{% if yes_str %}
    YES = "{{ yes_str }}"
{% endif %}
{% if no_str %}
    NO = "{{ no_str }}"
{% endif %}

{% if prediction_success %}
    def solve({{ actual_arguments }}) do

    end
{% else %}
    def solve() do

    end
{% endif %}

    def main() do
{% if prediction_success %}
        {{input_part}}
        solve({{ actual_arguments }})
{% else %}
        # Failed to predict input format
{% endif %}
    end

end
