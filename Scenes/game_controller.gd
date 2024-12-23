extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready():
	SaveData.load_game()
	TimeSystem.game_started = true
