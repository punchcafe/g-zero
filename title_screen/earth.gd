extends MeshInstance3D

func _process(delta: float) -> void:
	self.rotate(Vector3(0,1,0), (2*PI)/360)
