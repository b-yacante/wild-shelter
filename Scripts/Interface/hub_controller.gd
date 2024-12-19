extends Control

## Must be assign a Label node
@export var money_label: Label
@onready var character = $"../Character"
var player_wallet: Node 

func _ready():
	player_wallet = character.find_child("Wallet")
	player_wallet.connect("money_changed", update_money_display)

# Método para actualizar la interfaz
func update_money_display(new_amount: int) -> void:
	money_label.text = str(new_amount)
