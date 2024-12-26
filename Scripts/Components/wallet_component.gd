extends Node

## initial money 
@export var initial_money: int = 0
var current_money: int

var implements = Interface.IWallet

signal update_money(new_amount: int)

func _ready() -> void:
	current_money = SaveData.money

func add_money(amount: int) -> void:
	current_money += amount
	update_money.emit(current_money)
	SaveData.money = current_money

func subtract_money(amount: int) -> void:
	if current_money >= amount:
		current_money -= amount
		update_money.emit(current_money)
		SaveData.money = current_money

func get_money() -> int:
	return current_money
