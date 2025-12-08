extends RefCounted
class_name SphereSurfaceVector

var _coordinate : SphericalCoordinate

func _init() -> void:
	_coordinate = SphericalCoordinate.new()
	_coordinate.radius = 1.8

func translate(movement: Vector2) -> SphereSurfaceVector:
	var translation = SphericalCoordinate.new()
	translation.theta = movement.y / _circumference()
	translation.fi = movement.x / _polar_circumference()
	
	var result_vector := _coordinate.add(translation)
	var out := SphereSurfaceVector.new()
	out._coordinate = result_vector
	return out
	
func cartesian_position() -> Vector3:
	return _coordinate.to_cartesian()
	

func _circumference() -> float:
	return 2.0 * PI * _coordinate.radius
	
func _rotation() -> Vector3:
	return Vector3(0, _coordinate.fi, -1 * _coordinate.theta)

# returns the radius of the ring slice at the given theta.
func _polar_circumference() -> float:
	var radius := sin(_coordinate.theta) * _coordinate.radius
	return 2.0 * PI * radius
	
	
#func surface_normal() -> Vector3:
	# Maybe skip this for rotation?
	#return null
	
