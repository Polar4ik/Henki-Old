extends Control

func _process(delta: float) -> void:
	if G.player != null:
		$HPBar.value = G.player.hp
		$EnergyBar.value = G.player.power
		$SoulBar.value = G.player.soulCount
		$KillsLabel.text = "KILLS" + " " + str(G.kills)
		if G.player.final:
			$HPBar.hide()
			$SoulBar.show()
		else :
			$HPBar.show()
			$SoulBar.hide()
	
	await get_tree().create_timer(5).timeout
	$Help.modulate = lerp($Help.modulate, Color(1 , 1, 1, 0), delta * 2)
	$Location.modulate = lerp($Help.modulate, Color(1 , 1, 1, 0), delta * 2)
