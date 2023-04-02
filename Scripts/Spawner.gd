extends Node3D

var canSpawn := true
var rng = RandomNumberGenerator.new()
var enemyList = ["res://Object/Enemy/BatKnight.tscn", "res://Object/Enemy/BatWizzard.tscn"]
var enemyListPointer

var SceneList = []

var timer

func _ready() -> void:
	randomize()
	timer = Timer.new()
	timer.wait_time = rng.randi_range(5,10)
	add_child(timer)
	timer.timeout.connect(timeout)
	timer.start()


func _process(delta: float) -> void:
	SceneList.size()
	if G.player != null:
		spawn()

func spawn():
	if canSpawn and SceneList.size() < 1:
		enemyListPointer = rng.randi_range(0,1)
		var enem = load(enemyList[enemyListPointer]).instantiate()
		add_child(enem)
		canSpawn = false
		SceneList.append(enem)

func timeout():
	canSpawn = true
