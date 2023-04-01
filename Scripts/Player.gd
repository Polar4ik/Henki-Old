extends CharacterBody3D


const SPEED := 2.0
const FRICTION := 5.0

var gravity: float = ProjectSettings.get_setting("physics/3d/default_gravity")
var hp := 100
var power := 100
var canMove := true

@onready var animatedSprite: AnimatedSprite3D = $AnimatedSprite3D


func _ready() -> void:
	hp = clamp(hp, 0, 1000)

func _physics_process(delta: float) -> void:
	
	move(delta)
	gravitation(delta)
	die()
	
	animation()
	
	move_and_slide()

func gravitation(delta: float) -> void:
	if not is_on_floor():
		velocity.y -= gravity * delta

func move(delta: float) -> void:
	var input_dir := Input.get_vector("left", "right", "forward", "down")
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	
#	print(direction)
	print(velocity.z)
	
	if canMove:
		if direction:
			velocity.x = direction.x * SPEED
			velocity.z = direction.z * SPEED
			
			if direction.x > 0:
				animatedSprite.set_flip_h(true)
				$Weapon.scale.x = 1
			elif direction.x < 0:
				animatedSprite.set_flip_h(false)
				$Weapon.scale.x = -1
		else:
			velocity = lerp(velocity, Vector3.ZERO, FRICTION * delta)

func die() -> void:
	if hp == 0:
		animatedSprite.set_modulate(Color.hex(0xffffff7f))

func animation():
	if velocity.z > 1:
		animatedSprite.play("WalkForward")
	elif velocity.z > .1:
		animatedSprite.play("IdleForward")
	if velocity.z < -1:
		animatedSprite.play("WalkBack")
	elif velocity.z < -.1:
		animatedSprite.play("IdleBack")
