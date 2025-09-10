extends CharacterBody3D

var BULLET := preload("res://mech/bullet.tscn")

const FIRE_COOLDOWN := 0.1

var _torso_vector := Vector2(0., -1.)
var _legs_vector : Vector2

var _torso : Node3D
var _legs : Node3D

var _fire_cooldown := 0.0
var _camera_north := Vector2(0, 1)

func _ready() -> void:
	self._torso = $Torso
	self._legs = $Legs

func _physics_process(delta: float) -> void:
	_fire_cooldown = max(0.0, _fire_cooldown - delta)
	if _fire_cooldown < 0.01 and Input.is_action_pressed("fire_bullet"):
		_fire_bullet()
	var torso_input = Input.get_vector("torso_left", "torso_right", "torso_up", "torso_down")
	if torso_input.normalized().length() == 1.0:
		# Only update the torso vector if it's being moved
		_torso_vector = torso_input
	self._legs_vector = Input.get_vector("legs_left", "legs_right", "legs_up", "legs_down")
	
	if self._legs_vector.length() > 0.1:
		self.velocity = Vector3(self._legs_vector.x, 0, self._legs_vector.y) * 25
		self.move_and_slide()
		
func _fire_bullet():
	var bullet := BULLET.instantiate() as Bullet
	bullet.set_ariel_velocity(Vector2(_torso_vector.x, _torso_vector.y).normalized() * 50)
	bullet.global_position = self.global_position
	self._fire_cooldown = FIRE_COOLDOWN
	# Replace this with something better
	get_parent().add_child(bullet)
	

func _process(delta: float) -> void:
	self._torso.rotation = Vector3(0, _torso_vector.angle_to(_camera_north), 0)
	self._legs.rotation = Vector3(0, _legs_vector.angle_to(_camera_north), 0)
	
	
