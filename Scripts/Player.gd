extends CharacterBody3D


const SPEED := 2.0
const FRICTION := 5.0

var gravity: float = ProjectSettings.get_setting("physics/3d/default_gravity")
var hp := 100

func _ready() -> void:
	hp = clamp(hp, 0, 1000)

func _physics_process(delta: float) -> void:
	
	move(delta)
	gravitation(delta)
	die()
	
	move_and_slide()

func gravitation(delta: float) -> void:
	if not is_on_floor():
		velocity.y -= gravity * delta

func move(delta: float) -> void:
	var input_dir := Input.get_vector("left", "right", "forward", "down")
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	
#	print(direction)
	print(velocity.z)
	
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
		
		
		if direction.x > 0:
			$AnimatedSprite3D.set_flip_h(true)
		elif direction.x < 0:
			$AnimatedSprite3D.set_flip_h(false)
		
		if direction.z < 0 and velocity.z == 0:
			$AnimatedSprite3D.set_animation("IdleBack")
		elif direction.z > 0 and velocity.z == 0:
			$AnimatedSprite3D.set_animation("IdleForward")
	else:
		velocity = lerp(velocity, Vector3.ZERO, FRICTION * delta)

func die() -> void:
	if hp == 0:
		queue_free()
