extends Control

func _process(delta: float) -> void:
	if G.player != null:
		$HPBar.value = G.player.hp
		$EnergyBar.value = G.player.power
		$TimeLibel.text = str(G.player.find_child("Countdown").get_wait_time())
		$SoulBar.value = G.player.soulCount
		if G.player.final:
			$HPBar.hide()
			$SoulBar.show()
		else :
			$HPBar.show()
			$SoulBar.hide()
