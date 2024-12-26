extends Control

## Must be assign a Label node
@export var money_label: Label
@onready var character = $"../Character"
@onready var progress_bar = $ProgressBar
@onready var time_label = $"Time label"

func _ready():
	TimeSystem.time_updated.connect(update_time_label)
	for child in character.get_children():
		if "implements" in child:
			if child.implements == Interface.IBag:
				child.weight_changed.connect(update_bag_weight)
			if child.implements == Interface.IWallet:
				update_money_display(child.current_money)

func update_time_label(new_time: float):
	var float_time = new_time
	var h = floor(float_time)
	var m = int((float_time - h) * 100)
	time_label.text = '%02d:%02d' % [h, m]
		

# Método para actualizar la interfaz
func update_money_display(new_amount: int) -> void:
	money_label.text = str(new_amount)

func update_bag_weight(new_weight: float) -> void:
	progress_bar.value = new_weight

func _on_money_button_pressed():
	for child in character.get_children():
		if "implements" in child:
			if child.implements == Interface.IWallet:
				child.add_money(10)
				update_money_display(child.current_money)
