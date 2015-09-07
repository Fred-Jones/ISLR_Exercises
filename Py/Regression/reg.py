from __future__ import division
import numpy as np
import matplotlib.pyplot as plt
from theano import *
import theano.tensor as T

##func
theta = T.matrix('theta')
X = T.matrix('X')
b = T.scalar('b')

y_hat = b + T.dot(X, theta.T)

f = function([X, theta, b], [y_hat])
##end

xx = np.arange(0,10,1).reshape(5,2)
tt = np.arange(0,1,.1).reshape(5,2)
yy = np.array([0,-1,-2,-3,-4,-5,-6,-7,-8,-9])

print xx
print tt
print np.dot(xx, tt)
