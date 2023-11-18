extends RigidBody2D

var sound_gato: AudioStreamPlayer2D

var velocidad = 100
var direccion = Vector2(0, 0)
var random = randi_range(1, 4) # Número aleatorio para cases.

# Called when the node enters the scene tree for the first time.
func _ready():
	sound_gato = $AudioStreamPlayer2D
	sound_gato.play()
	
	ini_posicion()
	ini_velocidad()
	ini_animacion()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	set_linear_velocity(direccion * velocidad)
	on_screen()

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
	
func ini_velocidad():
	# Asignamos velocidad
	if random == 1:
		direccion = Vector2(0, -1)
	elif random == 2:
		direccion = Vector2(0, 1)
	elif random == 3:
		direccion = Vector2(1, 0)
	elif random == 4:
		direccion = Vector2(-1, 0)
		
	set_linear_velocity(direccion * velocidad)
	
func ini_animacion():
		# Asignamos animacion
	if random == 1:
		$AnimatedSprite2D.play('izquierda')
	elif random == 2:
		$AnimatedSprite2D.play('derecha')
	elif random == 3:
		$AnimatedSprite2D.play('derecha')
	elif random == 4:
		$AnimatedSprite2D.play('izquierda')

func _on_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.is_pressed():
			velocidad = 0
			sound_gato.stop()

# Función que checkea la posición del animal para ver si sigue dentro de pantalla.
func on_screen():
	# Obtén las coordenadas del mundo del RigidBody
	var position_in_world = global_position

	# Obtén las dimensiones del Viewport
	var viewport_rect = get_viewport_rect()

	# Verifica si la posición del RigidBody está dentro del Viewport
	if viewport_rect.has_point(position_in_world):
		if !sound_gato.is_playing():
			sound_gato.play()
	else:
		sound_gato.stop()

