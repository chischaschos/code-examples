import pdb
import math

# https://docs.python.org/3/reference/datamodel.html#emulating-numeric-types

class Vector(object):
    def __init__(self, coordinates):
        try:
            if not coordinates:
                raise ValueError
            self.coordinates = tuple(coordinates)
            self.dimension = len(coordinates)

        except ValueError:
            raise ValueError('The coordinates must be nonempty')

        except TypeError:
            raise TypeError('The coordinates must be an iterable')

    def __str__(self):
        return 'Vector: {}'.format(self.coordinates)

    def __eq__(self, v):
        return self.coordinates == v.coordinates

    def __add__(self, v):
        # pdb.set_trace()
        return self.__class__(map(sum, zip(self.coordinates, v.coordinates)))

    def __sub__(self, v):
        return self.__class__(
                map(
                    (lambda x: x[0] - x[1]), zip(self.coordinates, v.coordinates)
                    )
                )

    def __mul__(self, v):
        # pdb.set_trace()
        return self.__class__(
                map(
                    (lambda x: x * v), self.coordinates
            ))

    def magnitude(self):
        sv_sum = sum(map((lambda x: x ** 2), self.coordinates))
        return math.sqrt(sv_sum)

    def normalize(self):
        return self * (1.0 / self.magnitude())

    def dot_product(self, v):
        products = [a * b for a, b in zip(self.coordinates, v.coordinates)]
        return sum(products)

    def angle_with(self, v):
        return math.acos(self.normalize().dot_product(v.normalize()))


a = Vector([7.35, 0.221, 5.188])
b = Vector([2.751, 8.259, 3.985])
print(a.angle_with(b))
a = Vector([3.183, -7.627])
b = Vector([-2.668, 5.319])
print(a.angle_with(b))
