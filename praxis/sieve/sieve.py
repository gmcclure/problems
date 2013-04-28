# sieve of eratosthenes

import math
import time

class Sieve(object):

    def find_primes_to_max(self, n):
        n += 1
        primes_filter = [0] * n
        primes_filter[0] = 1
        primes_filter[1] = 1
        limit = int(math.sqrt(n))

        for i in range(3, limit, 2):
            start = i*i
            for x in range(start, n, i):
                primes_filter[x] = 1

        primes = [2]
        for n in range(3, n, 2):
            if not primes_filter[n]:
                primes.append(n)

        return primes


if __name__ == '__main__':
    start = time.time()
    s = Sieve()
    print len(s.find_primes_to_max(15485863))
    elapsed = (time.time() - start)
    print "Elapsed time: ", elapsed
