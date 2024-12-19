extends Camera3D
## Offset of the camera
@export var offset: float = 1
## Must be assigned as decimal
## @tutorial: 0.1 | 1 | 0.025
@export var smooth_offset: float = 2

var target_h_offset: float = 0.0
var target_v_offset: float = 0.0
 
func _ready():
	pass # Replace with function body.

func _process(delta: float):
	# Suaviza los valores de offset hacia los objetivos
	h_offset = lerp(h_offset, target_h_offset, delta * smooth_offset)
	v_offset = lerp(v_offset, target_v_offset, delta * smooth_offset)

func _on_player_input_direction_changed(new_direction: Vector2):
	target_h_offset = new_direction.x * offset
	target_v_offset = new_direction.y * offset
