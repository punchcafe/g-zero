extends RefCounted
class_name SphericalCoordinate

const POLAR_AXIS := Vector3(0,1,0)

# Polar angle: andle between this radial line and a given polar axis
var theta := PI/2
# azimuth angle: angle of rotation (counter-clock-wise) of the radial line around the polar axis.
# 0 angle = Vector(1,0,0)
var fi := 0.0
# Distance from center
var radius := 0.

static func of(radius: float, theta: float, fi: float) -> SphericalCoordinate:
	var instance = SphericalCoordinate.new()
	instance.theta = theta
	instance.fi = fi
	instance.radius = radius
	return instance
	

func add(coord: SphericalCoordinate) -> SphericalCoordinate:
	var result = SphericalCoordinate.new()
	result.fi = _wrapped_addition(coord.fi, self.fi)
	result.theta = _wrapped_addition(coord.theta, self.theta)
	result.radius = coord.radius + self.radius
	return result

func to_cartesian() -> Vector3:
	# For equations, counter clockwise moves from positive x to positive z
	# but in our scenario, counter clockwise moves to negative z, so we flip the
	# polarity so that it can match godot rotation.
	var inverted_fi := -1 * fi
	return Vector3(\
	radius * sin(theta) * cos(inverted_fi),\
	radius * cos(theta),
	radius * sin(theta) * sin(inverted_fi))

func _wrapped_addition(lhs: float, rhs: float):
	# TODO: find a nicer way to express this mathematically
	var initial_result = lhs + rhs
	if initial_result < (-1 * PI):
		# Wrap negative excess past -PI to a subtraction against +PI
		var excess = (-1 * PI) - initial_result
		return PI - excess
	if initial_result > PI:
		# Wrap positive excess past PI to an addition to -PI
		var excess = (initial_result - PI)
		return excess - PI
	return initial_result
