import unittest

from numbernamer import NumberNamer


class TestNumberNamer(unittest.TestCase):
    def setUp(self):
        self.nn = NumberNamer()

    def test_ones(self):
        self.assertEqual("three", self.nn.convert('3'))
        self.assertEqual("zero", self.nn.convert('0'))
        self.assertEqual("seven", self.nn.convert('7'))
        self.assertEqual("nine", self.nn.convert('9'))
        self.assertEqual("six", self.nn.convert('6'))
        self.assertEqual("eight", self.nn.convert('8'))
        self.assertEqual("two", self.nn.convert('2'))
        self.assertEqual("one", self.nn.convert('1'))
        self.assertEqual("four", self.nn.convert('4'))
        self.assertEqual("five", self.nn.convert('5'))

    def test_teens(self):
        self.assertEqual('thirteen', self.nn.convert('13'))
        self.assertEqual('fourteen', self.nn.convert('14'))
        self.assertEqual('eleven', self.nn.convert('11'))
        self.assertEqual('ten', self.nn.convert('10'))
        self.assertEqual('eighteen', self.nn.convert('18'))
        self.assertEqual('fifteen', self.nn.convert('15'))
        self.assertEqual('seventeen', self.nn.convert('17'))
        self.assertEqual('nineteen', self.nn.convert('19'))
        self.assertEqual('twelve', self.nn.convert('12'))
        self.assertEqual('sixteen', self.nn.convert('16'))

    def test_tens(self):
        self.assertEqual('twenty-three', self.nn.convert('23'))
        self.assertEqual('eighty-four', self.nn.convert('84'))
        self.assertEqual('fifty', self.nn.convert('50'))
        self.assertEqual('ten', self.nn.convert('10'))

    def test_hundreds(self):
        self.assertEqual('four-hundred-eighteen', self.nn.convert('418'))
        self.assertEqual('two-hundred-nine', self.nn.convert('209'))
        self.assertEqual('six-hundred-seventy-six', self.nn.convert('676'))
        self.assertEqual('nine-hundred', self.nn.convert('900'))
        self.assertEqual('one-hundred', self.nn.convert('100'))
        self.assertEqual('nine-hundred-ninety-nine', self.nn.convert('999'))
        self.assertEqual('one-hundred-two', self.nn.convert('102'))
        self.assertEqual('three-hundred-seventy-eight', self.nn.convert('378'))
        self.assertEqual('five-hundred-twelve', self.nn.convert('512'))

    def test_thousands(self):
        self.assertEqual('one-thousand-twenty-three', self.nn.convert('1023'))
        self.assertEqual('four-thousand-three-hundred-twenty-one', self.nn.convert('4321'))
        self.assertEqual('one-thousand-two-hundred-thirty-four', self.nn.convert('1234'))
        self.assertEqual('five-thousand-five-hundred-fifty-five', self.nn.convert('5555'))
        self.assertEqual('one-thousand', self.nn.convert('1000'))
        self.assertEqual('nine-thousand-twenty', self.nn.convert('9020'))
        self.assertEqual('six-thousand-one-hundred', self.nn.convert('6100'))
        self.assertEqual('eight-thousand-one', self.nn.convert('8001'))
        

if __name__ == '__main__':
    unittest.main()
