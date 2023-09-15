#!/usr/bin/env python3

import control as ct


class ExtendedTransferFunction(ct.TransferFunction):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        # Add new property named OutputDelay
        # By default, OutputDelay is set to 0, i.e. no delay
        self.OutputDelay = 0

    def exponential(self, coeff):
        '''
        This method is used to the system delay.
        Recall that a transfer function tf = exp(-ts) means the system
        is delay by t seconds.
        Input: coeff - this represents the time delay t
        Output: OutputDelay - an indicator. 0 represents no delay.
                Otherwise, its value = delay time.
        This method also returns a transfer function with numerator =
        denominator = 1.
        '''
        self.OutputDelay = coeff
        self.num = 1
        self.den = 1

    def Response(self):
        if

if __name__ == '__main__':
    Obj = ExtendedTransferFunction([1], [1])
    DelayTrans = Obj.exponential(-2)
