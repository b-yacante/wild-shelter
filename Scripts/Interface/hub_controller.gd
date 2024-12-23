extends Control

## Must be assign a Label node
@export var money_label: Label
@onready var character = $"../Character"

func _ready():
	for child in character.get_children():
		if "implements" in child:
			if child.implements == Interface.IWallet:
				update_money_display(child.current_money)

# Método para actualizar la interfaz
func update_money_display(new_amount: int) -> void:
	money_label.text = str(new_amount)

func _on_money_button_pressed():
	for child in character.get_children():
		if "implements" in child:
			if child.implements == Interface.IWallet:
				child.add_money(10)
				money_label.text = str(child.current_money)
