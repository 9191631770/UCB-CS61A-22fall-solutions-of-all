from audioop import mul


def multiply(m, n):
    """ Takes two positive integers and returns their product using recursion.
    >>> multiply(5, 3)
    15
    """
    if n == 0:
        return 0
    return m + multiply(m, n - 1)

def skip_mul(n):
    """Return the product of n * (n - 2) * (n - 4) * ...

    >>> skip_mul(5) # 5 * 3 * 1
    15
    >>> skip_mul(8) # 8 * 6 * 4 * 2
    384
    """
    if n == 2:
        return 2
    elif n == 1:
        return 1
    else:
        return n * skip_mul(n - 2)

print(skip_mul(8))

def is_prime(n):
    """Returns True if n is a prime number and False otherwise.

    >>> is_prime(2)
    True
    >>> is_prime(16)
    False
    >>> is_prime(521)
    True
    """
    if n == 1:
        return False
    def with_divisor(k = n - 1):
        if k == 1:
            return True
        elif n % k == 0:
            return False
        else:
            return with_divisor(k - 1)
    return with_divisor()

def hailstone(n):
    """Print out the hailstone sequence starting at n, and return the number of elements in the sequence.
    >>> a = hailstone(10)
    10
    5
    16
    8
    4
    2
    1
    >>> a
    7
    >>> b = hailstone(1)
    1
    >>> b
    1
    """
    print(n)
    if n == 1:
        return 1
    elif n % 2 == 0:
        return 1 + hailstone(n // 2)
    elif n % 2 == 1:
        return 1 + hailstone(n * 3 + 1)
    
def merge(n1, n2):
    """ Merges two numbers by digit in decreasing order
    >>> merge(31, 42)
    4321
    >>> merge(21, 0)
    21
    >>> merge (21, 31) 
    3211
    """
    last1 = n1 % 10
    last2 = n2 % 10
    if n1 == 0:
        return n2
    elif n2 == 0:
        return n1
    elif last1 >= last2:
        return 10 * merge(n1, n2//10) + last2
    else:
        return 10 * merge(n1//10, n2) + last1
