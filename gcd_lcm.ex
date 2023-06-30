def gcd(a, 0), do: a;
def gcd(a, b), do: gcd(b, rem(a, b))

def lcm(a, b), do: div(a * b, gcd(a, b))
