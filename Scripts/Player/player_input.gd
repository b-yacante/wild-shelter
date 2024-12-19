extends Node

@export var direction := Vector2()
signal direction_changed(new_direction)
#TODO: agregar input de interaccion 
#TODO: agregar input de tomar foto

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _physics_process(delta):
	direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	direction_changed.emit(direction)
