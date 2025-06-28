extends Node3D
class_name GammaZero

# TODO: make a custom Icon for fun

var _spherical_position := SphericalCoordinate.new()

func _physics_process(delta: float) -> void:
	_spherical_position.radius = 1.8
	_spherical_position.fi += 0.05
	# TODO: need to rethink how to map these to which axis.
	#_spherical_position.theta += 0.005
	

func _process(delta) -> void:
	self.position = _spherical_position.to_cartesian()
	#$mesh.rotation = Vector3(_spherical_position.theta, _spherical_position.fi, 0)
