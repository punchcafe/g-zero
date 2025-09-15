extends Node3D


func _on_area_3d_area_entered(area: Area3D) -> void:
	if is_instance_of(area, Bullet):
		queue_free()
