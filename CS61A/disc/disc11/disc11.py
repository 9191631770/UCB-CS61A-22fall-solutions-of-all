def if_program(condition, true_result, false_result):
    """
    >>> eval(if_program("True", "3", "4"))
    3
    >>> eval(if_program("0", "'if true'", "'if false'"))
    'if false'
    >>> eval(if_program("1", "print('true')", "print('false')"))
    true
    >>> eval(if_program("print('condition')", "print('true_result')", "print('false_result')"))
    condition
    false_result
    """
    if eval(f"{condition}"):
        return f"{true_result}"
    else:
        return f"{false_result}"

