extends RefCounted
class_name SphericalCoordinate

const normal_zenith := Vector3(0,1,0)

var fi := 0.0
var theta := PI/2
var radius := 0.0
var zenith := Vector3(0,1,0)

func to_cartesian() -> Vector3:
	return Vector3(\
	radius * sin(theta) * cos(fi),\
	radius * sin(theta) * sin(fi),\
	radius * cos(theta))
