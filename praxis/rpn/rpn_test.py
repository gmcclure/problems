import unittest
from StringIO import StringIO

import rpn_calc


class RPNTest(unittest.TestCase):
    def setUp(self):
        self.rpn = rpn_calc.RPN()

    def test_that_rpn_exists(self):
        self.assertIsInstance(self.rpn, rpn_calc.RPN)

    def test_that_stack_is_a_list(self):
        self.assertIsInstance(self.rpn._stack, list)

    def test_first_expression_and_stack(self):
        rpn_calc.raw_input = lambda _: '1 2 +'
        self.rpn.read_expr()
        self.assertEquals(self.rpn._stack[-1], '3')

    def test_second_expression_and_output(self):
        out = StringIO()
        rpn_calc.raw_input = lambda _: '19 2.14 + 4.5 2 4.3 / - *'
        self.rpn.read_expr(out)
        output = out.getvalue().strip()
        self.assertEquals(output, '85.2974')


if __name__ == '__main__':
    unittest.main()