extends Node

func save(data):
	var file = FileAccess.open("res://Core/SaveData.txt", FileAccess.WRITE)
	file.store_string(str(data))

func _load():
	var file = FileAccess.open("res://Core/SaveData.txt", FileAccess.READ)
	var read = file.get_as_text()
	return read
