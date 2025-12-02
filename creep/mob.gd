extends Node3D

var _vector := SphereSurfaceVector.new()
	
func _init():
	_vector._coordinate.radius = 1.5

func _physics_process(delta: float) -> void:
	_vector = _vector.translate(Vector2(0.1, 0.1) * 0.2)	
	self.position = _vector.cartesian_position()
	self.rotation = _vector._rotation()
