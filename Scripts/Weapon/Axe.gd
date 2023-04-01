extends Node3D

var damage := 15
var can_beat := true

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("impact") and can_beat:
		$AnimationPlayer.play("Attack")
		can_beat = false
		$CollDown.start()
		G.player.canMove = false
		G.player.velocity = Vector3.ZERO
		await $CollDown.timeout
		G.player.canMove = true

func _on_area_3d_body_entered(body: Node3D) -> void:
	if body.is_in_group("Enemy"):
		body.hp -= damage

func _on_reload_timeout() -> void:
	can_beat = true
