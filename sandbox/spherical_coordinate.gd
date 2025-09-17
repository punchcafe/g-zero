extends RefCounted
class_name SphericalCoordinate

const POLAR_AXIS := Vector3(0,1,0)

# Polar angle: andle between this radial line and a given polar axis
var theta := PI/2
# azimuth angle: angle of rotation (counter-clock-wise) of the radial line around the polar axis.
# 0 angle = Vector(1,0,0)
var fi := 0.0
# Distance from center
var radius := 0.0

func to_cartesian() -> Vector3:
	# For equations, counter clockwise moves from positive x to positive z
	# but in our scenario, counter clockwise moves to negative z, so we flip the
	# polarity so that it can match godot rotation.
	var inverted_fi := -1 * fi
	return Vector3(\
	radius * sin(theta) * cos(inverted_fi),\
	radius * cos(theta),
	radius * sin(theta) * sin(inverted_fi))
