extends Node3D
class_name GammaZero

# TODO: make a custom Icon for fun

var _vector := SphereSurfaceVector.new()
	

func _physics_process(delta: float) -> void:
	var translation := Input.get_vector("legs_left", "legs_right", "legs_up", "legs_down")
	if translation.length() < 0.05:
		return
	_vector = _vector.translate(translation * 0.2)	
	self.position = _vector.cartesian_position()
	
	self.rotation = _vector._rotation()
	$mesh.rotation = Vector3(PI/2, (-1 * translation.angle()) + PI, 0)

func _process(delta) -> void:
	pass
	#$mesh.rotation = Vector3(_spherical_position.theta, _spherical_position.fi, 0)
