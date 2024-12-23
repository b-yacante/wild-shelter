extends Area3D
@export var tag: String
@export var weight: float
## Must be assign a vector 2, 'Y' must be negative 
@export var offset_text: Vector2 = Vector2(40,-70)
@onready var control_interact = $"Control interact"
@onready var label = $"Control interact/VBoxContainer/Label"

var camera: Camera3D

func _ready():
	control_interact.visible = false
	if tag != 'trash':
		weight = 0

func _process(delta):
	if control_interact.visible:
		var screen_pos = get_viewport().get_camera_3d().unproject_position(global_transform.origin)
		control_interact.position = screen_pos + offset_text

func auto_destroy():
	queue_free()

func _on_body_entered(body):
	if not body is CharacterBody3D:
		return
	for child in body.get_children():
		if "implements" in child:
			if child.implements == Interface.IBag:
				control_interact.visible = true
				if Input.is_action_pressed("ui_accept"):
					child.add_weight(4.5)
