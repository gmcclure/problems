import sys


class RPN(object):
    def __init__(self):
        self._stack = []
        self._expr = ''
        self._operators = '+-*/'

    def read_expr(self, out=sys.stdout):
        self._expr = raw_input('? ')
        out.write('{0:.4f}'.format(self.process_expr()) + "\n")

    def process_expr(self):
        tokens = self._expr.split()
        for token in tokens:
            if token not in self._operators:
                self._stack.append(token)
            else:
                if len(self._stack) < 2:
                    print "Too few operands"
                else:
                    op1 = self._stack.pop()
                    op2 = self._stack.pop()
                    self._stack.append(str(eval(op2 + token + op1)))

        return float(self._stack[-1])


if __name__ == '__main__':
    rpn = RPN()
    while True:
        rpn.read_expr()