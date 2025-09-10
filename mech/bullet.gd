extends Area3D
class_name Bullet

var _lifetime := 2.0
var _velocity : Vector2

func set_ariel_velocity(velocity: Vector2):
	self._velocity = Vector2(velocity.x, velocity.y)
	
func _physics_process(delta: float) -> void:
	_lifetime -= delta
	if _lifetime < 0:
		queue_free()
		return
		
	self.position.x += (self._velocity.x * delta)
	self.position.z += (self._velocity.y * delta)
	
