extends Node

## initial money 
@export var initial_money: int = 0
var current_money: int

signal money_changed(new_amount: int)

func _ready() -> void:
	current_money = load_player_money()
	emit_signal("money_changed", current_money)

func add_money(amount: int) -> void:
	current_money += amount
	save_player_money(amount)
	emit_signal("money_changed", current_money)

func subtract_money(amount: int) -> void:
	if current_money >= amount:
		current_money -= amount
		save_player_money(amount)
		emit_signal("money_changed", current_money)


func save_player_money(amount: int) -> void:
	var config = ConfigFile.new()
	config.set_value("Player", "Money", amount)
	config.save("user://player_data.cfg") # Guarda en un archivo local

func load_player_money() -> int:
	var config = ConfigFile.new()
	if config.load("user://player_data.cfg") == OK:
		return config.get_value("Player", "Money") # Devuelve 0 si no hay valor guardado
	return initial_money

func get_money() -> int:
	return current_money
