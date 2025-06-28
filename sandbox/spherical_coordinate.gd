extends RefCounted
class_name SphericalCoordinate

var fi := 0.0
var theta := PI/2
var radius := 0.0

func to_cartesian() -> Vector3:
	return Vector3(\
	radius * sin(theta) * cos(fi),\
	radius * sin(theta) * sin(fi),\
	radius * cos(theta))
