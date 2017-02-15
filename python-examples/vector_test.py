import pdb
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
        self.assertEqual(v1.normalize(), v.Vector([0.34, 0.53, -0.777]), "normalized vector %r" % str(v1.normalize()))

    def test_normalize2(self):
        v1 = v.Vector([5.581, -2.136])
        self.assertEqual(v1.normalize(), v.Vector([0.934, -0.357]), "normalized vector %r" % str(v1.normalize()))

    def test_normalize3(self):
        # pdb.set_trace()
        v1 = v.Vector([-1, 1, 1])

        v1_normalized = v1.normalize()
        sqrt3 = round(math.sqrt(3), 3)
        expected_vector = v.Vector([round(-1 / sqrt3, 3), round(1 / sqrt3, 3), round(1 / sqrt3, 3)])

        self.assertEqual(v1_normalized, expected_vector,
                "vector {} != {}".format(str(v1_normalized), str(expected_vector)))

    def test_dot_product(self):
        v1 = v.Vector([2, 2])
        v2 = v.Vector([4, 4])

        self.assertEqual(v1.dot_product(v2), 16)

    # def test_dot_product(self):
    #     v = v.Vector([7.887, 4.138])
    #     w = v.Vector([-8.802, 6.776])



if __name__ == '__main__':
    unittest.main()
