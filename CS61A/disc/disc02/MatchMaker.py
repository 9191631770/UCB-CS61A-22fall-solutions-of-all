def match_k(k):
    """ Return a function that checks if digits k apart match

    >>> match_k(2)(1010)
    True
    >>> match_k(2)(2010)
    False
    >>> match_k(1)(1010)
    False
    >>> match_k(1)(1)
    True
    >>> match_k(1)(2111111111111111)
    False
    >>> match_k(3)(123123)
    True
    >>> match_k(2)(123123)
    False
    """
    def judge(n):
        first_k_digits = n % (10 ** k)
        while n > 0:
            if first_k_digits != n % (10 ** k):
                return False
            n //= 10 ** k
        return True
    return judge

match_k(3)(123123)