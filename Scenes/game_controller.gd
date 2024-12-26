extends Node3D
@onready var directional_light_3d = $DirectionalLight3D

# Called when the node enters the scene tree for the first time.
func _ready():
	TimeSystem.time_updated.connect(time_light_update)
	SaveData.load_game()
	TimeSystem.game_started = true

func time_light_update(day_time: float):
	if day_time < 6:  # Madrugada
		directional_light_3d.light_energy = 0.2
	elif day_time < 13:  # Mañana
		directional_light_3d.light_energy = 1
	elif day_time < 17:  # Tarde
		directional_light_3d.light_energy = 0.75
	elif day_time < 19:  # Tarde
		directional_light_3d.light_energy = 0.50
	else:  # Noche
		directional_light_3d.light_energy = 0.2
