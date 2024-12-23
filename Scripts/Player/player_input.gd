extends Node

@export var direction := Vector2()
signal direction_changed(new_direction)
#TODO: agregar input de interaccion 
#TODO: agregar input de tomar foto

func _physics_process(delta):
	direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	direction_changed.emit(direction)
