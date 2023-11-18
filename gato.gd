extends RigidBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	inicializar_posicion()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func inicializar_posicion():
	# Constantes de posición de pantalla x min/max y y min/max
	var viewport_tam = get_viewport_rect().size
	var x_max = viewport_tam.x
	var y_max = viewport_tam.y
	var x_min = 0
	var y_min = 0
	
	# Randomizamos posicion
	var pos_x = 0
	var pos_y = 0
	var random = randi_range(1, 4) # Número aleatorio para cases.
	print(random)
	
	# Randomizamos posición pero tiene que estar fuera de la pantalla

	# Case 1: Arriba
	if random == 1:
		pos_x = randf_range(x_min, x_max)
		pos_y = y_max + 50
	# Case 2: Abajo
	elif random == 2:
		pos_x = randf_range(x_min, x_max)
		pos_y = y_min - 50
	# Case 3: Izquierda
	elif random == 3:
		pos_x = x_min - 50
		pos_y = randf_range(y_min, y_max)
	# Case 4: Derecha
	elif random == 4:
		pos_x = x_max + 50
		pos_y = randf_range(y_min, y_max)

	# Asignamos posición
	set_position(Vector2(pos_x, pos_y))

	# Asignamos velocidad
	var velocidad = 100
	var direccion = Vector2(0, 0)
	if random == 1:
		direccion = Vector2(0, -1)
	elif random == 2:
		direccion = Vector2(0, 1)
	elif random == 3:
		direccion = Vector2(1, 0)
	elif random == 4:
		direccion = Vector2(-1, 0)
	set_axis_velocity(direccion * velocidad)


	$AnimatedSprite2D.play('idle')
