extends Node3D
class_name GammaZero

# TODO: make a custom Icon for fun

var _vector := SphereSurfaceVector.new()
	

func _physics_process(delta: float) -> void:
	var translation := Input.get_vector("legs_left", "legs_right", "legs_up", "legs_down")
	_vector = _vector.translate(translation * 0.2)
	var polar_axis := Vector3.UP.rotated(Vector3(1,0,0), _vector._coordinate.theta)
	var other_axis := Vector3(1,0,0).rotated(Vector3(0,1,0), _vector._coordinate.fi)
	self.position = _vector.cartesian_position()
	self.rotation = Vector3(0,0,0)
	self.rotate(polar_axis, _vector._coordinate.fi)
	self.rotate(other_axis, _vector._coordinate.theta)

func _process(delta) -> void:
	pass
	#$mesh.rotation = Vector3(_spherical_position.theta, _spherical_position.fi, 0)
