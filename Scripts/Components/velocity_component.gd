extends Node
## Movement speed
@export var speed: float

signal velocity_modifier(speed: float)

#var implements = Interface.IVelocity

func _ready() -> void:
	emit_signal("velocity_modifier", speed)
