# -*- coding: utf-8 -*-

import unittest
import skeleton

class BasicTestSuite(unittest.TestCase):
    """Docs here."""

    def test_hello(self):
        expected = True
        result = skeleton.core.hello()
        self.assertEqual(expected, result)


if __name__ == '__main__':
    unittest.main()
