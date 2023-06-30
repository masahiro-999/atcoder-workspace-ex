def gcd(a, 0), do: a;
def gcd(a, b), do: gcd(b, rem(a, b))

def lcm(a, b), do: div(a * b, gcd(a, b))
def lcm([h|[]]), do: h
def lcm([h|t]), do: lcm(h,lcm(t))
