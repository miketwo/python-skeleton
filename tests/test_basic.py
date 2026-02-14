import skeleton


def test_hello() -> None:
    assert skeleton.core.hello() is True


def test_test_with_patch(monkeypatch) -> None:
    def mock_randint(a, b):
        return 5

    monkeypatch.setattr("skeleton.core.random.randint", mock_randint)
    assert skeleton.core.test_with_patch() == 5
