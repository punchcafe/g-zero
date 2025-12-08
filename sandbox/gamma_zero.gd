extends Node3D
class_name GammaZero

# TODO: make a custom Icon for fun

var _vector := SphereSurfaceVector.new()
var _plane_velocity := Vector2(0.0,0.0)

	

func _physics_process(delta: float) -> void:
	var legs_input := Input.get_vector("legs_left", "legs_right", "legs_up", "legs_down")
	var camera_input := Input.get_vector("torso_left", "torso_right", "torso_up", "torso_down")
	$Camera3D.rotation = Vector3($Camera3D.rotation.x, camera_input.angle() + PI/2, $Camera3D.rotation.z)
	_plane_velocity = legs_input.rotated(-1.0 * camera_input.angle())
	if _plane_velocity.length() < 0.05: 
		# Act as though no input
		return
	_vector = _vector.translate(_plane_velocity * 0.2)	
	self.position = _vector.cartesian_position()
	
	# Required to rotate the craft tangential to the sphere surface
	self.rotation = _vector._rotation()
	# Rotate the craft through the y axis so that it aligns with it's velocity
	$mesh.rotation = Vector3($mesh.rotation.x, -1 * _plane_velocity.angle(), $mesh.rotation.z)
	

func _process(delta) -> void:
	pass
	#$mesh.rotation = Vector3(_spherical_position.theta, _spherical_position.fi, 0)
