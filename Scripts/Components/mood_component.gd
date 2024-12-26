extends Node
@export var hunger: float = 100.0  ## 0 = hambriento, 100 = lleno
@export var health: float = 100.0  ## 0 = crítico, 100 = sano
@export var boredom: float = 100.0 ## 0 = aburrido, 100 = entretenido

var current_state: String = "Feliz"

# Velocidades de cambio
var hunger_rate: float = 1.0
var boredom_rate: float = 0.5

func _process(delta: float):
	hunger = max(0, hunger - hunger_rate * delta)
	boredom = max(0, boredom - boredom_rate * delta)
	update_state()

func update_state():
	# Cambiar estado dependiendo de las estadísticas
	if hunger < 20:
		change_state("Hambriento")
	elif health < 30:
		change_state("Enfermo")
	elif boredom < 20:
		change_state("Aburrido")
	else:
		change_state("Feliz")

func change_state(new_state: String):
	if current_state != new_state:
		current_state = new_state
		print("Estado cambiado a: ", current_state)
		#TODO: cambiar animacion e interfaz

# Alimentar al animal
func feed(amount: float):
	hunger = min(100, hunger + amount)

# Jugar con el animal
func play(time: float):
	boredom = min(100, boredom + time * 10)

# Curar al animal
func heal(amount: float):
	health = min(100, health + amount)
