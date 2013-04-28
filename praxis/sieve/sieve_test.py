import unittest

import sieve

class SieveTest(unittest.TestCase):

    def setUp(self):
        self.s = sieve.Sieve()

    def test_sieve(self):
        self.assertEqual([2], self.s.find_primes_to_max(2))
        self.assertEqual([2, 3, 5], self.s.find_primes_to_max(5))
        self.assertEqual([2, 3, 5, 7, 9, 11], self.s.find_primes_to_max(11))
        self.assertEqual([2, 3, 5, 7, 9, 11], self.s.find_primes_to_max(12))
        self.assertEqual([2, 3, 5, 7, 11, 13, 17, 19, 23], self.s.find_primes_to_max(24))
        self.assertEqual([2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97, 101], self.s.find_primes_to_max(101))
        self.assertEqual([2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97], self.s.find_primes_to_max(100))


if __name__ == '__main__':
    unittest.main()
