extends RefCounted
class_name SphereSurfaceVector

var _coordinate : SphericalCoordinate

func _init() -> void:
	_coordinate = SphericalCoordinate.new()
	_coordinate.radius = 1.8

func translate(movement: Vector2) -> SphereSurfaceVector:
	var theta_change := movement.y / _circumference()
	var fi_change := movement.x / _polar_circumference()
	var out := SphereSurfaceVector.new()
	out._coordinate = SphericalCoordinate.new()
	out._coordinate.theta = _coordinate.theta + theta_change
	out._coordinate.fi = _coordinate.fi + fi_change
	out._coordinate.radius = _coordinate.radius
	return out
	
func cartesian_position() -> Vector3:
	return _coordinate.to_cartesian()
	

func _circumference() -> float:
	return 2.0 * PI * _coordinate.radius

# returns the radius of the ring slice at the given theta.
func _polar_circumference() -> float:
	var radius := sin(_coordinate.theta) * _coordinate.radius
	return 2.0 * PI * radius
	
	
#func surface_normal() -> Vector3:
	# Maybe skip this for rotation?
	#return null
	
