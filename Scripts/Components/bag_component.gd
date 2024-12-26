extends Node

var bag_weight: float = 0

var implements = Interface.IBag

signal weight_changed(new_weight: float)

func _ready():
	bag_weight = SaveData.backpack_weight

func add_weight(new_weight: float):
	bag_weight += new_weight
	weight_changed.emit(bag_weight)
	SaveData.backpack_weight = bag_weight

func subtract_weight(new_weight: float):
	if bag_weight >= new_weight:
		bag_weight -= new_weight
		weight_changed.emit(bag_weight)
		SaveData.backpack_weight = bag_weight
