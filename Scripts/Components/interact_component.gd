extends Area3D
@export var tag: String
@export var weight: float
## Must be assign a vector 2, 'Y' must be negative 
@export var offset_text: Vector2 = Vector2(40,-70)
## Sprite
@export var sprite: Texture

@onready var sprite_3d = $Sprite3D
@onready var control_interact = $"Control interact"
@onready var label = $"Control interact/VBoxContainer/Label"

var is_player_in_area = false
var camera: Camera3D
var child_component: Node

func _ready():
	if sprite:
		sprite_3d.texture = sprite
	control_interact.visible = false
	if tag != 'trash':
		weight = 0

func _process(delta):
	if is_player_in_area:
		if Input.is_action_just_pressed("ui_accept"):
			child_component.add_weight(weight)
			self.queue_free()
	
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
				is_player_in_area = true
				child_component = child


func _on_body_exited(body):
	if body is CharacterBody3D:
		is_player_in_area = false
