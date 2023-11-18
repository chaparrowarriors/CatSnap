extends RigidBody2D

var velocidad = 100
var direccion = Vector2(0, 0)
var random = randi_range(1, 2) # Número aleatorio para cases.

# Called when the node enters the scene tree for the first time.
func _ready():
	ini_posicion()
	ini_velocidad()
	ini_animacion()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	set_axis_velocity(direccion * velocidad)

func ini_posicion():
	# Constantes de posición de pantalla x min/max y y min/max
	var viewport_tam = get_viewport_rect().size
	var x_max = viewport_tam.x
	var y_max = viewport_tam.y
	var x_min = 0
	var y_min = 0
	
	# Randomizamos posicion
	var pos_x = 0
	var pos_y = 0
	
	# Randomizamos posición pero tiene que estar fuera de la pantalla

	if random == 1:
		pos_x = x_min - 50
		pos_y = randf_range(y_min, y_max)
	# Case 4: Derecha
	elif random == 2:
		pos_x = x_max + 50
		pos_y = randf_range(y_min, y_max)

	# Asignamos posición
	set_position(Vector2(pos_x, pos_y))
	
func ini_velocidad():
	# Asignamos velocidad
	if random == 1:
		direccion = Vector2(1, 0)
	elif random == 2:
		direccion = Vector2(-1, 0)
		
	set_axis_velocity(direccion * velocidad)
	
func ini_animacion():
		# Asignamos animacion
	if random == 1:
		$AnimatedSprite2D.play('derecha')
	elif random == 2:
		$AnimatedSprite2D.play('izquierda')
