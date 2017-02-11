import unittest
import math
import vector as v

class TestVector(unittest.TestCase):

    def test_equality(self):
        v1 = v.Vector([1, 2 , 9])
        v2 = v.Vector([1, 2 , 9])
        self.assertEqual(v1, v2)

    def test_inequality(self):
        v1 = v.Vector([1, 2 , 9])
        v2 = v.Vector([0, 1 , 8])
        self.assertNotEqual(v1, v2)

    def test_addition(self):
        v1 = v.Vector([1, 2 , 9])
        v2 = v.Vector([1, 2 , 9])
        self.assertEqual(v1 + v2, v.Vector([2, 4, 18]))

    def test_substraction(self):
        v1 = v.Vector([1, 2 , 9])
        v2 = v.Vector([1, 2 , 9])
        self.assertEqual(v1 - v2, v.Vector([0, 0, 0]))

    def test_scalar_mult(self):
        v1 = v.Vector([1, 2 , 9])
        self.assertEqual(v1 * 2, v.Vector([2, 4, 18]))

    def test_magnitude1(self):
        v1 = v.Vector([-0.221, 7.437])
        self.assertEqual(v1.magnitude(), 7.44)

    def test_magnitude2(self):
        v1 = v.Vector([8.813, -1.331, -6.247])
        self.assertEqual(v1.magnitude(), 10.884)

    def test_magnitude3(self):
        v1 = v.Vector([-1, 1, 1])
        self.assertEqual(v1.magnitude(), round(math.sqrt(3), 3))

    def test_normalize1(self):
        v1 = v.Vector([1.996, 3.108, -4.554])
        self.assertEqual(v1.normalize(), v.Vector([0, 1, -1]), "normalized vector %r" % str(v1.normalize()))

    def test_normalize2(self):
        v1 = v.Vector([5.581, -2.136])
        self.assertEqual(v1.normalize(), v.Vector([1, 0]), "normalized vector %r" % str(v1.normalize()))

    def test_normalize3(self):
        v1 = v.Vector([-1, 1, 1])
        sqrt3 = round(math.sqrt(3), 3)
        self.assertEqual(v1.normalize(), v.Vector([-1 / sqrt3, 1 / sqrt3, 1 / sqrt3]), "normalized vector %r" % str(v1.normalize()))

if __name__ == '__main__':
    unittest.main()
