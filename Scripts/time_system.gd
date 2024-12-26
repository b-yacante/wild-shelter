extends Node

var seconds_per_day: int = 900  # Duración total de un día en segundos
var time_of_day: float = 0.0  # Tiempo actual del día (0 a 1)
var game_started: bool = false
var days: int = 1

signal time_updated(time_of_day: float)

func _process(delta: float) -> void:
	if game_started:
		time_of_day += delta / seconds_per_day
		if time_of_day > 1.0:
			time_of_day = 0.0  # Reinicia el ciclo al inicio del día
			days += 1
		time_updated.emit(time_of_day * 24)
