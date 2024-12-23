extends Node

# Datos persistentes
var money: int = 0
var backpack_weight: float = 0.0

# Guardar los datos en un archivo
func save_game():
	var save_data = {
		"money": money,
		"backpack_weight": backpack_weight,
	}
	var file = FileAccess.open("user://save_game.json", FileAccess.WRITE)
	file.store_string(JSON.stringify(save_data))
	file.close()

# Cargar los datos desde un archivo
func load_game():
	if FileAccess.file_exists("user://save_game.json"):
		var file = FileAccess.open("user://save_game.json", FileAccess.READ)
		var save_data = JSON.parse_string(file.get_as_text())
		file.close()

		money = save_data.get("money", 0)
		backpack_weight = save_data.get("backpack_weight", 0.0)
	else:
		print("No se encontró un archivo de guardado.")
