import random


def hello() -> bool:
    print("Hello World")
    return True


def add_two_things(a: int, b: int) -> int:
    return a + b


def test_with_patch() -> int:
    # No way to test this without patching random.randint
    result = random.randint(1, 10)
    return result
