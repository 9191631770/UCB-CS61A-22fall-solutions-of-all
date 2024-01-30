def unique_digits(n):
    unique = 0
    while n > 0:
        digit = n % 10
        n = n // 10
        if not has_digits(n, digit):
            unique += 1
    return unique


def has_digits(n, k):
    while n > 0:
        if n % 10 == k:
            return True
        n //= 10
    return False