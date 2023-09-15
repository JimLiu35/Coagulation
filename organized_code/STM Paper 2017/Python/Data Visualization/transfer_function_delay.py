#!/usr/bin/env python3
from control.matlab import *
import numpy as np

def DelaySimulation(delayTime, coeff, Tin, sys):
    Response = np.array([])
    T0 = np.linspace(0, delayTime, 100)
    # Before delayTime
    youtBefore, Tout, xout = lsim(sys, T = T0)
    # After delayTime
    yout = impulse(sys, Tin)

    T = np.concatenate((T0, Tin+T0[-1]), axis=None)
    youtAfter = np.array(yout[0]) * coeff
    Y = np.concatenate((youtBefore, youtAfter), axis=None)
    return T, Y
